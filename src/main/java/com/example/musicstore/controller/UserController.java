package com.example.musicstore.controller;

import com.example.musicstore.model.User;
import com.example.musicstore.service.UserService;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @PostMapping("/register")
    public ModelAndView register(@RequestParam String firstname, @RequestParam String lastname, @RequestParam String email, @RequestParam String usertype, @RequestParam String password) {
        try{
            User checkUser = userService.checkUser(email.trim().toLowerCase());

            if (checkUser == null) {
                userService.addUser(firstname, lastname, email.trim().toLowerCase(), usertype, password);

                ModelAndView modelAndView = new ModelAndView();
                modelAndView.addObject("success", "Registration successful");
                modelAndView.setViewName("login");
                return modelAndView;
            } else {
                ModelAndView modelAndView = new ModelAndView();
                modelAndView.addObject("error", "User is already registered");
                modelAndView.setViewName("index");
                return modelAndView;
            }
        } catch(Exception e){
            e.printStackTrace();
            ModelAndView modelAndView = new ModelAndView();
            modelAndView.addObject("error", "An unexpected error occurred!");
            modelAndView.setViewName("index"); // create error.jsp
            return modelAndView;
        }

    }

    @PostMapping("/login")
    public String login(@RequestParam String email, @RequestParam String password,
                              HttpSession session, HttpServletResponse response, Model model) {
        try {
        User currentUser = userService.getUser(email.trim().toLowerCase(), password);

            if (currentUser != null) {
                session.setAttribute("loggedInUser", currentUser);

                Cookie loginCookie = new Cookie("login", "true");
                loginCookie.setMaxAge(60 * 60);
                loginCookie.setPath("/");
                response.addCookie(loginCookie);

                Cookie role = new Cookie("role", currentUser.getUserType().trim());
                role.setMaxAge(60 * 60);
                role.setPath("/");
                response.addCookie(role);

                switch (currentUser.getUserType().trim().toLowerCase()) {
                    case "admin":
                        return "admin";
                    case "user":
                        return "home";
                    case "artist":
                        return "home";

                }
            } else {
                model.addAttribute("error", "Username or password incorrect");
                return "login";
            }
            return "login";
        } catch (RuntimeException e) {
            e.printStackTrace();
            model.addAttribute("error", "An unexpected error occurred!");
            return "login";

        }


    }

    @GetMapping("/profile")
    public String profile(HttpSession session, Model model) {
        try {
            User user = (User) session.getAttribute("loggedInUser");
            if (user != null) {
                model.addAttribute("user", user);
                return "profile";
            } else {
                model.addAttribute("error", "You are not logged in");
                return "login";
            }
        }  catch (RuntimeException e) {
            e.printStackTrace();
            model.addAttribute("error", "An unexpected error occurred!");
            return "login";
        }
    }

    @PostMapping("/updateprofile")
    public String updateProfile(HttpSession session, @RequestParam String firstname, @RequestParam String lastname, @RequestParam String email, @RequestParam String password, Model model, RedirectAttributes redirectAttributes) {
        User currentUser = (User) session.getAttribute("loggedInUser");
        if (currentUser != null) {
            currentUser.setFirstName(firstname);
            currentUser.setLastName(lastname);
            currentUser.setEmail(email.trim().toLowerCase());
            currentUser.setPassword(password);

            currentUser.displayUser();

            userService.updateUser(currentUser);

            session.setAttribute("loggedInUser", currentUser);
            redirectAttributes.addFlashAttribute("success", "Profile updated successfully");


            return "redirect:/user/profile";
        } else {
            model.addAttribute("error", "You are not logged in");
            return "login";
        }
    }

    @GetMapping("/deleteprofile")
    public String deleteProfile(HttpSession session, Model model, RedirectAttributes redirectAttributes) {
        User currentUser = (User) session.getAttribute("loggedInUser");
        try {
            if (currentUser != null) {
                userService.deleteUser(currentUser);
                session.invalidate();
                redirectAttributes.addFlashAttribute("success", "Profile deleted successfully");
                return "redirect:/login";
            }  else {
                model.addAttribute("error", "You are not logged in");
                return "login";
            }
        } catch (RuntimeException e) {
            e.printStackTrace();
            model.addAttribute("error", "An unexpected error occurred!");
            return "login";
        }
    }
}

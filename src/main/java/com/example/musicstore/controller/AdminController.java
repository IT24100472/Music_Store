package com.example.demo.controller;

import com.example.demo.model.Songs;
import com.example.demo.model.User;
import com.example.demo.service.AdminService;
import com.example.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.sql.SQLException;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    AdminService adminService;
    @Autowired
    UserService userService;

    @GetMapping
    public String userManagement(Model model) {
        List<User> userList = adminService.getAllUsers();
        model.addAttribute("users", userList);
        return "adminUserManagement";
    }

    @GetMapping("/delete/{id}")
    public String deleteUser(@PathVariable int id, RedirectAttributes redirectAttributes) {
        try {
            adminService.deleteUser(id);
            redirectAttributes.addAttribute("success", "User has been deleted successfully");
            return "redirect:/admin";
        } catch (SQLException e) {
            e.printStackTrace();
            redirectAttributes.addAttribute("error", "Unexpected error occurred. Please try again later");
            return "redirect:/admin";
        }
    }

    @GetMapping("/edit/{id}")
    public String showEditUser(@PathVariable int id, Model model,  RedirectAttributes redirectAttributes) {
        try {
            User user = adminService.findUserById(id);
            model.addAttribute("user", user);
            return "adminEditUser";
        } catch (SQLException e) {
            e.printStackTrace();
            redirectAttributes.addAttribute("error", "Unexpected error occurred. Please try again later");
            return "redirect:/admin";
        }
    }

    @PostMapping("/edit/{id}")
    public String updateUser(@PathVariable int id, @RequestParam String firstname, @RequestParam String lastname, @RequestParam String email, @RequestParam String usertype, @RequestParam String password, RedirectAttributes redirectAttributes) {
        try {
            adminService.updateUser(id, firstname, lastname, email, usertype, password);
            redirectAttributes.addFlashAttribute("success", "User has been updated successfully");
            return "redirect:/admin";
        }  catch (SQLException e) {
            e.printStackTrace();
            redirectAttributes.addAttribute("error", "Unexpected error occurred. Please try again later");
            return "redirect:/admin";
        }
    }

    @GetMapping("/add")
    public String showAddUser() {
        return "adminAddUser";
    }

    @PostMapping("/add")
    public String addUser(@RequestParam String firstname, @RequestParam String  lastname, @RequestParam String email, @RequestParam String usertype, @RequestParam String password, RedirectAttributes redirectAttributes) {
        try {
            userService.addUser(firstname, lastname, email, usertype, password);
            redirectAttributes.addFlashAttribute("success", "User has been added successfully");
            return "redirect:/admin";
        }  catch (SQLException e) {
            e.printStackTrace();
            redirectAttributes.addAttribute("error", "Unexpected error occurred. Please try again later");
            return "redirect:/admin";
        }
    }

    @GetMapping("/music")
    public String showMusic(Model model) {
        List<Songs> songsList = adminService.getAllSongs();
        model.addAttribute("songs", songsList);
        return "adminMusicManagement";
    }

    @GetMapping("/music/edit/{MID}")
    public String showMusicForm(@PathVariable int MID, Model model, RedirectAttributes redirectAttributes) {
        try {
            Songs song = adminService.findSongById(MID);
            model.addAttribute("song", song);
            return "adminEditMusic";
        } catch (SQLException e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("error", "An unexpected error occurred");
            return "redirect:/admin/music";
        }
    }

    @PostMapping("/music/edit")
    public String updateMusic(@RequestParam int id, @RequestParam String title, @RequestParam String artist, @RequestParam String band, @RequestParam int price, RedirectAttributes redirectAttributes) {
        Songs song = new Songs(id,title,artist,band,price);
        try {
            adminService.updateMusic(song);
            return "redirect:/admin/music";
        } catch (SQLException e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("error", "An unexpected error occurred");
            return "redirect:/admin/music";
        }
    }

    @PostMapping("/music/delete/{MID}")
    public String deleteMusic(@PathVariable int MID, RedirectAttributes redirectAttributes) {
        try {
            adminService.deleteMusic(MID);
            redirectAttributes.addFlashAttribute("success", "Music has been deleted successfully");
            return "redirect:/admin/music";
        }  catch (SQLException e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("error", "An unexpected error occurred");
            return "redirect:/admin/music";
        }
    }
}

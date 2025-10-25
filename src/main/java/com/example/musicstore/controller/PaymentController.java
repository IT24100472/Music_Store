package com.example.demo.controller;

import com.example.demo.model.Songs;
import com.example.demo.model.User;
import com.example.demo.service.PaymentService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.sql.SQLException;
import java.util.List;

@Controller
@RequestMapping("/cart")
public class PaymentController {
    @Autowired
    private PaymentService paymentService;

    @GetMapping("/add/{MID}")
    public String addCart(@PathVariable int MID, @RequestParam String type, HttpSession  session, RedirectAttributes redirectAttributes) {
        User currentUser = (User) session.getAttribute("loggedInUser");
        try {
            paymentService.addCart(currentUser.getId(), MID);
            if (type.equals("browse")) {
                redirectAttributes.addFlashAttribute("emptyMusic", "Added to the cart");
                return "redirect:/browse";
            } else {
                redirectAttributes.addFlashAttribute("emptyMusic", "Added to the cart");
                return "redirect:/browse/wishlist";
            }
        } catch (SQLException e){
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("notFound", "An error occured");
            return "redirect:/browse";
        }
    }

    @GetMapping
    public String viewCart(HttpSession  session, Model model) {
        User currentUser = (User) session.getAttribute("loggedInUser");
        List<Songs> songs = paymentService.viewCart(currentUser.getId());
        int price = paymentService.calculateTotal(currentUser.getId());

        model.addAttribute("mySongs", songs);
        model.addAttribute("price", price);
        return "cart";
    }

    @GetMapping("/delete/{MID}")
    public String deleteCart(@PathVariable  int MID, HttpSession session) {
        User currentUser = (User) session.getAttribute("loggedInUser");
        paymentService.deleteCart(currentUser.getId(), MID);
        return "redirect:/cart";
    }

    @GetMapping("/mysongs")
    public String viewMySongs(HttpSession  session, Model model) {
        User currentUser = (User) session.getAttribute("loggedInUser");
        List<Songs> songList = paymentService.viewSongs(currentUser.getId());
        model.addAttribute("mySongs", songList);
        return "mySongs";
    }

    @GetMapping("/buy/{price}")
    public String sendToPaymentGateway(@PathVariable int price, Model model){
        model.addAttribute("price", price);
        return "cardPayment";
    }

    @PostMapping("/paid")
    public String completePayment(HttpSession session){
        User currentUser = (User) session.getAttribute("loggedInUser");
        List<Songs> songs = paymentService.viewCart(currentUser.getId());
        paymentService.addCustomerSongs(currentUser.getId(), songs);
        paymentService.deleteCartAfterBuy(currentUser.getId());
        return "redirect:/cart/mysongs";
    }
}


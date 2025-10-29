package com.example.demo.controller;

import com.example.demo.model.Contact;
import com.example.demo.model.User;
import com.example.demo.service.ContactService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/contact")
public class ContactController {
    @Autowired
    private ContactService contactService;

    @GetMapping
    public String userContactList(HttpSession session, Model model) {
        User user = (User)session.getAttribute("loggedInUser");

        List<Contact> contactList = contactService.getUserContacts(user.getId());
        model.addAttribute("quaries", contactList);
        return "contact";
    }

    @GetMapping("/add")
    public String addContactForm() {
        return "contactForm";
    }

    @PostMapping("/add")
    public String addContact(HttpSession session, @RequestParam String title, @RequestParam String message, RedirectAttributes redirectAttributes) {
        User user = (User)session.getAttribute("loggedInUser");
        contactService.addQuary(user.getId(), title, message);
        redirectAttributes.addAttribute("message", message);
        return "redirect:/contact";
    }

    @PostMapping("/edit/{id}")
    public String editContact(@RequestParam String title, @RequestParam String message, @PathVariable int id) {
        contactService.editQuary(id, title, message);
        return "redirect:/contact";
    }

    @GetMapping("/edit/{id}")
    public String editContactForm(@PathVariable int id, Model model) {
        Contact quary =  contactService.getContactById(id);
        model.addAttribute("contact", quary);
        return "editContactForm";
    }

    @PostMapping("/delete/{id}")
    public String deleteContact(@PathVariable int id) {
        contactService.deleteContactById(id);
        return "redirect:/contact";
    }
}

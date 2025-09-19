package com.example.musicstore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
public class HomeController {
    @GetMapping("/")
    public String home() {
        return "home";
    }

    @GetMapping("/login")
    public String login() {
        return "login"; }

    @GetMapping("/artist")
    public String artist() { return "artistPanel"; }

    @GetMapping("/search")
    public String search() {
        return "browse"; }

    @GetMapping("/register")
    public String register() {
        return "index"; }
}

package com.example.demo.service;

public class PaypalPayment implements PaymentStrategy {
    public void pay(double amount) {
        System.out.println("Paid Rs." + amount + " via PayPal");
    }
}

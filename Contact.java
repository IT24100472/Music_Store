package com.example.demo.model;

public class Contact {
    private int id;
    private String title;
    private String message;
    private String name;
    private int uid;

    public Contact(int id, String title, String message) {
        this.id = id;
        this.title = title;
        this.message = message;
    }

    public Contact(int id, String title) {
        this.id = id;
        this.title = title;
    }

    public Contact(int id, String title, String message, String name, int uid) {
        this.id = id;
        this.title = title;
        this.message = message;
        this.name = name;
        this.uid = uid;
    }

    public int getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getMessage() {
        return message;
    }

    public String getName() {
        return name;
    }

    public int getUid() {
        return uid;
    }
}

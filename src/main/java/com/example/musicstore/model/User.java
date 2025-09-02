package com.example.musicstore.model;

public class User {
    private int id;
    private String firstName;
    private String lastName;
    private String email;
    private String userType;
    private String password;

    public User(int id, String firstName, String lastName, String email, String userType, String password) {
        this.id = id;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.userType = userType;
    }

    public int getId() {
        return id;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getEmail() {
        return email;
    }

    public String getLastName() {
        return lastName;
    }

    public String getUserType() {
        return userType;
    }

    public String getPassword() {
        return password;
    }
}

package com.nasa.space.model;

import java.io.Serializable;

public class LoginUser implements Serializable {

    private static final long serialVersionUID = 5926468583005150707L;

    public LoginUser() {
    }

    private String username;
    private String password;

    public LoginUser(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}

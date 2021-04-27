package com.nasa.space.model;

import java.io.Serializable;

public class LoginRequest implements Serializable {

    private static final long serialVersionUID = 5926468583005150707L;

    public LoginRequest() {
    }

    private String username;
    private String password;

    public LoginRequest(String username, String password) {
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

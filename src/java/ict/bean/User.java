/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.bean;

import java.io.Serializable;

/**
 *
 * @author panos
 */
public class User implements Serializable  {
    private String uid;
    private String username;
    private String password;
    private int type;

    public User() {
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }
    
    public User(User u){
        uid = u.getUid();
        username = u.getUsername();
        password = u.getPassword();
        type = u.getType();
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

    public User(String uid, String username, String password, int type) {
        this.uid = uid;
        this.username = username;
        this.password = password;
        this.type = type;
    }
    
}

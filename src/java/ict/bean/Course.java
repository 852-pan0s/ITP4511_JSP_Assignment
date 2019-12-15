/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.bean;

/**
 *
 * @author panos
 */
public class Course {
    private String cid;
    private String name;
    private int hours;

    public Course() {
    }

    public String getCid() {
        return cid;
    }

    public String getName() {
        return name;
    }

    public int getHours() {
        return hours;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setHours(int hours) {
        this.hours = hours;
    }
    
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.bean;

import java.util.ArrayList;

/**
 *
 * @author panos
 */
public class Teacher extends User{
    private String tid;
    private String name;
    private ArrayList<Classes> classes;

    public Teacher() {
    }

    public Teacher(String tid, String name) {
        this.tid = tid;
        this.name = name;
    }
    
    public String getTid() {
        return tid;
    }

    public String getName() {
        return name;
    }

    public void setTid(String tid) {
        this.tid = tid;
    }

    public void setName(String name) {
        this.name = name;
    }

    public ArrayList<Classes> getClasses() {
        return classes;
    }

    public void setClasses(ArrayList<Classes> classes) {
        this.classes = classes;
    }
    
    public Teacher(User u){
        super(u);
    }
    
}

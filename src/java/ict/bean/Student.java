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
public class Student extends User{
    private String firstName;
    private String lastName;
    private boolean isLate;
    private ArrayList<Course> courses;

    public boolean isIsLate() {
        return isLate;
    }

    public void setIsLate(boolean isLate) {
        this.isLate = isLate;
    }
    
    
    
    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public Student() {
    }

    public Student(String firstName, String lastName, boolean isLate, ArrayList<Course> courses) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.isLate = isLate;
        this.courses = courses;
    }

    public ArrayList<Course> getCourses() {
        return courses;
    }

    public void setCourses(ArrayList<Course> courses) {
        this.courses = courses;
    }
    
      public Student(User u){
        super(u);
    }


    
    
}

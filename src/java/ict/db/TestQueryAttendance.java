/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.db;

import ict.bean.User;
import java.util.ArrayList;

/**
 *
 * @author tuningwan
 */
public class TestQueryAttendance {

    public static void main(String[] arg) {

        // Connect DB
        String url = "jdbc:mysql://localhost/itp4511_assignment";
//        String url = "jdbc:mysql://localhost:3306/itp4511_assignment";
        String username = "root";
        String password = "";
        ProjDB db = new ProjDB(url, username, password);

        
        // Query All Customer
        ArrayList<User> list = db.queryUser();
        System.out.println("---Query All Attendance---");
        for (User u : list) {
            System.out.println("ID: " + u.getUid());
        }
        
        
//        Classes c = db.queryClassByTid("jesse");
//        System.out.println("Class ID: " +c.getTid());
//        for(Student s: c.getStudents()){
//        System.out.println("Studnet: " +s.getFirstName());    
//        }
//        db.saveAttendance("ITP4507", "180000000", "08:30:00", "2019-12-14", 0);
    }
}
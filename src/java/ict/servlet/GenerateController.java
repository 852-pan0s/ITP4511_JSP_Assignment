/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.servlet;

import ict.bean.Classes;
import ict.bean.Attendance;
import ict.bean.Course;
import ict.bean.Student;
import ict.db.ProjDB;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author tuningwan
 */
@WebServlet(name = "GenerateController", urlPatterns = {"/GenerateController"})
public class GenerateController extends HttpServlet {

    private ProjDB db;

    public void init() {
        String dbUser = this.getServletContext().getInitParameter("dbUser");
        String dbPassword = this.getServletContext().getInitParameter("dbPassword");
        String dbUrl = this.getServletContext().getInitParameter("dbUrl");
        db = new ProjDB(dbUrl, dbUser, dbPassword);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Attendance> atlist = new ArrayList();
        atlist.add(new Attendance("ITP4506", "180000002", "200", "400", 0));
        atlist.add(new Attendance("ITP4511", "180000001", "100", "300", 1));
        atlist.add(new Attendance("ITP4507", "180000000", "120", "400", 0));
//        String cid, String sid, String attended_time, String class_day, int is_late
        
//        ArrayList<Classes> c = new ArrayList();
//        c.add(new Classes("ITP4511",  ))
//                (String cid, String tid, ArrayList<Student> students, String startTime, String endTime, String day, String name)
        
        
        request.setAttribute("atlist2", atlist);
        String targetURL = "generateAttendance.jsp";
        RequestDispatcher rd;
        rd = getServletContext().getRequestDispatcher("/" + targetURL);
        rd.forward(request, response);
    }
}

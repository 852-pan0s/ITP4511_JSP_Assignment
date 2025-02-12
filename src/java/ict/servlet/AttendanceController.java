/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.servlet;

import ict.bean.Classes;
import ict.bean.User;
import ict.bean.Attendance;
import ict.db.ProjDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

/**
 *
 * @author tuningwan
 */
@WebServlet(name = "AttendanceController", urlPatterns = {"/AttendanceController"})
public class AttendanceController extends HttpServlet {

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
        atlist.add(new Attendance("ITP4511", "180000000", "13:41:00", "2019-12-13", 0));
        atlist.add(new Attendance("ITP4511", "180000000", "13:51:00", "2019-12-14", 1));
        atlist.add(new Attendance("ITP4511", "180000000", "13:41:00", "2019-12-15", 0));
        
        // obtain seesion from request
//        HttpSession session = request.getSession(true);
        // store the userInfo to the session
        request.setAttribute("atlist", atlist);
        String targetURL = "attendance.jsp";
        RequestDispatcher rd;
        rd = getServletContext().getRequestDispatcher("/" + targetURL);
        rd.forward(request, response);
    }
}

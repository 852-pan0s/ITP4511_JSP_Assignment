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

//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String action = request.getParameter("action");
//
//        if ("authenticate".equals(action)) {
////            doAuthenticate(request, response);
//        } else if ("logout".equals(action)) {
////            doLogout(request, response);
//        } else if ("quickLogin".equals(action)) {
//            skipAuthenticate(request, response);
//        } else {
//            response.sendError(HttpServletResponse.SC_NOT_IMPLEMENTED);
//        }
//    }
    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //String username = request.getParameter("username");
        //String password = request.getParameter("password");
        //User u = db.login(username, password);
        Attendance a = new Attendance();
        a.setCid("ITP4511");
        a.setSid("180000000");
        a.setAttended_time("13:41:00");
        a.setClass_day("2019-12-13");
        a.setIs_late(0);

        Attendance at = new Attendance("ITP4511", "180000000", "13:41:00", "2019-12-13", 0);
//        Attendance at2 = new Attendance("ITP4511", "180000000", "13:51:00", "2019-12-14", 1);
//        Attendance at3 = new Attendance("ITP4511", "180000000", "13:41:00", "2019-12-15", 0);
        
//        ArrayList<Attendance> atlist = new ArrayList();
//        atlist.add(at);
//        atlist.add(at2);
//        atlist.add(at3);
//        atlist.add(a);

        // obtain seesion from request
        HttpSession session = request.getSession(true);
        // store the userInfo to the session
        session.setAttribute("attendance", a);
        String targetURL = "attendance.jsp";
        RequestDispatcher rd;
        rd = getServletContext().getRequestDispatcher("/" + targetURL);
        rd.forward(request, response);
    }
}

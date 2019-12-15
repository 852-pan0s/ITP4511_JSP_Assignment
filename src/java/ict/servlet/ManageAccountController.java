/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.servlet;

import ict.bean.Course;
import ict.bean.Student;
import ict.bean.Teacher;
import ict.bean.User;
import ict.db.ProjDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author panos
 */
@WebServlet(name = "ManageAccountController", urlPatterns = {"/ManageAccountController"})
public class ManageAccountController extends HttpServlet {

    private ProjDB db;

    public void init() {
        String dbUser = this.getServletContext().getInitParameter("dbUser");
        String dbPassword = this.getServletContext().getInitParameter("dbPassword");
        String dbUrl = this.getServletContext().getInitParameter("dbUrl");
        db = new ProjDB(dbUrl, dbUser, dbPassword);
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("getAllAccount".equalsIgnoreCase(action)) {
            ArrayList<User> u = db.queryUser();
            request.setAttribute("userList", u);
            RequestDispatcher rd = this.getServletContext()
                    .getRequestDispatcher("/accountManagement.jsp");
            rd.forward(request, response);
        } else if ("newStudent".equalsIgnoreCase(action)) {
            ArrayList<Course> eCoursesStudent = new ArrayList();
            ArrayList<Course> eCourses = db.queryAllCourse();
            Student s = new Student();
            s.setType(1);
            s.setUid("180000008");
            s.setFirstName("");
            s.setLastName("");
            request.setAttribute("eAdmin", s);
            request.setAttribute("eCoursesStudent", eCoursesStudent);
            request.setAttribute("eCourses", eCourses);
            request.setAttribute("eStudent", s);
            RequestDispatcher rd = this.getServletContext()
                    .getRequestDispatcher("/editUser.jsp");
            rd.forward(request, response);
        } else if ("newTeacher".equalsIgnoreCase(action)) {

            ArrayList<Course> eCoursesStudent = new ArrayList();
            ArrayList<Course> eCourses = db.queryAllCourse();
            Teacher t = new Teacher();
            t.setType(2);
            t.setName("");
            t.setUid("t01");
            request.setAttribute("eTeacher", t);
            request.setAttribute("eAdmin", t);
            request.setAttribute("eCoursesStudent", eCoursesStudent);
            request.setAttribute("eCourses", eCourses);
            RequestDispatcher rd = this.getServletContext()
                    .getRequestDispatcher("/editUser.jsp");
            rd.forward(request, response);
        } else if ("newAdmin".equalsIgnoreCase(action)) {
            ArrayList<Course> eCoursesStudent = new ArrayList();
            ArrayList<Course> eCourses = db.queryAllCourse();
            User u = new User();
            u.setType(3);
            u.setUid("admin2");
            request.setAttribute("eAdmin", u);
            request.setAttribute("eCoursesStudent", eCoursesStudent);
            request.setAttribute("eCourses", eCourses);
            RequestDispatcher rd = this.getServletContext()
                    .getRequestDispatcher("/editUser.jsp");
            rd.forward(request, response);
        } else if ("edit".equalsIgnoreCase(action)) {
            Student s = null;
            Teacher t = null;
            ArrayList<Course> eCoursesStudent = new ArrayList();
            ArrayList<Course> eCourses = db.queryAllCourse();
            String uid = request.getParameter("uid");
            User u = db.queryUserById(uid);
            if (u.getType() == 1) {
                s = db.queryStudentByUser(u);
                eCoursesStudent = db.queryCourseBySid(uid);
            } else if (u.getType() == 2) {
                t = db.queryTeacherByUser(u);
            }

            request.setAttribute("eStudent", s);
            request.setAttribute("eTeacher", t);
            request.setAttribute("eAdmin", u);
            request.setAttribute("eCoursesStudent", eCoursesStudent);
            request.setAttribute("eCourses", eCourses);
            RequestDispatcher rd = this.getServletContext()
                    .getRequestDispatcher("/editUser.jsp");
            rd.forward(request, response);

            /*response.setContentType("text/html;charset=UTF-8");
             try (PrintWriter out = response.getWriter()) {
            
             out.println("<!DOCTYPE html>");
             out.println("<html>");
             out.println("<head>");
             out.println("<title>Servlet ManageAccountController</title>");            
             out.println("</head>");
             out.println("<body>");
             out.println("<h1>Servlet ManageAccountController at " + t + "</h1>");
             out.println("</body>");
             out.println("</html>");
             }*/
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.servlet;

import ict.bean.Classes;
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
@WebServlet(name = "ManageClassController", urlPatterns = {"/ManageClassController"})
public class ManageClassController extends HttpServlet {

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
        if ("getAllClasses".equalsIgnoreCase(action)) {
            ArrayList<Classes> c = db.queryAllClasses();
            request.setAttribute("mClassList", c);
            RequestDispatcher rd = this.getServletContext()
                    .getRequestDispatcher("/classManagement.jsp");
            rd.forward(request, response);
        } else if ("edit".equalsIgnoreCase(action)) {
            String tid = request.getParameter("tid");
            String cid = request.getParameter("cid");
            Classes c = db.queryClassByTidCid(tid, cid);
            request.setAttribute("eClass", c);
            RequestDispatcher rd = this.getServletContext()
                    .getRequestDispatcher("/editClass.jsp");
            rd.forward(request, response);
        } else if ("add".equalsIgnoreCase(action)) {
            Classes c = new Classes();
            c.setCid("");
            c.setName("");
            c.setStartTime("");
            c.setEndTime("");
            c.setTid("");
            request.setAttribute("eClass", c);
            RequestDispatcher rd = this.getServletContext()
                    .getRequestDispatcher("/editClass.jsp");
            rd.forward(request, response);
        } else if ("newClass".equalsIgnoreCase(action)) {
            String tid = request.getParameter("tid");
            String cid = request.getParameter("cid");
            String name = request.getParameter("name");
            String sTime = request.getParameter("sTime");
            String eTime = request.getParameter("eTime");
            db.insertClass(cid, tid, sTime, eTime);
            response.setContentType("text/html;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
                // TODO output your page here. You may use following sample code.
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet ManageClassController</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Saved! <a href='ManageClassController?action=getAllClasses'>Go back.</a></h1>");
                out.println("</body>");
                out.println("</html>");
            }
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

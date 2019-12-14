/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.servlet;

// import library
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
// map the servlet to url, brandController
@WebServlet(name = "RollCallController", urlPatterns = {"/RollCallController"})
public class RollCallController extends HttpServlet {

    private ProjDB db;

    public void init() {
        String dbUser = this.getServletContext().getInitParameter("dbUser");
        String dbPassword = this.getServletContext().getInitParameter("dbPassword");
        String dbUrl = this.getServletContext().getInitParameter("dbUrl");
        db = new ProjDB(dbUrl, dbUser, dbPassword);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String tid = request.getParameter("uid");
        String cid = request.getParameter("cid");
        if ("rollCall".equalsIgnoreCase(action)) {
            Classes roll = db.queryClassByTidCid(tid, cid);
            PrintWriter out = response.getWriter();
            out.println("<html>");
            out.println("<head><title>radio button</title></head>");
            out.println("<body>");
            out.println("your company size :" + tid);
            out.println("</body></html>");
            request.setAttribute("roll", roll);
            RequestDispatcher rd = this.getServletContext()
                    .getRequestDispatcher("/roll_call.jsp");
            rd.forward(request, response);
        } else if ("save".equalsIgnoreCase(action)) {
            String[] attendTime = request.getParameterValues("attendTime");
            String[] students = request.getParameterValues("uid");
            String day = request.getParameter("day");
            String sTime = request.getParameter("sTime");
            PrintWriter out = response.getWriter();
            out.println("<html>");
            out.println("<head><title>radio button</title></head>");
            out.println("<body>");

            for (int i = 0; i < students.length; i++) {
                if (attendTime[i].equals("")) {
                    continue;
                }
                String hr = sTime.substring(0, 2);
                String min = sTime.substring(3, 5);
                int time = Integer.parseInt((hr + min));
                hr = attendTime[i].substring(0, 2);
                min = attendTime[i].substring(3, 5);
                int aTime = Integer.parseInt((hr + min));
                int late = (aTime - time) > 10 ? 1 : 0;

                db.saveAttendance(cid, students[i], attendTime[i], day, late);
                out.printf("%s, %s, %s, %s, %s<br>", cid, students[i], attendTime[i], day, late);
            }
            out.println("</body></html>");
            tid = request.getParameter("tid");
            Classes roll = db.queryClassByTidCid(tid, cid);
            request.setAttribute("roll", roll);
            RequestDispatcher rd = this.getServletContext()
                    .getRequestDispatcher("/roll_call.jsp");
            rd.forward(request, response);
        } else if ("classList".equalsIgnoreCase(action)) {
            ArrayList<Classes> classList = db.queryClassByTid(tid);
            request.setAttribute("classList", classList);
            RequestDispatcher rd = this.getServletContext()
                    .getRequestDispatcher("/classList.jsp");
            rd.forward(request, response);
        } else {
            PrintWriter out = response.getWriter();
            out.println("NO such action :" + action);
        }
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.db;

import ict.bean.Classes;
import ict.bean.Course;
import ict.bean.Student;
import ict.bean.Teacher;
import ict.bean.User;
import java.io.IOException;
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

/**
 *
 * @author panos
 */
public class ProjDB {

    private String dburl;
    private String dbUser;
    private String dbPassword;

    public ProjDB(String dburl, String dbUser, String dbPassword) {
        this.dburl = dburl;
        this.dbUser = dbUser;
        this.dbPassword = dbPassword;
    }

    public User login(String user, String pwd) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        User u = null;
        try {
            //1. get Connectiong
            cnnct = getConnection();
            String preQueryStatement = "SELECT * FROM user WHERE uid=? and password=?";
            //2. get the prepare Statement
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            //3.update the placehoders with username and pwd
            pStmnt.setString(1, user);
            pStmnt.setString(2, pwd);
            //4 execctue the query and assign to the result
            ResultSet rs = pStmnt.executeQuery();
            while (rs.next()) {
                u = new User();
                // set the record detail to the customer bean
                u.setUid(rs.getString("uid"));
                u.setUsername(rs.getString("username"));
                u.setType(rs.getInt("type"));
                u.setPassword(rs.getString("password"));
            }
        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
                System.out.println(ex + "");
                System.out.println("fk");
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return u;
    }

    void CreateUserInfoTable() {

    }

    public boolean addUserInfo(String id, String user, String pwd) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnct = getConnection();
            String preQueryStatement = "INSERT INTO USERINFO VALUES (?, ?, ?)";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, id);
            pStmnt.setString(2, user);
            pStmnt.setString(3, pwd);
            int rowCount = pStmnt.executeUpdate();
            if (rowCount >= 1) {
                isSuccess = true;
            }
            pStmnt.close();
            cnnct.close();
        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return isSuccess;
    }

    public Connection getConnection() throws SQLException, IOException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return DriverManager.getConnection(dburl, dbUser, dbPassword);
    }

    public Teacher queryTeacherByUser(User u) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;

        Teacher t = null;
        try {
            //1. get Connection
            cnnct = getConnection();;
            String preQueryStatement = "SELECT * FROM teacher WHERE tid = ?";
            //2. get the prepare Statement
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            ResultSet rs = null;
            pStmnt.setString(1, u.getUid());
            //4. excete the query and assign to the result
            rs = pStmnt.executeQuery();
            if (rs.next()) {
                t = new Teacher(u);
                // set the record detail to the customer bean
                t.setName(rs.getString("name"));
                t.setClasses(queryClassByTid(u.getUid()));
            }
            pStmnt.close();
            cnnct.close();
        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return t;
    }

    public Student queryStudentByUser(User u) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;

        Student s = null;
        try {
            //1. get Connection
            cnnct = getConnection();;
            String preQueryStatement = "SELECT * FROM student WHERE sid = ?";
            //2. get the prepare Statement
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            ResultSet rs = null;
            pStmnt.setString(1, u.getUid());
            //4. excete the query and assign to the result
            rs = pStmnt.executeQuery();
            if (rs.next()) {
                s = new Student(u);
                // set the record detail to the customer bean
                s.setFirstName(rs.getString("firstName"));
                s.setLastName(rs.getString("lastName"));
                s.setCourses(queryCourseBySid(u.getUid()));
            }
            pStmnt.close();
            cnnct.close();
        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return s;
    }

    public ArrayList<Course> queryCourseBySid(String sid) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;

        ArrayList<Course> list = new ArrayList<Course>();
        Course c = null;
        try {
            //1. get Connection
            cnnct = getConnection();;
            String preQueryStatement = "SELECT co.cid, co.name, co.hours FROM class c, student s, course co WHERE co.cid = c.cid and c.sid = s.sid and c.sid = ?";
            //2. get the prepare Statement
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            //3.update the placehoders with username and pwd
            pStmnt.setString(1, sid);
            //4 execctue the query and assign to the result
            ResultSet rs = pStmnt.executeQuery();
            while (rs.next()) {
                c = new Course();
                c.setHours(rs.getInt("hours"));
                c.setCid(rs.getString("cid"));
                c.setName(rs.getString("name"));
                list.add(c);
            }
            pStmnt.close();
            cnnct.close();
        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return list;
    }

    public User queryUserById(String uid) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;

        User u = null;
        try {
            //1. get Connection
            cnnct = getConnection();;
            String preQueryStatement = "SELECT * FROM user WHERE uid = ?";
            //2. get the prepare Statement
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            ResultSet rs = null;
            pStmnt.setString(1, uid);
            //4. excete the query and assign to the result
            rs = pStmnt.executeQuery();
            if (rs.next()) {
                u = new User();
                // set the record detail to the customer bean
                u.setUid(rs.getString("uid"));
                u.setUsername(rs.getString("username"));
                u.setType(rs.getInt("type"));
                u.setPassword(rs.getString("password"));
            }
            pStmnt.close();
            cnnct.close();
        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return u;
    }

    public ArrayList<User> queryUser() {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;

        User u = null;
        ArrayList<User> list = new ArrayList();
        try {
            //1. get Connection
            cnnct = getConnection();;
            String preQueryStatement = "SELECT * FROM user";
            //2. get the prepare Statement
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            ResultSet rs = null;
            //4. excete the query and assign to the result
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                u = new User();
                // set the record detail to the customer bean
                u.setUid(rs.getString("uid"));
                u.setUsername(rs.getString("username"));
                u.setType(rs.getInt("type"));
                u.setPassword(rs.getString("password"));
                list.add(u);
            }
            pStmnt.close();
            cnnct.close();
        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return list;
    }

    public ArrayList<Course> queryAllCourse() {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;

        Course c = null;
        ArrayList<Course> list = new ArrayList();
        try {
            //1. get Connection
            cnnct = getConnection();;
            String preQueryStatement = "SELECT * FROM course";
            //2. get the prepare Statement
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            ResultSet rs = null;
            //4. excete the query and assign to the result
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                c = new Course();
                // set the record detail to the customer bean
                c.setCid(rs.getString("cid"));
                c.setName(rs.getString("name"));
                c.setHours(rs.getInt("hours"));
                list.add(c);
            }
            pStmnt.close();
            cnnct.close();
        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return list;
    }

    public ArrayList<Classes> queryAllClasses() {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;

        Classes c = null;
        ArrayList<Classes> list = new ArrayList();
        try {
            //1. get Connection
            cnnct = getConnection();;
            String preQueryStatement = "SELECT c.cid, tc.tid, start_time, end_time, name FROM teach_class tc, course c WHERE tc.cid = c.cid";
            //2. get the prepare Statement
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            ResultSet rs = null;
            //4. excete the query and assign to the result
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                c = new Classes();
                // set the record detail to the customer bean
                c.setCid(rs.getString("cid"));
                c.setName(rs.getString("name"));
                c.setStartTime(rs.getString("start_time"));
                c.setEndTime(rs.getString("end_time"));
                c.setTid(rs.getString("tid"));
                list.add(c);
            }
            pStmnt.close();
            cnnct.close();
        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return list;
    }

    public Classes queryClassByTidCid(String tid, String cid) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;

        Classes c = null;
        try {
            //1. get Connection
            cnnct = getConnection();;
            String preQueryStatement = "SELECT c.cid, name, t.tid, start_time, end_time  from course c, teach_class t where t.cid=c.cid and tid =? and c.cid = ?";
            //2. get the prepare Statement
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            //3.update the placehoders with username and pwd
            pStmnt.setString(1, tid);
            pStmnt.setString(2, cid);
            //4 execctue the query and assign to the result
            ResultSet rs = pStmnt.executeQuery();
            c = new Classes();
            if (rs.next()) {

                c.setDay(getToday());
                c.setStartTime(rs.getString("start_time"));
                c.setEndTime(rs.getString("end_time"));
                c.setCid(rs.getString("cid"));
                c.setTid(rs.getString("tid"));
                c.setName(rs.getString("name"));
                c.setStudents(queryStudentByCid(c.getCid()));
            }
            pStmnt.close();
            cnnct.close();
        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return c;
    }

    public ArrayList<Classes> queryClassByTid(String tid) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;

        ArrayList<Classes> list = new ArrayList<Classes>();
        Classes c = null;
        try {
            //1. get Connection
            cnnct = getConnection();;
            String preQueryStatement = "SELECT c.cid, name, t.tid, start_time, end_time  from course c, teach_class t where t.cid=c.cid and tid =?";
            //2. get the prepare Statement
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            //3.update the placehoders with username and pwd
            pStmnt.setString(1, tid);
            //4 execctue the query and assign to the result
            ResultSet rs = pStmnt.executeQuery();
            while (rs.next()) {
                c = new Classes();
                c.setDay(getToday());
                c.setStartTime(rs.getString("start_time"));
                c.setEndTime(rs.getString("end_time"));
                c.setCid(rs.getString("cid"));
                c.setTid(rs.getString("tid"));
                c.setName(rs.getString("name"));
                c.setStudents(queryStudentByCid(c.getCid()));
                list.add(c);
            }
            pStmnt.close();
            cnnct.close();
        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return list;
    }

    public static String getToday() {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date date = new java.util.Date();
        return dateFormat.format(date);
    }

    public ArrayList<Student> queryStudentByCid(String cid) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;

        Student s = null;
        ArrayList<Student> list = new ArrayList();
        try {
            //1. get Connection
            cnnct = getConnection();;
            String preQueryStatement = "SELECT c.cid, c.sid, firstName, lastName FROM class c, student s where cid = ? and s.sid = c.sid";
            //2. get the prepare Statement
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            //3.update the placehoders with username and pwd
            pStmnt.setString(1, cid);
            //4 execctue the query and assign to the result
            ResultSet rs = pStmnt.executeQuery();
            rs = pStmnt.executeQuery();
            while (rs.next()) {
                s = new Student();
                // set the record detail to the customer bean
                s.setUid(rs.getString("sid"));
                s.setFirstName(rs.getString("firstName"));
                s.setLastName(rs.getString("lastName"));
                list.add(s);
            }
            pStmnt.close();
            cnnct.close();
        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return list;
    }

    public boolean saveAttendance(String cid, String sid, String aTime, String day, int late) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnct = getConnection();

            //check 
            String preQueryStatement = "SELECT * FROM attendance WHERE cid = ? AND sid = ? and class_day= ?";
            //2. get the prepare Statement
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            //3.update the placehoders with username and pwd
            pStmnt.setString(1, cid);
            pStmnt.setString(2, sid);
            pStmnt.setString(3, day);
            //4 execctue the query and assign to the result
            ResultSet rs = pStmnt.executeQuery();
            rs = pStmnt.executeQuery();
            if (rs.next()) {
                preQueryStatement = "UPDATE attendance set attended_time = ?, is_late = ? WHERE cid = ? and sid = ? and class_day = ?";
                pStmnt = cnnct.prepareStatement(preQueryStatement);
                pStmnt.setString(1, aTime);
                pStmnt.setInt(2, late);
                pStmnt.setString(3, cid);
                pStmnt.setString(4, sid);
                pStmnt.setString(5, day);
                int rowCount = pStmnt.executeUpdate();
                if (rowCount >= 1) {
                    isSuccess = true;
                }
            } else {
                preQueryStatement = "INSERT INTO attendance VALUES (?, ?, ?, ?, ?)";
                pStmnt = cnnct.prepareStatement(preQueryStatement);
                pStmnt.setString(1, cid);
                pStmnt.setString(2, sid);
                pStmnt.setString(3, aTime);
                pStmnt.setString(4, day);
                pStmnt.setInt(5, late);
                int rowCount = pStmnt.executeUpdate();
                if (rowCount >= 1) {
                    isSuccess = true;
                }
                System.out.println(preQueryStatement);
            }
            pStmnt.close();
            cnnct.close();
        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return isSuccess;
    }
    
    public boolean insertClass(String cid, String tid, String sTime, String eTime){
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnct = getConnection();
            String preQueryStatement = "INSERT INTO teach_class VALUES (?, ?, ?, ?)";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, cid);
            pStmnt.setString(2, tid);
            pStmnt.setString(3, sTime);
            pStmnt.setString(4, eTime);
            int rowCount = pStmnt.executeUpdate();
            if (rowCount >= 1) {
                isSuccess = true;
            }
            pStmnt.close();
            cnnct.close();
        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return isSuccess;
    }

}

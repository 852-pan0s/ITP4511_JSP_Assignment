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
public class Attendance {
    private String cid;
    private String sid;
    private String attended_time;
    private String class_day;
    private int is_late;

    public Attendance() {
    }

    public Attendance(String cid, String sid, String attended_time, String class_day, int is_late) {
        this.cid = cid;
        this.sid = sid;
        this.attended_time = attended_time;
        this.class_day = class_day;
        this.is_late = is_late;
    }

    public String getCid() {
        return cid;
    }

    public String getSid() {
        return sid;
    }

    public String getAttended_time() {
        return attended_time;
    }

    public String getClass_day() {
        return class_day;
    }

    public int getIs_late() {
        return is_late;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public void setAttended_time(String attended_time) {
        this.attended_time = attended_time;
    }

    public void setClass_day(String class_day) {
        this.class_day = class_day;
    }

    public void setIs_late(int is_late) {
        this.is_late = is_late;
    }
    
}

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.database;

import com.chart.ChartModel;
import com.chart.PieChart;
import com.constant.ServerConstants;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import javax.swing.JOptionPane;
import com.helper.DBUtils;
import com.helper.StringHelper;
import com.model.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import org.jfree.chart.JFreeChart;

/**
 *
 * @author Admin
 */
public class ConnectionManager extends DBUtils {

    public static Connection getDBConnection() {
        Connection conn = null;
        try {
            Class.forName(ServerConstants.db_driver);
            conn = DriverManager.getConnection(ServerConstants.db_url,
                    ServerConstants.db_user, ServerConstants.db_pwd);
            System.out.println("Got Connection");
        } catch (SQLException ex) {
            ex.printStackTrace();
            JOptionPane.showMessageDialog(
                    null,
                    "Please start the mysql Service from XAMPP Console.\n"
                    + ex.getMessage());
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return conn;
    }

    public static boolean checkAWCid(String awcid) {
        String sql = "select * from awc where awcid like '" + awcid + "'";
        return DBUtils.dataExists(sql);
    }

    public static List<DoctorReportModel> getDoctorReportData(String did) {
        String sql = "select * from doctorreport where docid like '" + did + "'";
        return DBUtils.getBeanList(DoctorReportModel.class, sql);
    }
    public static List<DoctorReportModel> getDoctorRefReportData(String did) {
        String sql = "select * from  refdoctorreport where docid like '" + did + "'";
        return DBUtils.getBeanList(DoctorReportModel.class, sql);
    }

    public static HashMap<String, Integer> getGraphData() {
        String sql = "SELECT * FROM doctorreport";
        List<DoctorReportModel> list = DBUtils.getBeanList(DoctorReportModel.class, sql);
        HashMap<String, Integer> hm = new HashMap<String, Integer>();
        for (int i = 0; i < list.size(); i++) {
            DoctorReportModel pm = (DoctorReportModel) list.get(i);
            String data = pm.getDeficiency();
            String str[] = data.split(",");
//             if (hm.containsKey(str)) {
//                 
//             }
            for (int j = 0; j < str.length; j++) {
                if (str[j].length() > 1) {
                    if (hm.containsKey(str[j])) {
                        int cnt = hm.get(str[j]);
                        cnt += 1;
                        hm.put(str[j], cnt);
                    } else {
                        hm.put(str[j], 1);
                    }
                }
            }
        }
        return hm;

    }

    public static List<ChildrenModel> getAWCChildrenData(String hid) {
        String sql = "select * from children where hid like '" + hid + "'";
        return DBUtils.getBeanList(ChildrenModel.class, sql);


    }

    public static List<PregnantWomenModel> getAWCPregnantWomenData(String hid) {
        String sql = "select * from pregnantwomen where hid like '" + hid + "'";
        return DBUtils.getBeanList(PregnantWomenModel.class, sql);


    }

    public static List<TeacherModel> getTeacherDetails() {
        String sql = "SELECT * FROM teacher where tid not in(SELECT tid FROM awchead)";
        return DBUtils.getBeanList(TeacherModel.class, sql);


    }

    public static List<TeacherModel> getTeachers() {
        String sql = "SELECT * FROM teacher";
        return DBUtils.getBeanList(TeacherModel.class, sql);


    }

    public static List<ChildrenCNTModel> getChildrenCNT() {
        String sql = "SELECT count(cid) as cnt,gender FROM children group by gender";
        return DBUtils.getBeanList(ChildrenCNTModel.class, sql);


    }

    public static void main(String[] args) {
//        try {
//            generatePiChart();
//        } catch (IOException ex) {
//            ex.printStackTrace();
//        }

//        List<prac> list = getuserdetail();
//        for (int i = 0; i < list.size(); i++) {
//            prac p = list.get(i);
//            System.out.println(p.getFname());
//        }
//        getGraphData();
        System.out.println("getGraphData();"+getGraphData());


    }

    public static List<prac> getuserdetail() {
        String sql = "SELECT * FROM `anganwadi`.`children`";
        return DBUtils.getBeanList(prac.class, sql);


    }

    public static BufferedImage generatePiChart(HashMap<String, Integer> hm) throws IOException {
//        List<ChildrenCNTModel> list = ConnectionManager.getChildrenCNT();
        ArrayList<String> xAxisNames = new ArrayList();
        ArrayList<Integer> xAxisValues = new ArrayList();
        Set<String> keys=hm.keySet();
        for (String key : keys) {
            xAxisNames.add(key);
            xAxisValues.add(hm.get(key));
        }
        
       
        ChartModel cm = new ChartModel();
        cm.setGraphTitle(" For page Name :");

        JFreeChart chart = PieChart.getPieChart(cm, xAxisNames, xAxisValues);

        BufferedImage bi = chart.createBufferedImage(400, 400);
//        File outputfile = new File("D:/a.png");
//            jLabel19.setIcon(new ImageIcon(bi));
//        ImageIO.write(bi, "png", outputfile);
        return bi;
    }

    public static List<TeacherModel> getTeachers(String awcid) {
        String sql = "SELECT * FROM teacher where awcid like '" + awcid + "'";
        return DBUtils.getBeanList(TeacherModel.class, sql);


    }

    public static List<DoctorModel> getDoctors() {
        String sql = "SELECT * FROM doctor";
        return DBUtils.getBeanList(DoctorModel.class, sql);


    }

    public static List<AWCModel> getAWC() {
        String sql = "SELECT * FROM awc";
        return DBUtils.getBeanList(AWCModel.class, sql);


    }

    public static List<AWCModel> getAwcDetails() {
        String sql = "SELECT * FROM awc where awcid not in(SELECT awcid FROM awchead)";
        return DBUtils.getBeanList(AWCModel.class, sql);


    }

    public static List<NursingModel> getAWCNursingData(String hid) {
        String sql = "select * from nursing where hid like '" + hid + "'";
        return DBUtils.getBeanList(NursingModel.class, sql);


    }

    public static List<AWCModel> getAWCData() {
        String sql = "select * from awc";
        return DBUtils.getBeanList(AWCModel.class, sql);
    }

    public static List<RequirementModel> getPendingRequirement() {
        String sql = "select * from requirement where status like 'NO'";
        return DBUtils.getBeanList(RequirementModel.class, sql);
    }

    public static List<MukhyasevikaModel> getMukhysevikaData() {
        String sql = "select * from mukhyasevika";
        return DBUtils.getBeanList(MukhyasevikaModel.class, sql);
    }

    public static String getAWCName(String awcid) {
        String sql = "select * from awc where awcid like '" + awcid + "'";
        List list = DBUtils.getBeanList(AWCModel.class, sql);
        if (list != null && list.size() > 0) {
            AWCModel a = (AWCModel) list.get(0);
            return a.getAwsname();
        } else {
            return "No Name";
        }

    }

    public static String getTeacherName(String tid) {
        String sql = "select * from teacher where tid like '" + tid + "'";
        List list = DBUtils.getBeanList(TeacherModel.class, sql);
        if (list != null && list.size() > 0) {
            TeacherModel a = (TeacherModel) list.get(0);
            return a.getFname() + " " + a.getMname() + " " + a.getLname();
        } else {
            return "No Name";
        }

    }

    public static String getMemberName(String fullid) {
        String id = "";
        try {

            id = fullid.split("-")[1];

        } catch (Exception e) {
//            JOptionPane.showMessageDialog(this, "Error... Please insert coorect ID..??");
        }
        if (fullid.contains("C-")) {
            String sql = "Select * from children where cid like '" + id + "%'";
            List list = DBUtils.getBeanList(ChildrenModel.class, sql);
            if (list != null && list.size() > 0) {

                ChildrenModel ch = (ChildrenModel) list.get(0);
                return ch.getFname() + " " + ch.getMname() + " " + ch.getLname();

            } else {
//                JOptionPane.showMessageDialog(this, "No data found..??");
            }

        } else if (fullid.contains("PW-")) {
            String sql = "Select * from pregnantwomen where pwid like '" + id + "%'";
            List list = DBUtils.getBeanList(PregnantWomenModel.class, sql);
            if (list != null && list.size() > 0) {
//                for (int i = 0; i < list.size(); i++) {
                PregnantWomenModel ch = (PregnantWomenModel) list.get(0);
                return ch.getFname() + " " + ch.getMname() + " " + ch.getLname();
//                    model1.addRow(new Object[]{i, ch.getPwid(), ch.getFname()+" "+ch.getMname()+" "+ch.getLname(),ch.getVillage(),ch.getCity(),ch.getDob(),ch.getBgrp(),ch.getCdate()});
//                }

            } else {
//                JOptionPane.showMessageDialog(this, "No data found..??");
            }

        } else if (fullid.contains("N-")) {
            String sql = "Select * from nursing where nwid like '" + id + "%'";
            List list = DBUtils.getBeanList(NursingModel.class, sql);
            if (list != null && list.size() > 0) {
//                for (int i = 0; i < list.size(); i++) {
                NursingModel ch = (NursingModel) list.get(0);
                return ch.getFname() + " " + ch.getMname() + " " + ch.getLname();
//                    model1.addRow(new Object[]{i, ch.getNwid(), ch.getFname()+" "+ch.getMname()+" "+ch.getLname(),ch.getVillage(),ch.getCity(),ch.getDob(),ch.getBgrp(),ch.getCdate()});
//                }

            } else {
//                JOptionPane.showMessageDialog(this, "No data found..??");
            }

        }
        return "No Name Found";

    }

    public static String getLastIndex(String coloumName, String tableName) {
        String sql = "select max(" + coloumName + ") as lastRow from " + tableName;
        List<LastIndexModel> list = DBUtils.getBeanList(LastIndexModel.class, sql);
        if (list != null && list.size() > 0) {
            LastIndexModel lim = list.get(0);
            return lim.getLastRow();
        }
        return "0";
    }

//    public static void insertFacebookDataIntoDB(FacebookModel fm) {
//        String query = "insert into facebookdata (pagename, feedtext, comment, pageid, feedid, commentid) values(?,?,?,?,?,?)";
//        if (!isAlreadyAvailable(fm.getCommentid())) {
//            DBUtils.executeUpdate(query, fm.getPagename(), fm.getFeedtext(), fm.getComment(), fm.getPageid(), fm.getFeedid(), fm.getCommentid());
//        }
//    }
//
//    public static boolean isAlreadyAvailable(String commentId) {
//        String query = "select * from facebookdata where commentid like '" + commentId + "'";
//        List<FacebookModel> list = DBUtils.getBeanList(FacebookModel.class, query);
//        if (list.size() > 0) {
//            return true;
//        } else {
//            return false;
//        }
//    }
    public static void closeConnection(Connection conn) {
        try {
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}

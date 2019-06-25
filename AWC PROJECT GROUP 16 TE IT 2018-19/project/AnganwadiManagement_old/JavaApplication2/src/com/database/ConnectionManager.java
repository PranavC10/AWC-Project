/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.database;

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
import com.model.ChildrenModel;
import com.model.LastIndexModel;
import java.util.*;

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

    public static String getLastIndex(String coloumName, String tableName) {
        String sql = "select max(" + coloumName + ") as lastRow from " + tableName;
        List<LastIndexModel> list=DBUtils.getBeanList(LastIndexModel.class, sql);
        if(list!=null && list.size()>0 ){
            LastIndexModel lim=list.get(0);
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

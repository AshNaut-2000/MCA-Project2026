/*
 
 */
package xtpl.sv;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpSession;
import java.sql.ResultSet;

/**
 *
 * @author Shak
 */
public class Subsidary {

    boolean verifiedUser = false;
    Connection con = null;
    PreparedStatement pst = null;
    ResultSet rst = null;
    int rowsAffected = 0;

    public boolean checkVerifiedUser(String username) {
        return verifiedUser;
    }

    public int insertLoginTime(String username) {
        try {
            con = xtpl.sv.ConnectionBean.makeCon(null);
            pst = con.prepareStatement("insert into logindetails(username) values(?)");
            pst.setString(1, username);
            rowsAffected = pst.executeUpdate();
        } catch (Exception e) {

        } finally {
            try {

                pst.close();
                con.close();
            } catch (Exception e) {

            }
        }
        return rowsAffected;
    }

    public String lastLoginTime(String username) {
        String logintime = "Never";
        try {
            con = xtpl.sv.ConnectionBean.makeCon(null);
            pst = con.prepareStatement("select date_format(date_time,'%a, %e/%M/%Y %r') from logindetails where username=?");
            pst.setString(1, username);
            rst = pst.executeQuery();
            while (rst.next()) {
                logintime = rst.getString(1);
            }
        } catch (Exception e) {

        } finally {
            try {
                rst.close();
                pst.close();
                con.close();
            } catch (Exception e) {

            }
        }
        return logintime;
    }

    public String getCategoryName(String cid) {
        String catname = null;
        try {
            con = xtpl.sv.ConnectionBean.makeCon(null);
            pst = con.prepareStatement("select cat_name from category where cat_id=?");
            pst.setString(1, cid);
            rst = pst.executeQuery();
            if (rst.next()) {
                catname = rst.getString(1);
            }
        } catch (Exception e) {

        } finally {
            try {
                rst.close();
                pst.close();
                con.close();
            } catch (Exception e) {

            }
        }
        return catname;
    }

    public String getReplyName(String rid) {
        String reply = null;
        try {
            con = xtpl.sv.ConnectionBean.makeCon(null);
            pst = con.prepareStatement("select reply_name from reply where reply_id=?");
            pst.setString(1, rid);
            rst = pst.executeQuery();
            if (rst.next()) {
                reply = rst.getString(1);
            }
        } catch (Exception e) {

        } finally {
            try {
                rst.close();
                pst.close();
                con.close();
            } catch (Exception e) {

            }
        }
        return reply;
    }

    public String getThreadName(String tid) {
        String threadname = null;
        try {
            con = xtpl.sv.ConnectionBean.makeCon(null);
            pst = con.prepareStatement("select thread_name from thread where thread_id=?");
            pst.setString(1, tid);
            rst = pst.executeQuery();
            if (rst.next()) {
                threadname = rst.getString(1);
            }
        } catch (Exception e) {

        } finally {
            try {
                rst.close();
                pst.close();
                con.close();
            } catch (Exception e) {

            }
        }
        return threadname;
    }

    public void updateThreadViews(String tid) {
        Long no_of_views = 0L;
        ResultSet rst = null;
        try {
            con = xtpl.sv.ConnectionBean.makeCon(null);
            pst = con.prepareStatement("select no_of_views from threaddata where thread_id='" + tid + "'");

            rst = pst.executeQuery();
            if (rst.next()) {
                no_of_views = rst.getLong(1);
            }
        } catch (Exception e) {

        } finally {
            try {
                rst.close();
                pst.close();
                con.close();
            } catch (Exception e) {
            }
        }

        Long updated_views = 0L;
        updated_views = no_of_views + 1;
        try {
            con = xtpl.sv.ConnectionBean.makeCon(null);
            pst = con.prepareStatement("update threaddata set no_of_views=? where thread_id=?");
            pst.setLong(1, updated_views);
            pst.setString(2, tid);

            pst.executeUpdate();

        } catch (Exception e) {

        } finally {
            try {
                pst.close();
                con.close();
            } catch (Exception e) {

            }
        }

    }
}

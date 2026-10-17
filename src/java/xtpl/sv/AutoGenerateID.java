/*

 */
package xtpl.sv;

import java.util.UUID;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;

public class AutoGenerateID {

    static String verifyNo = null;
    static Connection con = null;
    static ResultSet rs = null;
    static PreparedStatement ps = null;
    static String user_ID = null;
    static String category_ID = null;
    static String topic_ID = null;
    static String reply_ID = null;
    static String faq_ID = null;
    static String business_ID = null;
    static String visit_ID = null;
    /* ********************************Start For generating verification Number *********************************** */

    public static String verificationNumber() {
        UUID idOne = UUID.randomUUID();
        verifyNo = String.valueOf(idOne);
        return verifyNo;
    }
    /* ********************************End  For generating verification Number *********************************** */

    public static String genrateUserID() {
        String userID_table = "";
        try {
            int i = 0;
            con = xtpl.sv.ConnectionBean.makeCon(null);
            ps = con.prepareStatement("select count(*) from generateid");
            rs = ps.executeQuery();
            if (rs.next()) {
                i = rs.getInt(1);
            }


            int r;
            if (i == 0) {
                r = 1;
                ps = con.prepareStatement("insert into generateid(user_id) values('0')");
                ps.executeUpdate();
            } else {
                ps = con.prepareStatement("select user_id from generateid");
                rs = ps.executeQuery();
                rs.next();
                r = Integer.parseInt(rs.getString(1)) + 1;
            }
            user_ID = "SV_FORUM_U" + "-";
            userID_table = "";
            if (r < 10) {
                userID_table = user_ID + "000000" + r;
            } else if (r < 100) {
                userID_table = user_ID + "00000" + r;
            } else if (r < 1000) {
                userID_table = user_ID + "0000" + r;
            } else if (r < 10000) {
                userID_table = user_ID + "000" + r;
            } else if (r < 100000) {
                userID_table = user_ID + "00" + r;
            } else if (r < 1000000) {
                userID_table = user_ID + "0" + r;
            } else {
                userID_table = user_ID + r;
            }
        } catch (Exception e) {

        }
        return (userID_table);
    }

    public static String generateCategoryID() {
        String categoryID_table = "";
        try {
            int i = 0;
            con = xtpl.sv.ConnectionBean.makeCon(null);
            ps = con.prepareStatement("select count(*) from generateid");
            rs = ps.executeQuery();
            if (rs.next()) {
                i = rs.getInt(1);
            }


            int r;
            if (i == 0) {
                r = 1;
                ps = con.prepareStatement("insert into generateid(category_id) values('0')");
                ps.executeUpdate();
            } else {
                ps = con.prepareStatement("select category_id from generateid");
                rs = ps.executeQuery();
                rs.next();
                r = Integer.parseInt(rs.getString(1)) + 1;
            }
            category_ID = "SV_FORUM_CAT" + "-";
            categoryID_table = "";
            if (r < 10) {
                categoryID_table = category_ID + "000000" + r;
            } else if (r < 100) {
                categoryID_table = category_ID + "00000" + r;
            } else if (r < 1000) {
                categoryID_table = category_ID + "0000" + r;
            } else if (r < 10000) {
                categoryID_table = category_ID + "000" + r;
            } else if (r < 100000) {
                categoryID_table = category_ID + "00" + r;
            } else if (r < 1000000) {
                categoryID_table = category_ID + "0" + r;
            } else {
                categoryID_table = category_ID + r;
            }
        } catch (Exception e) {

        }
        return (categoryID_table);
    }

    public static String generatetopicID() {
        String topicID_table = "";
        try {
            int i = 0;
            con =xtpl.sv.ConnectionBean.makeCon(null);
            ps = con.prepareStatement("select count(*) from generateid");
            rs = ps.executeQuery();
            if (rs.next()) {
                i = rs.getInt(1);
            }


            int r;
            if (i == 0) {
                r = 1;
                ps = con.prepareStatement("insert into generateid(topic_id) values('0')");
                ps.executeUpdate();
            } else {
                ps = con.prepareStatement("select topic_id from generateid");
                rs = ps.executeQuery();
                rs.next();
                r = Integer.parseInt(rs.getString(1)) + 1;
            }
            topic_ID = "SV_FORUM_TOP" + "-";
            topicID_table = "";
            if (r < 10) {
                topicID_table = topic_ID + "000000" + r;
            } else if (r < 100) {
                topicID_table = topic_ID + "00000" + r;
            } else if (r < 1000) {
                topicID_table = topic_ID + "0000" + r;
            } else if (r < 10000) {
                topicID_table = topic_ID + "000" + r;
            } else if (r < 100000) {
                topicID_table = topic_ID + "00" + r;
            } else if (r < 1000000) {
                topicID_table = topic_ID + "0" + r;
            } else {
                topicID_table = topic_ID + r;
            }
        } catch (Exception e) {

        }
        return (topicID_table);
    }

    public static String generatereplyID() {
        String replyID_table = "";
        try {
            int i = 0;
            con = xtpl.sv.ConnectionBean.makeCon(null);
            ps = con.prepareStatement("select count(*) from generateid");
            rs = ps.executeQuery();
            if (rs.next()) {
                i = rs.getInt(1);
            }


            int r;
            if (i == 0) {
                r = 1;
                ps = con.prepareStatement("insert into generateid(reply_id) values('0')");
                ps.executeUpdate();
            } else {
                ps = con.prepareStatement("select reply_id from generateid");
                rs = ps.executeQuery();
                rs.next();
                r = Integer.parseInt(rs.getString(1)) + 1;
            }
            reply_ID = "SV_FORUM_REP" + "-";
            replyID_table = "";
            if (r < 10) {
                replyID_table = reply_ID + "0000000" + r;
            } else if (r < 100) {
                replyID_table = reply_ID + "000000" + r;
            } else if (r < 1000) {
                replyID_table = reply_ID + "00000" + r;
            } else if (r < 10000) {
                replyID_table = reply_ID + "0000" + r;
            } else if (r < 100000) {
                replyID_table = reply_ID + "000" + r;
            } else if (r < 1000000) {
                replyID_table = reply_ID + "00" + r;
            } else if (r < 10000000) {
                replyID_table = reply_ID + "0" + r;
            } else {
                replyID_table = reply_ID + r;
            }
        } catch (Exception e) {

        }
        return (replyID_table);
    }

    public static String generatefaqID() {
        String faqID_table = "";
        try {
            int i = 0;
            con =xtpl.sv.ConnectionBean.makeCon(null);
            ps = con.prepareStatement("select count(*) from generateid");
            rs = ps.executeQuery();
            if (rs.next()) {
                i = rs.getInt(1);
            }

            int r;
            if (i == 0) {
                r = 1;
                ps = con.prepareStatement("insert into generateid(faq_id) values('0')");
                ps.executeUpdate();
            } else {
                ps = con.prepareStatement("select faq_id from generateid");
                rs = ps.executeQuery();
                rs.next();
                r = Integer.parseInt(rs.getString(1)) + 1;
            }
            faq_ID = "SV_FORUM_FAQ" + "-";
            faqID_table = "";
            if (r < 10) {
                faqID_table = faq_ID + "000000" + r;
            } else if (r < 100) {
                faqID_table = faq_ID + "00000" + r;
            } else if (r < 1000) {
                faqID_table = faq_ID + "0000" + r;
            } else if (r < 10000) {
                faqID_table = faq_ID + "000" + r;
            } else if (r < 100000) {
                faqID_table = faq_ID + "00" + r;
            } else if (r < 1000000) {
                faqID_table = faq_ID + "0" + r;
            } else {
                faqID_table = faq_ID + r;
            }
        } catch (Exception e) {

        }
        return (faqID_table);
    }

    public static String generateBusinessID() {
        String businessID_table = "";
        try {
            int i = 0;
            con = xtpl.sv.ConnectionBean.makeCon(null);
            ps = con.prepareStatement("select count(*) from generateid");
            rs = ps.executeQuery();
            if (rs.next()) {
                i = rs.getInt(1);
            }

            int r;
            if (i == 0) {
                r = 1;
                ps = con.prepareStatement("insert into generateid(business_id) values('0')");
                ps.executeUpdate();
            } else {
                ps = con.prepareStatement("select business_id from generateid");
                rs = ps.executeQuery();
                rs.next();
                r = Integer.parseInt(rs.getString(1)) + 1;
            }
            business_ID = "SV_FORUM_BP_ID" + "-";
            businessID_table = "";
            if (r < 10) {
                businessID_table = business_ID + "000000" + r;
            } else if (r < 100) {
                businessID_table = business_ID + "00000" + r;
            } else if (r < 1000) {
                businessID_table = business_ID + "0000" + r;
            } else if (r < 10000) {
                businessID_table = business_ID + "000" + r;
            } else if (r < 100000) {
                businessID_table = business_ID + "00" + r;
            } else if (r < 1000000) {
                businessID_table = business_ID + "0" + r;
            } else {
                businessID_table = business_ID + r;
            }
        } catch (Exception e) {

        }
        return (businessID_table);
    }




     public static String generateVisitCounterID() {
        String visit_table = "";
        try {
            int i = 0;
            con = xtpl.sv.ConnectionBean.makeCon(null);
            ps = con.prepareStatement("select count(*) from generateid");
            rs = ps.executeQuery();
            if (rs.next()) {
                i = rs.getInt(1);
            }

            int r;
            if (i == 0) {
                r = 1;
                ps = con.prepareStatement("insert into visit_counter(visit) values('0')");
                ps.executeUpdate();
            } else {
                ps = con.prepareStatement("select visit from visit_counter");
                rs = ps.executeQuery();
                rs.next();
                r = Integer.parseInt(rs.getString(1)) + 1;
            }
            visit_ID = "00";
            visit_table = "";
            if (r < 10) {
                visit_table = visit_ID + "000000" + r;
            } else if (r < 100) {
                visit_table = visit_ID + "00000" + r;
            } else if (r < 1000) {
                visit_table = visit_ID + "0000" + r;
            } else if (r < 10000) {
                visit_table = visit_ID + "000" + r;
            } else if (r < 100000) {
                visit_table = visit_ID + "00" + r;
            } else if (r < 1000000) {
                visit_table = visit_ID + "0" + r;
            } else {
                visit_table = visit_ID + r;
            }
        } catch (Exception e) {

        }
        return (visit_table);
    }
}

/*
 
 */
package xtpl.sv;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.http.HttpSession;

public class Reply1 extends HttpServlet {

    Connection conn = null;
    Statement st = null;
    PreparedStatement pst = null;
    ResultSet rs = null;

    String user = null;
    String replyid = null;
    String faq = null;
    String reply = null;
    // @Override

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        replyid = xtpl.sv.AutoID.globalGenId("Reply-", "reply");

        reply = request.getParameter("textdescription");
        faq = request.getParameter("txtfaq");
        user = request.getParameter("txtlogin");
        if (reply != null) {
            try {
                conn = xtpl.sv.ConnectionBean.makeCon(request);
                String query = "insert into reply1(replyid,faq,user,reply,date) values(?,?,?,?,now())";

                pst = conn.prepareStatement(query);
                pst.setString(1, replyid);
                pst.setString(2, faq);
                pst.setString(3, user);
                pst.setString(4, reply);



                int j = 0;
                j = pst.executeUpdate();
                if (j > 0) {
                    xtpl.sv.AutoID.updateCampaignId("reply", replyid);
                    session.setAttribute("Message", "You Have Posted  Successfully !!");
                    response.sendRedirect("AdminFaqList.jsp");
                } else {
                    session.setAttribute("Message", "Sorry There is Some Problem!!");
                    response.sendRedirect("AdminFaqList.jsp");
                }

            } catch (Exception e) {
            }

        } else {
            session.setAttribute("Message", "Sorry There is Some Problem!!");
            response.sendRedirect("AdminFaqList.jsp");
        }

    }
}

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

public class NewFaq extends HttpServlet {

    Connection conn = null;
    Statement st = null;
    PreparedStatement pst = null;
    ResultSet rs = null;
    String faq = null;
    String login = null;
       String faqid = null;
    // @Override

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        faqid = xtpl.sv.AutoID.globalGenId("Faq-", "faq");
        faq = request.getParameter("textdescription");
        login = request.getParameter("txtlogin");

        if (faq != null) {
            try {
                conn = xtpl.sv.ConnectionBean.makeCon(request);
                String query = "insert into faq(faqid,faq,username,date) values(?,?,?,now())";
                pst = conn.prepareStatement(query);
                pst.setString(1, faqid);
                pst.setString(2, faq);
                pst.setString(3, login);


                int j = 0;
                j = pst.executeUpdate();
                if (j > 0) {
                    xtpl.sv.AutoID.updateCampaignId("faq", faqid);
                    session.setAttribute("Message", "Your Question is Successfully Accepted By Us!!");
                    response.sendRedirect("Faq.jsp");
                } else {
                    session.setAttribute("Message", "Sorry There is Some Problem!!");
                    response.sendRedirect("Faq.jsp");
                }

            } catch (Exception e) {
            }

        } else {
            session.setAttribute("Message", "Sorry There is Some Problem!!");
            response.sendRedirect("Faq.jsp");
        }

    }
}

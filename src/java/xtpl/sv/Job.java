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

public class Job extends HttpServlet {

    Connection conn = null;
    Statement st = null;
    PreparedStatement pst = null;
    ResultSet rs = null;
    //define globle variable
    String enq_id = null;
    String fname = null;
    String lname = null;
    String gender = null;
    String contact = null;
    String mobile = null;
    String city = null;
    String place = null;
    String enquiry = null;
    String email = null;

    // @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(true);

        //accepted all field from enquiry.jsp form
        enq_id = xtpl.sv.AutoID.globalGenId("ENQ-", "job");

        fname = request.getParameter("txtfname");
        lname = request.getParameter("txtlname");
        gender = request.getParameter("cmbgender");
        email = request.getParameter("txtemail");
        mobile = request.getParameter("txtmob");
        contact = request.getParameter("txtcontno");
        place = request.getParameter("txtplace");
        city = request.getParameter("txtcity");
        enquiry = request.getParameter("txtenquiry");

        //insert in database
        if (fname != null) {
            try {
                conn = xtpl.sv.ConnectionBean.makeCon(request);
                String query = "insert into job(enq_id,fname,lname,gender,email,mobile,cont_no,place,city,enquiry,enq_date) values(?,?,?,?,?,?,?,?,?,?,now())";
                pst = conn.prepareStatement(query);
                pst.setString(1, enq_id);
                pst.setString(2, fname);
                pst.setString(3, lname);
                pst.setString(4, gender);
                pst.setString(5, email);
                pst.setString(6, mobile);
                pst.setString(7, contact);
                pst.setString(8, place);
                pst.setString(9, city);
                pst.setString(10, enquiry);
                int j = 0;
                j = pst.executeUpdate();
                if (j > 0) {
                    xtpl.sv.AutoID.updateCampaignId("job", enq_id);
                    session.setAttribute("Message", "Your Information is Successfully Accepted By Us!!");
                    response.sendRedirect("JobDetails.jsp");
                } else {
                    session.setAttribute("Message", "Sorry There is Some Problem!!");
                    response.sendRedirect("JobDetails.jsp");
                }

            } catch (Exception e) {
            }

        } else {
            session.setAttribute("Message", "Sorry There is Some Problem!!");
            response.sendRedirect("JobDetails.jsp");
        }

    }
}

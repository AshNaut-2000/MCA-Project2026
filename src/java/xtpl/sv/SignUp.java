/*
 
 */
package xtpl.sv;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.http.HttpSession;

public class SignUp extends HttpServlet {

    Connection conn = null;
    Statement st = null;
    PreparedStatement pst = null;
    ResultSet rs = null;

    String reg_id = null;
    String lname = null;
    String gender = null;
    String contact = null;
    String mobile = null;
    String city = null;
    String place = null;
    String enquiry = null;
    String email = null;
    String pass = null;
    String name = null;
    String dob = null;
    String state = null;

     @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(true);


        //accepted all field from enquiry.jsp form
        reg_id = xtpl.sv.AutoID.globalGenId("Reg-", "register");

        lname = request.getParameter("txtfname");
        pass = request.getParameter("txtpwd");
        name = request.getParameter("txtname");
        gender = request.getParameter("cmbgender");
        dob = request.getParameter("txtdob");
        place = request.getParameter("txtplace");
        state = request.getParameter("txtstate");
        email = request.getParameter("txtemailid");
        mobile = request.getParameter("txtmobile");

        if (lname != null) {
            try {
                conn = xtpl.sv.ConnectionBean.makeCon(request);
                String query= "insert into register(reg_id,lname,pass,name,gender,dob,place,state,email,,mobile,reg_date) values(?,?,?,?,?,?,?,?,?,?,now())";
                pst = conn.prepareStatement(query);
   
                pst.setString(1, reg_id);
                pst.setString(2, lname);
                pst.setString(3, pass);
                pst.setString(4, name);
                pst.setString(5, gender);
                pst.setString(6, dob);
                pst.setString(7, place);
                pst.setString(8, state);
                pst.setString(9, email);
                pst.setString(10, mobile);
                int j = 0;
                j = pst.executeUpdate();
                if (j > 0) {
                    xtpl.sv.AutoID.updateCampaignId("register", reg_id);
                    session.setAttribute("Message", "Your Information is Successfully Accepted !!");
                    response.sendRedirect("applicationForm.jsp");
                } else {
                    session.setAttribute("Message", "Sorry There is Some Problem!!");
                    response.sendRedirect("applicationForm.jsp");
                }

            } catch (Exception e) {
            }

        } else {
            session.setAttribute("Message", "Sorry There is Some Problem!!");
            response.sendRedirect("Enquiry.jsp");
        }

    }
}

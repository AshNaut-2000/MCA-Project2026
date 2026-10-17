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

public class CompanyRegistration extends HttpServlet {

    Connection conn = null;
    Statement st = null;
    PreparedStatement pst = null;
    ResultSet rs = null;
    //define globle variable
    String reg_id = null;
    String lname = null;
    String pass = null;
    String name = null;
    String gender = null;
    String dob = null;
    String place = null;
    String state = null;
    String email = null;
    String mob = null;

    // @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(true);

        //accepted all field from enquiry.jsp form
        reg_id = xtpl.sv.AutoID.globalGenId("Reg-", "Company");

        lname = request.getParameter("txtlname");
        pass = request.getParameter("txtpwd");
        name = request.getParameter("txtname");
        gender = request.getParameter("cmbgender");
        dob = request.getParameter("txtdob");
        place = request.getParameter("txtplace");
        state = request.getParameter("txtstate");
        email = request.getParameter("txtemailid");
        mob = request.getParameter("txtmobile");

        if (lname != null) {
            try {
                conn = xtpl.sv.ConnectionBean.makeCon(request);
                String query = "insert into company(reg_id,lname,pass,name,gender,dob,place,state,email,mob,enq_date) values(?,?,?,?,?,?,?,?,?,?,now())";
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
                pst.setString(10, mob);
                int j = 0;
                j = pst.executeUpdate();
                if (j > 0) {
                    xtpl.sv.AutoID.updateCampaignId("Company", reg_id);
                    session.setAttribute("Message", "Your Information is Successfully Accepted By Us!!");
                    response.sendRedirect("CompanyDetail.jsp");
                } else {
                    session.setAttribute("Message", "Sorry There is Some Problem!!");
                    response.sendRedirect("CompanyDetail.jsp");
                }

            } catch (Exception e) {
            }

        } else {
            session.setAttribute("Message", "Sorry There is Some Problem!!");
            response.sendRedirect("applicationForm.jsp");
        }

    }
}

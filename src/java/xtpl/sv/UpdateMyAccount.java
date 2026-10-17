/*
 
 */
package xtpl.sv;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import javax.servlet.http.HttpSession;

public class UpdateMyAccount extends HttpServlet {

    Connection con = null;
    ResultSet rs = null;
    PreparedStatement pst = null;
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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        reg_id = request.getParameter("txtid");
     name = request.getParameter("txtname");
        gender = request.getParameter("cmbgender");
        dob = request.getParameter("txtdob");
        place = request.getParameter("txtplace");
        state = request.getParameter("txtstate");
        email = request.getParameter("txtemailid");
        mob = request.getParameter("txtmobile");
        if (name != null) {
            try {
                con = xtpl.sv.ConnectionBean.makeCon(request);
                String query = "Update saveregistration set name='" + name + "', gender='" + gender + "',dob='" + dob + "',place = '" + place + "',state = '" + state + "', email='" + email + "',mob='" + mob + "' where reg_id='" + reg_id + "'";
                pst = con.prepareStatement(query);
                int j = pst.executeUpdate();
                if (j > 0) {
                    response.sendRedirect("MyAccount.jsp");
                    session.setAttribute("msg", "My  Account Is Updated  successfully!!!");
                } else {
                    response.sendRedirect("MyAccount.jsp");
                    session.setAttribute("msg", "My  Account  Is Not Updated  successfully!!!");
                }
            } catch (Exception e) {

            }
        }
    }
}

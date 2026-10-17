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

public class ChangePassword extends HttpServlet {

    Connection con = null;
    ResultSet rs = null;
    PreparedStatement pst = null;
    String name = null;
    String opass = null;
    String npass = null;


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);

        opass = request.getParameter("txtopass");
   
        npass = request.getParameter("txtnpass");
    
        if (opass != null) {
            try {
                con = xtpl.sv.ConnectionBean.makeCon(request);
                String query = "Update saveregistration set pass='" + npass + "'where  pass='" + opass+"'";
                pst = con.prepareStatement(query);
                int j = pst.executeUpdate();
                if (j > 0) {
                    response.sendRedirect("ChangePassword.jsp");
                    session.setAttribute("MSG", "Your Password Is Change  Successfully!!!");
                } else {
                    response.sendRedirect("ChangePassword.jsp");
                    session.setAttribute("MSG", "Sorry!! Your Password Is Not Change  Successfully!!!");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}

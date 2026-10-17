/*
 
 */
package xtpl.sv;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.ServletException;
import java.sql.ResultSet;
import java.sql.Statement;

public class UserAuthentication extends HttpServlet {
    static Connection con = null;
    Statement st = null;
    PreparedStatement pst = null;
    PreparedStatement pst1 = null;
    ResultSet rst = null;
    String uname = null;
    String password = null;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                HttpSession session = request.getSession(true);
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        uname = request.getParameter("txtuname");
        password = request.getParameter("txtpassword");
          if (password != null) {
        try {
            con = xtpl.sv.ConnectionBean.makeCon(request);
            String query = "select lname,pass from saveregistration where lname='" + uname + "' and pass='" + password + "'";
         
            pst = con.prepareStatement(query);
            rst = pst.executeQuery();
            if (rst.next()) {
              response.sendRedirect("User/MyAccount.jsp");
            } else {
                 session.setAttribute("LOGIN", "Incorrect Userrr Login and Password !! Retry Again");
            response.sendRedirect("Authenticate.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } 
        }  
    }
}

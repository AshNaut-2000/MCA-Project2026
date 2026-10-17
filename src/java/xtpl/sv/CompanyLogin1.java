/*

 */
package xtpl.sv;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.ServletException;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.http.HttpSession;

/**
 *
 * @author surendra
 */
public class CompanyLogin1 extends HttpServlet {

    static Connection con = null;
    Statement st = null;
    PreparedStatement pst = null;
    PreparedStatement pst1 = null;
    ResultSet rst = null;
    ResultSet rst1 = null;
    HttpSession session = null;
    String uname = null;
    String password = null;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        session = request.getSession(true);
        uname = request.getParameter("txtuname");
        password = request.getParameter("txtpassword");

        boolean rowfound = false;
        String bt = request.getParameter("subLogin");



        if (uname.equals("") && password.equals("")) {
            session = request.getSession(true);
            session.setAttribute("LOGIN", "Required fields can't be left blank!");
            RequestDispatcher disp = request.getRequestDispatcher("/Company.jsp");
            disp.forward(request, response);
        }
        if (uname.equals("")) {
            session = request.getSession(true);
            session.setAttribute("LOGIN", "Username can't be left blank!");
            RequestDispatcher disp = request.getRequestDispatcher("/Company.jsp");
            disp.forward(request, response);
        }
        if (password.equals("")) {
            session = request.getSession(true);
            session.setAttribute("LOGIN", "Password can't be left blank!");
            RequestDispatcher disp = request.getRequestDispatcher("/Company.jsp");
            disp.forward(request, response);
        }
        //..........   Login  Authentication ...........................
        String username = "";
        try {

            con = xtpl.sv.ConnectionBean.makeCon(request);
            // pst = con.prepareStatement("select username from adminlogin where username=? COLLATE SQL_Latin1_General_Cp1_CS_AS and password=? COLLATE SQL_Latin1_General_Cp1_CS_AS");
            pst = con.prepareStatement("select lname from company where lname= '" + uname + "'  and pass=  '" + password + "'");
        
           // pst.setString(1, uname);
           // pst.setString(2, password);
            rst = pst.executeQuery();
            if (rst.next()) {
                username = rst.getString(1);
                rowfound = true;
                session.setAttribute("COMPANY", uname);

                RequestDispatcher disp = request.getRequestDispatcher("StudentsDetail.jsp");
                disp.forward(request, response);
            } else {
                session = request.getSession(true);
                session.setAttribute("LOGIN", "Sorry!! Invalid Username/Password");
                RequestDispatcher disp = request.getRequestDispatcher("/Company.jsp");
                disp.forward(request, response);
            }



//            if (rowfound) {
//                session.setAttribute("UNAME", username);
//
//                RequestDispatcher disp = request.getRequestDispatcher("/registrationDetails.jsp");
//                disp.forward(request, response);
//            } else {
//                session = request.getSession(true);
//                session.setAttribute("LOGIN", "Sorry!! Invalid Username/Password");
//                RequestDispatcher disp = request.getRequestDispatcher("/login.jsp");
//                disp.forward(request, response);
//            }




        } catch (Exception exception) {

            exception.printStackTrace();

            //---.println("Exception occur...... " + exception.getMessage());

        }
    }
    //...................  Login time  show to jsp page ........................
}

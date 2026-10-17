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

/**
 *
 * @author Owner
 */
public class Vrification extends HttpServlet {

    static Connection conn = null;
    Statement st = null;
    PreparedStatement pst = null;
    ResultSet rs = null;
    String id = null;
    String fname = null;
    String app = null;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(true);
        id = request.getParameter("txtid");
        fname = request.getParameter("txtfname");
        app = request.getParameter("cmbappv");






        if (id != null) {
            try {
                conn = xtpl.sv.ConnectionBean.makeCon(request);
                String query = "Insert into varificaion(id,fname,app)values(?,?,?)";

                pst = conn.prepareStatement(query);
                pst.setString(1, id);
                pst.setString(2, fname);
                pst.setString(3, app);


                int j = 0;
                j = pst.executeUpdate();
                if (j > 0) {

                    session.setAttribute("MSG", "New Varification Is Registered!!");
                    response.sendRedirect("ResumeList.jsp");
                   
                } else {
                    session.setAttribute("MSG", "New Varification Is Not Registered!!");
                    response.sendRedirect("ResumeList.jsp");
                }

            } catch (Exception e) {
                e.printStackTrace();
            }

        }

    }

}

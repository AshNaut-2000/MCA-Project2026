/*

 */
package xtpl.sv;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author ritesh
 */
public class DownloadingForm extends HttpServlet {

    String name = null;
    String email = null;
    String mob = null;
    String highest_qual = null;
    String university = null;
    String other_qual = null;
    Connection con = null;
    PreparedStatement pst = null;
    HttpSession session = null;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        session = request.getSession(true);
        name = request.getParameter("txtname");
        email = request.getParameter("txtEmail");
        mob = request.getParameter("txtMob");
        highest_qual = request.getParameter("cmbhighest_qual");
        other_qual = request.getParameter("txtother_qual");
        university = request.getParameter("txtUniversity");
        try {
            con = xtpl.sv.ConnectionBean.makeCon(request);
            String SQuery = "insert into downloading_form(name,highest_qual,other_qual,university,mobile,email,date) values(?,?,?,?,?,?,now())";
            pst = con.prepareStatement(SQuery);       
            pst.setString(1, name);
            pst.setString(2, highest_qual);
            pst.setString(3, other_qual);
            pst.setString(4, university);
            pst.setString(5, mob);
            pst.setString(6, email);
            int i = pst.executeUpdate();
            session.setAttribute("ADD", "Data has been successfully Inserted");
            session.setAttribute("NAME", name);
            RequestDispatcher rd = request.getRequestDispatcher("/Application_Form.jsp");
            rd.forward(request, response);
            pst.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("ADD", "Sorry!! Data has not been successfully added");
        }
    }
}

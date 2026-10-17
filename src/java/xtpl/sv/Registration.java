/*

 */
package xtpl.sv;

import java.io.IOException;

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
public class Registration extends HttpServlet {

    String name = null;
    String fname = null;
    String dob = null;
    String email = null;
    String mob = null;
    String address = null;
    String state = null;
    String zipcode = null;
    String country = null;
    String remarks = null;
    Connection con = null;
    PreparedStatement pst = null;
    HttpSession session = null;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        session = request.getSession(true);
        name = request.getParameter("txtname");
        fname = request.getParameter("txtFName");
        dob = request.getParameter("txtDOB");
        email = request.getParameter("txtEmail");
        mob = request.getParameter("txtMob");
        address = request.getParameter("txtAddress");
        state = request.getParameter("txtState");
        zipcode = request.getParameter("txtZip");
        country = request.getParameter("txtCount");
        remarks = request.getParameter("txtRemarks");
        addRegistrationRecord(request, response);
    }

    public void addRegistrationRecord(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {


            con = xtpl.sv.ConnectionBean.makeCon(request);
          
            pst = con.prepareStatement("insert into registration(name,fname ,dob,email ,mob ,address ,state ,zipcode,country,remarks)" +
                    " values(?,?,?,?,?,?,?,?,?,?)");
            pst.setString(1, name);
            pst.setString(2, fname);
            pst.setString(3, dob);
            pst.setString(4, email);
            pst.setString(5, mob);
            pst.setString(6, address);
            pst.setString(7, state);
            pst.setString(8, zipcode);
            pst.setString(9, country);
            pst.setString(10, remarks);

            int i = pst.executeUpdate();

            session.setAttribute("ADD", "Data has been successfully Inserted");
            RequestDispatcher rd = request.getRequestDispatcher("/applicationForm.jsp");
            rd.forward(request, response);
            pst.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("ADD", "Sorry!! Data has not been successfully added");
        }
    }
}
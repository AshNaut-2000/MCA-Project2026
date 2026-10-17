/*

 */
package xtpl.sv;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.http.HttpSession;

/**
 *
 * @author softavate
 */
public class DeleteRecord extends HttpServlet {

    HttpSession session = null;
    String id = null;
    Connection con1 = null;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        session = request.getSession(true);

        response.setContentType("text/xml");
      id = request.getParameter("id");
        
        PrintWriter out = response.getWriter();
        try {
            con1 = xtpl.sv.ConnectionBean.makeCon(request);

            PreparedStatement pst22 = con1.prepareStatement("delete from  registration where id=?");
            pst22.setString(1, id);

            int i = pst22.executeUpdate();
            RequestDispatcher rd = request.getRequestDispatcher("/registrationDetails.jsp");
            rd.forward(request, response);


        } catch (Exception e) {

            e.printStackTrace();
        }

    }
}

/*

 */
package xtpl.sv;

import java.io.IOException;
//import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;
/**
 *
 * @author Shak
 */
public class Logout extends HttpServlet {



    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        //---.println("lllllll"+logtype);
            session.removeAttribute("UNAME");
            session.invalidate();

            RequestDispatcher rd = request.getRequestDispatcher("/logout.jsp");
            rd.forward(request, response);


    }
}

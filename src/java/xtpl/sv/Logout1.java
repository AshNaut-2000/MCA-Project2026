/*

 */
package xtpl.sv;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Administrator
 */
public class Logout1 extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String logtype = null;
        logtype = request.getParameter("utype");

        if (logtype.equalsIgnoreCase("admin")) {
            HttpSession session = request.getSession();
            session.setAttribute("ADMIN", null);
            session.setAttribute("LOGIN", null);
            session.setAttribute("LOGINTIME", null);
            session.removeAttribute("ADMIN");
            session.removeAttribute("LOGIN");
            session.invalidate();
            HttpSession sess = request.getSession(true);
            sess.setAttribute("SESSION", "Logout Successfuly !!");
            RequestDispatcher rd = request.getRequestDispatcher("logout.jsp");
            rd.forward(request, response);
        }
        if (logtype.equalsIgnoreCase("user")) {
            HttpSession session = request.getSession();
            session.setAttribute("USERNAME", null);
            session.setAttribute("LOGIN", null);
            session.setAttribute("MSG", null);
            session.setAttribute("LASTLOGINTIME", null);
            session.removeAttribute("USER");
            session.removeAttribute("LOGIN");
            session.removeAttribute("LASTLOGINTIME");
            session.invalidate();
            HttpSession sess = request.getSession(true);
            sess.setAttribute("SESSION", "Logout Successfuly !!");
            RequestDispatcher rd = request.getRequestDispatcher("SessionTime.jsp");
            rd.forward(request, response);
        }
    }
}

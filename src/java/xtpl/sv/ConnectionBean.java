/*

 */
package xtpl.sv;

import java.io.IOException;
//import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.http.HttpServlet;
import java.sql.DriverManager;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;

/**

 */
public class ConnectionBean extends HttpServlet {

    static Connection con = null;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    static public Connection makeCon(HttpServletRequest req) throws ServletException, IOException {
        try {
            String url = "jdbc:mysql://localhost:3306/";
            String dbName = "catp";
            String driver = "com.mysql.jdbc.Driver";
            String userName = "root";
            String password = "root";
            Class.forName(driver).newInstance();
           
            con = DriverManager.getConnection(url + dbName, userName, password);
            //    con.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        }
        return con;
    }
//        try {
//               Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
//            //con=DriverManager.getConnection("jdbc:odbc:dsnUFIS","aayamtec_ufi","india123");
//
//             con=DriverManager.getConnection("jdbc:odbc:xtpl_dsn","aayamtec_xploriadmin","india123");
//
//
//            //Class.forName("net.sourceforge.jtds.jdbc.Driver");
//            //String url = "jdbc:jtds:sqlserver://db200.my-hosting-panel.com:1433/aayamtec_xplorigen";
//            //con = DriverManager.getConnection(url, "aayamtec_xploriadmin", "india123");
//
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//        }
//        return con;
    // }
}

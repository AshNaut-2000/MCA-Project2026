/*

 */
package xtpl.sv;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;
import java.io.*;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.servlet.*;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletConfig;

/**
 *
 * @author softavate
 */
public class OnlineJob extends HttpServlet {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String pname = null;
    String pname1 = null;
    String userid = null;
    String uname = null;
    String password = null;
    String fname = null;
    String lname = null;
    String gender = null;
    String dob = null;
    String contactNo = null;
    String emailid = null;
    String address = null;
    String city = null;
    String pincode = null;
    String state = null;
    String marks = null;
    String blog = null;
    String country = null;
    String fullImagepath = null;
    HttpSession session = null;
    String course = null;
    String branch = null;
    String gp = null;
    String gy = null;
    String sb = null;
    String sc = null;
    String tp = null;
    String ty = null;
    String tenthp = null;
    String tenthy = null;
    String hobbies = null;
    String summer = null;
    String mname = null;
    String name = null;
    String pname11 = null;
    String pname12 = null;
    String fullImagepath1 = null;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //String size1 = request.getParameter("txtsiz");

        PrintWriter out = response.getWriter();
        int i = 0;
        response.setContentType("text/html");
        ServletConfig config = getServletConfig();
        String context = config.getServletContext().getRealPath("/");
        String imagePath = context + "UploadedImage";
        boolean status = false;
        String fullfilename = null;
        String fullfilename1 = null;
        java.util.Date d = new java.util.Date();
        long timestamp = d.getTime();
        try {
            File projectDir = new File("imagePath");
            if (!projectDir.exists()) {
                projectDir.mkdirs();

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        boolean isMultipart = ServletFileUpload.isMultipartContent(new ServletRequestContext(request));
        if (isMultipart) {
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            try {
                List/*FileItem*/ items = upload.parseRequest(request);
                Iterator iter = items.iterator();
                while (iter.hasNext()) {
                    FileItem item = (FileItem) iter.next();
                    if (item.isFormField()) {
                        if (item.getFieldName().equalsIgnoreCase("txthidden")) {
                            userid = item.getString();
                            //System.out.println("user name : " + uname);
                        }
                        if (item.getFieldName().equalsIgnoreCase("uname")) {
                            uname = item.getString();
                            //System.out.println("user name : " + uname);
                        }

                        if (item.getFieldName().equalsIgnoreCase("txtcourse")) {
                            course = item.getString();
                            //System.out.println("user name : " + uname);
                        }
                        if (item.getFieldName().equalsIgnoreCase("txtbranch")) {
                            branch = item.getString();
                            //System.out.println("user name : " + uname);
                        }
                        if (item.getFieldName().equalsIgnoreCase("gp")) {
                            gp = item.getString();
                            //System.out.println("user name : " + uname);
                        }
                        if (item.getFieldName().equalsIgnoreCase("gy")) {
                            gy = item.getString();
                            //System.out.println("user name : " + uname);
                        }
                        if (item.getFieldName().equalsIgnoreCase("sc")) {
                            sc = item.getString();
                            //System.out.println("user name : " + uname);
                        }
                        if (item.getFieldName().equalsIgnoreCase("sb")) {
                            sb = item.getString();
                            //System.out.println("user name : " + uname);
                        }
                        if (item.getFieldName().equalsIgnoreCase("tp")) {
                            tp = item.getString();
                            //System.out.println("user name : " + uname);
                        }
                        if (item.getFieldName().equalsIgnoreCase("ty")) {
                            ty = item.getString();
                            //System.out.println("user name : " + uname);
                        }
                        if (item.getFieldName().equalsIgnoreCase("tenthp")) {
                            tenthp = item.getString();
                            //System.out.println("user name : " + uname);
                        }
                        if (item.getFieldName().equalsIgnoreCase("tenthy")) {
                            tenthy = item.getString();
                            //System.out.println("user name : " + uname);
                        }
                        if (item.getFieldName().equalsIgnoreCase("hobbies")) {
                            hobbies = item.getString();
                            //System.out.println("user name : " + uname);
                        }
                        if (item.getFieldName().equalsIgnoreCase("summer")) {
                            summer = item.getString();
                            //System.out.println("user name : " + uname);
                        }
                        if (item.getFieldName().equalsIgnoreCase("txtfname")) {
                            fname = item.getString();
                            //System.out.println("user name : " + uname);
                        }
                        if (item.getFieldName().equalsIgnoreCase("txtmname")) {
                            mname = item.getString();
                            //System.out.println("user name : " + uname);
                        }
                        if (item.getFieldName().equalsIgnoreCase("txtname")) {
                            name = item.getString();
                            //System.out.println("user name : " + uname);
                        }
                        if (item.getFieldName().equalsIgnoreCase("txtlname")) {
                            lname = item.getString();
                            //System.out.println("user name : " + uname);
                        }
                        if (item.getFieldName().equalsIgnoreCase("cmbgender")) {
                            gender = item.getString();
                            //System.out.println("user name : " + uname);
                        }
                        if (item.getFieldName().equalsIgnoreCase("txtdb")) {
                            dob = item.getString();
                            //System.out.println("user name : " + uname);
                        }
                        if (item.getFieldName().equalsIgnoreCase("number")) {
                            contactNo = item.getString();
                            //System.out.println("user name : " + uname);
                        }
                        if (item.getFieldName().equalsIgnoreCase("txtemail")) {
                            emailid = item.getString();
                            //System.out.println("user name : " + uname);
                        }
                        if (item.getFieldName().equalsIgnoreCase("txtaddress")) {
                            address = item.getString();
                            //System.out.println("user name : " + uname);
                        }
                        if (item.getFieldName().equalsIgnoreCase("cmbcity")) {
                            city = item.getString();
                            //System.out.println("user name : " + uname);
                        }
                        if (item.getFieldName().equalsIgnoreCase("txtpin")) {
                            pincode = item.getString();
                            //System.out.println("user name : " + uname);
                        }
                        if (item.getFieldName().equalsIgnoreCase("txtstate")) {
                            state = item.getString();
                            //System.out.println("user name : " + uname);
                        }
                        if (item.getFieldName().equalsIgnoreCase("cmbcountry")) {
                            country = item.getString();
                            //System.out.println("user name : " + uname);
                        }

                    } else {
                        fullfilename = "UserImage" + "_" + timestamp;
                        System.out.println("fullfilename : " + fullfilename);
                        if (item.getFieldName().equalsIgnoreCase("txtImage")) {
                            String filename = item.getName();
                            if (!filename.equalsIgnoreCase("")) {
                                pname = filename.substring(filename.lastIndexOf("."), filename.length());
                                pname1 = imagePath + File.separator + fullfilename + pname;
                                fullImagepath = fullfilename + pname;
                                File file3 = new File(pname1);
                                try {
                                    item.write(file3);
                                    status = true;
                                } catch (Exception e1) {
                                    e1.printStackTrace();
                                    status = false;
                                }
                            }
                        }
                        fullfilename1 = "UserImage" + "_" + timestamp;
                        System.out.println("fullfilename : " + fullfilename);
                        if (item.getFieldName().equalsIgnoreCase("txtImage1")) {
                            String filename1 = item.getName();
                            if (!filename1.equalsIgnoreCase("")) {
                                pname11 = filename1.substring(filename1.lastIndexOf("."), filename1.length());
                                pname12 = imagePath + File.separator + fullfilename1 + pname11;
                                fullImagepath1 = fullfilename1 + pname11;
                                File file3 = new File(pname12);
                                try {
                                    item.write(file3);
                                    status = true;
                                } catch (Exception e1) {
                                    e1.printStackTrace();
                                    status = false;
                                }
                            }
                        }
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                status = false;
            }
        }
        String msg = null;
        if (status == true) {
            try {
                Connection con2 = xtpl.sv.ConnectionBean.makeCon(request);
                PreparedStatement pst = null;
                String sqlquery = "insert into resume(userid,uname,Image,VideoFile,course,branch,gp,gy,sc,sb,tp,ty,tenthp,tenthy,hobbies,summer,fname,mname,FirstName,LastName,Gender,DOB,ContactNo,EmailID,Address,City,PinCode,State,Country)values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                System.out.println(" sql query : " + sqlquery);
                pst = con2.prepareStatement(sqlquery);
                pst.setString(1, userid);
                pst.setString(2, uname);
                pst.setString(3, fullImagepath);
                pst.setString(4, fullImagepath1);
                pst.setString(5, course);
                pst.setString(6, branch);

                     pst.setString(7, gp);
                pst.setString(8, gy);
                pst.setString(9, sc);
                pst.setString(10, sb);
                pst.setString(11, tp);
                pst.setString(12, ty);

                     pst.setString(13, tenthp);
                pst.setString(14, tenthy);
                pst.setString(15, hobbies);
                pst.setString(16, summer);
                pst.setString(17, fname);
                pst.setString(18, mname);

                pst.setString(19, name);
                pst.setString(20, lname);
                pst.setString(21, gender);
                pst.setString(22, dob);
                pst.setString(23, contactNo);
                pst.setString(24, emailid);
                pst.setString(25, address);
                pst.setString(26, city);
                pst.setString(27, pincode);
                pst.setString(28, state);
                pst.setString(29, country);

                i = pst.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (i > 0) {

                msg = "Successfully Registered";
                session = request.getSession(true);
                session.setAttribute("MSG", msg);
                response.sendRedirect("OnlineJob.jsp");

            } else {
                msg = "Not Registered";
                session = request.getSession(true);
                session.setAttribute("MSG", msg);
                response.sendRedirect("OnlineJob.JSP");
            }
        }
        if (status == false) {
            msg = "Not Registered";
            session = request.getSession(true);
            session.setAttribute("MSG", msg);
            response.sendRedirect("OnlineJob.jsp");
        }
    }
}

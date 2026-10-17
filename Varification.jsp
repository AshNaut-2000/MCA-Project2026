<%--

--%>



<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%
         response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
         response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
         response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
         response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility
         String username = null;
         username = (String) session.getAttribute("ADMIN");
         if (username != null) {

%>
<script type="text/javascript">

    function deleteEnquiryRecord(val)
    {
        var answer = confirm ("Do you want to delete this Record?");
        if(answer)
        {

            return true;
        }
        else{
            return false;
        }
        return false;
    }
</script>
<%
            //String uname = (String) session.getAttribute("UNAME");

            //if (uname != null) {
%>
      <%@page import="java.sql.*" %>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Skill Bridge an Integrated Training and Placement Management System</title>
        <link href="css/style.css" rel="stylesheet" type="text/css" />
                 <link href="css/form_style.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div  id="maindiv"> <%-- main div --%>
            <div id="mainheader"> <%-------  opened mainheader-------------------------%>
                <div>
                    <%@include file="logoheader.jsp" %>
                </div>
                <div>
                    <%@include file="flashHeader.jsp" %>
                </div>
               <div id="header"><img src="images/header5.jpg" width="986" height="180" /></div>
            </div>             <%-------  closed mainheader------------------------------------------------------%>
            <div class="mainbody">   <%--  opened mainbody div --%>



                    <div class="shapemidfull11">

                        <div>
                            <table border="0" width="90%">
                                <tr>
                                    <td height="8px">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td height="30" colspan="8" style="text-align:center;font-weight:bold;background-color:#07304E;color:white;width:500px;font-family:verdana;font-size:16px;">
               <%@include file="admin.html" %>
                                    <td>
                                </tr>
                                <tr>
                                    <td colspan="8" align="center" style="font-size: 16px;font-weight:bold;background-color:#07304E;color:white;">
                                  Placement Status
                                    </td>
                                <tr>
                                    <td><div style="overflow:auto;height:400px">
                                                     <form action="vrification" method="post">
                                    <table style="margin-left: 100px;"width="100%" cellpadding="10" cellspacing="10" align="center">

    <%

                Connection con = null;
                ResultSet rs = null;
                Statement st = null;
                String fname = null;
                String cname = null;

                cname = request.getParameter("id");

                try {
                    con = xtpl.sv.ConnectionBean.makeCon(request);
                    st = con.createStatement();
                    String sql = "select uname from resume where userId = '" + cname + "'";
                    rs = st.executeQuery(sql);
                    while (rs.next()) {


                        fname = rs.getString(1);



    %>

                                        <tr>
                                            <td>Student Job No.</td>
                                            <td><input type="text" name="txtid" id="txtmodule" value="<%=cname%>"></td>
                                            <td>Student Name</td>
                                            <td><input type="text" name="txtfname" id="txtcenter" value="<%=fname%>"></td>
                                        </tr>
                                                  <%
                                                        }
                                                        con.close();
                                                        st.close();


                                                    } catch (Exception e) {
                                                    }

                                        %>

                                        <tr>
                                            <td>Status</td>
                                            <td>
                                                <select name="cmbappv"  style="width:145px;"id="cmbappv">
                                                     <option value="na">--select--</option>
                                                    <option value="Placed">Placed</option>
                                                     <option value="Not_Placed"> Not Placed</option>
                                                </select>
                                            </td>

                                                      <tr>
                                            &nbsp;
                                        </tr>
                                        <tr></tr>
                                        <tr>
                                            <td colspan="2" align="right">
                                                <input type="submit" name="btnsubmit" value="Submit" onclick="return total()">
                                                <input type="reset" name="btnreset" value="Reset">
                                            </td>
                                        </tr>




                                    </table>
                          </form>

                                        </div> </td>
                                </tr>


                            </table>


                        </div>

                    </div>

             
            </div>  <%-- closed mainbody div --%>
            <div><%@include file="footer.jsp" %>
            </div>
        </div> <%-- closed main div --%>
    </body>
</html>
<%
            } else {


                response.sendRedirect("logout.jsp");
            }
%>

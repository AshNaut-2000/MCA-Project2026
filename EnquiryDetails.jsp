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
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Skill Bridge an Integrated Training and Placement Management System</title>
        <link href="css/style.css" rel="stylesheet" type="text/css" />
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


                <form action="login1" method="post">
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
                                        DOWNLOADING DETAILS
                                    </td>
                                <tr>
                                    <td><div style="overflow:auto;height:400px">
                                            <table width="100%" border="0" cellpadding="1" cellspacing="1">
                                                <tr style="background-color:gray;color:white;font-weight:bold">

                                                    <td width="5%">
                                                        Sl.No.
                                                    </td>
                                                    <td width="5%">
                                                        First&nbsp;Name
                                                    </td>
                                                    <td width="5%">
                                                        Last&nbsp;Name
                                                    </td>
                                                    <td width="5%">
                                                        Gender
                                                    </td>
                                                    <td width="10%">
                                                        Email
                                                    </td>

                                                    <td width="5%">
                                                        Mobile
                                                    </td>
                                                    <td width="5%">
                                                        Contact
                                                    </td>

                                                    <td width="5%">
                                                        Place
                                                    </td>
                                                    <td width="5%">
                                                        City
                                                    </td>
                                                    <td width="35%">
                                                        Enquiry
                                                    </td>
                                                    <td width="10%">
                                                        Enq_Date
                                                    </td>
                                                    <td width="5%">
                                                        Delete
                                                    </td>
                                                </tr>
                                                <%!int sno = 1;%>
                                                <%

                                                            try {
                                                                Connection con = xtpl.sv.ConnectionBean.makeCon(request);
                                                                PreparedStatement pst = con.prepareStatement("select * from enquiry");

                                                                ResultSet rs = pst.executeQuery();
                                                                while (rs.next()) {
                                                                    String id = rs.getString(1);
                                                                    String fname = rs.getString(2);
                                                                    String lname = rs.getString(3);
                                                                    String gender = rs.getString(4);
                                                                    String email = rs.getString(5);
                                                                    String mobile = rs.getString(6);
                                                                    String contact = rs.getString(7);
                                                                    String place = rs.getString(8);
                                                                    String city = rs.getString(9);
                                                                    String enquiry = rs.getString(10);
                                                                    String date = rs.getString(11);


                                                %>                            <tr>
                                                    <td align="center">
                                                        <%=sno%>
                                                    </td>
                                                    <td>
                                                        <%=fname%>
                                                    </td>
                                                    <td>
                                                        <%=lname%>
                                                    </td>

                                                    <td>
                                                        <%=gender%>
                                                    </td>
                                                    <td>
                                                        <%=email%>
                                                    </td>
                                                    <td>
                                                        <%=mobile%>
                                                    </td>
                                                    <td>
                                                        <%=contact%>
                                                    </td>
                                                    <td>
                                                        <%=place%>
                                                    </td>
                                                    <td>
                                                        <%=city%>
                                                    </td>

                                                    <td>
                                                        <%=enquiry%>
                                                    </td>
                                                    <td>
                                                        <%=date%>
                                                    </td>



                                                    <td>
                                                        <a href="deleteEnquiry?id=<%=id%>" onclick="return deleteRecord(<%=id%>)">Delete</a>

                                                    </td>

                                                </tr>

                                                <%
                                                                    sno++;
                                                                }

                                                                //out.write("<root><status>true</status></root>");
                                                            } catch (Exception e) {
                                                                e.printStackTrace();
                                                            } finally {
                                                                out.close();
                                                            }

                                                            sno = 1;%>

                                            </table>

                                        </div> </td>
                                </tr>


                            </table>


                        </div>

                    </div>

                </form>
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

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
    function deleteRecord(val)
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
                                    <td height="30" colspan="9" style="text-align:center;font-weight:bold;background-color:#07304E;color:white;width:500px;font-family:verdana;font-size:16px;">
                                         <%@include file="admin.html" %>
                                    <td>
                                </tr>
                                <tr>
                                    <td colspan="9" align="center" style="font-size: 16px;font-weight:bold;background-color:#07304E;color:white;"">
                                        Resume DETAILS
                                </td>
                            </tr>
                            <tr>
                                <td><div style="overflow:auto;height:400px">
                                        <table width="100%" border="0" cellpadding="1" cellspacing="1">
                                            <tr style="background-color:gray;color:white;font-weight:bold">
                                                <td width="3%">
                                                    S.No
                                                </td>

                                                <td width="13%">
                                                    Name
                                                </td>

                                                <td width="10%">
                                                    Course
                                                </td>

                                                <td width="10%">
                                                    Branch
                                                </td>
                                                <td width="20%">
                                                    Grand(%)
                                                </td>
                                                <td width="10%">
                                                    Year
                                                </td>
                                                <td width="20%">
                                                    12(%)
                                                </td>
                                                <td width="10%">
                                                    Year
                                                </td>
                                                <td width="10%">
                                                    10(%)
                                                </td>

                                                <td width="10%">
                                                    Year
                                                </td>
                                                <td width="10%">
                                                    Video Resume
                                                </td>

                                                <td width="10%">
                                                     Resume
                                                </td>


                                            </tr>

                                            <%

                                                            try {
                                                                Connection con = xtpl.sv.ConnectionBean.makeCon(request);
                                                                PreparedStatement pst = con.prepareStatement("select * from resume");

                                                                ResultSet rs = pst.executeQuery();
                                                                while (rs.next()) {
                                                                    String id = rs.getString(1);
                                                                    String name = rs.getString(2);
                                                                    String gender = rs.getString(5);
                                                                    String dob = rs.getString(6);
                                                                    String place = rs.getString(7);
                                                                    String state = rs.getString(8);
                                                                    String place1 = rs.getString(11);
                                                                    String state1 = rs.getString(12);
                                                                    String place12 = rs.getString(13);
                                                                    String state12 = rs.getString(14);
                                                                    String place13 = rs.getString(3);
                                                                    String state13 = rs.getString(4);


                                            %>                            <tr>
                                                <td align="center"><a href="Varification.jsp?id=<%=id%>"><%=id%></a></td>

                                                <td>
                                                    <%=name%>
                                                </td>
                                                <td>
                                                    <%=gender%>
                                                </td>

                                                <td>
                                                    <%=dob%>
                                                </td>
                                                <td>
                                                    <%=place%>
                                                </td>
                                                <td>
                                                    <%=state%>
                                                </td>
                                                <td>
                                                    <%=place1%>
                                                </td>

                                                <td>
                                                    <%=state1%>
                                                </td>
                                                <td>
                                                    <%=place12%>
                                                </td>
                                                                                  <td>
                                                    <%=state12%>
                                                </td>

                                                <td  align="center"><a href="UploadedImage/<%=state13%>">Downloads</a></td>
                                                 <td  align="center"><a href="UploadedImage/<%=place13%>">Downloads</a></td>


                                            </tr>

                                            <%

                                                                }

                                                                //out.write("<root><status>true</status></root>");
                                                            } catch (Exception e) {
                                                                e.printStackTrace();
                                                            } finally {
                                                                out.close();
                                                            }

                                            %>

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
                response.sendRedirect("login.jsp");
            }
%>
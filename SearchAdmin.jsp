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
                                        Searching CV DETAILS
                                    </td>
                                    </tr>
                                <tr>
                                    <td><div style="overflow:auto;height:400px">
                                <table width="100%" cellspacing="3">

               <tr>
                            <td valign="top" style="margin-top:10px;">
                                <a href="searchmonth.jsp"><h3>Sort CV By Percentage</h3></a>
                           </td>
                        </tr>
                        <tr>
                            <td valign="top" style="margin-top:10px;">
                                <a href="SortByPlaced.jsp"><h3>Sort CV By Placed/Unplaced</h3></a>
                           </td>
                        </tr>
                                             <tr>
                            <td valign="top" style="margin-top:10px;">
                                <a href="SortCvByYear.jsp"><h3>Sort CV By Year </h3></a>
                           </td>
                        </tr>
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

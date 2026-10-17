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
        String cat=request.getParameter("cname");
        System.out.println("thread is"+cat);
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


            <form action="adminreply" method="post">

                                                <input type="hidden" value="<%=username%>" name="txtlogin" id="txtlogin">
                                                <table width="100%">
                                                    <tr>
                                                        <td class="bold_matter" height="30" valign="middle">
                                                            Question&nbsp; : &nbsp;&nbsp;&nbsp;&nbsp;  <b><%=cat%></b>
                                                        </td>
                                                    </tr>
                                                    <%
                                                                String msg = null;
                                                                msg = (String) session.getAttribute("Message");
                                                                if (msg != null) {
                                                    %>

                                                    <tr>
                                                        <td colspan="4" align="center">
                                                            <div style="width:100%;color: #3278A3; font-size: 12px;font-weight: bold;" align="center"><%=msg%></div>
                                                        </td>
                                                    </tr>
                                                    <%
                                                                    session.removeAttribute("Message");
                                                                } else {
                                                                    session.setAttribute("Message", "");

                                                                }
                                                    %>
                                                    <%
                                                                Connection con = null;
                                                                Statement st = null;
                                                                ResultSet rs = null;
                                                                int i = 0;
                                                                try {
                                                                    con = xtpl.sv.ConnectionBean.makeCon(request);
                                                                    st = con.createStatement();
                                                                    String Query = "select * from faq where faq='"+ cat+"'";
                                                                    rs = st.executeQuery(Query);
                                                                    while (rs.next()) {


                                                                        String user = rs.getString(3);
                                                                        i++;
                                                    %>
                                                    <tr class="bold_matter">
                                                    <input type="hidden" name="txtfaq" id="txtfaq" value="<%=cat%>">
                                                    <input type="hidden" name="txtuser" id="txtuser" value="<%=user%>">
                                                    </tr>
                                                    <%

                                                                    }
                                                                    st.close();
                                                                    con.close();
                                                                } catch (Exception e) {
                                                                }

                                                    %>

                                                    <tr>
                                                        <td align="center">
                                                            <div id="hidMSG" style="width:100%" align="center"></div>
                                                        </td>
                                                    </tr>

                                                    <tr id="PageContentRow1">
                                                        <td class="FeatureContainer" align="center">
                                                            <textarea id="textdescription" name="textdescription"  style="width:450px;height: 250px" cols="" rows="" class="iEdit"></textarea>
                                                            <script type="text/javascript">speckInit();</script>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center">
                                                            <input class="text_bor" align="right" type="submit"  id="submit" value="Submit" onclick="return valid(this)">
                                                            <input align="left" class="text_bor" type="reset" value="Reset">
                                                        </td>

                                                    </tr>
                                                </table>
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

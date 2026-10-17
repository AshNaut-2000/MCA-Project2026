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
    <%
                    String msg = (String) session.getAttribute("Message");

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
                                        FAQ DETAILS
                                    </td>
                                <tr>
                                    <td><div style="overflow:auto;height:400px">
                                            <form action="deleteFaqList" method="post">
                                                <table width="100%" cellpadding="3" cellspacing="3">

                                            <tr class="heading_lable">
                                                        <td width="15%">Resume ID</td>
                                                        <td width="50%">Name</td>
                                                        <td width="15%">&nbsp;Status&nbsp;</td>


                                                    </tr>
                                                    <%
                                                                    java.sql.Connection conn;
                                                                    conn = xtpl.sv.ConnectionBean.makeCon(request);
                                                                    java.sql.Statement st;
                                                                    String query;
                                                                    int pageAsInt = 0;
                                                                    int i = 0;

                                                                    // because records start with index 0; page should be decremented (for instance, page=2 should start with offset 10 = page - 1 * 10)
                                                                    query = "select * from varificaion where app = '" + msg + "'  ";
                                                                    st = conn.prepareStatement(query);
                                                                    java.sql.ResultSet result = st.executeQuery(query);
                                                                    while (result.next()) {
                                                                        String faqid = result.getString(1);
                                                                        String faq_ques = result.getString(2);
                                                                        String by = result.getString(3);

                                                                        i++;


                                                    %>
                                                    <tr class="text">
                                                        <td width="15%"><%=faqid%></td>
                                                          <td width="15%"><%=faq_ques%></td>
                                                            <td width="15%"><%=by%></td>




                                                </td>
                                                    </tr>
                                                    <tr></tr>

                                                    <%

                                                                    }

                                                    %>



                                                    <tr>
                                                        <td colspan="14" align="right">
                                                            <hr/>

                                                        </td>
                                                    </tr>

                                                </table>
                                            </form>

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

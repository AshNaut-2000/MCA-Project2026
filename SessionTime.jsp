
<%--

--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

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


                <div class="shaperight">
                    <div class="articleshape">
                          <%@include  file="services.jsp" %>
                    </div>
                    <div class="contact"><a href="#">Read More</a></div>
                </div>

                <div class="shapemidfull">

                    <div class="welcome"><h1><span>About Us</span></h1><br />
         <table align="center">
                                            <%
                                                        String sess_time = null;
                                                        sess_time = (String) session.getAttribute("SESSION");
                                                        if (sess_time != null) {
                                            %>
                                            <tr><td height="40" valign="middle" class="title"><%=sess_time%></td></tr>
                                            <%
                                                            session.removeAttribute("SESSION");
                                                        } else {
                                                            session.setAttribute("SESSION", "");

                                                        }
                                            %>

                                            <tr><td height="40" valign="middle" class="title"><a href="Authenticate.jsp" class="title" style="text-decoration: none;">CLICK HERE</a></td></tr>
                                        </table>
                    </div>

                </div>


            </div>  <%-- closed mainbody div --%>
            <div><%@include file="footer.jsp" %>
            </div>
        </div> <%-- closed main div --%>
    </body>
</html>

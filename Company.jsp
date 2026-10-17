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
                    <div class="welcome"><h1><span>User Login</span></h1><br />
     
                            <div style="height: 350px;overflow: auto;">
                                <form action="companyLogin1" method="post">
                                    <table width="100%" cellpadding="0" cellspacing="0">
                                        <tr valign="middle">
                                            <td width="100%">
                                                <table width="100%" border="0" cellpadding="5" cellspacing="5">
                                                    <%
                                                                String msg = null;
                                                                msg = (String) session.getAttribute("LOGIN");
                                                                if (msg != null) {
                                                    %>
                                                    <tr>
                                                        <td colspan="4" align="center">
                                                            <div style="width:100%;color: #3278A3; font-size: 12px;font-weight: bold;" align="center"><%=msg%></div>
                                                        </td>
                                                    </tr>
                                                    <%
                                                                    session.removeAttribute("LOGIN");
                                                                } else {
                                                                    session.setAttribute("LOGIN", "");

                                                                }
                                                    %>
                                                    <tr>
                                                        <td align="center">
                                                            <fieldset class="fieldset" style="width: 300px;">
                                                                <legend class="legand1">Login</legend>
                                                                <table width="100%">
                                                                    <tr><td height="10"></td></tr>
                                                                    <tr>
                                                                        <td class="bold_matter">
                                                                            HR Name:
                                                                        </td>
                                                                        <td>
                                                                            <input type="text" name="txtuname" id="txtuname" class="text-1" size="30">
                                                                        </td>

                                                                    </tr>
                                                                    <tr><td height="10"></td></tr>
                                                                    <tr>
                                                                        <td class="bold_matter">
                                                                            Password :
                                                                        </td>
                                                                        <td>
                                                                            <input type="password" name="txtpassword"  id="txtpassword" class="text-1" size="30">
                                                                        </td>
                                                                    </tr>

                                                                    <tr><td>&nbsp;</td></tr>
                                                                    <tr>
                                                                        <td align="right" colspan="2">
                                                                            <input  type="submit" name="submitRegister" id="submitRegister" value="Login" class="text_bor" style="margin-right: 40px;"/>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </fieldset>
                                                        </td>
                                                    </tr>

                                                </table>
                                            </td>
                                        </tr>

                                    </table>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>  <%-- closed mainbody div --%>
                <div><%@include file="footer.jsp" %>
                </div>
            </div>
        <%-- closed main div --%>
    </body>
</html>

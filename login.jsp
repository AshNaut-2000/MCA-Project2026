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


                <form action="login1" method="post">
                    <div class="shapemidfull11">

                        <div>
                            <center> <table border="0" width="50%">
                                    <tr>
                                        <td height="50px">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td height="15" style="text-align:center;font-weight:bold;background-color:#07304E;color:white;width:500px;font-family:verdana;font-size:16px;">
                                            Administrator Login
                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="120px" align="center">
                                            <table width="70%" border="0" cellpadding="8" cellspacing="8">
                                                <tr>
                                                    <%
        String msg = (String) session.getAttribute("LOGIN");
        if (msg != null) {
                                                    %>
                                                    <tr>
                                                        <td colspan="2" align="center" style="color:red"><%=msg%></td>
                                                    </tr>
                                                    <%
            session.removeAttribute("LOGIN");
        } else {
            session.setAttribute("LOGIN", null);
        }
                                                    %>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" height="14px">
                                                        &nbsp;
                                                </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">

                                                       <div> 
                                                           <hr style="color:orange;height:5px;background-color:orange" width="170%">
                                                       </div>
                                                </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        USER&nbsp;NAME
                                                    </td>
                                                    <td>
                                                        <input type="text" name="txtUserName" id="txtUserName" size="38">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        PASSWORD
                                                    </td><td>
                                                    <input type="password" name="txtPwd" id="txtPwd" size="38"></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <hr style="color:orange;height:5px;background-color:orange" width="170%" height="11px">
                                                </td>
                                                </tr>

                                                <tr>
                                                    <td>
                                                        &nbsp;
                                                    </td><td>
                                                        <input type="submit" name="subLogin" id="subLogin" value="     LOGIN     ">
                                                        <input type="reset" name="subreset" id="subreset" value="     CLEAR     ">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" height="14px">
                                                        &nbsp;
                                                </td></tr>
                                            </table>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align:center;background-color:#07304E;color:white;width:500px">&nbsp;</td>
                                    </tr>

                                </table>
                            </center>

                        </div>

                    </div>

                </form>
            </div>  <%-- closed mainbody div --%>
            <div><%@include file="footer.jsp" %>
            </div>
        </div> <%-- closed main div --%>
    </body>
</html>

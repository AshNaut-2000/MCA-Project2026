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
                            <center>
                                <table border="0" width="50%">
                                    <tr>
                                        <td height="150px">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td height="5" style="text-align:center;font-weight:bold;background-color:orange;color:white;width:500px;font-family:verdana;font-size:16px;">
                                         
                                        </td>
                                    </tr>
                                     <tr>
                                        <td height="25">

                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="40px" style="font-size:30px;" align="center">
                                         You successfully Logout...
                                        </td>
                                    </tr>
                                         <tr>
                                        <td height="25">

                                        </td>
                                    </tr>
                                      <tr>
                                        <td height="35px" style="font-size:15px;" align="center">
                                       <a href="login.jsp">  Click to Login  </a>
                                        </td>
                                    </tr>
                                         <tr>
                                        <td height="25">

                                        </td>
                                    </tr>
                                    <tr>
                                        <td height="5" style="text-align:center;font-weight:bold;background-color:orange;color:white;width:500px;font-family:verdana;font-size:16px;">

                                        </td>
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

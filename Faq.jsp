<%-- 
   
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
   <%
                response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
                response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
                response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
                response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility
                String username = null;
                username = (String) session.getAttribute("USER");
               if (username != null) {
                String threadmsg = (String) session.getAttribute("THREAD_STATUS");
                String catid = null, catname = null;
                catid = request.getParameter("cid");
                xtpl.sv.Subsidary obj = new xtpl.sv.Subsidary();
                catname = obj.getCategoryName(catid);
    %>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Skill Bridge an Integrated Training and Placement Management System</title>
        <link href="css/style.css" rel="stylesheet" type="text/css" />
    </head>
    <script type="text/javascript">
        function newpost(){
            alert('Registered user can send Post/Reply Only, Please Login...')
        }
    </script>
        <%
                    String cat = request.getParameter("cname");
        %>
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
                    <div id="navigation">
                        <%@include  file="usermenu.html" %>
                    </div>

                </div>

                <div class="shapemidfull">
                    <div class="welcome"><h1><span>Faq</span></h1><br />
        
                            <div style="height: 350px;overflow: auto;">
                                       <form action="newFaq" method="post">

                                                <input type="hidden" value="<%=username%>" name="txtlogin" id="txtlogin">
                                                <table width="100%">
                                                    <tr>
                                                        <td class="bold_matter" height="30" valign="middle">
                                                            Mr./Mrs.&nbsp; : &nbsp;&nbsp;&nbsp;&nbsp;  <b><%=username%></b>
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
<%
            } else {

                session.setAttribute("SESSION", "SESSION TIME EXPIRED !! <BR/><BR/> PLZ, LOGIN AGAIN ");
                response.sendRedirect("SessionTime.jsp");
            }
%>
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
%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Skill Bridge an Integrated Training and Placement Management System</title>
        <link href="css/style.css" rel="stylesheet" type="text/css" />
        <link href="css/form_style.css" rel="stylesheet" type="text/css" />

        <script language="javascript" src="js/CheckValidity.js"></script>


        <script type="text/javascript">
            function contact(i)
            {
                if(i.value.length>0)
                {
                    i.value = i.value.replace(/[^\d]+/g, '');

                }
            }

            function mob()
            {
                var rl=document.getElementById("txtmobile").value;
                if(rl.toString().length<10||rl.toString().length>10)
                {
                    alert("Contact No. should be of ten digits");
                    return false;
                }

            }
        </script>
        <script type="text/javascript">
            function valid() {
                //alert('calling');
                var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
                // var address = document.forms[form_id].elements[txtemail_id].value;
                var address = document.getElementById('txtemailid').value;
                if(reg.test(address) == false) {
                    alert('Invalid Email Address');
                    return false;
                }
            }
        </script>
        <%@page import="java.sql.*" %>
        <script src="js/scw.js" type="text/javascript"></script>

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

                <div>
                    <div class="shaperight">
                        <div id="navigation">
                            <%@include  file="usermenu.html" %>
                        </div>

                    </div>
                    <div style="height: 500px;">

          <div  style="height:460px; overflow: auto;">

                            <div class="welcome">
                                <div>

            <form method="get" action="ViewStatus.jsp">
                                <table align="center" cellspacing="5" cellpadding="5">

                                    <tr>
                                        <td class="login-text">
                        Job ID
                                        </td>
                                        <td>
                                            <input type="text" name="txtid" id="txtid" size="20" class="input-text">
                                        </td>
                                        <td class="login-text">
                                            <input type="submit" name="btnok" id="btnok" value="OK">
                                        </td>

                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <table align="center">
                                                <%
                                                            if (request.getParameter("btnok") != null) {

                                                                Connection con = null;
                                                                ResultSet rs = null;
                                                                Statement st = null;
                                                                String id = null;
                                                                String name = null;
                                                                String course = null;
                                                                String sem = null;
                                                                String pep7 = null;
                                                                String pep1 = null;
                                                                String pep2 = null;
                                                                String pep3 = null;
                                                                String pep4 = null;
                                                                String pep5 = null;
                                                                String pep6 = null;
                                                                String total = null;
                                                                String grade = null;
                                                                id = request.getParameter("txtid");
                                                                System.out.println("FJJJJJJJJJJJ" + id);
                                                                try {
                                                                    con = xtpl.sv.ConnectionBean.makeCon(request);
                                                                    st = con.createStatement();
                                                                    String sql = "select * from varificaion where Id = '" + id + "' ";
                                                                    rs = st.executeQuery(sql);
                                                                    if (rs.next()) {


                                                                        sem = rs.getString(2);
                                                                        pep1 = rs.getString(3);



                                                %>
                                                 <tr>
                                                    <td class="login-text">
                                                        <strong> Job Id</strong>
                                                    </td>
                                                    <td class="login-text">
                                                        <%=id%>
                                                    </td>


                                                </tr>
                                                <tr>
                                                    <td class="login-text">
                                                        <strong> Name</strong>
                                                    </td>
                                                    <td class="login-text">
                                                        <%=sem%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="login-text">
                                            Job Status
                                                    </td>
                                                    <td class="login-text">
                                                        <%=pep1%>
                                                    </td>
                                                </tr>


                                                <%
                                                                                                                    } else {
                                                %>
                                                <tr>
                                                    <td style="color: red;font-size: 12px;font-weight: bold;">Job ID Wrong !!Retry Again</td>
                                                </tr>
                                                <%                                                                                                        }
                                                                                                                    con.close();
                                                                                                                    st.close();


                                                                                                                } catch (Exception e) {
                                                                                                                }

                                                %>
                                            </table>
                                        </td>
                                    </tr>

                                    <%} else {%>

                                    <%}%>



                                </table>


                            </form>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
                <%-- closed mainbody div --%>
                <div><%@include file="footer.jsp" %>
                </div>
            </div> <%-- closed main div --%>
        </div> </body>
</html>
<%
            } else {

                session.setAttribute("SESSION", "SESSION TIME EXPIRED !! <BR/><BR/> PLZ, LOGIN AGAIN ");
                response.sendRedirect("SessionTime.jsp");
            }
%>
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
<h2> Vacancy Requirement</h2>
                               <tr>
                                    <td><div style="overflow:auto;height:400px">
                                            <table width="100%" border="0" cellpadding="1" cellspacing="1">
                                                <tr style="background-color:gray;color:white;font-weight:bold">

                                                    <td width="5%">
                                                        S.No.
                                                    </td>
                                                    <td width="5%">
                                                        HR&nbsp;Name
                                                    </td>
                                                    <td width="5%">
                                                        Company&nbsp;Name
                                                    </td>
                                                    <td width="5%">
                                                        Profile
                                                    </td>
                                                    <td width="10%">
                                                        Email
                                                    </td>

                                                    <td width="5%">
                                                        Mobile
                                                    </td>
                                                    <td width="5%">
                                                        Company No.
                                                    </td>

                                                    <td width="5%">
                                                        Date
                                                    </td>
                                                    <td width="5%">
                                                        Time
                                                    </td>
                                                    <td width="35%">
                                                        Location
                                                    </td>
                                                   
                                                </tr>
                                                <%!int sno = 1;%>
                                                <%

                                                            try {
                                                                Connection con = xtpl.sv.ConnectionBean.makeCon(request);
                                                                PreparedStatement pst = con.prepareStatement("select * from job");

                                                                ResultSet rs = pst.executeQuery();
                                                                while (rs.next()) {
                                                                    String id = rs.getString(1);
                                                                    String fname = rs.getString(2);
                                                                    String lname = rs.getString(3);
                                                                    String gender = rs.getString(4);
                                                                    String email = rs.getString(5);
                                                                    String mobile = rs.getString(6);
                                                                    String contact = rs.getString(7);
                                                                    String place = rs.getString(8);
                                                                    String city = rs.getString(9);
                                                                    String enquiry = rs.getString(10);
                                                                    String date = rs.getString(11);

                                                %>                            <tr>
                                                    <td align="center">
                                                        <%=sno%>
                                                    </td>
                                                    <td>
                                                        <%=fname%>
                                                    </td>
                                                    <td>
                                                        <%=lname%>
                                                    </td>

                                                    <td>
                                                        <%=gender%>
                                                    </td>
                                                    <td>
                                                        <%=email%>
                                                    </td>
                                                    <td>
                                                        <%=mobile%>
                                                    </td>
                                                    <td>
                                                        <%=contact%>
                                                    </td>
                                                    <td>
                                                        <%=place%>
                                                    </td>
                                                    <td>
                                                        <%=city%>
                                                    </td>

                                                    <td>
                                                        <%=enquiry%>
                                                    </td>
                                                




                                                </tr>

                                                <%
                                                                    sno++;
                                                                }

                                                                //out.write("<root><status>true</status></root>");
                                                            } catch (Exception e) {
                                                                e.printStackTrace();
                                                            } finally {
                                                                out.close();
                                                            }

                                                            sno = 1;%>

                                            </table>

                                        </div> </td>
                                </tr>
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
                response.sendRedirect("../SessionTime.jsp");
            }
%>
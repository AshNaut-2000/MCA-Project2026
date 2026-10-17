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

                                    <form action="updateMyAccount" method="post" id="u_form" name="u_form">
                                        <div style="display: none;"><input id="" name="" type="hidden" value="" /></div>
                                        <h2> Update Registration</h2>
                                        <h3>&nbsp;</h3>
                                        <%





                                                        Connection con = null;

                                                        ResultSet rs = null;
                                                        Statement st = null;
                                                        String t1 = null;
                                                        String t4 = null;
                                                        String t5 = null;
                                                        String t6 = null;
                                                        String t7 = null;
                                                        String t8 = null;
                                                        String t9 = null;
                                                        String t10 = null;

                                                        try {
                                                            con = xtpl.sv.ConnectionBean.makeCon(request);
                                                            st = con.createStatement();
                                                            String sql = "select * from saveregistration where lname = '" + username + "' ";
                                                            rs = st.executeQuery(sql);
                                                            if (rs.next()) {
                                                                t1 = rs.getString(1);
                                                                t4 = rs.getString(4);
                                                                t5 = rs.getString(5);
                                                                t6 = rs.getString(6);
                                                                t7 = rs.getString(7);
                                                                t8 = rs.getString(8);
                                                                t9 = rs.getString(9);
                                                                t10 = rs.getString(10);


                                        %>
                                        <tr>
                                            <td>
                                                <input type="hidden" name="txtid" id="txtid" value="<%=t1%>">
                                            </td>
                                        </tr>
                                        <fieldset class="highlight">
                                            <legend>Personal Information</legend>
                                            <label for="EmailID">Name:</label>
                                            <input type="text"  name="txtname"  id="txtname" class="text-1" size="50" value="<%=t4%>"/>
                                            <br clear="left" />
                                            <label for="MobileNo">Gender:</label>
                                            <select name="cmbgender" id="cmbgender" class="text-1" style="width:210px;">
                                                <option value="na"> - - - - Select  - - - -</option>
                                                <option value="Male">Male</option>
                                                <option value="Female">Female</option>
                                                <option selected value="<%=t5%>"><%=t5%></option>
                                            </select>
                                            <br clear="left" />
                                            <label for="AlternetContactNo">Date&nbsp;Of&nbsp;Birth.</label>
                                            <input type="text" name="txtdob" id="txtdob" class="text-1" size="50"  readonly onclick="scwShow(this,event)"value="<%=t6%>" />
                                        </fieldset>
                                        <fieldset class="password highlight">
                                            <legend>Basic Information</legend>
                                            <label for="Place">Place:</label>
                                            <input type="text" name="txtplace" id="txtplace" class="text-1" size="50" value="<%=t7%>" />
                                            <br clear="left" />
                                            <label for="City">State:</label>
                                            <input type="text" name="txtstate" id="txtstate" class="text-1" size="50"  value="<%=t8%>"/>
                                            <br clear="left" />
                                            <label for="Enquiry">Email&nbsp;Id:</label>
                                            <input type="text" name="txtemailid" id="txtemailid" class="text-1" size="50" onblur="valid()" value="<%=t9%>"/>
                                            <br clear="left" />
                                            <label for="Enquiry">Mobile&nbsp;No:</label>
                                            <input type="text" name="txtmobile" id="txtmobile" class="text-1" size="50" onkeyup="contact(this)" onblur="mob()" value="<%=t10%>"/>
                                        </fieldset>
                                        <%                                                                                                        }
                                                            con.close();
                                                            st.close();


                                                        } catch (Exception e) {
                                                        }

                                        %>
                                        <button type="submit" onclick="return validate()">Update</button>
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
                response.sendRedirect("../SessionTime.jsp");
            }
%>
<%-- 
  
--%>
 <%
            response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
            response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
            response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
            response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility
            String username = null;
            username = (String) session.getAttribute("USER");
            if (username != null) {

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

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
            var rl=document.getElementById("txtmob").value;
            if(rl.toString().length<10)
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
            var address = document.getElementById('txtemail').value;
            if(reg.test(address) == false) {
                alert('Invalid Email Address');
                return false;
            }
        }
    </script>

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
           
                      <div  style="height:460px; overflow: auto;">

                

                    <div class="welcome">
                        <div>
                               <form action="changePassword" method="post" id="u_form" name="u_form">
                        <div style="display: none;"><input id="" name="" type="hidden" value="" /></div>
                        <h2>Change Password</h2>
                        <h3>&nbsp;</h3>
                        <fieldset class="highlight">
                            <%
                                        String imageVerified = (String) session.getAttribute("captcha");
                                        String msg = null;
                                        msg = (String) session.getAttribute("MSG");
                                        if (msg != null) {
                            %>

                            <label for="first_name" style="width:100%;color: #3278A3; font-size: 12px;font-weight: bold;" align="center"><%=msg%></label>
                            <br clear="left" />

                            <%
                                            session.removeAttribute("MSG");
                                        } else {
                                            session.setAttribute("MSG", "");

                                        }
                            %>
                            <label for="FirstName">Old Password</label>
                            <input type="text" name="txtopass" id="txtopass" class="text-1" size="50" />
                            <br clear="left" />
                            <label for="LastName">New Password:</label>
                            <input type="text" name="txtnpass" id="txtnpass" class="text-1" size="50" />
                            <br clear="left" />
                            <label for="Gender">Confirm Password</label>
                         <input type="text" name="txtlname" id="txtlname" class="text-1" size="50" />
                        </fieldset>
             
                        <button type="submit" align="center"onclick="return validate()">Change</button>
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
     </body>
</html>
<%
            } else {

                session.setAttribute("SESSION", "SESSION TIME EXPIRED !! <BR/><BR/> PLZ, LOGIN AGAIN ");
                response.sendRedirect("SessionTime.jsp");
            }
%>
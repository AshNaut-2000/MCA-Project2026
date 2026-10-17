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
       
           <link href="css/form_style.css" rel="stylesheet" type="text/css" />

        <script language="javascript" src="js/CheckValidity.js"></script>
        <script type="text/javascript">
            function validatePassword(){
                if(document.getElementById("txtpwd").value!=document.getElementById("txtscpwd")){
                    alert("Please enter correct confirm password !");
                    return false;
                }
            }
        </script>

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
            <div class="mainbody" style="height: 650px;">   <%--  opened mainbody div --%>

                <div>

                    <div>
  <div class="welcome">
                                <div>

                                    <form action="saveRegistration" method="post" id="u_form" name="u_form">
                                        <div style="display: none;"><input id="" name="" type="hidden" value="" /></div>
                                        <h2>Registration</h2>
                                        <h3>&nbsp;</h3>
                                        <fieldset class="highlight">
                                            <legend>Login Information</legend>
                                            <%
                                                        String imageVerified = (String) session.getAttribute("captcha");
                                                        String msg = null;
                                                        msg = (String) session.getAttribute("Message");
                                                        if (msg != null) {
                                            %>

                                            <label for="first_name" style="width:100%;color: #3278A3; font-size: 12px;font-weight: bold;" align="center"><%=msg%></label>
                                            <br clear="left" />

                                            <%
                                                            session.removeAttribute("Message");
                                                        } else {
                                                            session.setAttribute("Message", "");

                                                        }
                                            %>
                                            <label for="FirstName">User&nbsp;Name:</label>
                                            <input type="text" name="txtlname" id="txtlname" class="text-1" size="50" />
                                            <br clear="left" />
                                            <label for="LastName">Password:</label>
                                            <input type="password" name="txtpwd" id="txtpwd" class="text-1" size="50" />
                                            <br clear="left" />
                                            <label for="FirstName">Confirm&nbsp;Password:</label>
                                            <input type="password" name="txtcpwd" id="txtcpwd" class="text-1" size="50" onblur="validatePassword()" />
                                        </fieldset>
                                        <fieldset class="highlight">
                                            <legend>Personal Information</legend>
                                            <label for="EmailID">Name:</label>
                                            <input type="text"  name="txtname"  id="txtname" class="text-1" size="50" />
                                            <br clear="left" />
                                            <label for="MobileNo">Gender:</label>
                                            <select name="cmbgender" id="cmbgender" class="text-1" style="width:210px;">
                                                <option value="na"> - - - - Select  - - - -</option>
                                                <option value="Male">Male</option>
                                                <option value="Female">Female</option>
                                            </select>
                                            <br clear="left" />
                                            <label for="AlternetContactNo">Date&nbsp;Of&nbsp;Birth.</label>
                                            <input type="text" name="txtdob" id="txtdob" class="text-1" size="50"  readonly onclick="scwShow(this,event)" />
                                        </fieldset>
                                        <fieldset class="password highlight">
                                            <legend>Basic Information</legend>
                                            <label for="Place">Place:</label>
                                            <input type="text" name="txtplace" id="txtplace" class="text-1" size="50"  />
                                            <br clear="left" />
                                            <label for="City">State:</label>
                                            <input type="text" name="txtstate" id="txtstate" class="text-1" size="50"  />
                                            <br clear="left" />
                                            <label for="Enquiry">Email&nbsp;Id:</label>
                                            <input type="text" name="txtemailid" id="txtemailid" class="text-1" size="50" onblur="valid()" />
                                            <br clear="left" />
                                            <label for="Enquiry">Mobile&nbsp;No:</label>
                                            <input type="text" name="txtmobile" id="txtmobile" class="text-1" size="50" onkeyup="contact(this)" onblur="mob()" />
                                        </fieldset>
                                        <button type="submit" onclick="return validate()">Submit</button>
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

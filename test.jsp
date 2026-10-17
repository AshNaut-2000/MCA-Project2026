<%-- 
   
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Skill Bridge an Integrated Training and Placement Management System</title>
        <link href="css/style.css" rel="stylesheet" type="text/css" />
        <link href="css/form_style.css" rel="stylesheet" type="text/css" />

        <script language="javascript" src="js/CheckValidity.js"></script>
    </head>
    <body>
        <table width="850px" align="center" border="5">
            <tr>
                <td>
                    <form action="enquiry" method="post" id="u_form" name="u_form">
                        <div style="display: none;"><input id="" name="" type="hidden" value="" /></div>
                        <h2>Enquiry</h2>
                        <h3>&nbsp;</h3>
                        <fieldset class="highlight">
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
                            <label for="FirstName">First Name:</label>
                            <input type="text" name="txtfname" id="txtfname" class="text-1" size="50" />
                            <br clear="left" />
                            <label for="LastName">Last Name:</label>
                            <input type="text" name="txtlname" id="txtlname" class="text-1" size="50" />
                            <br clear="left" />
                            <label for="Gender">Gender:</label>
                            <select name="cmbgender" id="cmbgender" class="text-1" style="width:210px;">
                                <option value="na"> - - - - Select  - - - -</option>
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                            </select>
                        </fieldset>
                        <fieldset class="highlight">
                            <label for="EmailID">Your Email ID:</label>
                            <input type="text" type="text" name="txtemail"  id="txtemail" class="text-1" size="50" onblur="return valid();" />
                            <br clear="left" />
                            <label for="MobileNo">Your Mobile No.:</label>
                            <input type="text" name="txtmob" id="txtmob" class="text-1" size="50" onkeyup="contact(this)"  />
                            <br clear="left" />
                            <label for="AlternetContactNo">Your Contact No.</label>
                            <input type="text" type="text" name="txtcontno" id="txtcontno" class="text-1" size="50" onkeyup="contact(this)" />
                        </fieldset>
                        <fieldset class="password highlight">
                            <label for="Place">Place:</label>
                            <input type="text" name="txtplace" id="txtplace" class="text-1" size="50"  />
                            <br clear="left" />
                            <label for="City">City:</label>
                            <input type="text" name="txtcity" id="txtcity" class="text-1" size="50"  />
                            <br clear="left" />
                            <label for="Enquiry">Enquiry:</label>
                            <textarea cols="50" rows="3" name="txtenquiry" id="txtenquiry" class="text-1"></textarea>
                        </fieldset>
                        <button type="submit" onclick="return validate()">Enquiry</button>
                    </form>
                </td>
            </tr>
        </table>
    </body>
</html>

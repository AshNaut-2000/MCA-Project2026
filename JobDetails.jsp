<%-- 
   
--%>



<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%
         response.setHeader("Cache-Control", "no-cache"); //Forces caches to obtain a new copy of the page from the origin server
         response.setHeader("Cache-Control", "no-store"); //Directs caches not to store the page under any circumstance
         response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
         response.setHeader("Pragma", "no-cache"); //HTTP 1.0 backward compatibility
         String username = null;
         username = (String) session.getAttribute("COMPANY");
         if (username != null) {

%>
<script type="text/javascript">

    function deleteEnquiryRecord(val)
    {
        var answer = confirm ("Do you want to delete this Record?");
        if(answer)
        {

            return true;
        }
        else{
            return false;
        }
        return false;
    }
</script>
<%
            //String uname = (String) session.getAttribute("UNAME");

            //if (uname != null) {
%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Skill Bridge an Integrated Training and Placement Management System</title>
        <link href="css/style.css" rel="stylesheet" type="text/css" />
                 <link href="css/form_style.css" rel="stylesheet" type="text/css" />
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


             
                    <div class="shapemidfull11">

                        <div>
                            <table border="0" width="90%">
                                <tr>
                                    <td height="8px">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td height="30" colspan="8" style="text-align:center;font-weight:bold;background-color:#07304E;color:white;width:500px;font-family:verdana;font-size:16px;">
                                          <%@include file="company.html" %>
                                    <td>
                                </tr>
                                <tr>
                                    <td colspan="8" align="center" style="font-size: 16px;font-weight:bold;background-color:#07304E;color:white;">
                                        JOB REQUIREMENT DETAILS
                                    </td>
                                <tr>
                                    <td>
                                         <div style="height: 350px;overflow: auto;">
                                                  <form action="job1" method="post" id="u_form" name="u_form">
                                <div style="display: none;"><input id="" name="" type="hidden" value="" /></div>
                            
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
                                    <label for="FirstName">HR Name:</label>
                                    <input type="text" name="txtfname" id="txtfname" class="text-1" size="50" />
                                    <br clear="left" />
                                    <label for="LastName">Company Name:</label>
                                    <input type="text" name="txtlname" id="txtlname" class="text-1" size="50" />
                                    <br clear="left" />
                                    <label for="Gender">Profile:</label>
                                    <select name="cmbgender" id="cmbgender" class="text-1" style="width:210px;">
                                        <option value="na"> - - - - Select  - - - -</option>
                                        <option value="Software">Software</option>
                                        <option value="Electronics">Electronics</option>
                                        <option value="Mechanical">Mechanical</option>
                                    </select>
                                </fieldset>
                                <fieldset class="highlight">
                                    <label for="EmailID">Your Email ID:</label>
                                    <input type="text" type="text" name="txtemail"  id="txtemail" class="text-1" size="50" onblur="return valid();" />
                                    <br clear="left" />
                                    <label for="MobileNo">Your Mobile No.:</label>
                                    <input type="text" name="txtmob" id="txtmob" class="text-1" size="50" onkeyup="contact(this)" onblur="mob()" />
                                    <br clear="left" />
                                    <label for="AlternetContactNo">Company Contact No.</label>
                                    <input type="text" type="text" name="txtcontno" id="txtcontno" class="text-1" size="50" onkeyup="contact(this)" onblur="mob()"/>
                                </fieldset>
                                <fieldset class="password highlight">
                                    <label for="Place">Date:</label>
                                    <input type="text" name="txtplace" id="txtplace" class="text-1" size="50"  />
                                    <br clear="left" />
                                    <label for="City">Time:</label>
                                    <input type="text" name="txtcity" id="txtcity" class="text-1" size="50"  />
                                    <br clear="left" />
                                    <label for="Enquiry">Interview Location:</label>
                                    <textarea cols="50" rows="3" name="txtenquiry" id="txtenquiry" class="text-1"></textarea>
                                </fieldset>
                                <button type="submit" onclick="return validate()">Submit</button>
                            </form>
                                            </form>

                                        </div> </td>
                                </tr>


                            </table>


                        </div>

                    </div>

                </form>
            </div>  <%-- closed mainbody div --%>
            <div><%@include file="footer.jsp" %>
            </div>
        </div> <%-- closed main div --%>
    </body>
</html>
<%
            } else {


                response.sendRedirect("logout.jsp");
            }
%>

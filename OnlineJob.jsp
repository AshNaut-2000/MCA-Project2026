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

                                    <form  action="onlineJob" method="post" enctype="multipart/form-data">
                                        <table  border="0" cellspacing="10" cellpadding="8"  align="center">
                                            <%             String msg = (String) session.getAttribute("MSG");
                                                            if (msg != null) {
                                            %>
                                            <tr>
                                                <td style="font-family: verdana;color: red;font-size: 10px" align="center" colspan="2"><%=msg%></td>
                                            </tr>
                                            <%
                                                                session.removeAttribute("Mess");
                                                            } else {
                                                                session.setAttribute("Mess", "");
                                                            }
                                            %>
                                            <tr>
                                                <td>
                                                    <fieldset>
                                                        <legend class="tabHeading">Job Information</legend>
                                                        <table cellpadding="5" cellspacing="5">
                                                            <tr>
                                                                <td class="text"><span style="color: red;"></span>&nbsp;Job&nbsp;Id:</td>
                                                                <td> <input type= "text" size="25"  id="txthidden" name="txthidden"></td>
                                                                <td class="text"><span style="color: gray;">*</span> Student&nbsp;Name:</td>
                                                                <td class="text-1"><input type="text" size="25"  id="uname" name="uname"  value="<%=username%>"></td>

                                                            </tr>
                                                            <tr>
                                                                <td class="text"><span style="color: red;">*</span>Course &nbsp;</td>
                                                                <td> <input type= "text" size="25"  id="txtcourse" name="txtcourse"></td>
                                                                <td class="text"><span style="color: red;">*</span>Branch&nbsp;Name&nbsp;:</td>
                                                                <td> <input type= "text" size="25"  id="txtbranch" name="txtbranch"></td>

                                                            </tr>
                                                            <tr>
                                                                <td class="text"><span style="color: red;">*</span>Grand Percentage</td>
                                                                <td> <input type= "text" size="25"  id="gp" name="gp"></td>
                                                                <td class="text"><span style="color: red;">*</span>Grand&nbsp;Year&nbsp;:</td>
                                                                <td> <input type= "text" size="25"  id="gy" name="gy"></td>

                                                            </tr>
                                                            <tr>
                                                                <td class="text"><span style="color: red;">*</span>School Name</td>
                                                                <td> <input type= "text" size="25"  id="sc" name="sc"></td>
                                                                <td class="text"><span style="color: red;">*</span>School&nbsp;Board&nbsp;:</td>
                                                                <td> <input type= "text" size="25"  id="sb" name="sb"></td>

                                                            </tr>
                                                            <tr>
                                                                <td class="text"><span style="color: red;">*</span>12 Percentage</td>
                                                                <td> <input type= "text" size="25"  id="tp" name="tp"></td>
                                                                <td class="text"><span style="color: red;">*</span>Passing&nbsp;Year&nbsp;:</td>
                                                                <td> <input type= "text" size="25"  id="ty" name="ty"></td>

                                                            </tr>
                                                            <tr>
                                                                <td class="text"><span style="color: red;">*</span>10 Percentage</td>
                                                                <td> <input type= "text" size="25"  id="tenthp" name="tenthp"></td>
                                                                <td class="text"><span style="color: red;">*</span>Passing&nbsp;Year&nbsp;:</td>
                                                                <td> <input type= "text" size="25"  id="tenthy" name="tenthy"></td>

                                                            </tr>
                                                            <tr>
                                                                <td class="text"><span style="color: red;">*</span>Hobbies</td>
                                                                <td><textarea row="4" cols="25" name="hobbies" id="hobbies"></textarea></td>
                                                                <td class="text"><span style="color: red;">*</span>Summer&nbsp;Tranning&nbsp;:</td>
                                                                <td><textarea row="4" cols="25" name="summer" id="summer"></textarea></td>

                                                            </tr>
                                                        </table>
                                                    </fieldset>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <fieldset>
                                                        <legend class="tabHeading">Personal Information</legend>
                                                        <table cellpadding="5" cellspacing="5">
                                                            <tr>
                                                                <td class="text">
                                                                    Upload &nbsp;Resume
                                                                </td>
                                                                <td>
                                                                    <input type="file" name="txtImage" id="txtImage"/>
                                                                </td>
                                                                <td class="text">
                                                                    Upload&nbsp;Video&nbsp;Resume
                                                                </td>
                                                                <td>
                                                                    <input type="file" name="txtImage1" id="txtImage1"/>
                                                                </td>

                                                            </tr>
                                                            <tr>
                                                                <td class="text"><span style="color: red;">*</span>Father&nbsp;Name:</td>
                                                                <td><input type="text" size="25"  id="txtfname" name="txtfname" onblur=" CheckForAlphabets(this)" ></td>
                                                                <td class="text"><span style="color: red;">*</span>Mother&nbsp;Name&nbsp;:</td>
                                                                <td> <input type= text size="25"  id="txtmname" name="txtmname" onblur=" CheckForAlphabets(this)" ></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="text"><span style="color: red;">*</span>First&nbsp;Name:</td>
                                                                <td><input type="text" size="25"  id="txtname" name="txtname" onblur=" CheckForAlphabets(this)" ></td>
                                                                <td class="text"><span style="color: red;">*</span>Last&nbsp;Name&nbsp;:</td>
                                                                <td> <input type= text size="25"  id="txtlname" name="txtlname" onblur=" CheckForAlphabets(this)" ></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="text"><span style="color: red;">*</span>
                                                                    Gender
                                                                </td>
                                                                <td class="text">
                                                                    <select  id="cmbgender"name="cmbgender" style="width: 180px">
                                                                        <option value="Select"> - - - - - - - - - Select- - - - - - - - - </option>
                                                                        <option value="Male">Male</option>
                                                                        <option value="Female">Female</option>
                                                                    </select>
                                                                </td>
                                                                <td class="text"><span style="color: red;">*</span>Date&nbsp;of&nbsp;Birth</td>
                                                                <td> <input type= text size="25" name="txtdb"  id="txtdb" readonly onclick="scwShow(this,event)" ></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="text"><span style="color: red;">*</span>Contact&nbsp;Number:</td>
                                                                <td> <input type= text size="25"  id="number" name="number" onkeyup="contact(this)" onblur="mob()"></td>
                                                                <td class="text"><span style="color: red;">*</span>Email&nbsp;Id:</td>
                                                                <td><input type="text" size="25" id="txtemail" name="txtemail"  onblur="valid()"></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="text">Address:</td>
                                                                <td><input type= text size="25"  id="txtaddress" name="txtaddress"></td>

                                                                <td class="text">City:</td>
                                                                <td> <input type= text size="25"  id="cmbcity" name="cmbcity"></td>

                                                            </tr>
                                                            <tr>
                                                                <td class="text">Pin&nbsp;Code:</td>
                                                                <td> <input type= text size="25"  id="txtpin" name="txtpin" onkeyup="contact(this)" onblur="pin()"></td>
                                                                <td class="text">State:</td>
                                                                <td>
                                                                    <select name="state" id="txtstate">
                                                                        <option value="">Select State</option>
                                                                        <option value="Andaman and Nicobar Islands">Andaman and Nicobar Islands</option>
                                                                        <option value="Andhra Pradesh">Andhra Pradesh</option>
                                                                        <option value="Arunachal Pradesh">Arunachal Pradesh</option>
                                                                        <option value="Assam">Assam</option>
                                                                        <option value="Bihar">Bihar</option>
                                                                        <option value="Chandigarh">Chandigarh</option>

                                                                        <option value="Chhattisgarh">Chhattisgarh</option>
                                                                        <option value="Dadar and Nagar Haveli">Dadar and Nagar Haveli</option>
                                                                        <option value="Daman and Diu">Daman and Diu</option>
                                                                        <option value="Delhi">Delhi</option>
                                                                        <option value="Goa">Goa</option>
                                                                        <option value="Gujarat">Gujarat</option>
                                                                        <option value="Haryana">Haryana</option>
                                                                        <option value="Himachal Pradesh">Himachal Pradesh</option>
                                                                        <option value="Jammu and Kashmir">Jammu and Kashmir</option>

                                                                        <option value="Jharkhand">Jharkhand</option>
                                                                        <option value="Karnataka">Karnataka</option>
                                                                        <option value="Kerala">Kerala</option>
                                                                        <option value="Lakshadeep">Lakshadeep</option>
                                                                        <option value="Madya Pradesh">Madya Pradesh</option>
                                                                        <option value="Maharashtra">Maharashtra</option>
                                                                        <option value="Manipur">Manipur</option>
                                                                        <option value="Meghalaya">Meghalaya</option>
                                                                        <option value="Mizoram">Mizoram</option>

                                                                        <option value="Nagaland">Nagaland</option>
                                                                        <option value="Orissa">Orissa</option>
                                                                        <option value="Pondicherry">Pondicherry</option>
                                                                        <option value="Punjab">Punjab</option>
                                                                        <option value="Rajasthan">Rajasthan</option>
                                                                        <option value="Sikkim">Sikkim</option>
                                                                        <option value="Tamil Nadu">Tamil Nadu</option>
                                                                        <option value="Tripura">Tripura</option>
                                                                        <option value="Uttar Pradesh">Uttar Pradesh</option>

                                                                        <option value="Uttaranchal">Uttaranchal</option>
                                                                        <option value="West Bengal">West Bengal</option>
                                                                    </select></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="text">Country:</td>

                                                                <td> <input type= text size="25"  id="cmbcountry" name="cmbcountry"></td>
                                                            </tr>
                                                        </table>
                                                    </fieldset>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td align="center" colspan="2" >
                                                    <input type="submit" onclick= "return valid2()"value="Submit" onclick="return validate1();"/>
                                                    <input type= "reset" value="Reset">
                                                </td>
                                            </tr>
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
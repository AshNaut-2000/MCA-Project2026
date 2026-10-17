<%--
 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%
            String name = null;
            name = (String) session.getAttribute("NAME");


%>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Skill Bridge an Integrated Training and Placement Management System</title>
        <link href="css/style.css" rel="stylesheet" type="text/css" />
        <script language="javascript" src="js/CheckValidity.js"></script>
        <script type="text/javascript">
            function specifyOther(){
                
                if(document.getElementById('cmbhighest_qual').value == "Other"){                    
                    document.getElementById('hidother').style.display = 'block';
                }else{
                    document.getElementById('hidother').style.display = 'none';
                }
            }
            function downloadValidation(){

                var val = document.getElementById('hidname').value;
                //alert('calling'+val);
                if(val == "null"){
                    alert('Sorry!! Please Submit the form.');
                    return false;
                }
            }
            function validation()
            {
                if(document.getElementById("txtname").value=="")
                {
                    alert("Sorry!! Please enter the name.")
                    return false;
                }
                if(document.getElementById("txtEmail").value=="")
                {
                    alert("Sorry!! Please enter the Email.")
                    return false;
                }
                if(document.getElementById("txtMob").value=="")
                {
                    alert("Sorry!! Please enter the Mobile.")
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


                <div class="shaperight">
                    <div class="articleshape">
                        <%@include  file="services.jsp" %>
                    </div>
                    <div class="contact"><a href="#">Read More</a></div>
                </div>

                <div class="shapemidfull">
                    <div  class="head1">Downloading Form</div>


                    <div class="welcome">
                        <div>
                            <form action="downloadingForm" method="post">
                                <table width="100%" border="0" cellpadding="5" cellspacing="5">
                                    <tr>                                        
                                        <td align="left"colspan="3">
                                            <div align="left">
                                                <div class="iconappl"></div>
                                                <div class="readdiv">
                                                    <a href="images/application_form.pdf" onclick="return downloadValidation(this)">
                                                        Download Application Form</a>
                                                </div>

                                            </div>
                                        </td>
                                    </tr>
                                    <tr>


                                        <%

                                                    String add = (String) session.getAttribute("ADD");
                                                    if ((add != null) && (add != "")) {
                                        %>
                                        <td colspan="5" align="center" style="font-size:11px;color:red;font-style:italic">  <%=add%></td>

                                        <%
                                                        session.removeAttribute("ADD");
                                                    } else {
                                                        session.setAttribute("ADD", "");
                                                    }

                                        %>

                                    </tr>
                                    <TR>
                                    <input type="hidden" id="hidname" value="<%=name%>">
                                    <td  CLASS="label1" width="25%">
                                        Name
                                    </td>
                                    <td width="75%" colspan="2">
                                        <input type="text" id="txtname" name="txtname" size="35">
                                    </td>
                                    </TR>
                                    <TR>
                                        <td  CLASS="label1" width="25%">
                                            Highest&nbsp;Qualification
                                        </td>
                                        <td width="18%">
                                            <select name="cmbhighest_qual" id="cmbhighest_qual" onchange="specifyOther(this)" style="width:240px">
                                                <option selected> - - - - - - Select - - - - - - </option>
                                                <option value="M.Sc. Biotechnology">M.Sc. Biotechnology</option>
                                                <option value="M.Sc. Microbiology">M.Sc. Microbiology</option>
                                                <option value="M.Sc. Bioinformatics">M.Sc. Bioinformatics</option>
                                                <option value="M.Sc. Nanotechnology">M.Sc. Nanotechnology</option>
                                                <option value="M.Sc. Biochemistry">M.Sc. Biochemistry</option>
                                                <option value="M.Sc. Genetic Engineering">M.Sc. Genetic Engineering</option>
                                                <option value="M.Sc. Environmental Science">M.Sc. Environmental Science</option>
                                                <option value="M.Tech Biotechnology">M.Tech Biotechnology</option>
                                                <option value="M.Tech Bioinformatics">M.Tech Bioinformatics</option>
                                                <option value="MTech (Integrated) Biotechnology">MTech (Integrated) Biotechnology</option>
                                                <option value="M.B.A Biotechnology">M.B.A Biotechnology</option>
                                                <option value="B.Sc. Biotechnology">B.Sc. Biotechnology</option>
                                                <option value="B.Sc. Microbiology">B.Sc. Microbiology</option>
                                                <option value="B.Sc. Bioinformatics">B.Sc. Bioinformatics</option>
                                                <option value="B.Sc. Nanotechnology">B.Sc. Nanotechnology</option>
                                                <option value="B.Sc. Biochemistry">B.Sc. Biochemistry</option>
                                                <option value="B.Sc. Genetic Engineering">B.Sc. Genetic Engineering</option>
                                                <option value="B.Sc. Environmental Science">B.Sc. Environmental Science</option>
                                                <option value=".Tech Biotechnology">B.Tech Biotechnology</option>
                                                <option value="B.Tech Bioinformatics">B.Tech Bioinformatics</option>
                                                <option value="Other">Other</option>

                                            </select>
                                        </td>
                                        <td align="left" style="display: none" id="hidother">
                                            <input type="text" name="txtother_qual" id="txtother_qual" size="20">
                                        </td>
                                    </TR>
                                    <TR>
                                        <td  CLASS="label1" width="25%">
                                            College/University
                                        </td>
                                        <td width="75%" colspan="2">
                                            <input type="text" id="txtcollege" name="txtUniversity" size="35">
                                        </td>
                                    </TR>

                                    <TR>
                                        <td  CLASS="label1" width="25%">
                                            Contact/Mobile No
                                        </td>
                                        <td width="75%" colspan="2">
                                            <input type="text" id="txtMob" name="txtMob" size="35" onkeyup="CheckForIntegers(this);">
                                        </td>
                                    </TR>

                                    <TR>
                                        <td  CLASS="label1" width="25%">
                                            Email ID
                                        </td>
                                        <td width="75%" colspan="2">
                                            <input type="text" id="txtEmail" name="txtEmail" size="35" onblur="return validateEmail(this);">
                                        </td>
                                    </TR>



                                    <TR>
                                        <td  CLASS="label1" width="25%">
                                            &nbsp;
                                        </td>
                                        <td width="75%" colspan="2">
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <input type="submit" value="    Submit    " onclick="return validation()" name="Submit">
                                            <input type="reset" value="     Clear      " name="Clear">
                                        </td>
                                    </TR>

                                </table>
                            </form>
                        </div>
                    </div>


                </div>  <%-- closed mainbody div --%>
                <div><%@include file="footer.jsp" %>
                </div>
            </div> <%-- closed main div --%>
        </div> </body>
</html>

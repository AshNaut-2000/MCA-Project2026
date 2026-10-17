<%-- 

--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
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

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Skill Bridge an Integrated Training and Placement Management System</title>
        <link href="css/style.css" rel="stylesheet" type="text/css" />
          <link href="HtmlEditor/speck.css" rel="stylesheet" type="text/css"/>
        <script src="HtmlEditor/speck.js"></script>
    </head>
  <script type="text/javascript">
            function valid()
            {
                iEdit["textdescription"].html();
            }
        </script>
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
                        <%@include  file="visitormenu.html" %>
                    </div>

                </div>

                <div class="shapemidfull">
                    <div class="welcome"><h1><span>Ask Question</span></h1><br />
 
                                 <div  style="height: 350px;overflow: auto;">
                                            <form action="visiterFaq" method="post">
                                                <table width="100%" cellpadding="5" cellspacing="5">
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
                                                    <tr>
                                                        <td class="text-1">
                                                            Name:
                                                        </td>
                                                        <td>
                                                            <input type="text" name="txtlogin" id="txtlogin" size="30">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-1">
                                                            Contact No.:
                                                        </td>
                                                        <td>
                                                            <input type="text" name="txtlogin" id="txtlogin" size="30" onkeyup="contact(this)" onblur="mob()">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="text-1">
                                                            Email ID:
                                                        </td>
                                                        <td>
                                                            <input type="text" name="txtlogin" id="txtlogin" size="30" onblur="valid()">
                                                        </td>
                                                    </tr>
                                                    <tr>

                                                    </tr>

                                                    <tr id="PageContentRow1">
                                                        <td class="text-1">
                                                            Your Query:
                                                        </td>
                                                        <td class="FeatureContainer" align="left">
                                                            <textarea id="textdescription" name="textdescription"  style="width:450px;height: 300px" cols="" rows="" class="iEdit"></textarea>
                                                            <script type="text/javascript">speckInit();</script>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" colspan="2">
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

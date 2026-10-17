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
            String cid = null;
            cid = request.getParameter("cid");
            String catname = null;

            xtpl.sv.Subsidary obj = new xtpl.sv.Subsidary();
            catname = obj.getCategoryName(cid);
%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Skill Bridge an Integrated Training and Placement Management System</title>
        <link href="css/style.css" rel="stylesheet" type="text/css" />
    </head>
    <script type="text/javascript">
        function newpost(){
            alert('Registered user can send Post/Reply Only, Please Login...')
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
                    <div class="welcome"><h1><span>Faq List</span></h1><br />
                


                                   <div  style="height:350px;overflow: auto;">
                                      <table width="100%" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td width="100%" align="right"><span class="prod_head-1" style="float: right"><a href="visiterfaq.jsp">Ask&nbsp;Question</a></span></td>
                                                </tr>
                                                <tr>
                                                    <td width="100%">
                                                        <%
                                                                    java.sql.Connection conn;
                                                                    conn = xtpl.sv.ConnectionBean.makeCon(request);
                                                                    java.sql.Statement st;
                                                                    String query;
                                                                    int pageAsInt = 0;


                                                                    // because records start with index 0; page should be decremented (for instance, page=2 should start with offset 10 = page - 1 * 10)
                                                                    query = "select * from reply1";
                                                                    st = conn.prepareStatement(query);
                                                                    java.sql.ResultSet result = st.executeQuery(query);
                                                                    while (result.next()) {
                                                                        String faq_ques = result.getString(2);
                                                                        String faq_ans = result.getString(4);
                                                                        String created_by = result.getString(3);
                                                                        String date = result.getString(5);


                                                        %>
                                                        <div style="width: 100%;">
                                                            <table width="100%" cellspacing="3" >
                                                                <tr class="bold_matter" bgcolor="pink">
                                                                    <td height="20" colspan="2">Question :
                                                                        <%=faq_ques%>&nbsp;?</td>
                                                                </tr>
                                                                <tr>
                                                                    <td width="20%" bgcolor="#FFEBCD">
                                                                        <table width="100%">
                                                                            <tr>
                                                                                <td class="bold_matter">
                                                                                    By : <span class="text-black"><strong><%=created_by%></strong></span>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="bold_matter">
                                                                                    On : <span class="text-black"><strong><%=date%></strong></span>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td class="bold_matter" width="80%" bgcolor="#D3D3D3">
                                                                        <%=faq_ans%>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>

                                                        <%

                                                                    }

                                                        %>
                                                    </td>
                                                </tr>

                                                <%
                                                            st.close();

                                                            // Calculate number of rows in the table

                                                            query = "SELECT * FROM reply WHERE 1";
                                                            st = conn.prepareStatement(query);
                                                            st.executeQuery(query);
                                                            result = st.getResultSet();
                                                            int count = 0;

                                                            while (result.next()) {
                                                                count++;
                                                            }
                                                            st.close();

                                                            int pages = (count / 10) + 1; // 20 results = 0-9, 10-19, 20 thus 3 pages

                                                            out.println("<tr><td width='100%' align='center'><table bgcolor='#AB99BC' width='100%'> <tr>");
                                                            // First page
                                                            if (pageAsInt > 1) {
                                                                out.println("<td> <a href=\"?page=1\"> << </a> </td>");

                                                                // Previous page

                                                                int previousPage = pageAsInt - 1;
                                                                out.println("<td><a href=\"?page='" + previousPage + "'\"> < </a></td>");
                                                            } else {
                                                                out.println("<td>On First Page</td>");
                                                            }
                                                            out.println("<td><b> Page: " + pageAsInt + "</b></td>");

                                                            if (pages > pageAsInt) {
                                                                // Next page
                                                                int nextPage = pageAsInt + 1;
                                                                out.println("<td><a href=\"?page='" + nextPage + "'\"> > </a></td>");
                                                                // Last Page
                                                                out.println("<td><a href=\"?page='" + pages + "'\"> >> </a></td>");
                                                            } else {
                                                                out.println("<td align=right>On Last Page</td>");

                                                            }
                                                            out.println("</tr></table></td></tr>");

                                                            conn.close();

                                                %>

                                            </table>

                                        </div>
                                    </div>


                        </div>

                    </div>

 <div><%@include file="footer.jsp" %>
                </div>
                </div>  <%-- closed mainbody div --%>
               
      <%-- closed main div --%>
    </body>
</html>

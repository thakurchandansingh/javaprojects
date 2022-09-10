<%-- 
    Document   : searchdelect
    Created on : Sep 10, 2022, 1:32:57 PM
    Author     : Chandan Singh
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="databased.DbConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <center>

        <%
            String check = request.getParameter("check");
            boolean ispostback;
            if (check == null) {
                ispostback = false;
            } else {
                ispostback = true;
            }
            String option = "", sno = "", status = "", description = "", task = "", result = "";
            if (ispostback) {
                option = request.getParameter("option");
                sno = request.getParameter("sno");
                PreparedStatement ps = DbConnect.connect().prepareStatement("select * from ravi where sno=?");
                ps.setString(1, sno);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    task = "" + rs.getObject("task");
                    description = "" + rs.getObject("description");
                    status = "" + rs.getObject("status");
                }
            }
            if (option.equals("delete")) {
                out.println("delete code");
                sno = request.getParameter("sno");
                PreparedStatement ps = DbConnect.connect().prepareStatement("delete from ravi where sno=?");
                ps.setString(1, sno);
                int n = ps.executeUpdate();
                result = "delete" + n + "record";
            }

        %>
        <center>
            <%=result%>
           
                <h1>Hello boys delect & search my program !</h1>
                 <from method="post">
                <input type="hidden" name="check"/>
                <br>
                <br>
                sno<input value="%=sno%"sno="sno"type="number">
                <br>
                <br>
                task<input value="%=task%"sno="task"type="text">
                <br>
                <br>
                description<input value="%=description%"sno="description"type="text">
                <br>
                <br>
                status<input value="%=status%"sno="status"type="text">
                <br>
                <br>
                <input type="submit"name="option"value="search"/>
                <input type="submit"name="option"value="delect"/>


            </from>
             </center>
            </body>
       
</html>

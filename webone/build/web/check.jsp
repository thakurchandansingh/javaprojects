<%-- 
    Document   : check
    Created on : Sep 9, 2022, 4:32:25 PM
    Author     : Chandan Singh
--%>

<%@page import="java.util.jar.Attributes.Name"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Railway</title>
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
            String status = "", task = "", description = "", sno = "", result = "";
            System.out.println(ispostback);

            if (ispostback) {
                try {
                    sno = request.getParameter("sno");
                    task = request.getParameter("task");
                    description = request.getParameter("description");
                    status = request.getParameter("status");
                    PreparedStatement ps = databased.DbConnect.connect().prepareStatement("insert into ravi  values(?,?,?,?)");
                    ps.setString(1, sno);
                    ps.setString(2, task);
                    ps.setString(3, description);
                    ps.setString(4, status);
                    int n = ps.executeUpdate();
                    result = "Inserted " + n + " records";
                } catch (Exception ex) {
                    System.out.println(ex);
                    result = ex.getMessage();
                }

        %>
        <h1>RailWay Enquiry</h1>
        <form>
            <h3><%=result%></h3>
            <input type="hidden" name="check" value="1">
            sno<input name="sno" autocomplete="off" value="<%=sno%>" type="number">
            task<input name="task" autocomplete="off" value="<%=task%>" type="text">
            description<input name="description" autocomplete="off" value="<%=description%>" type="text">
            status<input value="<%=status%>" autocomplete="off" name="status" type="text">
            <br>
            <br>
            <input type="submit">
            </center>
            </body>
            </html>

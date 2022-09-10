<%-- 
    Document   : update
    Created on : Sep 10, 2022, 11:06:14 AM
    Author     : Chandan Singh
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="databased.DbConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; char
              set=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <center>
        <h1>Hello Student!</h1>
        <form>
            
            <%
            String check = request.getParameter("check");
            boolean ispostback;
            if (check == null) {
                ispostback = false;
            } else {
                ispostback = true;
            }
           
             String name = "", roll = "", age = "", result = "";
            System.out.println(ispostback);
            if (ispostback) {
                try {
                    
                    roll = request.getParameter("rollno");
                    
                    PreparedStatement ps = DbConnect.connect().prepareStatement("select * from ramu where roll=?");
                    ps.setString(1, roll);
              
                    ResultSet rs = ps.executeQuery();
                    if(!rs.next())
                    {
                        result = "RollNo " + roll + " not found";
                    }
                    else
                    {
                  
                        result = "Record Found ";
                         name="" + rs.getObject("name");
                        age="" + rs.getObject("age");
                    }
                    
                } catch (Exception ex) {
                    System.out.println(ex);
                    result = ex.getMessage();
                }
            }
        %>
        <%=result%>
         <%=roll%>
         <%=name%>
         <%=age%>
            <input type="hidden"name="check"value="2">
          rollno.<input value="<%=roll%>" name="rollno" type="number">
            <br>
            <br>
            <input type="submit"value="search"/>
            </center>
       </form>
    </body>
     
</html>

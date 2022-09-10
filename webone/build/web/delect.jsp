<%-- 
    Document   : delect
    Created on : Sep 10, 2022, 12:09:29 AM
    Author     : Chandan Singh
--%>



<%@page import="java.sql.PreparedStatement"%>
<%@page import="databased.DbConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type"nt="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>


        <%
            String check = request.getParameter("check");
            boolean ispostback;
            if (check == null) {
                ispostback = false;
            } else {
                ispostback = true;
            }

            String option = "";

            String sno = "", task = "", description = "", status = "", result = "", delete = "", search = "";
            //String sno = "", task = "", description = "", status = "",result ="",search ="";
            System.out.println(ispostback);
            if (ispostback) {
                option=request.getParameter("option");
                try {
                    if(option.equals("delete"))
                    {
                    sno = request.getParameter("sno");

                    PreparedStatement ps = DbConnect.connect().prepareStatement("delete from ravi where sno=?");
                   // PreparedStatement ps=DbConnect.connect().prepareStatement("delete from ravi where sno=?");
                    ps.setString(1, sno);

                    int n = ps.executeUpdate();
                    result = "Deleted " + n + " records";
                    }
                    
                    if(option.equals("update"))
                    {
                      out.println("Update");
                        
                        
                    }
                                           
                } catch (Exception ex) {
                    System.out.println(ex);
                    result = ex.getMessage();
                }
            }
        %>
    <center>
        <%=result%>
        <form >

            <input type="hidden" name="check"/>
            <h1>Hello World!</h1>
            sno<input name="sno" value="<%=sno%>" type="number">
            <br>
            <br>
            <input name="option" type="submit" value="delete"/>

            <input name ="option" type="submit" value="update"/>
            <br>
            <br>
            <input name ="option" type="submit" value="search"/>
            <input name ="option" type="submit" value="insert"/>

        </form>

    </center>

</body>
</html>

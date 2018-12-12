<%-- 
    Document   : new_loc
    Created on : Nov 28, 2017, 2:02:22 PM
    Author     : java3
--%>

<%@page import="java.sql.Statement"%>
<%@page import="CLUE.SQLconnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%  String uid= (String)session.getAttribute("uid");
            String Location = request.getParameter("location");
            Connection connn = SQLconnection.getconnection();
            Statement st0 = connn.createStatement();
            System.out.println("Location------------------>" +Location);
            int i = st0.executeUpdate("Update users set cur_address='"+Location+"' where id= '" +uid+ "' ");
        %>
        <script>
            window.location.replace("my_prof.jsp");
        </script>
    </body>
</html>

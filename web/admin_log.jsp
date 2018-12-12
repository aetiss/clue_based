<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="CLUE.SQLconnection"%>
<%@page import="java.sql.Connection"%>
<%
    String name = request.getParameter("name");
    String pass = request.getParameter("pass");
    String status = null;
    System.out.println("Check User name And Password : " + name + pass);
    Connection con = SQLconnection.getconnection();
    Statement st = con.createStatement();
    try {
      //  ResultSet rs = st.executeQuery("SELECT * FROM do_details where name='" + name + "' AND pass='" + pass + "'");
        if ((name.equalsIgnoreCase("admin")) && (pass.equalsIgnoreCase("admin"))) {
                response.sendRedirect("Admin_home.jsp?success");
            }else{
                response.sendRedirect("admin.jsp?msg=authentication_Failed");
            }
        
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>
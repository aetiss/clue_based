<%-- 
    Document   : otp1
    Created on : Nov 27, 2017, 11:13:45 AM
    Author     : java3
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="CLUE.SQLconnection"%>
<%@page import="java.sql.Connection"%>
<%
    String votp = request.getParameter("votp");
    String mail = (String)session.getAttribute("mail");
    String status = null;
    System.out.println("Check otp : " + votp);
    Connection con = SQLconnection.getconnection();
    Statement st = con.createStatement();
    try {
        ResultSet rs = st.executeQuery("SELECT * FROM users where otp='" + votp + "' AND email='" + mail + "'");
        if (rs.next()) {

            response.sendRedirect("user_home.jsp?Msg=login Sucessfull");
        } else {
            response.sendRedirect("otp.jsp?Msg=Wrong_OTP_entered");
        }

    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>
<%-- 
    Document   : user_log
    Created on : Nov 25, 2017, 3:09:46 PM
    Author     : java3
--%>

<%@page import="java.security.SecureRandom"%>
<%@page import="java.util.Random"%>
<%@page import="CLUE.Mail"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="CLUE.SQLconnection"%>
<%@page import="java.sql.Connection"%>
<%
    String mail = request.getParameter("email");
    String pass = request.getParameter("password");
    String status = null;
    System.out.println("Check User name And Password : " + mail + pass);
    Connection con = SQLconnection.getconnection();
    Statement st = con.createStatement();
     Statement sto = con.createStatement();
    try {
        ResultSet rs = st.executeQuery("SELECT * FROM users where email='" + mail + "' AND password='" + pass + "'");
        if (rs.next()) {
            session.setAttribute("uname", rs.getString("name"));
            session.setAttribute("mail", rs.getString("email"));
            session.setAttribute("uid", rs.getString("id"));
            
            Random RANDOM = new SecureRandom();
        int PASSWORD_LENGTH = 4;
        String letters = "0123456789";
        String otp = "";
        for (int i = 0; i < PASSWORD_LENGTH; i++) {
            int index = (int) (RANDOM.nextDouble() * letters.length());
            otp += letters.substring(index, index + 1);
        }
        String filekey = "CLUE" + otp;
         int i = sto.executeUpdate("update users set otp='"+filekey+"' where email='" +mail+"' " );
            String msggg = "Your 8 digit OTP : " +filekey ;
            Mail ma = new Mail();
            ma.secretMail(msggg, "Downloadkey", mail);
            String msg = "File Download Key:" + msggg;
            response.sendRedirect("otp.jsp?Msg=otp");
        } else {
            response.sendRedirect("users.jsp?Msg=Authentication_Failed");
        }

    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>
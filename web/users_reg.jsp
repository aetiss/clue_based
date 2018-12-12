<%-- 
    Document   : users_reg
    Created on : Nov 25, 2017, 3:31:20 PM
    Author     : java3
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="CLUE.Mail"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.Statement"%>
<%@page import="CLUE.SQLconnection"%>
<%@page import="java.sql.Connection"%>
<%
    String name = request.getParameter("name");
    session.setAttribute("nname", name);
    String mail = request.getParameter("email");
    session.setAttribute("nmail", mail);
    String gender = request.getParameter("gender");
    String phone = request.getParameter("phone");
    String street = request.getParameter("street");
    String city = request.getParameter("city");
    String country = request.getParameter("country");
    String state = request.getParameter("state");
    String pass = request.getParameter("password");
    String otp="waiting";
    String location=request.getParameter("location");
    System.out.println("Users location=="+location);
    Connection conn = SQLconnection.getconnection();
    Statement sto = conn.createStatement();
    Statement st = conn.createStatement();
    DateFormat dateFormat = new SimpleDateFormat("YYYY/MM/dd HH:mm:ss");
    Date date = new Date();
    String time = dateFormat.format(date);
    System.out.println("Date and Time : " + time);
    System.out.println("Date and Time : " + name);
    System.out.println("Date and Time : " + street);
    System.out.println("Date and Time : " + pass);
    System.out.println("Date and Time : " + city);
    System.out.println("Date and Time : " + country);
    System.out.println("Date and Time : " + state);
    System.out.println("Date and Time : " + pass);
    try {
        int i = sto.executeUpdate("insert into users(name,email,phone,gender,street,city,country,state,password,time,otp,cur_address)values('" + name + "','" + mail + "','" + phone + "','" + gender + "','" + street + "','" + city + "','" + country + "','" + state + "','" + pass + "','" + time + "','"+otp+"','"+location+"')");
        if (i != 0) {
            System.out.println("success");
            response.sendRedirect("update.jsp");
        } else {
            System.out.println("users.jsp?msg=Registered failed");
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>
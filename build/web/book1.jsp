<%-- 
    Document   : review
    Created on : Nov 28, 2017, 11:18:54 AM
    Author     : java3
--%>
<%@page import="java.sql.Statement"%>
<%@page import="CLUE.SQLconnection"%>
<%@page import="java.sql.Connection"%>
<%
    String p_name = request.getParameter("p_name");
    String address = request.getParameter("address");
    String poi = request.getParameter("poi");
    String vehicle = request.getParameter("vehicle");
    String p_id = request.getParameter("pid");
    String members = request.getParameter("members");
    String days = request.getParameter("days");
    String location = request.getParameter("location");
    String uid = (String) session.getAttribute("uid");
    String name = (String) session.getAttribute("uname");
    String rate = "waiting";
    System.out.println("uid : " + uid + "\n uname : " + name + "\n pname : " + p_name);
    System.out.println("vehicle : " + vehicle + "\n location : " + location);
    Connection con = SQLconnection.getconnection();
    Statement st = con.createStatement();
    try {
        int in = st.executeUpdate("insert into booking(uid,uname,pid,pname,address,vehicle,members,days,pick_up,rate)values('" + uid + "','" + name + "','" + p_id + "','" + p_name + "','" + address + "','" + vehicle + "','" + members + "','" + days + "','" + location + "','" + rate + "')");
        if (in != 0) {
            response.sendRedirect("user_home.jsp");
        } else {
            response.sendRedirect("Failed");
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }

%>
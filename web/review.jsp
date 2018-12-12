<%-- 
    Document   : review
    Created on : Nov 28, 2017, 11:18:54 AM
    Author     : java3
--%>
<%@page import="java.sql.Statement"%>
<%@page import="CLUE.SQLconnection"%>
<%@page import="java.sql.Connection"%>
<%
        String rating = request.getParameter("rating");
        String recom = request.getParameter("feedback");
        String uid = (String)session.getAttribute("uid");
        String name = (String)session.getAttribute("uname");
        String p_id = (String)session.getAttribute("pid");
        String p_name = (String)session.getAttribute("pname");
        
 System.out.println("oid : " + uid + "\n oname : " + name + "\n oname : " + p_name );
        System.out.println("rating : " + rating + "\n rating1 : " +recom);
        Connection con = SQLconnection.getconnection();
        Statement st = con.createStatement();
        try {
            int in = st.executeUpdate("insert into review(p_id, p_name, uid,uname,rating, feedback)values('"+p_id+"','"+p_name+"','" + uid + "','" + name + "','" + rating + "','" + recom + "')");
            if (in != 0){
                response.sendRedirect("view_places.jsp");
            } else {
                response.sendRedirect("Failed");
            }
}
catch(Exception ex)
                               {
        ex.printStackTrace();
        }
             
%>
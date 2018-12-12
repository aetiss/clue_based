<%@page import="CLUE.Mail"%>
<%@page import="CLUE.SQLconnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%
String rate=request.getParameter("rate");
String id=request.getParameter("id");
String uid=request.getParameter("uid");

Connection con = null;
    Statement st = null;
    Statement st1 = null;
    Connection conn = SQLconnection.getconnection();
    Statement sto = conn.createStatement();
    st = conn.createStatement();
    st1 = conn.createStatement();
    
    try {                       
            int i = sto.executeUpdate("update booking set rate='"+rate+"' where id='" + id + "'" );
           System.out.println("Redirect Attributes==");
            if (i != 0) {
                ResultSet rs = st.executeQuery(" SELECT * from users where id= '"+uid+"'");
                if(rs.next()){
                    String name = rs.getString("name");
                    String mail = rs.getString("email");
                    String msggg="Dear "+name+" your Travell booking Estimated Cost is RS. "+rate+"";                   
                 Mail ma= new Mail();
             ma.secretMail(msggg,"Downloadkey",mail);          
            String msgg= "File Download Key:"+msggg;                          
                System.out.println("success");
                System.out.println("success");
                response.sendRedirect("booking.jsp?msg=updated");
            } else {
               
                System.out.println("failed");
                response.sendRedirect("booking.jsp?msg=failed");
                 }
                       }
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>
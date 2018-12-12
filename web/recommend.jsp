<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="CLUE.SQLconnection"%>
<%@page import="java.sql.Connection"%>
<%
        
        String pid = request.getParameter("id");
        String name  = (String)session.getAttribute("uname");
        String uid = (String)session.getAttribute("uid");
        
        Connection con = SQLconnection.getconnection();
        Statement st = con.createStatement();
        Statement st1 = con.createStatement();
        Statement st2 = con.createStatement();
        try {

            ResultSet rs = st.executeQuery("SELECT * FROM places where id ='"+pid+"'");
            if(rs.next())
            {
                int rec=rs.getInt("recom");
             int val = rec + 1;
            String p_id =rs.getString("id");
            String p_name =rs.getString("p_name");
            String state =rs.getString("p_state");
            String city =rs.getString("p_city");
            int i = st.executeUpdate("Update places set recom="+val+" where id ='"+pid+"'");
            
            int in = st1.executeUpdate("insert into recommend_place(p_id, p_name, user_name, user_id, state, city)values('"+p_id+"','"+p_name+"','" + name + "', '" + uid + "','" + state + "','" + city + "')");
            if (in != 0)
                               {
                response.sendRedirect("view_places.jsp?msg=recommeded");
            }
                        else {
                response.sendRedirect("Failed");
            }
        }
                       }
catch(Exception ex)
                               {
        ex.printStackTrace();
        }
             
%>
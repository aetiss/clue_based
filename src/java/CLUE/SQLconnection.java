/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package CLUE;

import java.sql.*;


public class SQLconnection{

    static Connection con;

    
    /**
     *
     * @return
     */
    public static Connection getconnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/clue", "root", "root");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}


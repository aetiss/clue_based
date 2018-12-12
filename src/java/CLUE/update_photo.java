/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package CLUE;

import java.awt.Image;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import javax.imageio.ImageIO;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/update_photo")
@MultipartConfig(maxFileSize = 16177215)
public class update_photo extends HttpServlet {

    // database connection settings
    private String dbURL = "jdbc:mysql://localhost:3306/clue";
    private String dbUser = "root";
    private String dbPass = "root";
    private SimpleDateFormat format;

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(true);
        String name = session.getAttribute("nname").toString();
        String email = session.getAttribute("nmail").toString();

        System.out.println("uid" + name + "name" + email);
        InputStream inputStream = null;
        Part filePart = request.getPart("dpic");
        if (filePart != null) {
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
            inputStream = filePart.getInputStream();
        }
        Connection conn = null;
        String message  = null;
        try {

            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            String sql = "Update users set photo=? where name=? AND email=? ";
            PreparedStatement statement = conn.prepareStatement(sql);
            
            if (inputStream != null) {
                statement.setBlob(1, inputStream);
            }
            statement.setString(2, name);
            statement.setString(3, email);
            int row = statement.executeUpdate();
            if (row > 0) {

                response.sendRedirect("users.jsp?msg=Registered Successfully");
            } else {
                response.sendRedirect("update.jsp?msg=Failed");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
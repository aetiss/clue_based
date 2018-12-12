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
import java.text.DateFormat;
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

@WebServlet("/add_places")
@MultipartConfig(maxFileSize = 16177215)
public class add_places extends HttpServlet {

    // database connection settings
    private String dbURL = "jdbc:mysql://localhost:3306/clue";
    private String dbUser = "root";
    private String dbPass = "root";
    private SimpleDateFormat format;

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(true);
        String p_name = request.getParameter("p_name");
        String p_city = request.getParameter("p_city");
        String p_state = request.getParameter("p_state");
        String p_address = request.getParameter("p_address");
        String des = request.getParameter("des");
        String fam = request.getParameter("fam");
        String poi = request.getParameter("poi");
        String open = request.getParameter("open");
        String close = request.getParameter("close");
        String clue = request.getParameter("clue");
        String clue1 = request.getParameter("clue1");
        String clue2 = request.getParameter("clue2");
        String clues = clue +" , "+clue1+" , "+clue2;
        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Date date = new Date();
        String time = dateFormat.format(date);
         int recom=0;
         int avg=0;

        System.out.println("name" + p_name + "city" + p_city + "state" + p_state + "address" + p_address + "des" + des + "fam" + fam + "poi" + poi);
        InputStream inputStream = null;
        InputStream inputStream1 = null;
        InputStream inputStream2 = null;
        Part filePart = request.getPart("pic1");
        if (filePart != null) {
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
            inputStream = filePart.getInputStream();
        }
        Part filePart1 = request.getPart("pic2");
        if (filePart != null) {
            System.out.println(filePart1.getName());
            System.out.println(filePart1.getSize());
            System.out.println(filePart1.getContentType());
            inputStream1 = filePart1.getInputStream();
        }
        Part filePart2 = request.getPart("pic3");
        if (filePart != null) {
            System.out.println(filePart2.getName());
            System.out.println(filePart2.getSize());
            System.out.println(filePart2.getContentType());
            inputStream2 = filePart2.getInputStream();
        }
        Connection conn = null;
        String message  = null;
        try {

            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            String sql = "insert into places(p_name,p_city,p_state,address,des,fam,poi,pic1,time,pic2,pic3,open,close,recom,avg,clues) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?,?,?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, p_name);
            statement.setString(2, p_city);
            statement.setString(3, p_state);
            statement.setString(4, p_address);
            statement.setString(5, des);
          // statement.setString(6, language);
            statement.setString(6, fam);
            statement.setString(7, poi);


            if (inputStream != null) {
                statement.setBlob(8, inputStream);
            }
            statement.setString(9, time);
            if (inputStream != null) {
                statement.setBlob(10, inputStream1);
            }
            if (inputStream != null) {
                statement.setBlob(11, inputStream2);
            }
            statement.setString(12, open);
            statement.setString(13, close);
            statement.setInt(14, recom);
            statement.setInt(15, avg);
            statement.setString(16, clues );
            
           int row = statement.executeUpdate();
            if (row > 0) {

                response.sendRedirect("add_places.jsp?msg=Success");
            } else {
                response.sendRedirect("add_places.jsp?msg=Failed");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
package online_movie_tickets;


import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
 
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
 
@WebServlet("/html/upimge")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class uploade_image extends HttpServlet {
     
    // database connection settings
    private String dbURL = "jdbc:mysql://localhost:8080/ticket_booking";
    private String dbUser = "root";
    private String dbPass = "Dev@";
     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
        String Moviename = request.getParameter("mname");
        String Movielanguage = request.getParameter("mlan");
        String Movietype = request.getParameter("mtp");
        String Moviedecryption = request.getParameter("mdrpn");
        String MoviesDatetime = request.getParameter("msd");
        String MovieeDatetime = request.getParameter("med");
        InputStream inputStream = null; // input stream of the upload file
         
        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("photo");
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
             
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }
         
        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client
         
        try {
            // connects to the database
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
 
            // constructs SQL statement
            String sql = "INSERT INTO `add_movie`(`M_name`,`M_language`,`M_type`,`M_sdate`,`M_edate`,`M_decryption`,`image`) values (?, ?, ?,?,?,?,?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, Moviename);
            statement.setString(2, Movielanguage);
            statement.setString(3, Movietype);
            statement.setString(4, MoviesDatetime);
            statement.setString(5, MovieeDatetime);
            statement.setString(6, Moviedecryption);
            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(7, inputStream);
            }
 
            // sends the statement to the database server
            int row = statement.executeUpdate();
            if (row > 0) {
                message = "File uploaded and saved into database";
            }
        } catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
            ex.printStackTrace();
        } finally {
            if (conn != null) {
                // closes the database connection
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            // sets the message in request scope
            request.setAttribute("Message", message);
             
            // forwards to the message page
            getServletContext().getRequestDispatcher("/html/Message.jsp").forward(request, response);
        }
    }
}
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.io.*"%>
<html>
<body>
<%
 Class.forName ("com.mysql.cj.jdbc.Driver"); // load driver class
 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:8080/ticket_booking","root","Dev@");
//Set up the database online, where upload image is the database name and SA is the account number and password to connect to the database.
Statement stmt=con.createStatement();
ResultSet rs=null;
//Create a resultset object
int id= Integer.parseInt(request.getParameter("M_id"));
//Get the number ID of the picture to be displayed and convert it to integer
String sql = "select image from add_movie";
//SQL statement to execute query
rs=stmt.executeQuery(sql);
while(rs.next()) {
ServletOutputStream sout = response.getOutputStream();
//Output stream of picture output
InputStream in = rs.getBinaryStream(1);
byte b[] = new byte[0x7a120];
for(int i = in.read(b); i != -1;)
{
sout.write(b);
//Output buffer input to page
in.read(b);
}
sout.flush();
//Input complete, clear buffer
sout.close();
}
%>
</body>
</html>
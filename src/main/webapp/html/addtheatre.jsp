<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
String name = request.getParameter("thname");
String Movie_id = request.getParameter("mid");
String Movie_time = request.getParameter("mtm");

try{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:8080/ticket_booking","root","Dev@");
Statement stmt = con.createStatement();
int rs = stmt.executeUpdate("INSERT INTO `theater`(`theater_name`,`M_time`,`M_id`) VALUES('"+name+"','"+Movie_time+"','"+Movie_id+"');");	


	response.sendRedirect("index.html");


}
	catch (ClassNotFoundException | SQLException e) {
		// TODO Auto-generated catch block
			
		e.printStackTrace();
		}
	%>

</body>
</html>
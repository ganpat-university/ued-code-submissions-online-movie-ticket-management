<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*"
%>

<%
String name = request.getParameter("username");
String email = request.getParameter("email");
String num = request.getParameter("p_no");
String pass = request.getParameter("pass");
String cpass = request.getParameter("cpass");

try{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:8080/ticket_booking","root","Dev@");
Statement stmt = con.createStatement();
if(pass.equals(cpass) && cpass.equals(pass)){
	int rs = stmt.executeUpdate("INSERT INTO t_movies(uname,email,phone_no,passwords,cpasswords) VALUES('"+name+"','"+email+"','"+num+"','"+pass+"','"+cpass+"');");
	


	response.sendRedirect("login.jsp");
}
else{
	out.println("password not match");
}
}
	catch (ClassNotFoundException | SQLException e) {
		// TODO Auto-generated catch block
			
		e.printStackTrace();
		}
	%>

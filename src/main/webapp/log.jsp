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

String uname=request.getParameter("username");
String pas = request.getParameter("pass");
try{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:8080/ticket_booking","root","Dev@");
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("SELECT * FROM t_movies");
while(rs.next()){
	String id = rs.getString(1);
	String uname1 = rs.getString(2);
	String pas1 = rs.getString(5);
if(uname.equals(uname1) && pas.equals(pas1))	
{
	response.sendRedirect("index.jsp?id="+id+"");
}

else{
	out.println("<h1>"+"pls check your username and password"+"</h1>");
}
}
if (uname.equals("showfix") && pas.equals("Showfix@123")) {
	response.sendRedirect("html/index.html");
	
}
}
catch(ClassNotFoundException | SQLException e)
{
	out.print(e);
}
%>
</body>
</html>
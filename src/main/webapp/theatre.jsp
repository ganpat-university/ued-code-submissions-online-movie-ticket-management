<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("userid");
String driver ="com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:8080/";
String database = "ticket_booking";
String userid = "root";
String password = "Dev@";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<h1>Display All theatre times</h1>
 
<table>
<%try{
                    	connection = DriverManager.getConnection(connectionUrl+database, userid, password);
                    	statement=connection.createStatement();
                    	String sql ="select * from theater";
                    	resultSet = statement.executeQuery(sql);
                    	while(resultSet.next()){
 %>
 
 <tr>
 <td>
<label><%=resultSet.getString("theater_name") %></label><br>
</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td>
	<div class="buttons">
	<button class="pulse"><a href="select-seats.jsp">
	<%=resultSet.getString("M_time")%>
	</a></button>
	</div>
</td>
<td>
	<div class="buttons">
	<button class="pulse"><a href="select-seats.jsp">
	<%=resultSet.getString("M_time")%>
	</a></button>
	</div>
</td>
<td>
	<div class="buttons">
	<button class="pulse"><a href="select-seats.jsp">
	<%=resultSet.getString("M_time")%>
	</a></button>
	</div>
</td>
<td>
	<div class="buttons">
	<td>
	<button class="pulse"><a href="select-seats.jsp">
	<%=resultSet.getString("M_time")%>
	</a></button>
	</div>
</td>
</tr>
</table>  
                   
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>
</body>
</html>
<style>
/*
  https://developer.mozilla.org/en/docs/Web/CSS/box-shadow
  box-shadow: [inset?] [top] [left] [blur] [size] [color];

  Tips:
    - We're setting all the blurs to 0 since we want a solid fill.
    - Add the inset keyword so the box-shadow is on the inside of the element
    - Animating the inset shadow on hover looks like the element is filling in from whatever side you specify ([top] and [left] accept negative values to become [bottom] and [right])
    - Multiple shadows can be stacked
    - If you're animating multiple shadows, be sure to keep the same number of shadows on hover/focus as non-hover/focus (even if you have to create a transparent shadow) so the animation is smooth. Otherwise, you'll get something choppy.
*/
.fill:hover,
.fill:focus {
  box-shadow: inset 0 0 0 2em var(--hover);
}

.pulse:hover,
.pulse:focus {
  -webkit-animation: pulse 1s;
          animation: pulse 1s;
  box-shadow: 0 0 0 2em transparent;
}

@-webkit-keyframes pulse {
  0% {
    box-shadow: 0 0 0 0 var(--hover);
  }
}

@keyframes pulse {
  0% {
    box-shadow: 0 0 0 0 var(--hover);
  }
}
.close:hover,
.close:focus {
  box-shadow: inset -3.5em 0 0 0 var(--hover), inset 3.5em 0 0 0 var(--hover);
}

.raise:hover,
.raise:focus {
  box-shadow: 0 0.5em 0.5em -0.4em var(--hover);
  transform: translateY(-0.25em);
}

.up:hover,
.up:focus {
  box-shadow: inset 0 -3.25em 0 0 var(--hover);
}

.slide:hover,
.slide:focus {
  box-shadow: inset 6.5em 0 0 0 var(--hover);
}

.offset {
  box-shadow: 0.3em 0.3em 0 0 var(--color), inset 0.3em 0.3em 0 0 var(--color);
}
.offset:hover, .offset:focus {
  box-shadow: 0 0 0 0 var(--hover), inset 6em 3.5em 0 0 var(--hover);
}

.fill {
  --color: #a972cb;
  --hover: #cb72aa;
}

.pulse {
  --color: #ef6eae;
  --hover: #ef8f6e;
}

.close {
  --color: #ff7f82;
  --hover: #ffdc7f;
}

.raise {
  --color: #ffa260;
  --hover: #e5ff60;
}

.up {
  --color: #e4cb58;
  --hover: #94e458;
}

.slide {
  --color: #8fc866;
  --hover: #66c887;
}

.offset {
  --color: #19bc8b;
  --hover: #1973bc;
}

button {
  color: var(--color);
  transition: 0.25s;
}
button:hover, button:focus {
  border-color: var(--hover);
  color: #fff;
}

body {
  color: #000;
  font: 300 1em "Fira Sans", sans-serif;

  min-height: 100vh;
  display: flex;
}

button {
  background: none;
  border: 2px solid;
  font: inherit;
  line-height: 1;
  margin: 0.5em;
  padding: 1em 2em;
}

h1 {
  font-weight: 400;
}
 	
code {
  color: #e4cb58;
  font: inherit;
}
</style>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
if(session.getAttribute("uid")==null){
	response.sendRedirect("login.jsp");
}
%>
<h1>welcome to <%=session.getAttribute("uid") %> in user dashboard</h1>
<h1><a href="logout.jsp"> logout</a></h1>
<table border="1">
<tr><th>email</th><th>password</th><th>mono</th></tr>
<% 
Cookie arr[]=request.getCookies();
for(int i=0; i<arr.length; i++)
{
	if(arr[i].getName().equals("abc")){
	out.print("username is:"+arr[i].getValue());
    }
	if(arr[i].getName().equals("abc1")){
		out.print("password is :"+arr[i].getValue());
	}
}	
String email=(String)session.getAttribute("uid");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/reg","root","nidhi@123");
Statement st=con.createStatement();
ResultSet res=st.executeQuery("select * from regis where email='"+email+"'");
if(res.next())
{%>
	<tr><td><%= res.getString(1) %></td><td><%= res.getString(2)%></td><td><%= res.getString(3)%>
	<td><a href="edit.jsp?q=<%= res.getString(1) %>"><img src="edit.png" width="50" height="50"></a></td> | <td><a href="delete.jsp?q=<%= res.getString(1) %>"><img src="delete.png" width="50" height="50"/></a></td>
		</tr> 
<% }%>
</table>
</body>
</html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
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
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb1","root","nidhi@123");
Statement st=con.createStatement();
ResultSet res=st.executeQuery("select * from student1 where rno='"+request.getParameter("q")+"'");
if(res.next()){
%>
<form action="UpdateSer" method="post">
<input type="text" name="email" placeholder="enter email" value="<%=res.getString(1) %>" ><br><br>
<input type="text" name="pass" placeholder="enter pass" value="<%= res.getString(2) %>"><br><br>

<input type="submit" name="submit" value="update">

</form>

<%
}
%>
</body>
</html>
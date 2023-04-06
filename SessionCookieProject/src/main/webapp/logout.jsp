
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
//isme bas ek hi kaam krna h destry session
session.removeAttribute("uid");
session.invalidate();//is mtlb aatribute to hat jaayega but invalid bhi ho jaayega
response.sendRedirect("login.jsp");
%>
</body>
</html>
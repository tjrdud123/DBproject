<%@ page import ="java.util.*" %>
<%@ page import ="java.io.*" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "dbcode.Customer" %>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인 확인</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	Customer cus = new Customer();
	int tf = cus.loginCheck(id, password);
	System.out.println(id);
	System.out.println(password);
	System.out.println("tf = " + tf);
	
	if(tf == 1){ // 로그인 성공
		session.setAttribute("id", id);
		out.println("<script>");
		out.println("alert('성공적으로 로그인 되었습니다.')");
		out.println("location.href = 'index.jsp'");
		out.println("</script>");
	}
	else{ // 로그인 실패
		out.println("<script>");
		out.println("alert('아이디 또는 비밀번호가 올바르지 않습니다.')");
		out.println("location.href = 'login.jsp'");
		out.println("</script>");
	}
%>

</body>
</html>
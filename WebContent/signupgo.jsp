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
<title>회원가입 확인</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String password1 = request.getParameter("password");
	String password2 = request.getParameter("password2");
	
	Customer cus = new Customer();
	
	if(password1.equals(password2) == false){ // 입력한 패스워드 1 패스워드 2 불일치
		out.println("<script>");
		out.println("alert('입력한 비밀번호가 일치하지 않습니다.')");
		out.println("location.href = 'signup.jsp'");
		out.println("</script>");
	}
	
	if(cus.isOverlapped(id) == 1){ // 중복일때
		out.println("<script>");
		out.println("alert('중복된 ID 입니다.')");
		out.println("location.href = 'signup.jsp'");
		out.println("</script>");
	}
	else{ // 정상회원가입될때
		int tf = cus.newCustomer(id, password1);
		out.println("<script>");
		out.println("alert('정상적으로 회원가입 되셨습니다.')");
		out.println("location.href = 'index.jsp'");
		out.println("</script>");
		
		System.out.println(tf);
	}
%>

</body>
</html>
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
<title>�α��� Ȯ��</title>
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
	
	if(tf == 1){ // �α��� ����
		session.setAttribute("id", id);
		out.println("<script>");
		out.println("alert('���������� �α��� �Ǿ����ϴ�.')");
		out.println("location.href = 'index.jsp'");
		out.println("</script>");
	}
	else{ // �α��� ����
		out.println("<script>");
		out.println("alert('���̵� �Ǵ� ��й�ȣ�� �ùٸ��� �ʽ��ϴ�.')");
		out.println("location.href = 'login.jsp'");
		out.println("</script>");
	}
%>

</body>
</html>
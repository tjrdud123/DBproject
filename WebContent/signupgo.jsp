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
<title>ȸ������ Ȯ��</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String password1 = request.getParameter("password");
	String password2 = request.getParameter("password2");
	
	Customer cus = new Customer();
	
	if(password1.equals(password2) == false){ // �Է��� �н����� 1 �н����� 2 ����ġ
		out.println("<script>");
		out.println("alert('�Է��� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.')");
		out.println("location.href = 'signup.jsp'");
		out.println("</script>");
	}
	
	if(cus.isOverlapped(id) == 1){ // �ߺ��϶�
		out.println("<script>");
		out.println("alert('�ߺ��� ID �Դϴ�.')");
		out.println("location.href = 'signup.jsp'");
		out.println("</script>");
	}
	else{ // ����ȸ�����Եɶ�
		int tf = cus.newCustomer(id, password1);
		out.println("<script>");
		out.println("alert('���������� ȸ������ �Ǽ̽��ϴ�.')");
		out.println("location.href = 'index.jsp'");
		out.println("</script>");
		
		System.out.println(tf);
	}
%>

</body>
</html>
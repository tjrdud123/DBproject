<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	session.removeAttribute("id");
	out.println("<script>");
	out.println("alert('�α׾ƿ� �Ǿ����ϴ�.')");
	out.println("location.href = 'index.jsp'");
	out.println("</script>");


%>
</body>
</html>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%!
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt1 = null;
	PreparedStatement pstmt2 = null;
	ResultSet rs1 = null;
	ResultSet rs2 = null;
	String url="jdbc:oracle:thin:@localhost:1521:oraknu";
	String id="kdhong";
	String pw="kdhong";
	String my_id;
	int my_cid = 2;
	String sql1="select * from customer where cid = ?";
	String sql2="select b.book_name, b.author, b.publiser, g.gname, b.price, p.book_cnt from purchase_history p, book b, genre g where p.cid=? and b.book_id = p.book_id and b.genre_id = g.genre_id";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>My INFO</title>
</head>
<body>
<h2>아이디 :
	<%
	 try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         conn = DriverManager.getConnection(url, id, pw);
		 conn.setAutoCommit(false);
		 stmt = conn.createStatement();

		 pstmt1 = conn.prepareStatement(sql1);
		 pstmt1.setInt(1, my_cid);
		 rs1 = pstmt1.executeQuery();

         rs1.next();
		 my_id = rs1.getString("id");
		 out.println(my_id);
		 out.println();

		 rs1.close();
		 pstmt1.close();
		 conn.commit();
	 %>
</h2>		 
<br>
<h3>Buying List</h3>
<table width="800" border="1" cellpadding="0" cellspacing="0">
	<tr>
		<th>책 이름</th>
		<th>저자</th>
		<th>출판사</th>
		<th>장르</th>
		<th>가격</th>
		<th>수량</th>
	<%
		 pstmt2 = conn.prepareStatement(sql2);
		 pstmt2.setInt(1, my_cid);
		 rs2 = pstmt2.executeQuery();

		 while(rs2.next()){
			out.println("<tr>");
			out.println("<td>"+rs2.getString(1)+"</td>");
			out.println("<td>"+rs2.getString(2)+"</td>");
			out.println("<td>"+rs2.getString(3)+"</td>");
			out.println("<td>"+rs2.getString(4)+"</td>");
			out.println("<td>"+rs2.getInt(5)+"</td>");
			out.println("<td>"+rs2.getInt(6)+"</td>");
		 }
			
		 rs2.close();
		 pstmt2.close();
		 conn.commit();
		 conn.setAutoCommit(true);
		 conn.close();
      } catch (Exception e) {
         System.err.println("error: " + e.getMessage());
      }
	%>
</table>
</body>
</html>
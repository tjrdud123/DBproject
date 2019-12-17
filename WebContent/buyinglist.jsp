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
	int my_cid;
	String sql1="select * from customer where id = ?";
	String sql2="select b.book_name, b.author, b.publiser, g.gname, b.price, p.book_cnt from purchase_history p, book b, genre g where p.cid=? and b.book_id = p.book_id and b.genre_id = g.genre_id";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>My INFO</title>
 <!-- Custom fonts for this template-->
  <link href="buyinglist/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="buyinglist/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="buyinglist/css/sb-admin.css" rel="stylesheet">

</head>
<body id = "page-top">
<nav class="navbar navbar-expand navbar-dark bg-dark static-top">

    <a class="navbar-brand mr-1" href="index.jsp">KNU 24</a>
		 
</nav>
<div id="wrapper">
	<div class="container-fluid">
	<ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a>ID</a>
          </li>
          <li class="breadcrumb-item active">
          <%
	my_id = (String)session.getAttribute("id");
	out.println(my_id);
	 try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         conn = DriverManager.getConnection(url, id, pw);
		 conn.setAutoCommit(false);
		 stmt = conn.createStatement();

		 pstmt1 = conn.prepareStatement(sql1);
		 pstmt1.setString(1, my_id);
		 rs1 = pstmt1.executeQuery();

         rs1.next();
		 my_cid = rs1.getInt("cid");
		 out.println();

		 rs1.close();
		 pstmt1.close();
		 conn.commit();
	 %>
		</li>
        </ol>
	<div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            Buying List</div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
            <thead>
            <tr>
			<th>책 이름</th>
			<th>저자</th>
			<th>출판사</th>
			<th>장르</th>
			<th>가격</th>
			<th>수량</th>
			</tr>
			</thead>
			<tbody>
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
		</tbody>
		</table>
		</div>
		</div>
		</div>        
	</div>
</div>
  <!-- Bootstrap core JavaScript-->
  <script src="buyinglist/vendor/jquery/jquery.min.js"></script>
  <script src="buyinglist/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="buyinglist/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Page level plugin JavaScript-->
  <script src="buyinglist/vendor/datatables/jquery.dataTables.js"></script>
  <script src="buyinglist/vendor/datatables/dataTables.bootstrap4.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="buyinglist/js/sb-admin.min.js"></script>

  <!-- Demo scripts for this page-->
  <script src="buyinglist/js/demo/datatables-demo.js"></script>
</body>
</html>
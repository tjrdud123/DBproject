<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.PreparedStatement"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<!-- Site made with Mobirise Website Builder v4.10.0, https://mobirise.com -->
<meta charset="EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="generator" content="Mobirise v4.10.0, mobirise.com">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1">
<link rel="shortcut icon" href="detail/images/logo4.png"
	type="image/x-icon">
<meta name="description" content="">

<title>책</title>
<link rel="stylesheet" href="detail/tether/tether.min.css">
<link rel="stylesheet" href="detail/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="detail/bootstrap/css/bootstrap-grid.min.css">
<link rel="stylesheet"
	href="detail/bootstrap/css/bootstrap-reboot.min.css">
<link rel="stylesheet" href="detail/theme/css/style.css">
<link rel="stylesheet" href="detail/mobirise/css/mbr-additional.css"
	type="text/css">



</head>

<body>
	<%
request.setCharacterEncoding("UTF-8");

String temp = request.getParameter("bookid");
int bookID = Integer.parseInt(temp);
String book_name =null;
String img_url=null;
String author=null;
String publiser=null;
String publication_date=null;
String gname=null;
int left_book=0;
int price=0;
System.out.println("bookID = " + bookID);
%>
	<%
String url = "jdbc:oracle:thin:@localhost:1521:oraknu";
String user = "hsy";
String pass = "hsy";
Connection conn = null;
String query = null;
String id = new String();


try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
} catch (ClassNotFoundException e) {
	System.err.println("error: " + e.getMessage());
	System.exit(1);
}

try {
	conn = DriverManager.getConnection(url, user, pass);
} catch (SQLException e) {
	System.err.println("Sql error: " + e.getMessage());
	System.exit(1);
}

try {
	conn.setAutoCommit(false);

	
	query = "select book_id, book_name, img_url, author, publiser, publication_date, gname, left_book, price from book where book_id = ?";
	PreparedStatement pstmt = conn.prepareStatement(query);
	pstmt.setString(1, temp);
	
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	book_name = rs.getString(2);
	img_url = rs.getString(3);
	author = rs.getString(4);
	publiser = rs.getString(5);
	publication_date = rs.getString(6);
	gname = rs.getString(7);
	left_book = rs.getInt(8);
	price = rs.getInt(9);
	
	rs.close();
	pstmt.close();
	conn.setAutoCommit(true);
	

} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}

%>

	<section class="header7 cid-rrg5WhmoYo" id="header7-g">
		<div class="container">
			<div class="media-container-row">

				<div class="media-content align-right">
					<h1
						class="mbr-section-title mbr-white pb-3 mbr-fonts-style display-2">
						<strong> <%=book_name %></strong>
					</h1>
					<div class="mbr-section-text mbr-white pb-3">

						<p class="mbr-text mbr-fonts-style display-5">
							저자 :
							<%=author %></p>
						<p class="mbr-text mbr-fonts-style display-5">
							출판사 :
							<%=publiser %></p>
						<p class="mbr-text mbr-fonts-style display-5">
							출판날짜 :
							<%=publication_date %></p>
						<p class="mbr-text mbr-fonts-style display-5">
							장르 :
							<%=gname %></p>
						<p class="mbr-text mbr-fonts-style display-5">
							남은재고 :
							<%=left_book %>권
						</p>
						<p class="mbr-text mbr-fonts-style display-5">
							가격 :
							<%=price %>원
						</p>





					</div>

				</div>
				<div class="media-content align-right">
				<div class="mbr-section-text mbr-white pb-3">
				<div class="mbr-figure" style="width: 135%;">
					<iframe class="mbr-embedded-video" src="<%=img_url%>" width="1920"
						height="1080" frameborder="0" allowfullscreen></iframe>
				</div>
				<br>
				<form action = "buy.jsp" method = "post">
							<input type = "hidden" name = "bookid" value = "<%=bookID%>">
							<input type = "hidden" name = "bookName" value = "<%=book_name%>">
							<input type = "hidden" name = "price" value = "<%=price%>">
							<input type = "hidden" name = "url" value = "<%=img_url%>">
							<input style = "font-size:30px; width:140px; height:45px"  class="mbr-section-title mbr-white pb-3 mbr-fonts-style display-2"  type = "submit" value = "구매하기">
							
							</form>
				</div>
				</div>
			</div>
			
		</div>
		<div class="container">
			<div class="media-content align-right">
			<br>
			<h1 class="mbr-section-title mbr-white pb-3 mbr-fonts-style display-2">이런 책은 어떠세요?</h1>
			</div>
		</div>

	</section>


	<section class="engine">
		<a href="https://mobirise.info/r">bootstrap template</a>
	</section>
	<script src="detail/web/assets/jquery/jquery.min.js"></script>
	<script src="detail/popper/popper.min.js"></script>
	<script src="detail/tether/tether.min.js"></script>
	<script src="detail/bootstrap/js/bootstrap.min.js"></script>
	<script src="detail/smoothscroll/smooth-scroll.js"></script>
	<script src="detail/theme/js/script.js"></script>


</body>
</html>
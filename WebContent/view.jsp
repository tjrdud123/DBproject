<%@ page import ="java.util.*" %>
<%@ page import ="java.io.*" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "java.sql.Statement" %>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE HTML>
<html>
	<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>책 조회하기</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Website Template by gettemplates.co" />
	<meta name="keywords" content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
	<meta name="author" content="gettemplates.co" />

	<!-- 
	//////////////////////////////////////////////////////

	FREE HTML5 TEMPLATE 
	DESIGNED & DEVELOPED by FreeHTML5.co
		
	Website: 		http://freehtml5.co/
	Email: 			info@freehtml5.co
	Twitter: 		http://twitter.com/fh5co
	Facebook: 		https://www.facebook.com/fh5co

	//////////////////////////////////////////////////////
	 -->

  	<!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<!-- <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet"> -->
	<!-- <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i" rel="stylesheet"> -->
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="view/css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="view/css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="view/css/bootstrap.css">

	<!-- Flexslider  -->
	<link rel="stylesheet" href="view/css/flexslider.css">

	<!-- Owl Carousel  -->
	<link rel="stylesheet" href="view/css/owl.carousel.min.css">
	<link rel="stylesheet" href="view/css/owl.theme.default.min.css">

	<!-- Theme style  -->
	<link rel="stylesheet" href="view/css/style.css">

	<!-- Modernizr JS -->
	<script src="js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

	</head>
	<body>
		
	<div class="fh5co-loader"></div>
	
	<div id="page">
	<nav class="fh5co-nav" role="navigation">
		<div class="container">
			<div class="row">
				
				<div class="col-md-3 col-xs-4 text-right hidden-xs menu-2">
					<ul>
						<li class="search">
							<div class="input-group">
						      <input type="text" placeholder="Search..">
						      <span class="input-group-btn">
						        <button class="btn btn-primary" type="button"><i class="icon-search"></i></button>
						      </span>
						    </div>
						</li>
					</ul>
				</div>
			</div>
			
		</div>
	</nav>

	<header id="fh5co-header" class="fh5co-cover fh5co-cover-sm" role="banner" style="background-image:url(view/images/img_bg_2.jpg);">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-md-offset-2 text-center">
					<div class="display-t">
						<div class="display-tc animate-box" data-animate-effect="fadeIn">
							<h1>Product</h1>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	
	<%
		String url = "jdbc:oracle:thin:@localhost:1521:oraknu";
		String user = "hsy";
		String pass = "hsy";
		Connection conn = null;
		String query = null;
		String id = new String();
		
		int price;
		int bid;
		String bookName;
		String URL;
		
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
	%>
	
	<div id="fh5co-product">
		<div class="container">
			<%
			try {
				
				conn.setAutoCommit(false);

				Statement stmt = conn.createStatement();
				query = "select book_id, book_name, img_url, price from book";
				ResultSet rs = stmt.executeQuery(query);

				while (rs.next()) {
					bid = rs.getInt(1);
					bookName = rs.getString(2);
					URL = rs.getString(3);
					price = rs.getInt(4);	
					%>
					<div class="col-md-3 text-center animate-box">
					<div class="product">
						<div class="product-grid" style="width:150px; height:220px; text-align: center; margin:auto;">
							<iframe src = "<%=URL %>" style="width:100%; height:100%; border:none" marginwidth="0" marginheight="0">
							
							</iframe>
						</div>
						<br>
						<div class="desc">
							<form action = "detail.jsp" method = "post">
							<input type = "hidden" name = "bookid" value = "<%=bid%>">
							<h3><input style = "font-size:10px; width:100%; margin:auto;" class = "btn btn-default btn-block" type = "submit" value = "<%=bookName %>"></h3>
							<span class="price">\<%=price %></span>
							</form>
						</div>
					</div>
					</div>
					<%
				}

				rs.close();
				stmt.close();
				conn.setAutoCommit(true);
				

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			%>
				
				
				
				
				
			</div>
		</div>
	</div>

	
	
	<!-- jQuery -->
	<script src="view/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="view/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="view/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="view/js/jquery.waypoints.min.js"></script>
	<!-- Carousel -->
	<script src="view/js/owl.carousel.min.js"></script>
	<!-- countTo -->
	<script src="view/js/jquery.countTo.js"></script>
	<!-- Flexslider -->
	<script src="view/js/jquery.flexslider-min.js"></script>
	<!-- Main -->
	<script src="view/js/main.js"></script>

	</body>
</html>


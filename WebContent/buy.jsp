<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.PreparedStatement"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>구매</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="buy/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="buy/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="buy/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="buy/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="buy/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="buy/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="buy/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="buy/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="buy/css/util.css">
	<link rel="stylesheet" type="text/css" href="buy/css/main.css">
<!--===============================================================================================-->
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");

String temp = request.getParameter("bookid");
int bookID = Integer.parseInt(temp);
String bookName = request.getParameter("bookName");
temp = request.getParameter("price");
int price = Integer.parseInt(temp);
String img_url = request.getParameter("url");

%>	
	
		<div class="container-login100" style="width:1000px; height:300px;margin:auto;margin-top: 0px;">
				<div style = "margin-top: 0px;">
				<iframe src = "<%=img_url %>" style=" width:150px; height:220px; border:none" marginwidth="0" marginheight="0">
					</iframe>
					</div><br><br>
					
				<form class="login100-form validate-form" action = "complete.jsp" method = "post">
					<span class="login100-form-title p-b-34">
						도서 구매하기
					</span>
					
					
					<div style="width:100px;">
						<span class="login100-form-title p-b-34">
						<%=price %>원
					</span>
					
					</div>
					<div class="wrap-input100 rs2-wrap-input100 validate-input m-b-20" data-validate="Type password" style = "display:inline; width:70px; margin:auto;">
						<input style = "width:70px;"class="input100" type="text" name="n" placeholder="권">
						<span class="focus-input100"></span>
						
					</div>
						<%
							String userid = (String)session.getAttribute("id");
						%>
						<input type="hidden" name="userID" value = "<%=userid%>"> 
						<input  type="hidden" name="bookID" value = "<%=bookID%>">
						
					<div class="container-login100-form-btn">
						<input type ="submit" value = "구매하기" class="login100-form-btn">
							
						
					</div>
					
					<div class="w-full text-center p-t-27 p-b-239">

						<a href="view.jsp" class="txt2">
							돌아가기
						</a>
					</div>

				</form>

			
		</div>
	
	
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="buy/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="buy/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="buy/vendor/bootstrap/js/popper.js"></script>
	<script src="buy/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="buy/vendor/select2/select2.min.js"></script>
	<script>
		$(".selection-2").select2({
			minimumResultsForSearch: 20,
			dropdownParent: $('#dropDownSelect1')
		});
	</script>
<!--===============================================================================================-->
	<script src="buy/vendor/daterangepicker/moment.min.js"></script>
	<script src="buy/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="buy/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="buy/js/main.js"></script>

</body>
</html>
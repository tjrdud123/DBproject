<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="dbcode.Customer"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>complete</title>

  <!-- Bootstrap Core CSS -->
  <link href="index/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom Fonts -->
  <link href="index/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
  <link href="index/vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet">

  <!-- Custom CSS -->
  <link href="index/css/stylish-portfolio.min.css" rel="stylesheet">
  
</head>
<body id = "page-top">
<%
request.setCharacterEncoding("UTF-8");

String userID = request.getParameter("userID");
String temp = request.getParameter("bookID");
int bookID = Integer.parseInt(temp);
temp = request.getParameter("n");
int n = Integer.parseInt(temp);

Customer cus = new Customer();
cus.buy(bookID, userID, n);



%>

<header class="masthead d-flex">
    <div class="container text-center my-auto">
      <h1 class="mb-1">Payment Completed!</h1>
      <h3 class="mb-5">
        <em>Thank you for using KNU 24.</em>
      </h3>

      <a class="btn btn-primary btn-xl" href="index.jsp">INIT PAGE</a>
      <a class="btn btn-primary btn-xl" href="buyinglist.jsp">INFO PAGE</a>
      <a class="btn btn-primary btn-xl" href="self.close()">EXIT PAGE</a>
    </div>
    <div class="overlay"></div>
</header>
</body>
</html>
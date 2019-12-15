<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>서점</title>

  <!-- Bootstrap Core CSS -->
  <link href="index/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom Fonts -->
  <link href="index/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
  <link href="index/vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet">

  <!-- Custom CSS -->
  <link href="index/css/stylish-portfolio.min.css" rel="stylesheet">

</head>

<body id="page-top">

  <%
  	//session.removeAttribute("id");
  	String id = new String();
	id = null;
	//session.removeAttribute("id");
	id = (String)session.getAttribute("id");
  %>

  <!-- Header -->
  <header class="masthead d-flex">
    <div class="container text-center my-auto">
      <h1 class="mb-1">KNU 24</h1>
      <h3 class="mb-5">
      	<% if(id == null){ %>
        <em>DB project team 2</em>
        <%}else{%>
        <em><%=id %>님 안녕하세요!</em>
        <%}%>
      </h3>
      <% if(id == null){ %>
        <p><a class="btn btn-primary btn-xl" href="login.jsp">LOG IN</a></p>
        <%}else{%>
        <p><a class="btn btn-primary btn-xl" href="logout.jsp">LOG OUT</a></p>
        <%}%>
      
      <a class="btn btn-primary btn-xl" href="signup.jsp">SIGN UP</a>
    </div>
    <div class="overlay"></div>
  </header>

 <!-- Portfolio -->
  <section class="content-section" id="portfolio">
    <div class="container">
      <div class="content-section-heading text-center">
        <h3 class="text-secondary mb-0">로그인이 필요한 기능입니다.</h3>
        <h2 class="mb-5">SERVICES</h2>
      </div>
      <div class="row no-gutters">
        <div class="col-lg-6">
          <% if(id == null){ %>
        <a class="portfolio-item" href="login.jsp">
        <%}else{%>
        <a class="portfolio-item" href="view.jsp">
        <%}%>
            <span class="caption">
              <span class="caption-content">
                <h2></h2>
                <p class="mb-0"></p>
              </span>
            </span>
            <img class="img-fluid" src="index/img/lookup.jpg" alt="">
          </a>
        </div>
        <div class="col-lg-6">
          <% if(id == null){ %>
        <a class="portfolio-item" href="login.jsp">
        <%}else{%>
        <a class="portfolio-item" href="recommend.jsp">
        <%}%>
          
          
            <span class="caption">
              <span class="caption-content">
                <h2></h2>
                <p class="mb-0"></p>
              </span>
            </span>
            <img class="img-fluid" src="index/img/recommand.jpg" alt="">
          </a>
        </div>
        
      </div>
    </div>
  </section>


  <!-- Services -->
  <section class="content-section bg-primary text-white text-center" id="services">
    <div class="container">
      <div class="content-section-heading">
        <h3 class="text-secondary mb-0">Services</h3>
        <h2 class="mb-5">What We Offer</h2>
      </div>
      <div class="row">
        <div class="col-lg-3 col-md-6 mb-5 mb-lg-0">
          <span class="service-icon rounded-circle mx-auto mb-3">
            <i class="icon-screen-smartphone"></i>
          </span>
          <h4>
            <strong>Responsive</strong>
          </h4>
          <p class="text-faded mb-0">Looks great on any screen size!</p>
        </div>
        <div class="col-lg-3 col-md-6 mb-5 mb-lg-0">
          <span class="service-icon rounded-circle mx-auto mb-3">
            <i class="icon-pencil"></i>
          </span>
          <h4>
            <strong>Redesigned</strong>
          </h4>
          <p class="text-faded mb-0">Freshly redesigned for Bootstrap 4.</p>
        </div>
        <div class="col-lg-3 col-md-6 mb-5 mb-md-0">
          <span class="service-icon rounded-circle mx-auto mb-3">
            <i class="icon-like"></i>
          </span>
          <h4>
            <strong>Favorited</strong>
          </h4>
          <p class="text-faded mb-0">Millions of users
            <i class="fas fa-heart"></i>
            Start Bootstrap!</p>
        </div>
        <div class="col-lg-3 col-md-6">
          <span class="service-icon rounded-circle mx-auto mb-3">
            <i class="icon-mustache"></i>
          </span>
          <h4>
            <strong>Question</strong>
          </h4>
          <p class="text-faded mb-0">I mustache you a question...</p>
        </div>
      </div>
    </div>
  </section>


 
  
  <!-- Footer -->
  <footer class="footer text-center">
    <div class="container">
      <ul class="list-inline mb-5">
        <li class="list-inline-item">
          <a class="social-link rounded-circle text-white mr-3" href="#">
            <i class="icon-social-facebook"></i>
          </a>
        </li>
        <li class="list-inline-item">
          <a class="social-link rounded-circle text-white mr-3" href="#">
            <i class="icon-social-twitter"></i>
          </a>
        </li>
        <li class="list-inline-item">
          <a class="social-link rounded-circle text-white" href="https://github.com/tjrdud123/DBproject">
            <i class="icon-social-github"></i>
          </a>
        </li>
      </ul>
      <p class="text-muted small mb-0">Copyright &copy; Your Website 2019</p>
    </div>
  </footer>

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded js-scroll-trigger" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Bootstrap core JavaScript -->
  <script src="index/vendor/jquery/jquery.min.js"></script>
  <script src="index/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="index/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="index/js/stylish-portfolio.min.js"></script>

</body>

</html>

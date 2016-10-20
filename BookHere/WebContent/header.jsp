<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js" lang="">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Home One || Witter Multipage Responsive Template</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- favicon -->
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
<!-- Place favicon.ico in the root directory -->
<!-- Google Fonts -->
<link
	href='https://fonts.googleapis.com/css?family=Poppins:400,700,600,500,300'
	rel='stylesheet' type='text/css'>

<!-- all css here -->
<!-- bootstrap v3.3.6 css -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- animate css -->
<link rel="stylesheet" href="css/animate.css">
<!-- jquery-ui.min css -->
<link rel="stylesheet" href="css/jquery-ui.min.css">
<!-- meanmenu css -->
<link rel="stylesheet" href="css/meanmenu.min.css">
<!-- Font-Awesome css -->
<link rel="stylesheet" href="css/font-awesome.min.css">
<!-- pe-icon-7-stroke css -->
<link rel="stylesheet" href="css/pe-icon-7-stroke.css">
<!-- Flaticon css -->
<link rel="stylesheet" href="css/flaticon.css">
<!-- venobox css -->
<link rel="stylesheet" href="venobox/venobox.css" type="text/css"
	media="screen" />
<!-- nivo slider css -->
<link rel="stylesheet" href="lib/css/nivo-slider.css" type="text/css" />
<link rel="stylesheet" href="lib/css/preview.css" type="text/css"
	media="screen" />
<!-- owl.carousel css -->
<link rel="stylesheet" href="css/owl.carousel.css">
<!-- style css -->
<link rel="stylesheet" href="css/style.css">
<!-- responsive css -->
<link rel="stylesheet" href="css/responsive.css">
<!-- modernizr css -->
<script src="js/vendor/modernizr-2.8.3.min.js"></script>
</head>
<body>
	<!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

	<!-- Add your site or application content here -->
	<!--Header Area Start-->
	<div class="header-area">
		<div class="container">
			<div class="row">
				<div class="col-md-2 col-sm-6 col-xs-6">
					<div class="header-logo">
						<a href="index"> <img src="img/logo.png" alt="">
						</a>
					</div>
				</div>
				<div class="col-md-1 col-sm-6 visible-sm  col-xs-6">
					<div class="header-right">
						<ul>
							<li><a href="account.jsp"><i class="flaticon-people"></i></a>
							</li>
							<li class="shoping-cart"><a href="#"> <i
									class="flaticon-shop"></i> <span>2</span>
							</a>
								<div class="add-to-cart-product">
									<div class="cart-product">
										<div class="cart-product-image">
											<a href="single-product.jsp"> <img src="img/shop/1.jpg"
												alt="">
											</a>
										</div>
										<div class="cart-product-info">
											<p>
												<span>1</span> x <a href="single-product.jsp">East of
													eden</a>
											</p>
											<a href="single-product.jsp">S, Orange</a> <span
												class="cart-price">$ 140.00</span>
										</div>
										<div class="cart-product-remove">
											<i class="fa fa-times"></i>
										</div>
									</div>
									<div class="cart-product">
										<div class="cart-product-image">
											<a href="single-product.jsp"> <img src="img/shop/1.jpg"
												alt="">
											</a>
										</div>
										<div class="cart-product-info">
											<p>
												<span>1</span> x <a href="single-product.jsp">East of
													eden</a>
											</p>
											<a href="single-product.jsp">S, Orange</a> <span
												class="cart-price">$ 140.00</span>
										</div>
										<div class="cart-product-remove">
											<i class="fa fa-times"></i>
										</div>
									</div>
									<div class="total-cart-price">
										<div class="cart-product-line fast-line">
											<span>Shipping</span> <span class="free-shiping">$10.50</span>
										</div>
										<div class="cart-product-line">
											<span>Total</span> <span class="total">$ 140.00</span>
										</div>
									</div>
									<div class="cart-checkout">
										<a href="checkout.jsp"> Check out <i
											class="fa fa-chevron-right"></i>
										</a>
									</div>
								</div></li>
						</ul>
					</div>
				</div>
				<div class="col-md-9 col-sm-12 hidden-xs">
					<div class="mainmenu text-center">
						<nav>
						<ul id="nav">
							<li><a href="index">HOME</a></li>
							<li><a href="aboutPage">ABOUT PAGE</a></li>
<!-- 							<li><a href="searchPage">BOOK SEARCH</a></li> -->
							<li><a href="bookshelfList?id=${sessionScope.loginEmail}">BOOKSHELF</a></li>
							<li><a href="MyBookSelect?id=${sessionScope.loginEmail}">MY BOOK</a></li>
							<li><a href="MyWishList?id=${sessionScope.loginEmail}">WISHLIST</a></li>
						 <li><a href="bookstorePage">BOOKSTORE</a></li>
							<!--  <li><a href="#">pages</a>
                                        <ul class="sub-menu">
                                            <li><a href="about.jsp">About Us</a></li>
                                            <li><a href="cart.jsp">Cart Page</a></li>
                                            <li><a href="checkout.jsp">Check Out</a></li>my
                                            <li><a href="contact.jsp">Contact</a></li>
                                            <li><a href="login.jsp">Login</a></li>
                                            <li><a href="my-account.jsp">My Account</a></li>
                                            <li><a href="shop.jsp">Shopping Page</a></li>
                                            <li><a href="single-product.jsp">Single Shop Page</a></li>
                                            <li><a href="wishlist.jsp">Wishlist Page</a></li>
                                            <li><a href="404.jsp">404 Page</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="contact.jsp">CONTACT</a></li> -->
						</ul>
						</nav>
					</div>
				</div>
				<div class="col-md-1 hidden-sm">
					<div class="header-right">
						<c:choose>
							<c:when test="${sessionScope.loginEmail == null}">
								<li>
									<form action="loginPage" method="post">
										<button name="submitcreate" id="submitcreate" type="submit"
											class="btn-default">Login</button>
									</form>
								</li>
							</c:when>
							<c:otherwise>
								<li>
<%-- 								<center>${sessionScope.loginEmail}님</center> --%>
									<form action="logout" id="logout">
										<button class="btn-default" onclick="click_logout()">Logout</button>
									</form>
								</li>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--Header Area End-->

	<!-- Mobile Menu Start -->
	<div class="mobile-menu-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="mobile-menu">
						<nav id="dropdown">
						<ul>
							<li><a href="index">HOME</a></li>
							<li><a href="aboutPage">ABOUT PAGE</a></li>
<!-- 							<li><a href="searchPage">BOOK SEARCH</a></li> -->
							<li><a href="bookshelfList?id=${sessionScope.loginEmail}">BOOKSHELF</a></li>
							<li><a href="selectMyBook?id=${sessionScope.loginEmail}">MY BOOK</a></li>
							<li><a href="MyWishList?id=${sessionScope.loginEmail}">WISHLIST</a></li>
							 <li><a href="bookstorePage">BOOKSTORE</a></li>

						</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Mobile Menu End -->

	<!--End of Quickview Product-->
	<!-- all js here -->
	<!-- jquery latest version -->
	<script src="js/vendor/jquery-1.12.0.min.js"></script>
	<!-- bootstrap js -->
	<script src="js/bootstrap.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<!-- jquery-ui js -->
	<script src="js/jquery-ui.min.js"></script>
	<!-- jquery Counterup js -->
	<script src="js/jquery.counterup.min.js"></script>
	<script src="js/waypoints.min.js"></script>
	<!-- jquery countdown js -->
	<script src="js/jquery.countdown.min.js"></script>
	<!-- jquery countdown js -->
	<script type="text/javascript" src="venobox/venobox.min.js"></script>
	<!-- jquery Meanmenu js -->
	<script src="js/jquery.meanmenu.js"></script>
	<!-- wow js -->
	<script src="js/wow.min.js"></script>
	<script>
		new WOW().init();
	</script>
	<!-- scrollUp JS -->
	<script src="js/jquery.scrollUp.min.js"></script>
	<!-- plugins js -->
	<script src="js/plugins.js"></script>
	<!-- Nivo slider js -->
	<script src="lib/js/jquery.nivo.slider.js" type="text/javascript"></script>
	<script src="lib/home.js" type="text/javascript"></script>
	<!-- main js -->
	<script src="js/main.js"></script>
	<!-- 로그아웃 click_logout() -->
	<script>
	function click_logout() {
	       $.ajax({
	            type: "post",
	            dataType: 'text',
	            url: "http://nid.naver.com/nidlogin.logout",
	            crossDomain : true,
	            xhrFields: {
	                withCredentials: true
	            }
	        }).done(function( data ) {
	               $('#logout').submit();
	            }).fail( function(xhr, textStatus, errorThrown) {
	               $('#logout').submit();
	            });
	       alert("로그아웃");
	     }
	</script>
</body>
</html>
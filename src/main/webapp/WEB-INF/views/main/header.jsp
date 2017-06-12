<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>모여서 공부하자</title>

<link
	href="https://fonts.googleapis.com/css?family=Josefin+Sans|Open+Sans|Raleway"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/flexslider.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<!-- Theme style -->
<link rel="stylesheet"    
	href="${pageContext.request.contextPath}/resources/dist/css/AdminLTE.min.css">

<style type="text/css">
</style>

</head>
<body id="top" data-spy="scroll">
	<!--top header-->

	<header id="home">

		<section class="main-header">

			<!-- Logo -->
			<a href="${pageContext.request.contextPath}/" class="logo"> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg"><b style="font-size: 35px">모</b>여서 <b
					style="font-size: 30px">공</b>부하자</span>
			</a>

			<!-- Header Navbar -->
			<nav class="navbar navbar-static-top" role="navigation">
				<!-- Sidebar toggle button-->
				<!-- <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
				<span class="sr-only">Toggle navigation</span>
			  </a> -->
				<!-- Navbar Right Menu -->
				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<li class="dropdown messages-menu">
							<!-- Menu toggle button --> <a href="/mypage"
							class="dropdown-toggle" data-toggle="dropdown"> <i
								class="fa fa-envelope-o"></i> <span class="label label-success">4</span>
						</a>
							<ul class="dropdown-menu">
								<li class="header">You have 4 messages</li>
								<li>
									<!-- /.menu -->
								</li>
								<li class="footer"><a
									href="${pageContext.request.contextPath}/main/mypage">My
										page</a></li>
							</ul>
						</li>
						</li>
						<!-- 헤더에서 메시지 드랍다운-->
						<%--  <li class="dropdown messages-menu">
					<!-- Menu toggle button -->
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
					  <i class="fa fa-envelope-o"></i>
					  <span class="label label-success">4</span>
					</a>
					<ul class="dropdown-menu">
					  <li class="header">You have 4 messages</li>
					  <li>
						<!-- inner menu: contains the messages -->
						<ul class="menu">
						  <li><!-- start message -->
							<a href="#">
							  <div class="pull-left">
								<!-- User Image -->
								<img src="${pageContext.request.contextPath}/resources/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
							  </div>
							  <!-- Message title and timestamp -->
							  <h4>
								Support Team
								<small><i class="fa fa-clock-o"></i> 5 mins</small>
							  </h4>
							  <!-- The message -->	
							  <p>Why not buy a new awesome theme?</p>
							</a>
						  </li>
						  <!-- end message -->
						</ul>
						<!-- /.menu -->
					  </li>
					  <li class="footer"><a href="#">See All Messages</a></li>
					</ul>
				  </li>
				 --%>
						<!-- /.messages-menu -->

						<!-- Notifications Menu -->
						<!-- <li class="dropdown notifications-menu">
					Menu toggle button
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
					  <i class="fa fa-bell-o"></i>
					  <span class="label label-warning">10</span>
					</a>
					<ul class="dropdown-menu">
					  <li class="header">You have 10 notifications</li>
					  <li>
						Inner Menu: contains the notifications
						<ul class="menu">
						  <li>start notification
							<a href="#">
							  <i class="fa fa-users text-aqua"></i> 5 new members joined today
							</a>
						  </li>
						  end notification
						</ul>
					  </li>
					  <li class="footer"><a href="#">View all</a></li>
					</ul>
				  </li> -->
						<!-- Tasks Menu -->
						<!-- <li class="dropdown tasks-menu">
					Menu Toggle Button
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
					  <i class="fa fa-flag-o"></i>
					  <span class="label label-danger">9</span>
					</a>
					<ul class="dropdown-menu">
					  <li class="header">You have 9 tasks</li>
					  <li>
						Inner menu: contains the tasks
						<ul class="menu">
						  <li>Task item
							<a href="#">
							  Task title and progress text
							  <h3>
								Design some buttons
								<small class="pull-right">20%</small>
							  </h3>
							  The progress bar
							  <div class="progress xs">
								Change the css width attribute to simulate progress
								<div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar"
									 aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
								  <span class="sr-only">20% Complete</span>
								</div>
							  </div>
							</a>
						  </li>
						  end task item
						</ul>
					  </li>
					  <li class="footer">
						<a href="#">View all tasks</a>
					  </li>
					</ul>
				  </li> -->
						<!-- User Account Menu -->
						<li class="dropdown user user-menu">
							<!-- Menu Toggle Button --> <a href="#" class="dropdown-toggle"
							data-toggle="dropdown"> <span class="hidden-xs">Login</span>
						</a>

							<ul class="dropdown-menu">
								<!-- The user image in the menu -->
								<form action="" method="post">
									<li class="user-header">
										<div class="form-group">
											<label for="id">ID:</label> <input type="text"
												class="form-control" id="id">
										</div>
										<div class="form-group">
											<label for="password">Password:</label> <input
												type="password" class="form-control" id="password">
										</div> <!-- Menu Footer-->
									<li class="user-footer">
										<div class="pull-left">
											<input class="btn btn-default btn-flat" type="submit"
												name="login" value="login">
											<!--  <a href="#" class="btn btn-default btn-flat">Profile</a> -->
										</div>
										<div class="pull-right">
											<a href="#" class="btn btn-default btn-flat">Sign</a>
										</div>
									</li>
								</form>
							</ul>
						</li>

						<!-- 헤더에서 Sign up 버튼 -->
						<li class="dropdown user user-menu"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"> <span
								class="hidden-xs">Sign up</span>
						</a></li>

					</ul>
				</div>
			</nav>
		</section>

		<!--main-nav-->

		<div id="main-nav">

			<nav class="navbar">
				<div class="container">
					<!-- 	
					<div class="navbar-header">
						<a href="index.html" class="navbar-brand">MyBiz</a>
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#ftheme">
							<span class="sr-only">Toggle</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
					</div>
				 -->
					<div class="navbar-collapse collapse" id="ftheme">

						<ul class="nav navbar-nav navbar-right">
							<li><a href="${pageContext.request.contextPath}/">home</a></li>
							<li><a href="${pageContext.request.contextPath}/enrollForm">스터디 모집</a></li>
							<li><a href="#service">스터디 검색</a></li>
							<li><a href="${pageContext.request.contextPath}/study/main">공지사항</a></li>
							<li class="hidden-sm hidden-xs"><a href="#" id="ss"><i
									class="fa fa-search" aria-hidden="true"></i></a></li>
						</ul>

					</div>

					<div class="search-form">
						<form>
							<input type="text" id="s" size="40" placeholder="Search..." />
						</form>
					</div>

				</div>
			</nav>
		</div>

	</header>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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

<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>

<script>
	function logout() {
		document.getElementById("logoutForm").submit();
	}
</script>


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
				<!-- 로그인이 된 상태 상단 메뉴 처리  -->						
				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
					<sec:authorize access="isAuthenticated()">
						<li style="margin:18px 5px 0px 0px;"><div><sec:authentication property="principal.name" /> 님 환영합니다.</div>
						</li>
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
					</sec:authorize>
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

<sec:authorize access="hasAnyRole('ROLE_MEMBER', 'ROLE_ADMIN')">
	<li class="dropdown user user-menu">
		<a href="${pageContext.request.contextPath}/main/mypage"><span class="hidden-xs">My page</span></a>
	</li>				
	<li class="dropdown user user-menu">
		<a href="javascript:logout();"><span class="hidden-xs">Logout</span></a>
	</li>	
	<form id="logoutForm" action="${pageContext.request.contextPath}/member/logout" method="post" style="display: none">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	</form>
</sec:authorize>

<!-- 로그인이 되지 않은 상태에서 로그인 화면  -->
<sec:authorize access="isAnonymous()">
<!-- 또는 !isAuthenticated() 로 비교해도 된다.  로그인을 하지 않은 사용자-->


		

						<li class="dropdown user user-menu">
							<!-- Menu Toggle Button --> <a href="#" class="dropdown-toggle"
							data-toggle="dropdown"> <span class="hidden-xs">Login</span>
						</a>

							<ul class="dropdown-menu" style="width:200px;">
								<!-- The user image in the menu -->
								<form action="${pageContext.request.contextPath}/login" method="post">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" >
									<li class="user-header">
										<div class="form-group input-group" style="margin:5px;">
											<span class="input-group-addon"><i class="fa fa-user"></i></span>
											<input type="text"
												class="form-control input-sm" id="id" name="id">
										</div>
										<div class="form-group input-group" style="margin:5px;">
											<span class="input-group-addon"><i class="fa  fa-unlock-alt"></i></span><input
												type="password" class="form-control input-sm" id="password" name="password">
										</div> <!-- Menu Footer-->
									<li class="user-footer">
										<div class="pull-left" style="margin-left:15px; margin-bottom:5px; float:left;">
											<input class="btn btn-flat btn-default" type="submit"
												name="login" value="login" style="padding:0px;margin:0px;width:80px;height:30px;">
											<!--  <a href="#" class="btn btn-default btn-flat">Profile</a> -->
										</div>
										<div class="pull-right" style="margin-left:0px; margin-bottom:10px; padding-right:15px;">
											<a href="${pageContext.request.contextPath}/login/signupForm" class="btn btn-flat btn-default" style="width:80px;height:30px; padding:5px;">SignUp</a>
										</div>
									</li>
								</form>
							</ul>
						</li>

						<!-- 헤더에서 Sign up 버튼 -->
						<li class="dropdown user user-menu"><a href="${pageContext.request.contextPath}/login/signupForm">
							<!-- class="dropdown-toggle" data-toggle="dropdown" --> <span
								class="hidden-xs">Sign up</span>
						</a></li>
</sec:authorize>

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
							<li><a href="${pageContext.request.contextPath}/search/study">스터디 검색</a></li>
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
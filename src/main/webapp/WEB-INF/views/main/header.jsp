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
	$(function () {
		$("#logo").hover(
	            function () {
	               $(this).css('background-color','white');
	               $("#logoText").css('color','#349fda');
	            },      
	            function () {
	               $("#logoText").css('color','#367fa9');
	            }
	         )
	})

	function logout() {
		document.getElementById("logoutForm").submit();
	}
</script>
<style type="text/css">
	#logo{
		text-decoration:none;
	}
	
</style>


</head>
<body id="top" data-spy="scroll">
	<!--top header-->

	<header id="home">

		<section class="main-header">

			<!-- Logo -->
			<a href="${pageContext.request.contextPath}/" class="logo" id="logo"> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg" id="logoText"><b style="font-size: 35px">모</b>여서 <b
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
							<!-- Menu toggle button --> <a> <i
								class="fa fa-envelope-o"></i> <span class="label label-success">${messageCount}</span>
						</a>
						</li>
					</sec:authorize>

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
							<!-- Menu Toggle Button --> <a href="${pageContext.request.contextPath}/loginForm" > <span class="hidden-xs">Login</span>
						</a>
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
							<li><a href="${pageContext.request.contextPath}/study/enrollForm">스터디 모집</a></li>
							<li><a href="${pageContext.request.contextPath}/search/study">스터디 검색</a></li>
							<li><a href="${pageContext.request.contextPath}/main/study/board/selectAll">맴버 모집</a></li>
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
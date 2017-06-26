<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/main/header.jsp">
	<jsp:param value="${messageCount}" name="messageCount"/>
</jsp:include>

<!--slider-->
<div id="slider" class="flexslider">

	<!-- 메인 사진 넘어가는 부분 -->
	<ul class="slides">
		<li><img
			src="${pageContext.request.contextPath}/resources/images/slider/slider1.jpg">

			<div class="caption">
				<h2>
					<span>모여서 공부하자</span>
				</h2>
				<h2>
					<span>모공</span>
				</h2>
				<p>모여서 공부하자는 취지로 만들어진 웹사이트입니다.</p>
			</div></li>
		<li><img
			src="${pageContext.request.contextPath}/resources/images/slider/slider2.jpg">

			<div class="caption">
				<h2>
					<span>모여서 공부하자</span>
				</h2>
				<h2>
					<span>Recruiting Study</span>
				</h2>
				<p>원하는 스터디 구성원을 모집할 수 있습니다.</p>
			</div></li>
		<li><img
			src="${pageContext.request.contextPath}/resources/images/slider/slider3.jpg">

			<div class="caption">
				<h2>
					<span>모여서 공부하자</span>
				</h2>
				<h2>
					<span>Searching Study</span>
				</h2>
				<p>원하는 스터디를 찾을 수 있습니다.</p>
			</div></li>
	</ul>

</div>

<!--portfolio-->
<div id="portfolio">
	<div class="container">
		<div class="row">

			<div
				class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
				<div class="portfolio-heading">
					<h2>최신 스터디</h2>
					<p></p>
				</div>
			</div>

		</div>
	</div>

	<div class="portfolio-thumbnail">
		<div class="container-fluid">
			<div class="row">

				<div class="col-xs-6 col-sm-3 col-md-3">
					<div class="item" id="${studyList[0].studyCode}">
						<img
							src="${pageContext.request.contextPath}/resources/images/portfolio/portfolio1.jpg"
							alt="">
						<div class="caption">
							<i class="fa fa-search" aria-hidden="true"></i>
							<p><br>${studyList[0].name}</p>
						</div>
					</div>
				</div>

				<div class="col-xs-6 col-sm-3 col-md-3">
					<div class="item" id="${studyList[1].studyCode}">
						<img
							src="${pageContext.request.contextPath}/resources/images/portfolio/portfolio2.jpg"
							alt="">
						<div class="caption">
							<i class="fa fa-search" aria-hidden="true"></i>
							<p><br>${studyList[1].name}</p>
						</div>
					</div>
				</div>

				<div class="col-xs-6 col-sm-3 col-md-3">
					<div class="item" id="${studyList[2].studyCode}">
						<img
							src="${pageContext.request.contextPath}/resources/images/portfolio/portfolio3.jpg"
							alt="">
						<div class="caption">
							<i class="fa fa-search" aria-hidden="true"></i>
							<p><br>${studyList[2].name}</p>
						</div>
					</div>
				</div>

				<div class="col-xs-6 col-sm-3 col-md-3">
					<div class="item" id="${studyList[3].studyCode}">
						<img
							src="${pageContext.request.contextPath}/resources/images/portfolio/portfolio4.jpg"
							alt="">
						<div class="caption">
							<i class="fa fa-search" aria-hidden="true"></i>
							<p><br>${studyList[3].name}</p>
						</div>
					</div>
				</div>

				<div class="col-xs-6 col-sm-3 col-md-3">
					<div class="item" id="${studyList[4].studyCode}">
						<img
							src="${pageContext.request.contextPath}/resources/images/portfolio/portfolio5.jpg"
							alt="">
						<div class="caption">
							<i class="fa fa-search" aria-hidden="true"></i>
							<p><br>${studyList[4].name}</p>
						</div>
					</div>
				</div>

				<div class="col-xs-6 col-sm-3 col-md-3">
					<div class="item" id="${studyList[5].studyCode}">
						<img
							src="${pageContext.request.contextPath}/resources/images/portfolio/portfolio6.jpg"
							alt="">
						<div class="caption">
							<i class="fa fa-search" aria-hidden="true"></i>
							<p><br>${studyList[5].name}</p>
						</div>
					</div>
				</div>

				<div class="col-xs-6 col-sm-3 col-md-3">
					<div class="item" id="${studyList[6].studyCode}">
						<img
							src="${pageContext.request.contextPath}/resources/images/portfolio/portfolio7.jpg"
							alt="">
						<div class="caption">
							<i class="fa fa-search" aria-hidden="true"></i>
							<p><br>${studyList[6].name}</p>
						</div>
					</div>
				</div>

				<div class="col-xs-6 col-sm-3 col-md-3">
					<div class="item" id="${studyList[7].studyCode}">
						<img
							src="${pageContext.request.contextPath}/resources/images/portfolio/portfolio8.jpg"
							alt="">
						<div class="caption">
							<i class="fa fa-search" aria-hidden="true"></i>
							<p><br>${studyList[7].name}</p>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</div>

<!--about bg-->
<div id="about-bg">

	<div class="container">
		<div class="row">

			<div class="about-bg-heading">
				<h1>모공 서비스</h1>
				<p>함께 협력하는 공간</p>
			</div>

			<div class=" col-xs-12 col-md-3">
				<div class="about-bg-wrapper">
					<span class="count"><h1>142</h1></span>
					<p>명의 회원 수</p>
				</div>
			</div>

			<div class="col-xs-12 col-md-3">
				<div class="about-bg-wrapper">
					<span class="count"><h1>489</h1></span>
					<p>개의 스터디 수</p>
				</div>
			</div>

			<div class="col-xs-12 col-md-3">
				<div class="about-bg-wrapper">
					<span class="count"><h1>1522</h1></span>
					<p>개 협력 스터디 공간</p>
				</div>
			</div>

			<div class="col-xs-12 col-md-3">
				<div class="about-bg-wrapper">
					<span class="count"><h1>3151</h1></span>
					<p>개 완료된 스터디</p>
				</div>
			</div>

		</div>
	</div>

	<div class="cover"></div>

</div>

<!--about-->
<div id="about">

	<div class="container">
		<div class="row">
			<div
				class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
				<div class="about-heading">
					<h2>about</h2>
					<p>네이버 카페, 오프라인으로 힘들게 스터디를 구하지 마세요 '모공'이 해결해 드리겠습니다.</p>
				</div>
			</div>
		</div>
	</div>

	<!--about wrapper left-->
	<div class="container">

		<div class="row">
			<div class="col-xs-12 hidden-sm col-md-5">

				<div class="about-left">
					<img
						src="${pageContext.request.contextPath}/resources/images/about/about1.jpg"
						alt="">
				</div>

			</div>

			<!--about wrapper right-->
			<div class="col-xs-12 col-md-7">
				<div class="about-right">
					<div class="about-right-heading">
						<h1>about our consulting</h1>
					</div>

					<div class="about-right-boot">
						<div class="about-right-wrapper">
							<a href="${pageContext.request.contextPath}/study/enrollForm"><h3>스터디 모집하기</h3></a>
							<p>스터디의 조장이 되어보세요. 카테고리로 스터디를 만들고 스터디를 찾고 있는 다른 스터디원들을 모집하세요.
								그들이 당신의 조원이 될 것입니다.</p>
						</div>
					</div>

					<div class="about-right-best">
						<div class="about-right-wrapper">
							<a href="${pageContext.request.contextPath}/search/study"><h3>스터디 찾기</h3></a>
							<p>자신이 공부하고 싶은 스터디를 보다 쉽게 찾을 수 있습니다. 카테고리를 선택한 후 스터디에 대한 정보를
								확인하고 스터디의 구성원이 되어보세요.</p>
						</div>
					</div>

					<div class="about-right-support">
						<div class="about-right-wrapper">
							<a href="#"><h3>스터디 관리</h3></a>
							<p>스터디가 구성되어도 흐지부지했던 지난 날들... 이젠 사라질 것입니다. 스터디 관리를 통해 원하는 목표를
								이뤄보세요</p>
						</div>
					</div>

				</div>
			</div>
		</div>

	</div>
</div>


<!--client-->
<div id="client">
	<span></span><img width="200" height="150px"
		src="${pageContext.request.contextPath}/resources/images/client/kosta.png"
		alt=""> <span></span><img width="200" height="150px"
		style="margin-left: 100px"
		src="${pageContext.request.contextPath}/resources/images/client/kimoo.png"
		alt="">
</div>

<!--footer-->
<div id="footer">
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<div class="footer-heading">
					<p>원하는 종류의 스터디를 등록하고, 모집할 수 있습니다.</p>
					<p>스터디에 가입하고, 스터디를 지원하는 다양한 기능을 체험해보세요.</p>
				</div>
			</div>

			<div class="col-md-4">
				<div class="footer-heading">
					<h3>
						<span>최근</span> 이슈
					</h3>
					<ul>
						<li><a href="#">스터디에서 채팅이 가능합니다</a></li>
						<li><a href="#">다양한 Task를 등록하고 관리할 수 있습니다</a></li>
						<li><a href="#">Task에 대한 정보를 그래프로 확인해보세요</a></li>
						<li><a href="#">취미 관련 스터디 분야가 추가되었습니다</a></li>
					</ul>
				</div>
			</div>

			<div class="col-md-4">
				<div class="footer-heading">
					<h3>
						<span>스터디</span> 관리
					</h3>
					<div class="insta">
						<ul>
							<img
								src="${pageContext.request.contextPath}/resources/images/footer/footer1.jpg"
								alt="" />
							<img
								src="${pageContext.request.contextPath}/resources/images/footer/footer2.jpg"
								alt="" />
							<img
								src="${pageContext.request.contextPath}/resources/images/footer/footer3.jpg"
								alt="" />
							<img
								src="${pageContext.request.contextPath}/resources/images/footer/footer4.jpg"
								alt="" />
							<img
								src="${pageContext.request.contextPath}/resources/images/footer/footer5.jpg"
								alt="" />
							<img
								src="${pageContext.request.contextPath}/resources/images/footer/footer6.jpg"
								alt="">
						</ul>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>

<script>
	$(function() {
		$(".item").click(function() {
			location.href="${pageContext.request.contextPath}/search/detail?studyCode="+$(this).attr("id");
		})
	})
</script>

<jsp:include page="/WEB-INF/views/main/footer.jsp" />

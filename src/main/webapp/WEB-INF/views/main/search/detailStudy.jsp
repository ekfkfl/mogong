<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
     <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
  <!-- daterange picker -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/daterangepicker.css">
  <!-- Bootstrap time Picker -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-timepicker.min.css">
  <!-- Select2 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/select2.min.css">

<!-- jQuery 3.1.1 -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.0.min.js"></script>



<jsp:include page="/WEB-INF/views/main/header.jsp" />
<style>
	html,body{height:100%}
	body{margin:0}
	#body{min-height:100%}
	#content{padding-bottom:2.0em}
	#bottom-footer{margin-top:2.0em;height:2.0em}	
</style>

<div id="body">
<div class="container">
      <div class="row">
         <div
            class="col-xs-12 col-sm-9 col-md-6 col-sm-offset-2 col-md-offset-3">
            <div class="box box-warning col-xs-12">
               <div class="box-header with-border">
                  <h3 class="box-title">그룹장 정보</h3>
               </div>
              <div class="user-block">
                <img class="img-circle" src="${pageContext.request.contextPath}${studyDTO.userProfile}" alt="User Image">
                <span class="username"><a href="#">${studyDTO.userName}</a></span>
                <span class="description">ID : ${studyDTO.id}</span><br>
                <label>Email</label><br>
	               	<p>${studyDTO.userEmail}</p>
	            <label>Intro</label><br>
	               	<p>${studyDTO.userIntro}</p>
              </div>
              
              <!-- /.box-tools -->
            </div>
         </div>
      </div>
   </div>
<div class="container">
      <div class="row">
         <div
            class="col-xs-12 col-sm-9 col-md-6 col-sm-offset-2 col-md-offset-3">
            <div class="box box-info">
               <div class="box-header with-border">
                  <h3 class="box-title">스터디 정보</h3>
               </div>
               <div class="box-body">
	               <div class="form-group">
	               <label>스터디 제목</label><br>
	               		<p>${studyDTO.name}</p>
	               </div>
	              <div class="form-group">
	               <label>시작일 / 마감일</label><br>
	              		<p>${studyDTO.startDate}&nbsp;/&nbsp;${studyDTO.endDate}</p>
	              </div>
	            	<div class="form-group">
	            		  <label>스터디 요일</label><br>
	            		  <p>${studyDTO.day}</p>	
					</div>
					<div class="form-group">
	            		  <label>스터디 시간</label><br>
	            		  <p>${studyDTO.startTime} ~ ${studyDTO.endTime}</p>
					</div>
					<div class="form-group">
            		  <label>인원수</label><br>
            		  	<p>${studyDTO.people}</p>	
					</div>
					<div class="form-group">
            		  <label>지역</label><br>
            		  	<p>${studyDTO.area}</p>
					</div><br>
					<c:choose>
						<c:when test="${sessionScope.userDTO.id==studyDTO.id}">
							<button type="button" id="updateBtn" class="btn btn-info pull-right">수정하기</button>
						</c:when>
						<c:when test="${empty selectStudyMember}">
							<button type="button" id="joinBtn" class="btn btn-info pull-right">신청하기</button>
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
					<div id="map" style="width:300px;height:350px;position:absolute;top:45px;left:250px"></div>
               		<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=f93121500121a54094b1f2b7bddeb160&libraries=services"></script>
					<script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = {
				        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨
				    };  

				// 지도를 생성합니다    
				var map = new daum.maps.Map(mapContainer, mapOption); 

				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new daum.maps.services.Geocoder();

				// 주소로 좌표를 검색합니다
				geocoder.addr2coord('${studyDTO.addr1}', function(status, result) {

				    // 정상적으로 검색이 완료됐으면 
				     if (status === daum.maps.services.Status.OK) {

				        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);

				        // 결과값으로 받은 위치를 마커로 표시합니다
				        var marker = new daum.maps.Marker({
				            map: map,
				            text: 'aa',
				            position: coords
				        });

				        // 인포윈도우로 장소에 대한 설명을 표시합니다
				         var infowindow = new daum.maps.InfoWindow({
				            content: '<div style="width:150px;text-align:center;padding:6px 0;">${studyDTO.addr2}</div>'
				        });
				        infowindow.open(map, marker);

				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);
				    } 
				});    
					</script>
				</div>
            </div>
         </div>
      </div>
   </div>
   <div class="container">
      <div class="row">
         <div
            class="col-xs-12 col-sm-9 col-md-6 col-sm-offset-2 col-md-offset-3">
            <div class="box box-warning col-xs-12">
               <div class="box-header with-border">
                  <h3 class="box-title">스터디 설명</h3>
               </div>
               <div class="box-body">
                  <!-- textarea -->
                  <div class="form-group">
                     <textarea class="form-control" id="description" readonly="readonly"
                        name="description" rows="5" placeholder="${studyDTO.description}"></textarea>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>

</div>
<!--bottom footer-->
	<div id="bottom-footer" class="hidden-xs">
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<div class="footer-left">
						&copy; MyBix Theme. All rights reserved
						<div class="credits">
							<!-- 
                                    All the links in the footer should remain intact. 
                                    You can delete the links only if you purchased the pro version.
                                    Licensing information: https://bootstrapmade.com/license/
                                    Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=MyBiz
                                -->
							Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
						</div>
					</div>
				</div>

				<div class="col-md-8">
					<div class="footer-right">
						<ul class="list-unstyled list-inline pull-right">
							<li><a href="#home">Home</a></li>
							<li><a href="#about">About</a></li>
							<li><a href="#service">Service</a></li>
							<li><a href="#portfolo">Portfolio</a></li>
							<li><a href="#contact">Contact</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
<script>
	$(function() {
		$("#updateBtn").click(function() {
			alert('수정하는페이지로이동');
		})
		
		$("#joinBtn").click(function() {
			var sessionId="${sessionScope.userDTO.id}";
			if(sessionId == "") {
				location.href="${pageContext.request.contextPath}/loginForm";
			} else {
				alert('신청하는로직으로이동')
			}
		})
	})
</script>

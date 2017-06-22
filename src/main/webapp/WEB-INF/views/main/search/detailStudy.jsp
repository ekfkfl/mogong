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
                  <h3 class="box-title">�׷��� ����</h3>
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
                  <h3 class="box-title">���͵� ����</h3>
               </div>
               <div class="box-body">
	               <div class="form-group">
	               <label>���͵� ����</label><br>
	               		<p>${studyDTO.name}</p>
	               </div>
	              <div class="form-group">
	               <label>������ / ������</label><br>
	              		<p>${studyDTO.startDate}&nbsp;/&nbsp;${studyDTO.endDate}</p>
	              </div>
	            	<div class="form-group">
	            		  <label>���͵� ����</label><br>
	            		  <p>${studyDTO.day}</p>	
					</div>
					<div class="form-group">
	            		  <label>���͵� �ð�</label><br>
	            		  <p>${studyDTO.startTime} ~ ${studyDTO.endTime}</p>
					</div>
					<div class="form-group">
            		  <label>�ο���</label><br>
            		  	<p>${studyDTO.people}</p>	
					</div>
					<div class="form-group">
            		  <label>����</label><br>
            		  	<p>${studyDTO.area}</p>
					</div><br>
					<c:choose>
						<c:when test="${studyDTO.id != sessionScope.userDTO.id}">
							<button type="button" id="joinBtn" class="btn btn-info pull-right">��û�ϱ�</button>
						</c:when>
						<c:when test="${studyDTO.id == sessionScope.userDTO.id}">
							<button type="button" id="joinBtn" class="btn btn-info pull-right">�����ϱ�</button>
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
					<div id="map" style="width:300px;height:350px;position:absolute;top:45px;left:250px"></div>
               		<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=f93121500121a54094b1f2b7bddeb160&libraries=services"></script>
					<script>
					var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
				    mapOption = {
				        center: new daum.maps.LatLng(33.450701, 126.570667), // ������ �߽���ǥ
				        level: 3 // ������ Ȯ�� ����
				    };  

				// ������ �����մϴ�    
				var map = new daum.maps.Map(mapContainer, mapOption); 

				// �ּ�-��ǥ ��ȯ ��ü�� �����մϴ�
				var geocoder = new daum.maps.services.Geocoder();

				// �ּҷ� ��ǥ�� �˻��մϴ�
				geocoder.addr2coord('${studyDTO.addr1}', function(status, result) {

				    // ���������� �˻��� �Ϸ������ 
				     if (status === daum.maps.services.Status.OK) {

				        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);

				        // ��������� ���� ��ġ�� ��Ŀ�� ǥ���մϴ�
				        var marker = new daum.maps.Marker({
				            map: map,
				            text: 'aa',
				            position: coords
				        });

				        // ����������� ��ҿ� ���� ������ ǥ���մϴ�
				         var infowindow = new daum.maps.InfoWindow({
				            content: '<div style="width:150px;text-align:center;padding:6px 0;">${studyDTO.addr2}</div>'
				        });
				        infowindow.open(map, marker);

				        // ������ �߽��� ��������� ���� ��ġ�� �̵���ŵ�ϴ�
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
                  <h3 class="box-title">���͵� ����</h3>
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

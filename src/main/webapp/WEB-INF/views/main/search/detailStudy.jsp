<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
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
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=f93121500121a54094b1f2b7bddeb160"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=f93121500121a54094b1f2b7bddeb160&libraries=services,clusterer"></script>


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
                <span class="username"><a href="#">����</a></span>
                <span class="description">ID : �ٶ�</span><br>
                <label>Email</label><br>
	               	<p>ekfkfl@ekfkfl</p>
	            <label>Intro</label><br>
	               	<p>���ڴ� ����ó�?</p>
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
	               		<p>asdjasd</p>
	               </div>
	              <div class="form-group">
	               <label>������ / ������</label><br>
	              		<p>asdasdasd</p>
	              </div>
	            	<div class="form-group">
	            		  <label>���͵� ����</label><br>
	            		  <p>��,��,��</p>	
					</div>
					<div class="form-group">
	            		  <label>���͵� �ð�</label><br>
	            		  <p>8�� ~ 10��</p>
					</div>
					<div class="form-group">
            		  <label>�ο���</label><br>
            		  	<p>6��</p>	
					</div>
					<div class="form-group">
            		  <label>����</label><br>
            		  	<p>����/��� - ������</p>
					</div>
					<div id="map" style="width:300px;height:350px;position:absolute;top:45px;left:250px"></div>
               		    
					<script>
					var container = document.getElementById('map');
					var options = {
						center: new daum.maps.LatLng(33.450701, 126.570667),
						level: 3
					};
					
					var map = new daum.maps.Map(container, options);
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
                        name="description" rows="5" placeholder="���͵� ���� ������ �����ϴ�."></textarea>
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

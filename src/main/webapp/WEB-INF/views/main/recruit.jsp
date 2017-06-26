<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<!-- Select2 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/select2.min.css">
<!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/dist/css/AdminLTE.css">

  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/dist/css/skins/skin-blue.css">
	
  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
<!-- jQuery 3.1.1 -->
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.2.0.min.js"></script>


<jsp:include page="/WEB-INF/views/main/header.jsp" />
<script type="text/javascript">
		$(function () {
			$("#write").click( function () {
				location.href="${pageContext.request.contextPath}/main/study/board/writeForm";
			});
		})	
		
	</script>
<style>
#searchContent{
	width:75%;
	height:auto;
	margin:auto;
}
		th,td{text-align:center;}
		th{background:#dfdfdf;}
		li{float:left;list-style:none;margin:0 auto;}
		.number:hover{background:#eeeeee;}

</style>
<body>
<div id="searchContent">
	<section class="content-header">
      <h1>
        맴버 모집
        <small>공지사항 및 게시글을 올릴 수 있습니다.</small>
      </h1>
</section>
    
	<section class="content container-fluid">
		 <form name="form">
		 	<input type="hidden" name="pageNo"/>
	
		 <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">&nbsp;</h3>
              <div class="box-tools pull-right">
                <div class="has-feedback">
                  <input type="text" id="filed" name="filed" onkeydown="javascript:if(event.keyCode==13){fn_search()}" class="form-control input-sm" placeholder="제목으로 검색하기">
                  <span class="glyphicon glyphicon-search form-control-feedback"></span>
                </div>
              </div>
              <!-- /.box-tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
              <div class="mailbox-controls">
                <button id="write" type="button" style="width:80px;height:35px;" class="btn btn-default btn-sm checkbox-toggle">글쓰기</button>
              </div>
              <div class="table-responsive mailbox-messages">
                <table class="table table-hover table-striped">
                  <tbody>
                  <tr>
                  	<th width="5%">번호</th>
                  	<th width="40%">제목</th>
                  	<th width="10%">작성자</th>
                  	<th width="15%">작성일</th>
                  	<th width="5%">조회</th>
                  	<th width="5%">첨부</th>
                  </tr>
                  <c:forEach items="${requestScope.list}" var="dto">
                  	<tr>
                  		<c:if test="${dto.notice == '1'}">
                  			<td><button type="button" style="width:80px;height:30px;" class="btn btn-block btn-danger btn-xs">공지</button></td>
                  		</c:if>
                  		<c:if test="${dto.notice=='0'}">
                  			<td>${dto.boardCode}</td>
                  		</c:if>
	                    <td><a href="${pageContext.request.contextPath}/main/study/board/selectById?boardCode=${dto.boardCode}">${dto.title}</a></td>
	                    <td>${dto.name}</td>
	                    <td>${dto.writeDate}</td>
	                    <td>${dto.hit}</td>
	                    <c:if test="${dto.fileName != null}">
	                   		<td><i class="fa fa-file-o"></i></td> 
	                    </c:if>
	                    <c:if test="${dto.fileName == null}">
	                   		<td>&nbsp;</td> 
	                    </c:if>
                    </tr>
                  
                  </c:forEach>
                  </tbody>
                </table>
                <!-- /.table -->
                
              </div>
              
              <!-- /.mail-box-messages -->
            </div>
          <!-- /. box -->
          
        </div>
        <br>
        <div style="text-align:center;">
        <a href="#" class="number" style="color:black;padding:15px;display:inline"><i class="fa fa-chevron-left"></i></a>
                <a href="#" class="number" style="color:black;padding:15px;display:inline">
        			<font style="font-weight:bold;">1</font>
        		</a>
        		<a href="#" class="number" style="color:black;padding:15px;display:inline"><i class="fa fa-chevron-right"></i></a>
        </div>
		</form>
	</section>
</div>
<br><br><br><br><br><br>



<!-- jQuery 3.1.1 -->
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
<!-- Bootstrap 3.3.7 -->
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<!-- Select2 -->
<script
	src="${pageContext.request.contextPath}/resources/js/select2.full.min.js"></script>
<!-- date-range-picker -->
<script
	src="${pageContext.request.contextPath}/resources/js/moment.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/daterangepicker.js"></script>
<!-- AdminLTE App -->
<script
	src="${pageContext.request.contextPath}/resources/dist/js/adminlte.min.js"></script>
<!-- bootstrap time picker -->
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap-timepicker.min.js"></script>
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
</body>
</html>

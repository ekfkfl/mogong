<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- jQuery 3.1.1 -->
 <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
 <!-- Bootstrap 3.3.7 -->
 <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath}/resources/dist/js/adminlte.min.js"></script>

<!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/dist/css/AdminLTE.css">

  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/dist/css/skins/skin-blue.css">
	
  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.0.min.js"></script>
	
	<script type="text/javascript">
		$(function () {
			$("#write").click( function () {
				location.href="${pageContext.request.contextPath}/member/study/writeForm";
			});
		})	
	
	</script>
	<style type="text/css">
		th,td{text-align:center;}
		th{background:#dfdfdf;}
		li{float:left;list-style:none;margin:0 auto;}
		.number:hover{background:#eeeeee;}
	</style>
</head>
<body>
<section class="content-header">
      <h1>
        자유 게시판
        <small>공지사항 및 게시글을 올릴 수 있습니다.</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Study</a></li>
        <li class="active">Board</li>
      </ol>
</section>
    
	<section class="content container-fluid">
		 <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">&nbsp;</h3>
	 
              <div class="box-tools pull-right">
                <div class="has-feedback">
                  <input type="text" class="form-control input-sm" placeholder="Search Mail">
                  <span class="glyphicon glyphicon-search form-control-feedback"></span>
                </div>
              </div>
              <!-- /.box-tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
              <div class="mailbox-controls">
                <button id="write" type="button" class="btn btn-default btn-sm checkbox-toggle">글쓰기</button>
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
                  <tr>
                    <td>1</td>
                    <td><a href="#">testdawdadwawdawdawdawdawd</a></td>
                    <td>최성훈</td>
                    <td>2017-06-16 16:12:10</td>
                    <td>10</td>
                    <td>2</td>
                  </tr>
                  <tr>
                    <td>1</td>
                    <td><a href="#">test</a></td>
                    <td>최성훈</td>
                    <td>2017-06-16 16:12:10</td>
                    <td>10</td>
                    <td>2</td>
                  </tr>
                  <tr>
                    <td>1</td>
                    <td><a href="#">test</a></td>
                    <td>최성훈</td>
                    <td>2017-06-16 16:12:10</td>
                    <td>10</td>
                    <td>2</td>
                  </tr>
                  </tbody>
                </table>
                <!-- /.table -->
              </div>
              
              <!-- /.mail-box-messages -->
            </div>
          <!-- /. box -->
        </div>
        <div>
        	
	        <ul>
	        	<li>
	        	<button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-left"></i></button> 
				</li>
				<li>
					<a href="#" class="number" style="padding:15px;display:inline"><span>1</span></a>
				</li>              
	            <li>
	            <button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-right"></i></button>
				</li>
			</ul>
			
		</div>
	</section>
</body>
</html>
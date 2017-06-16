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

	<style type="text/css">
		th,td{
			text-align:center;
		}
		th{
			background:#dfdfdf;
		}
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
                <!-- Check all button -->
                <button type="button" class="btn btn-default btn-sm checkbox-toggle"><i class="fa fa-square-o"></i>
                </button>
                <div class="btn-group">
                  <button type="button" class="btn btn-default btn-sm"><i class="fa fa-trash-o"></i></button>
                  <button type="button" class="btn btn-default btn-sm"><i class="fa fa-reply"></i></button>
                  <button type="button" class="btn btn-default btn-sm"><i class="fa fa-share"></i></button>
                </div>
                <!-- /.btn-group -->
                <button type="button" class="btn btn-default btn-sm"><i class="fa fa-refresh"></i></button>
                <div class="pull-right">
                  1-50/200
                  <div class="btn-group">
                    <button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-left"></i></button>
                    <button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-right"></i></button>
                  </div>
                  <!-- /.btn-group -->
                </div>
                <!-- /.pull-right -->
              </div>
              <div class="table-responsive mailbox-messages">
                <table class="table table-hover table-striped">
                  <tbody>
                  <tr>
                  	<th width="10%">번호</th>
                  	<th width="25%">제목</th>
                  	<th width="10%">작성자</th>
                  	<th width="15%">작성일</th>
                  	<th width="10%">조회</th>
                  	<th width="10%">첨부</th>
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
        <ul>
        	
              <button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-left"></i></button>
              <a href="#"><span>1</span></a>
              <button type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-right"></i></button>
		</ul>
	</section>
</body>
</html>
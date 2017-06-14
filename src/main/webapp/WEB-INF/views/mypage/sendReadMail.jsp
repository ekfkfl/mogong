<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>모여서 공부하자</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/dist/css/AdminLTE.css">
  <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
        page. However, you can choose any other skin. Make sure you
        apply the skin class to the body tag so the changes take effect. -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/dist/css/skins/skin-blue.css">
<!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
<script type="text/javascript">
	function backList() {
		document.requestForm.action ="mailMypage";
		document.requestForm.submit();
	}

</script>

</head>

<body class="hold-transition skin-blue sidebar-mini">
<form action="${pageContext.request.contextPath}/member/mypage/composeMailForm" method="post">
<input type="hidden" name="sendId" value="${sendDTO.recvId}">
 <section class="content">
      <div class="row">
		 	<div class="col-md-12">
		          <div class="box box-primary">
		            <div class="box-header with-border">
		              <h3 class="box-title">보낸 쪽지 읽기</h3>
		            </div>
		            <!-- /.box-header -->
		            <div class="box-body">
		              <div class="form-group">
		               <b>받는이</b><input class="form-control" value="${sendDTO.recvId}" readonly="readonly">
		              </div>
		              <div class="form-group">
		                <b>보낸 날짜</b><input class="form-control" value="${sendDTO.writeDate}" readonly="readonly">
		              </div>
		              <div class="form-group">
		                <b>제 목</b><input class="form-control" value="${sendDTO.title}" readonly="readonly">
		              </div>
		              <div class="form-group">
		                    <textarea id="compose-textarea" class="form-control" style="height: 300px" name="content" readonly="readonly">
		                     	${sendDTO.content}
		                    </textarea>
		              </div>
		            </div>
		            <!-- /.box-body -->
		            <div class="box-footer">
		              <div class="pull-right">
		                <button type="submit" class="btn btn-primary"><i class="fa fa-envelope-o"></i>다시보내기</button>
		                <a href="${pageContext.request.contextPath}/member/mypage/sendMail"><input type="button" class="btn btn-primary" value="목록으로"></a>
		              </div>
		            </div>
		            <!-- /.box-footer -->
		          </div>
		          <!-- /. box -->
		        </div>
		      </div>
		  </section>
	</form>
<!-- ./wrapper -->

<!-- REQUIRED JS SCRIPTS -->

<!-- jQuery 3.1.1 -->
 <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
 <!-- Bootstrap 3.3.7 -->
 <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath}/resources/dist/js/adminlte.min.js"></script>


</body>
</html>
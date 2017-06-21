<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">


<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<!-- daterange picker -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/daterangepicker.css">
<!-- Select2 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/select2.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/dist/css/AdminLTE.css">
<!-- AdminLTE Skins. We have chosen the skin-blue for this starter
        page. However, you can choose any other skin. Make sure you
        apply the skin class to the body tag so the changes take effect. -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/dist/css/skins/skin-blue.css">

<!-- Google Font -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
	
<link href="${pageContext.request.contextPath}/resources/css/fileinput.min.css" media="all" rel="stylesheet" type="text/css" />

<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.2.0.min.js"></script>

<script type="text/javascript">
	var sessionID="${sessionScope.userDTO.id}";
	var sessionPath="${sessionScope.userDTO.path}"
	var sessionName="${sessionScope.userDTO.name}"

	$(function() {
		$("#logo").hover(function() {
			$(this).css('background-color', 'white');
			$("#logoText").css('color', '#349fda');
		}, function() {
			$("#logoText").css('color', '#367fa9');
		})

		$("#toggle").hover(function() {
			$("#toggle").css('background-color', '#e1e1e1');
		}, function() {
			$("#toggle").css('background-color', 'white');
		})
	})
</script>
<style>
#todo, #doing, #done {
	border: 1px dashed #eee;
	min-height: 40px;
}

.tab-content {
	margin: 20px;
}
</style>
</head>
<body>
	<input type="hidden" name="studyCode" id="studyCode" value="6" />
	<input type="hidden" id="csrf" name="${_csrf.parameterName}"
		value="${_csrf.token}">
	<section class="content-header">
		<h1>
			Task 관리 <small>task를 등록,수정,삭제 할 수 있습니다</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Study</a></li>
			<li class="active">Task</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content container-fluid">
		<div class="col-sm-4">
			<!-- TO DO List -->
			<div class="box box-primary">
				<div class="box-header">
					<i class="ion ion-clipboard"></i>
					<h3 class="box-title">To Do</h3>
					<button id="todoInsert" type="button"
						class="btn btn-default pull-right">
						<i class="fa fa-plus"></i> Task 등록
					</button>
				</div>
				<!-- 등록 -->
				<div id="todoInsertBox" class="box box-info" style="display: none">
					<div class="box-body">
						<div class="form-group">
							<div class="col-sm-10">
								<input type="text" class="form-control" id="todoTitle"
									placeholder="새로운 Task 등록하기">
							</div>
						</div>
					</div>
					<div class="box-footer">
						<button id="todoInsertBoxCancle" class="btn btn-default">닫기</button>
						<button id="todoInsertBoxSubmit" class="btn btn-info pull-right">등록</button>
					</div>
				</div>

				<!-- /.box-header -->
				<div class="box-body">
					<ul id="todo" class="todo-list">
						<c:if test="${todoList != null}">
							<c:forEach items="${todoList}" var="todoTask" varStatus="status">
								<li id='task'><span data-toggle="modal"
									data-target="#modal-default" class='text'
									id='${todoTask.taskCode}'>${todoTask.title}</span> <i
									id='deleteTask' class="fa fa-fw fa-trash-o pull-right"></i></li>
							</c:forEach>
						</c:if>
					</ul>
				</div>
				<!-- /.box-body -->
				<div class="box-footer clearfix no-border">
					<span id="todoNum"></span>
				</div>
			</div>
			<!-- /.box -->
		</div>
		<!-- TO DO List -->
		<div class="col-sm-4">
			<div class="box box-primary">
				<div class="box-header">
					<i class="ion ion-clipboard"></i>
					<h3 class="box-title">Doing</h3>
					<button id="doingInsert" type="button"
						class="btn btn-default pull-right">
						<i class="fa fa-plus"></i> Task 등록
					</button>
				</div>
				<!-- 등록 -->
				<div id="doingInsertBox" class="box box-info" style="display: none">
					<div class="box-body">
						<div class="form-group">
							<div class="col-sm-10">
								<input type="text" class="form-control" id="doingTitle"
									placeholder="새로운 Task 등록하기">
							</div>
						</div>
					</div>
					<div class="box-footer">
						<button id="doingInsertBoxCancle" class="btn btn-default">닫기</button>
						<button id="doingInsertBoxSubmit" class="btn btn-info pull-right">등록</button>
					</div>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<!-- See dist/js/pages/dashboard.js to activate the todoList plugin -->
					<ul id="doing" class="todo-list">
						<c:if test="${doingList != null}">
							<c:forEach items="${doingList}" var="doingTask">
								<li id='task'><span data-toggle="modal"
									data-target="#modal-default" class='text'
									id='${doingTask.taskCode}'>${doingTask.title}</span> <i
									id='deleteTask' class="fa fa-fw fa-trash-o pull-right"></i></li>
							</c:forEach>
						</c:if>
					</ul>
				</div>
				<!-- /.box-body -->
				<div class="box-footer clearfix no-border">
					<span id="doingNum"></span>
				</div>
			</div>
			<!-- /.box -->
		</div>
		<!-- TO DO List -->
		<div class="col-sm-4">
			<div class="box box-primary">
				<div class="box-header">
					<i class="ion ion-clipboard"></i>
					<h3 class="box-title">Done</h3>
					<button id="doneInsert" type="button"
						class="btn btn-default pull-right">
						<i class="fa fa-plus"></i> Task 등록
					</button>
				</div>
				<!-- 등록 -->
				<div id="doneInsertBox" class="box box-info" style="display: none">
					<div class="box-body">
						<div class="form-group">
							<div class="col-sm-10">
								<input type="text" class="form-control" id="doneTitle"
									placeholder="새로운 Task 등록하기">
							</div>
						</div>
					</div>
					<div class="box-footer">
						<button id="doneInsertBoxCancle" class="btn btn-default">닫기</button>
						<button id="doneInsertBoxSubmit" class="btn btn-info pull-right">등록</button>
					</div>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<!-- See dist/js/pages/dashboard.js to activate the todoList plugin -->
					<ul id="done" class="todo-list">
						<c:if test="${doneList != null}">
							<c:forEach items="${doneList}" var="doneTask">
								<li id='task'><span data-toggle="modal"
									data-target="#modal-default" class='text'
									id='${doneTask.taskCode}'>${doneTask.title}</span> <i
									id='deleteTask' class="fa fa-fw fa-trash-o pull-right"></i></li>
							</c:forEach>
						</c:if>
					</ul>
				</div>
				<!-- /.box-body -->
				<div class="box-footer clearfix no-border">
					<span id="doneNum"></span>
				</div>
			</div>
			<!-- /.box -->
		</div>
	</section>
	<!-- /.content -->
	<!-- /.content-wrapper -->
	<div class="modal fade" id="modal-default">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<div id="tabs" class="nav-tabs-custom">
						<ul class="nav nav-tabs">
							<li><a href="#tab1" data-toggle="tab">속성</a></li>
							<li><a href="#tab2" data-toggle="tab">코멘트</a></li>
							<li><a href="#tab3" data-toggle="tab">파일 업로드</a></li>
						</ul>
						<div class="form-group tab-content">
							<div class="tab-pane active" id="tab1">
								<label>제목</label> <input type="text" id="title" name="title"
									class="form-control">
								<hr>
								<label>설명</label> <input type="text" id="content" name="content"
									class="form-control">
								<hr>
								<!-- Date and time range -->
								<label>시작일 / 마감일</label>
								<div class="input-group">
									<div class="input-group-addon">
										<i class="fa fa-clock-o"></i>
									</div>
									<input type="text" class="form-control pull-right"
										id=dateChooser>
								</div>
								<!-- /.input group -->
								<hr>
								<label>배정된 멤버</label> <select id="member"
									class="form-control select2" multiple="multiple"
									data-placeholder="멤버 할당하기" style="width: 100%;">
									<option></option>
								</select>
								<p>
							</div>
							<div class="tab-pane" id="tab2">
								<div class="box-body">
									<div class="direct-chat-messages" id=chatMessage style="overflow: auto">
									</div>
								</div>
								<div class="box-footer">
										<div class="input-group">
											<input type="text" id="message" name="message"
												placeholder="메시지를 입력하세요..." class="form-control"> <span
												class="input-group-btn">
												<button id="sendComment" type="button" class="btn btn-primary btn-flat">보내기</button>
											</span>
										</div>
								</div>
								<!-- /.box-footer-->
							</div>
							<div class="tab-pane" id="tab3">
        						<input id="fileUpload" name="file" type="file" multiple=false class="file-loading">
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default pull-left"
						data-dismiss="modal">닫기</button>
					<button id="taskUpdate" type="button" class="btn btn-primary">저장</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<!-- REQUIRED JS SCRIPTS -->

	<!-- jQuery 3.1.1 -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<!-- jQuery UI 1.11.4 -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
	<!-- the main fileinput plugin file -->
	<script src="${pageContext.request.contextPath}/resources/js/fileinput.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/fileinput-kr.js"></script>
	<!-- taskmain.js -->
	<script
		src="${pageContext.request.contextPath}/resources/js/taskmain.js"></script>
</body>
</html>
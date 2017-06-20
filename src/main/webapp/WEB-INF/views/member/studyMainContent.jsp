<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
</head>
<body>
<!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        ���͵� ����
        <small>Task ��ü�� �����ݴϴ�.</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Study</a></li>
        <li class="active">Main</li>
      </ol>
    </section>
    
	<section class="content container-fluid">
 <!-- TO DO List -->
<c:if test="${today == '1'}">
           <div class="box box-primary">
            <div class="box-header">
              <h3 class="box-title">���ñ���</h3>
              <hr>
            </div>
            
            <div class="box-body">
	            <ul class="todo-list">
	            <c:forEach var="dto" items="${list}">
	 				<c:if test="${dto.state == '1'}">
	 					<li>
	                        <i class="fa fa-ellipsis-v"></i>
	                        <i class="fa fa-ellipsis-v"></i>
	                  <span class="text">
	                  	<c:if test="${dto.progressStatus == '0142' }">To Do</c:if>
	                  	<c:if test="${dto.progressStatus == '0143' }">Doing</c:if>
	                   &nbsp; > &nbsp; ${dto.title}</span>
	                   <small class="label label-warning pull-right">${dto.remain }</small>
	                </li>
	 				</c:if>
	 			</c:forEach>
	 			</ul>
            </div>
           
          </div>
</c:if>
<c:if test="${week == '1'}">
          
          <div class="box box-primary">
            <div class="box-header">

              <h3 class="box-title">�̹� �ֱ���</h3>
              <hr>
            </div>
            
            <div class="box-body">
              <ul class="todo-list">
                <c:forEach var="dto" items="${list}">
	 				<c:if test="${dto.state=='2'}">
	 					<li>
	                        <i class="fa fa-ellipsis-v"></i>
	                        <i class="fa fa-ellipsis-v"></i>
	                  <span class="text">
	                  	<c:if test="${dto.progressStatus == '0142' }">To Do</c:if>
	                  	<c:if test="${dto.progressStatus == '0143' }">Doing</c:if>
	                   &nbsp; > &nbsp; ${dto.title}</span>
	                  <small class="label label-success pull-right">${dto.remain }</small>
	                </li>
	 				</c:if>
	 			</c:forEach>
              </ul>
            </div>
           
          </div>
</c:if>
<c:if test="${month == '1'}">
          <div class="box box-primary">
            <div class="box-header">

              <h3 class="box-title">�̹� �ޱ���</h3>
              <hr>
            </div>
            
            <div class="box-body">
              <ul class="todo-list">
                <c:forEach var="dto" items="${list}">
	 				<c:if test="${dto.state=='3'}">
	 					<li>
	                        <i class="fa fa-ellipsis-v"></i>
	                        <i class="fa fa-ellipsis-v"></i>
	                  <span class="text">
	                  	<c:if test="${dto.progressStatus == '0142' }">To Do</c:if>
	                  	<c:if test="${dto.progressStatus == '0143' }">Doing</c:if>
	                   &nbsp; > &nbsp; ${dto.title}</span>
	                  <small class="label label-info pull-right">${dto.remain}</small>
	                </li>
	 				</c:if>
	 			</c:forEach>
              </ul>
            </div>
           
          </div>
</c:if>

<c:if test="${noEnd == '1'}">
          <div class="box box-primary">
            <div class="box-header">

              <h3 class="box-title">������ ����</h3>
              <hr>
            </div>
            
            <div class="box-body">
              <ul class="todo-list">
               	<c:forEach var="dto" items="${list}">
	 				<c:if test="${dto.state=='4'}">
	 					<li>
	                        <i class="fa fa-ellipsis-v"></i>
	                        <i class="fa fa-ellipsis-v"></i>
	                 <span class="text">
	                  	<c:if test="${dto.progressStatus == '0142' }">To Do</c:if>
	                  	<c:if test="${dto.progressStatus == '0143' }">Doing</c:if>
	                   &nbsp; > &nbsp; ${dto.title}</span>
	                   <small class="label label-default pull-right">������ ����</small>
	                </li>
	 				</c:if>
	 			</c:forEach>
              </ul>
            </div>
          </div>
</c:if>
<c:if test="${end == '1'}">          
          <div class="box box-primary">
            <div class="box-header">

              <h3 class="box-title">������ ����</h3>
              <hr>
            </div>
            
            <div class="box-body">
              <ul class="todo-list">
               	<c:forEach var="dto" items="${list}">
	 				<c:if test="${dto.state=='5'}">
	 					<li>
	                        <i class="fa fa-ellipsis-v"></i>
	                        <i class="fa fa-ellipsis-v"></i>
	                  <span class="text">
	                  	<c:if test="${dto.progressStatus == '0142' }">To Do</c:if>
	                  	<c:if test="${dto.progressStatus == '0143' }">Doing</c:if>
	                   &nbsp; > &nbsp; ${dto.title}</span>
	                   <small class="label label-danger pull-right">${dto.remain}</small>
	                </li>
	 				</c:if>
	 			</c:forEach>
              </ul>
            </div>
          </div>
</c:if>
<c:if test="${after == '1'}">
          <div class="box box-primary">
            <div class="box-header">

              <h3 class="box-title">�̹� �� ����</h3>
              <hr>
            </div>
            
            <div class="box-body">
              <ul class="todo-list">
                <c:forEach var="dto" items="${list}">
	 				<c:if test="${dto.state=='6'}">
	 					<li>
	                        <i class="fa fa-ellipsis-v"></i>
	                        <i class="fa fa-ellipsis-v"></i>
	                  <span class="text">
	                  	<c:if test="${dto.progressStatus == '0142' }">To Do</c:if>
	                  	<c:if test="${dto.progressStatus == '0143' }">Doing</c:if>
	                   &nbsp; > &nbsp; ${dto.title}</span>
	                </li>
	 				</c:if>
	 			</c:forEach>
              </ul>
            </div>
           
          </div>
</c:if>
        
</section>
          
</body>
</html>
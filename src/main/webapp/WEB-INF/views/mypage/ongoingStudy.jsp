<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/dist/css/AdminLTE.css">

<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#detailBtn").click(function(){
			
			top.location.href="${pageContext.request.contextPath}/"
		})	
	})
</script>

</head>
<body>

<!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        ���͵� ������
        <small>Optional description</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
        <li class="active">Here</li>
      </ol>
    </section>
    
    <!-- Main content -->
    <section class="content container-fluid">
	
		<c:choose>
		    <c:when test="${empty requestScope.list}">
			<tr>
		        <td colspan="5">
		            <p align="center"><b><span style="font-size:20pt;">�������� ���͵� �����ϴ�.</span></b></p>
		        </td>
		    </tr>
		    </c:when>
		    <c:otherwise>
				<c:forEach items="${list}" var="studyDTO">
			    	  <!--------------------------
				        | Your Page Content Here |
				        -------------------------->
			       <div class="row">
			        <div class="col-md-3">
			          <div class="box box-default collapsed-box">
			            <div class="box-header with-border">
			              <h3 class="box-title">${studyDTO.name}</h3>
			              
			              <div class="box-tools pull-right">
			                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i>
			                </button>
			              </div>
			              <!-- /.box-tools -->
			            </div>
			            <!-- /.box-header -->
			            <div class="box-body"><b>
			              ������   : ${studyDTO.startDate}<p>
			              ������   : ${studyDTO.endDate}<p>
			              �׷���   : ${studyDTO.id}<p>
			              ����     : ${studyDTO.area}<p>
			              ���೯   : ${studyDTO.day}<p>
			              �ο�     : ${studyDTO.people}<p>
			              ���۽ð� : ${studyDTO.startTime}<p>
			              ����ð� : ${studyDTO.endTime}<p></b>
			              <input type="button" value="���͵������ϱ�" id="detailBtn">
			            </div>
			            <!-- /.box-body -->
			          </div>
			          <!-- /.box -->
			        </div>
			        <!-- /.col -->
			    </c:forEach>
			</c:otherwise>
		</c:choose>
    </section>
    
    <!-- jQuery 3.1.1 -->
 <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
 <!-- Bootstrap 3.3.7 -->
 <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath}/resources/dist/js/adminlte.min.js"></script>

</body>
</html>
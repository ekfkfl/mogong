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

   <!-- jQuery 3.1.1 -->
 <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
 <!-- Bootstrap 3.3.7 -->
  <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> 
<!-- AdminLTE App -->
 <script src="${pageContext.request.contextPath}/resources/dist/js/adminlte.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(document).on("click","#detailBtn", function () {
			top.location.href="${pageContext.request.contextPath}/search/detail?studyCode="+$(this).val();
		})
		
	})
</script>
<style type="text/css">
	th{
		width:40%;
	}
	td{
		width:60%;
	}

</style>

</head>
<body>

<!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        ���͵� ������
        <small>Optional description</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> ���͵����</a></li>
        <li class="active">������</li>
      </ol>
    </section>
    <br><br>
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
			        <div class="col-md-3">
			          <div class="box box-default">
			            <div class="box-header with-border" style="background-color:#f0f8ff">
			              <h5 class="box-title">${studyDTO.name}</h5>
			            </div>
			            <!-- /.box-header -->
			            <div class="box-body">
			            <table width="100%">
			            	<tr>
			            		<th>��¥</th>
			            		<td>${studyDTO.day}</td>
			            	</tr>
			            	<tr>
			            		<th>���</th>
			            		<td>${studyDTO.addr2}</td>
			            	</tr>
			            	<tr>
			            		<th>�����ο�</th>
			            		<td>${studyDTO.people}</td>
			            	</tr>
			            	<tr>
			            		<th>����</th>
			            		<td>${studyDTO.description}</td>
			            	</tr>
			            </table>
			            <br>
			             <%--  ��¥ : ${studyDTO.day}<p>
			              ��� : ${studyDTO.area}<p>
			              �����ο� : ${studyDTO.people}<p>
			              ���� : ${studyDTO.description}<p> --%>
			              <button type="button"  class='btn btn-primary btn-xs' id="detailBtn" value="${studyDTO.studyCode}">�󼼺���</button>&nbsp;&nbsp;&nbsp;&nbsp;
			              <button type="button"  class='btn btn-primary btn-xs' id="checkBtn" value="${studyDTO.studyCode}" data-toggle="modal" data-target="#myModal">��û Ȯ��</button>
			            	<div id="myModal" class="modal fade" role="dialog">
							  <div class="modal-dialog">
							
							    <!-- Modal content-->
							    <div class="modal-content">
							      <div class="modal-header">
							        <button type="button" class="close" data-dismiss="modal">&times;</button>
							        <h4 class="modal-title">��û Ȯ	��</h4>
							      </div>
							      <div class="modal-body">
								            <div id="modalBody" class="box box-warning col-xs-12">
								               <div class="box-header with-border">
								                  <h3 class="box-title">
								                  <label>��û�� ����</label></h3>
								               </div>
								              <!-- /.box-tools -->
								            </div>
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							      </div>
							    </div>
							
							  </div>
							</div>
			            </div>
			            <!-- /.box-body -->
			          </div>
			          <!-- /.box -->
			        </div>
			    </c:forEach>
			</c:otherwise>
		</c:choose>
    </section>
    
 

<script type="text/javascript">
$(function () {
	var studyCode="";
	
	$(document).on("click","#checkBtn",function () {
		studyCode = $(this).val();
		$.ajax({
			url: "${pageContext.request.contextPath}/member/mypage/confirm",
			data: "studyCode="+$(this).val()+"&${_csrf.parameterName}=${_csrf.token}",
			type: "post",
			dataType: "json",
			success: function (result) {
				var str = "";
				var gender ="";
				$.each(result, function (index, item) {
					if(item.gender == "0009"){gender="��"}
					else {gender="��"}
					str += "<div class='user-block'>";
					str += "<img class='img-circle' src='${pageContext.request.contextPath}"+item.path+"' alt='User Image'>";
					str += "<span class='username'><a href='#'>"+item.name+"</a></span>";
					str += "<span class='description'>";
					str += "ID : "+item.memberId+"&nbsp;/&nbsp;Email : "+item.email+"&nbsp;/&nbsp;Phone : "+item.phone+"<br>"
					str += "Gender : "+gender+"&nbsp;/&nbsp;Intro : "+item.intro
					str += "<button type='button' id='refuse' value='"+item.memberCode+"' class='btn btn-danger pull-right'>����</button>"
					str += "<button type='button' id='allow' value='"+item.memberCode+"' class='btn btn-info pull-right'>����</button>"
					str += "</span></div>"
				})
				$("#modalBody").find("div:gt(0)").empty();
				$("#modalBody").append(str);
				
			},
			error: function (err) {
				alert("ajax ����");
			}
		}) //ajax ��
	})
	
	$(document).on("click","#refuse",function () {
		 $.ajax({
			url: "${pageContext.request.contextPath}/member/mypage/refuse",
			data: "memberCode="+$(this).val()+"&studyCode="+studyCode+"&${_csrf.parameterName}=${_csrf.token}",
			type: "post",
			dataType: "text",
			success: function (result) {
				
					alert("����")
					printAll();
			},
			error: function (err) {
				
			}
		})
	}) //refuse click ��
	$(document).on("click","#allow", function () {
		 $.ajax({
				url: "${pageContext.request.contextPath}/member/mypage/allow",
				data: "memberCode="+$(this).val()+"&studyCode="+studyCode+"&${_csrf.parameterName}=${_csrf.token}",
				type: "post",
				dataType: "text",
				success: function (result) {
					
						alert("����")
						printAll();
				},
				error: function (err) {
					
				}
			})
	})
	
	function printAll() {
		$.ajax({
			url: "${pageContext.request.contextPath}/member/mypage/confirm",
			data: "studyCode="+studyCode+"&${_csrf.parameterName}=${_csrf.token}",
			type: "post",
			dataType: "json",
			success: function (result) {
				var str = "";
				var gender ="";
				$.each(result, function (index, item) {
					if(item.gender == "0009"){gender="��"}
					else {gender="��"}
					str += "<div class='user-block'>";
					str += "<img class='img-circle' src='${pageContext.request.contextPath}"+item.path+"' alt='User Image'>";
					str += "<span class='username'><a href='#'>"+item.name+"</a></span>";
					str += "<span class='description'>";
					str += "ID : "+item.memberId+"&nbsp;/&nbsp;Email : "+item.email+"&nbsp;/&nbsp;Phone : "+item.phone+"<br>"
					str += "Gender : "+gender+"&nbsp;/&nbsp;Intro : "+item.intro
					str += "<button type='button' id='refuse' value='"+item.memberCode+"' class='btn btn-danger pull-right'>����</button>"
					str += "<button type='button' id='allow' value='"+item.memberCode+"' class='btn btn-info pull-right'>����</button>"
					str += "</span></div>"
				})
				$("#modalBody").find("div:gt(0)").empty();
				$("#modalBody").append(str);
	
			},
			error: function (err) {
				alert("ajax ����");
			}
		}) //ajax ��
	}
})


</script>

</body>
</html>
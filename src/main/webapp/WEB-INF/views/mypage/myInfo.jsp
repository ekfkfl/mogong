<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="kosta.web.mogong.util.CodeUtil" %>
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
		$(document).on("click","#detailBtn", function () {
			top.location.href="${pageContext.request.contextPath}/study/main?studyCode="+$(this).val();
		})
		
		
		$("#profileSelector").change(function(){
		var input=this;
		
		if (input.files && input.files[0]){
			var reader = new FileReader();
			reader.onload = function (e){
				$('#profileImage').attr('src', e.target.result);
			}
			
			reader.readAsDataURL(input.files[0]); 
		}
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
    <section class="content-header">
      <h1>
        ������������
        <small>Optional description</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> ������������</a></li>
      </ol>
      <br><br>
</section>
<form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/login/signup?${_csrf.parameterName}=${_csrf.token}" name="userInfoForm" id="userInfoForm" onSubmit='return checkValid()'  enctype="multipart/form-data">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" >
<!-- ����� ���� ����  - user-->
<div class="container">
		<div class="row">
		<div class="col-xs-12">
<div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">��������</h3>
            </div>
          
              <div class="box-body">
                <div class="form-group">
                  <div class="col-sm-12">
					���̵� : ${userDTO.id}                
                  </div>
                 
                  
                </div>

              </div>

</div>	
</div></div>
</div>	




<!-- ����� �⺻ ���� - userBasicInfo-->
<div class="container">
		<div class="row">
		<div class="col-xs-12">
<div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">��������</h3>
            </div>
              <div class="box-body">
                <div class="form-group">
                  <div class="col-sm-12">
                    �̸� : ${userDTO.name}
                  </div>
                </div>
                <div class="form-group">
					<div class="col-sm-12">
					���� : ${CodeUtil.getCodeName(userDTO.gender)}
                	</div>
                </div>
   
                <div class="form-group">
                <div class="col-sm-12">
					������� : ${userDTO.birth}
                </div>               
                </div>
              </div>

</div>	
</div>	</div>
</div>

<!-- ����� ���� �Ż����� - userPersonalInfo-->
<div class="container">
		<div class="row">
		<div class="col-xs-12">
<div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">����ó</h3>
            </div>
              <div class="box-body">
                <div class="form-group">
                	<div class="col-sm-12">
					�̸��� : ${userDTO.email}
					</div>
                </div>
                <div class="form-group">
					<div class="col-sm-12">
                    	��ȭ��ȣ : ${userDTO.phone}
                	</div>
                </div>
                <div class="form-group">
					<div class="col-sm-12">
					���� �� �ּ� : ${userDTO.addr}
					</div>
                </div>
              </div>
            
</div>	
</div>	</div>
</div>	


<!-- �ڱ�Ұ� -  userIntro-->
<div class="container">
		<div class="row">
		<div class="col-xs-12">
<div class="box box-warning col-xs-12">
            <div class="box-header with-border">
              <h3 class="box-title">�ڱ�Ұ�</h3>
            </div>
            <div class="box-body">
                <!-- textarea -->
                
                <div class="form-group">

					<img src="${pageContext.request.contextPath}${userDTO.path}" class="col-xs-3" class="form-control" id="profileImage"/>
					<div>${userDTO.intro}</div>
                </div>
            </div>
</div>
</div></div></div>

<div class="container">
		<div class="row">
		<div class="col-xs-12" style="text-align:center">
            <div class="box-body">
			<a href="">�����ϱ�</a>
            </div>
</div></div></div>

</form>    
    <!-- jQuery 3.1.1 -->
 <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
 <!-- Bootstrap 3.3.7 -->
 <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath}/resources/dist/js/adminlte.min.js"></script>

</body>
</html>
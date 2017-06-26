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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
$(function(){

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
	


	
	//��ȭ��ȣ ����ũ
	$("#phone").inputmask();
	/*$("#phone").keyup(function(){
		var phoneNumber=$(this).val();
		//var phoneNumber=val();
		
 		if(phoneNumber.charAt(1)=="2"){
			console.log($("#phone").data("inputmask"));
			$(this).data("inputmask", '"mask": "99-999-9999"');
			$(this).inputmask();
			$(this).val(phoneNumber);
		} 
	});
	*/
	
	//���̵� üũ 
	$("div #id").keypress(function(event){
		if(checkCharCode(event.keyCode)){
			return true;
		}else{
			alert("Ư�����ڴ� �Է��� �Ұ����մϴ�.")
			return false;	
		}
	});

	
	//�ּ� �ؽ�Ʈ �ڽ� Ŭ���� �ּ� �Է� ���̾� ����
	$("#addr1").click(function(){
		sample3_execDaumPostcode();
	});
	
}); //end jQuery ready
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
               <div class="form-group">
					<div class="col-sm-12">
                    <input type="password" class="form-control" id="password" name="password" placeholder="��й�ȣ�� �Է��ϼ���">
                	</div>
                </div>
                <div class="form-group">
					<div class="col-sm-12">
                    <input type="password" class="form-control" id="rePassword" name="rePassword" placeholder="��й�ȣ�� ���Է��ϼ���">
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
                    <input type="email" class="form-control" id="email" name="email" placeholder="�̸��� �ּҸ� �Է��ϼ���" value="${userDTO.email}">
                  </div>
                </div>
                <div class="form-group">
					<div class="col-sm-12">
                    <input type="text" class="form-control" id="phone" name="phone" placeholder="����ó ��ȣ�� �Է��ϼ���.  - ���� �Է��ϼ���" data-inputmask='"mask": "999-9999-9999"' data-mask value="${userDTO.phone}">
                	</div>
                </div>
                <div class="form-group">
					<div class="col-sm-12">

								<div id="wrap"
									style="display: none; border: 1px solid; width: 500px; height: 300px; margin: 5px 0; position: relative">
									<img
										src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png"
										id="btnFoldWrap"
										style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
										onclick="foldDaumPostcode()" alt="���� ��ư">
								</div>
<!-- 								<input type="text" id="sample3_address" class="d_form large"
									placeholder="�ּ�"> -->

								<script>
									// �����ȣ ã�� ã�� ȭ���� ���� element
									var element_wrap = document
											.getElementById('wrap');

									function foldDaumPostcode() {
										// iframe�� ���� element�� �Ⱥ��̰� �Ѵ�.
										element_wrap.style.display = 'none';
									}

									function sample3_execDaumPostcode() {
										// ���� scroll ��ġ�� �����س��´�.
										var currentScroll = Math
												.max(
														document.body.scrollTop,
														document.documentElement.scrollTop);
										new daum.Postcode(
												{
													oncomplete : function(data) {
														// �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

														// �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
														// �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
														var fullAddr = data.address; // ���� �ּ� ����
														var extraAddr = ''; // ������ �ּ� ����

														// �⺻ �ּҰ� ���θ� Ÿ���϶� �����Ѵ�.
														if (data.addressType === 'R') {
															//���������� ���� ��� �߰��Ѵ�.
															if (data.bname !== '') {
																extraAddr += data.bname;
															}
															// �ǹ����� ���� ��� �߰��Ѵ�.
															if (data.buildingName !== '') {
																extraAddr += (extraAddr !== '' ? ', '
																		+ data.buildingName
																		: data.buildingName);
															}
															// �������ּ��� ������ ���� ���ʿ� ��ȣ�� �߰��Ͽ� ���� �ּҸ� �����.
															fullAddr += (extraAddr !== '' ? ' ('
																	+ extraAddr
																	+ ')'
																	: '');
														}

														// �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
														
													/* 	document
																.getElementById('sample3_postcode').value = data.zonecode; //5�ڸ� �������ȣ ��� */
														document.getElementById('addr1').value = "(�����ȣ:" + data.zonecode + ") " + fullAddr;

														// iframe�� ���� element�� �Ⱥ��̰� �Ѵ�.
														// (autoClose:false ����� �̿��Ѵٸ�, �Ʒ� �ڵ带 �����ؾ� ȭ�鿡�� ������� �ʴ´�.)
														element_wrap.style.display = 'none';

														// �����ȣ ã�� ȭ���� ���̱� �������� scroll ��ġ�� �ǵ�����.
														document.body.scrollTop = currentScroll;
													},
													// �����ȣ ã�� ȭ�� ũ�Ⱑ �����Ǿ����� ������ �ڵ带 �ۼ��ϴ� �κ�. iframe�� ���� element�� ���̰��� �����Ѵ�.
													onresize : function(size) {
														element_wrap.style.height = size.height
																+ 'px';
													},
													width : '100%',
													height : '100%'
												}).embed(element_wrap);

										// iframe�� ���� element�� ���̰� �Ѵ�.
										element_wrap.style.display = 'block';
									}
								</script>
								<input type="hidden" name="addr" />
								<input type="text" class="form-control" id="addr1" name="addr1" placeholder="�ּҸ� �Է��ϼ���" value="${addr1}">
                	</div>
                </div>
                <div class="form-group">
					<div class="col-sm-12">
                    <input type="text" class="form-control" id="addr2" name="addr2" placeholder="�� �ּҸ� �Է��ϼ���" value="${addr2}">
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
					
					<textarea class="help-inline col-xs-9" id="intro" name="intro" rows="5" placeholder="���͵� ��û�� ���͵� �����忡�� �������ϴ�." >${userDTO.intro}</textarea>
                    <input type="file" id="profileSelector" name="file">

                </div>
            </div>
</div>
</div></div></div>

<div class="container">
		<div class="row">
		<div class="col-xs-12" style="text-align:center">
            <div class="box-body">
			<a href="${pageContext.request.contextPath}/member/mypage/myInfoReplace">�����Ϸ�</a>
            </div>
</div></div></div>

</form>    
    <!-- jQuery 3.1.1 -->
 <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
 <!-- Bootstrap 3.3.7 -->
 <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath}/resources/dist/js/adminlte.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/input-mask/jquery.inputmask.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/input-mask/jquery.inputmask.extensions.js"></script>

<script>
  $(function () {
    //Initialize Select2 Elements
    $(".select2").select2();

    //Datemask dd/mm/yyyy
   $("#datemask").inputmask("dd/mm/yyyy", {"placeholder": "YYYY/MM/DD"});
    //Datemask2 mm/dd/yyyy
   $("#datemask2").inputmask("mm/dd/yyyy", {"placeholder": "YYYY/MM/DD"});
    //Money Euro
    $("[data-mask]").inputmask();

    //Date range picker
   	//$('#reservation').daterangepicker({timePicker: true, timePickerIncrement: 30, format: 'YYYY/MM/DD h:mm A'});
</script>
</body>
</html>
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
	


	
	//전화번호 마스크
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
	
	//아이디 체크 
	$("div #id").keypress(function(event){
		if(checkCharCode(event.keyCode)){
			return true;
		}else{
			alert("특수문자는 입력이 불가능합니다.")
			return false;	
		}
	});

	
	//주소 텍스트 박스 클릭스 주소 입력 레이어 띄우기
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
        개인정보수정
        <small>Optional description</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> 개인정보수정</a></li>
      </ol>
      <br><br>
</section>
<form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/login/signup?${_csrf.parameterName}=${_csrf.token}" name="userInfoForm" id="userInfoForm" onSubmit='return checkValid()'  enctype="multipart/form-data">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" >
<!-- 사용자 계정 정보  - user-->
<div class="container">
		<div class="row">
		<div class="col-xs-12">
<div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">계정정보</h3>
            </div>
          
              <div class="box-body">
                <div class="form-group">
                  <div class="col-sm-12">
					아이디 : ${userDTO.id}                
                  </div>
                </div>
               <div class="form-group">
					<div class="col-sm-12">
                    <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호를 입력하세요">
                	</div>
                </div>
                <div class="form-group">
					<div class="col-sm-12">
                    <input type="password" class="form-control" id="rePassword" name="rePassword" placeholder="비밀번호를 재입력하세요">
                	</div>
                </div>
              </div>

</div>	
</div></div>
</div>	




<!-- 사용자 기본 정보 - userBasicInfo-->
<div class="container">
		<div class="row">
		<div class="col-xs-12">
<div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">개인정보</h3>
            </div>
              <div class="box-body">
                <div class="form-group">
                  <div class="col-sm-12">
                    이름 : ${userDTO.name}
                  </div>
                </div>
                <div class="form-group">
					<div class="col-sm-12">
					성별 : ${CodeUtil.getCodeName(userDTO.gender)}
                	</div>
                </div>
   
                <div class="form-group">
                <div class="col-sm-12">
					생년월일 : ${userDTO.birth}
                </div>               
                </div>
              </div>

</div>	
</div>	</div>
</div>

<!-- 사용자 개인 신상정보 - userPersonalInfo-->
<div class="container">
		<div class="row">
		<div class="col-xs-12">
<div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">연락처</h3>
            </div>
              <div class="box-body">
                <div class="form-group">
                  <div class="col-sm-12">
                    <input type="email" class="form-control" id="email" name="email" placeholder="이메일 주소를 입력하세요" value="${userDTO.email}">
                  </div>
                </div>
                <div class="form-group">
					<div class="col-sm-12">
                    <input type="text" class="form-control" id="phone" name="phone" placeholder="연락처 번호를 입력하세요.  - 없이 입력하세요" data-inputmask='"mask": "999-9999-9999"' data-mask value="${userDTO.phone}">
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
										onclick="foldDaumPostcode()" alt="접기 버튼">
								</div>
<!-- 								<input type="text" id="sample3_address" class="d_form large"
									placeholder="주소"> -->

								<script>
									// 우편번호 찾기 찾기 화면을 넣을 element
									var element_wrap = document
											.getElementById('wrap');

									function foldDaumPostcode() {
										// iframe을 넣은 element를 안보이게 한다.
										element_wrap.style.display = 'none';
									}

									function sample3_execDaumPostcode() {
										// 현재 scroll 위치를 저장해놓는다.
										var currentScroll = Math
												.max(
														document.body.scrollTop,
														document.documentElement.scrollTop);
										new daum.Postcode(
												{
													oncomplete : function(data) {
														// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

														// 각 주소의 노출 규칙에 따라 주소를 조합한다.
														// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
														var fullAddr = data.address; // 최종 주소 변수
														var extraAddr = ''; // 조합형 주소 변수

														// 기본 주소가 도로명 타입일때 조합한다.
														if (data.addressType === 'R') {
															//법정동명이 있을 경우 추가한다.
															if (data.bname !== '') {
																extraAddr += data.bname;
															}
															// 건물명이 있을 경우 추가한다.
															if (data.buildingName !== '') {
																extraAddr += (extraAddr !== '' ? ', '
																		+ data.buildingName
																		: data.buildingName);
															}
															// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
															fullAddr += (extraAddr !== '' ? ' ('
																	+ extraAddr
																	+ ')'
																	: '');
														}

														// 우편번호와 주소 정보를 해당 필드에 넣는다.
														
													/* 	document
																.getElementById('sample3_postcode').value = data.zonecode; //5자리 새우편번호 사용 */
														document.getElementById('addr1').value = "(우편번호:" + data.zonecode + ") " + fullAddr;

														// iframe을 넣은 element를 안보이게 한다.
														// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
														element_wrap.style.display = 'none';

														// 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
														document.body.scrollTop = currentScroll;
													},
													// 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
													onresize : function(size) {
														element_wrap.style.height = size.height
																+ 'px';
													},
													width : '100%',
													height : '100%'
												}).embed(element_wrap);

										// iframe을 넣은 element를 보이게 한다.
										element_wrap.style.display = 'block';
									}
								</script>
								<input type="hidden" name="addr" />
								<input type="text" class="form-control" id="addr1" name="addr1" placeholder="주소를 입력하세요" value="${addr1}">
                	</div>
                </div>
                <div class="form-group">
					<div class="col-sm-12">
                    <input type="text" class="form-control" id="addr2" name="addr2" placeholder="상세 주소를 입력하세요" value="${addr2}">
                	</div>
                </div>
              </div>
            
</div>	
</div>	</div>
</div>	

<!-- 자기소개 -  userIntro-->
<div class="container">
		<div class="row">
		<div class="col-xs-12">
<div class="box box-warning col-xs-12">
            <div class="box-header with-border">
              <h3 class="box-title">자기소개</h3>
            </div>
            <div class="box-body">
                <!-- textarea -->
                
                <div class="form-group">

					<img src="${pageContext.request.contextPath}${userDTO.path}" class="col-xs-3" class="form-control" id="profileImage"/>
					
					<textarea class="help-inline col-xs-9" id="intro" name="intro" rows="5" placeholder="스터디 신청시 스터디 모집장에게 보여집니다." >${userDTO.intro}</textarea>
                    <input type="file" id="profileSelector" name="file">

                </div>
            </div>
</div>
</div></div></div>

<div class="container">
		<div class="row">
		<div class="col-xs-12" style="text-align:center">
            <div class="box-body">
			<a href="${pageContext.request.contextPath}/member/mypage/myInfoReplace">수정완료</a>
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
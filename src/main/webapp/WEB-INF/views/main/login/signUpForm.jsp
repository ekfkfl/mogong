<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/main/header.jsp"/>
<style>
/* @media (min-width:768px){
	.row, .col-sm-6{
		width:600px;
	}
} */

/* .form-control{
	width:70%;
	float:left;
} */
</style>

<%-- <script src="${pageContext.request.contextPath}/resource/plugins/daum/postcode.v2.js"></script> --%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
$(function(){

	
	
	//생년월일 마스크
	$("#birth").inputmask();
	
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




function checkValid() {
	var f = window.document.userInfoForm;
	
	//주소 만들기 (미입력 , "", 지역주소+상세주소)
	alert(checkAddr());
	$(f.addr).val(checkAddr());
	
	
	var formData=[
			{"src":f.id, "name":"아이디"},
			{"src":f.password, "name":"비밀번호"},
			{"src":f.name, "name":"이름"},
			{"src":f.gender, "name":"성별"},
			{"src":f.birth, "name":"생년월일"},
			{"src":f.email, "name":"이메일"},
			{"src":f.phone, "name":"핸드폰"},
			{"src":f.addr, "name":"주소"},
			{"src":f.intro, "name":"자기소개"}
	];
	
	
	for(var i=0; i<formData.length; i++){
		if(formData[i].src.value==""){
			alert(formData[i].name+" 입력이 필요합니다.");
			formData[i].src.focus();
			return false;
		}
	}
	
	
	alert("입력값 확인 끝");
    return true;
}

//비밀번호가 같은지 체크
function equalPassword(){
	
}

//중복 아이디 체크
function usableId(){
	
}


//아이디로 체크
function checkId(id){
	$.ajax({
		url : "${pageContext.request.contextPath}/auth/usableId",
		type : "post",
		dataType : "text",
		data : "${_csrf.parameterName}=${_csrf.token}",
		success : function(result) {
			if(result=="1"){
				console.log("사용가능");
			}else{
				console.log("사용 불가능");
			}
		},
		error : function(err) {
			alert(err);
		}
	});
}

//아이디로 사용가능한지 체크
function checkCharCode(ch){
	console.log(ch);
	if((ch>=65 && ch<=90) || (ch>=97 && ch<=122) || (ch>=48 && ch<=57)){
		return true;
	}else{
		return false;
	}
}

//주소로 포커스 이동
function checkAddr(){
	var addr1=$("#addr1").val();
	var addr2=$("#addr2").val();
	
	if(addr1==""){
		return "미입력";
	}else{
		if(addr2==""){
			return "";
		}else{
			return addr1+addr2;
		}
	}
	
}

</script>


<form class="form-horizontal" method="post" action="" name="userInfoForm" id="userInfoForm" onSubmit='return checkValid()'>
<!-- 사용자 계정 정보  - user-->
<div class="container">
		<div class="row">
		<div class="col-xs-12 col-sm-9 col-md-6 col-sm-offset-2 col-md-offset-3">
<div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">계정정보</h3>
            </div>
          
              <div class="box-body">
                <div class="form-group has-success">
                  <div class="col-sm-12">
                  <!--   <label class="control-label" for="inputError"><i class="fa fa-check"></i> 정상</label>  -->
                    <input type="text" class="form-control" id="id" name="id"  placeholder="아이디를 입력하세요" ><!-- <span class="help-inline"><i class="fa fa-check"></i> 정상</span> -->
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
		<div class="col-xs-12 col-sm-9 col-md-6 col-sm-offset-2 col-md-offset-3">
<div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">개인정보</h3>
            </div>
              <div class="box-body">
                <div class="form-group">
                  <div class="col-sm-12">
                    <input type="text" class="form-control" id="name" name="name" placeholder="이름">
                  </div>
                </div>
                <div class="form-group">
					<div class="col-sm-12">
<!-- 					<div class="col-sm-2" style="text-align:center;padding-top:5px;height:32px;background-color:white;border-width:1px 1px 1px 1px;border:1px solid #d0d0d0;">성별</div>
					<div class="col-sm-5" style="text-align:center;padding-top:5px;height:32px;border:1px solid #d0d0d0;border-width:1px 1px 1px 0px;">남 자</div>
					<div class="col-sm-5" style="text-align:center;padding-top:5px;height:32px;border:1px solid #d0d0d0;border-width:1px 1px 1px 0px;">여 자</div>
  -->                   <!-- <input type="password" class="form-control" id="gender" name="gender" placeholder="성별"> -->
  					<!-- radio -->
                <div class="form-group">
                  <div class="radio" style="border:1px solid #d0d0d0; margin:0px 15px 0px 15px; height:35px;">
                 
                   <label class="col-sm-2">성별 </label>
                    <label class="col-sm-5">
                      <input type="radio" name="gender" id="gender" value="0001">남자
                    </label>
                     <label class="col-sm-5">
                      <input type="radio" name="gender" id="gender" value="0002">여자
                    </label>

                  </div>
                </div>
                	</div>
                </div>
   
                <div class="form-group">
					<div class="col-sm-12" style="margin-top:-14px;">
					<input type="text" class="form-control" id="birth" name="birth" placeholder="생년월일  예) 1991년  2월 3일 출생  - 1991 02 03 입력" data-inputmask='"mask": "9999-99-99"' data-mask>
                	</div>
                </div>               
                </div>
              </div>

</div>	
</div>	</div>

<!-- 사용자 개인 신상정보 - userPersonalInfo-->
<div class="container">
		<div class="row">
		<div class="col-xs-12 col-sm-9 col-md-6 col-sm-offset-2 col-md-offset-3">
<div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">연락처</h3>
            </div>
              <div class="box-body">
                <div class="form-group">
                  <div class="col-sm-12">
                    <input type="email" class="form-control" id="email" name="email" placeholder="이메일 주소를 입력하세요">
                  </div>
                </div>
                <div class="form-group">
					<div class="col-sm-12">
                    <input type="text" class="form-control" id="phone" name="phone" placeholder="연락처 번호를 입력하세요.  - 없이 입력하세요" data-inputmask='"mask": "999-9999-9999"' data-mask>
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
								<input type="text" class="form-control" id="addr1" name="addr1" placeholder="주소를 입력하세요">
                	</div>
                </div>
                <div class="form-group">
					<div class="col-sm-12">
                    <input type="text" class="form-control" id="addr2" name="addr2" placeholder="상세 주소를 입력하세요">
                	</div>
                </div>
              </div>
            
</div>	
</div>	</div>
</div>	


<!-- 자기소개 -  userIntro-->
<div class="container">
		<div class="row">
		<div class="col-xs-12 col-sm-9 col-md-6 col-sm-offset-2 col-md-offset-3">
<div class="box box-warning col-xs-12">
            <div class="box-header with-border">
              <h3 class="box-title">자기소개</h3>
            </div>
            <div class="box-body">
                <!-- textarea -->
                <div class="form-group">
                  <textarea class="form-control" id="intro" name="intro" rows="5" placeholder="스터디 신청시 스터디 모집장에게 보여집니다."></textarea>
                </div>
            </div>
</div>
</div></div></div>

<div class="container">
		<div class="row">
		<div class="col-xs-12 col-sm-9 col-md-6 col-sm-offset-2 col-md-offset-3" style="text-align:center">
            <div class="box-body">
			<input type="reset" value="재입력" class="btn">&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="submit" value="가입하기" class="btn">
            </div>
</div></div></div>

</form>

<!-- InputMask -->

<jsp:include page="/WEB-INF/views/main/footer.jsp"/>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<!-- daterange picker -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/daterangepicker.css">
<!-- Bootstrap time Picker -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap-timepicker.min.css">
<!-- Select2 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/select2.min.css">

<!-- jQuery 3.1.1 -->
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.2.0.min.js"></script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<jsp:include page="/WEB-INF/views/main/header.jsp" />

<form class="form-horizontal" method="post"
	action="${pageContext.request.contextPath}/enroll" name="insert">

	<input type="hidden" id="csrf" name="${_csrf.parameterName}"
		value="${_csrf.token}">
	<div class="container">
		<div class="row">
			<div
				class="col-xs-12 col-sm-9 col-md-6 col-sm-offset-2 col-md-offset-3">
				<div class="box box-info">
					<div class="box-header with-border">
						<h3 class="box-title">스터디 등록하기</h3>
					</div>
					<div class="box-body">
						<div class="form-group">
							<div class="col-sm-12">
								<input type="text" class="form-control" id="name" name="name"
									placeholder="스터디 제목을 입력하세요"> 
								<br>
								<label>시작일 / 마감일</label>
								<div class="input-group">
									<div class="input-group-addon">
										<i class="fa fa-clock-o"></i>
									</div>
									<input type="text" name="datePicker"
										class="form-control pull-right" id=dateChooser
										readonly="readonly">
								</div>
							</div>
						</div>
						<div class="form-group"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<div class="container">
		<div class="row">
			<div
				class="col-xs-12 col-sm-9 col-md-6 col-sm-offset-2 col-md-offset-3">
				<div class="box box-info">
					<div class="box-header with-border">
						<h3 class="box-title">스케줄 선택하기</h3>
					</div>
					<div class="box-body">
					<br> <label>스터디 요일</label>
					<div class="checkbox">
						<label> <input type="checkbox" name="day" value="일">일
						</label> <label> <input type="checkbox" name="day" value="월">월
						</label> <label> <input type="checkbox" name="day" value="화">화
						</label> <label> <input type="checkbox" name="day" value="수">수
						</label> <label> <input type="checkbox" name="day" value="목">목
						</label> <label> <input type="checkbox" name="day" value="금">금
						</label> <label> <input type="checkbox" name="day" value="토">토
						</label>
					</div>
					<br>
					<div class="form-group">
						<div class="bootstrap-timepicker" style="float: left; width: 50%">
							<label>스터디 시작 시간</label>
							<div class="input-group" style="width: 80%">
								<input type="text" name="startTime"
									class="form-control timepicker" readonly="readonly">
								<div class="input-group-addon">
									<i class="fa fa-clock-o"></i>
								</div>
							</div>
						</div>
						<div class="bootstrap-timepicker" style="float: left; width: 50%">
							<label>스터디 종료 시간</label>
							<div class="input-group" style="width: 80%">
								<input type="text" name="endTime"
									class="form-control timepicker" readonly="readonly">
								<div class="input-group-addon">
									<i class="fa fa-clock-o"></i>
								</div>
							</div>
							<!-- /.input group -->
						</div>
						<!-- /.form group -->
					</div>
					<!-- /.form group -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="container">
		<div class="row">
			<div
				class="col-xs-12 col-sm-9 col-md-6 col-sm-offset-2 col-md-offset-3">
				<div class="box box-info">
					<div class="box-header with-border">
						<h3 class="box-title">스터디 구성 선택하기</h3>
					</div>
					<div class="box-body">
					<label>인원 수</label><br> <input type="radio" name="people"
						value="3">3명&nbsp;&nbsp;&nbsp; <input type="radio"
						name="people" value="4">4명&nbsp;&nbsp;&nbsp; <input
						type="radio" name="people" value="5">5명&nbsp;&nbsp;&nbsp;
					<input type="radio" name="people" value="6">6명&nbsp;&nbsp;&nbsp;
					<input type="radio" name="people" value="7">7명&nbsp;&nbsp;&nbsp;
					<input type="radio" name="people" value="8">8명&nbsp;&nbsp;&nbsp;
					<br>
					<br> <label>카테고리</label><br> <select class="form-control"
						id="category2" name="category2" style="float: left; width: 50%;">
						<option value="1차">1차 분류</option>
						<option value="0158">취업</option>
						<option value="0169">금융</option>
						<option value="0167">어학</option>
						<option value="0172">취미</option>
						<option value="0173">고시</option>
						<option value="0170">프로그래밍</option>
						<option value="0171">자기계발</option>
					</select> <select class="form-control" id="category" name="category"
						style="float: left; width: 50%;">
						<option value="2차">1차 분류를 먼저 선택해주세요</option>
					</select><br>
					<br> <label>지역 선택</label><br> <select
						class="form-control" id="area" name="area"
						style="float: left; width: 50%;">
						<option value="지역">지역</option>
						<option value="0070">서울/경기</option>
						<option value="0063">강원</option>
						<option value="0078">경남</option>
						<option value="0086">경북</option>
						<option value="0108">전북</option>
						<option value="0102">전남</option>
						<option value="0124">충북</option>
						<option value="0117">충남</option>
						<option value="0114">제주</option>
					</select> <select class="form-control" id="detailArea" name="detailArea"
						style="float: left; width: 50%;">
						<option value="지역">지역을 먼저 선택해주세요</option>
					</select><br>
					<br>

					<div id="wrap"
						style="display: none; border: 1px solid; width: 500px; height: 300px; margin: 5px 0; position: relative">
						<img
							src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png"
							id="btnFoldWrap"
							style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
							onclick="foldDaumPostcode()" alt="접기 버튼">
					</div>
					<!-- <input type="text" id="sample3_address" class="d_form large"
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
					<input type="hidden" name="addr" /> <input type="text"
						class="form-control" id="addr1" name="addr1"
						placeholder="주소를 입력하세요"> <input type="text"
						class="form-control" id="addr2" name="addr2"
						placeholder="상세 주소를 입력해주세요.">
				</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<div class="container">
		<div class="row">
			<div
				class="col-xs-12 col-sm-9 col-md-6 col-sm-offset-2 col-md-offset-3">
				<div class="box box-warning col-xs-12">
					<div class="box-header with-border">
						<h3 class="box-title">스터디 상세정보 입력</h3>
					</div>
					<div class="box-body">
						<!-- textarea -->
						<div class="form-group">
							<textarea class="form-control" id="description"
								name="description" rows="5" placeholder="스터디에 대한 상세정보를 알려주세요"></textarea>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div
				class="col-xs-12 col-sm-9 col-md-6 col-sm-offset-2 col-md-offset-3"
				style="text-align: center">
				<div class="box-body">
					<input type="reset" value="재입력" class="btn">&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="submit" value="모집 등록" class="btn">
				</div>
			</div>
		</div>
	</div>
</form>

<!-- jQuery 3.1.1 -->
<script
	src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
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
<!-- bootstrap time picker -->
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap-timepicker.min.js"></script>

<script>

$(function () {
	//주소 텍스트 박스 클릭스 주소 입력 레이어 띄우기
	$("#addr1").click(function(){
		sample3_execDaumPostcode();
	});
	
	$("#area").change(function () {
		$.ajax({
			url: "${pageContext.request.contextPath}/study/location",
			data: "areaCode="+$("#area option:selected").val()+"&${_csrf.parameterName}=${_csrf.token}",
			type: "post",
			dataType: "json",
			success: function (result) {
				$("#detailArea").empty();
				var str = "";
				$.each(result, function (index,item) {
					//alert(item.codeName);
					str += "<option value='"+item.commCode+"'>"+item.codeName+"</option>";
				})
				$("#detailArea").append(str);
			},
			error : function (request,status,error) {
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});//ajax 끝 
	})
	
	$("#category2").change(function () {
		$.ajax({
			url: "${pageContext.request.contextPath}/study/category",
			data: "category="+$("#category2 option:selected").val()+"&${_csrf.parameterName}=${_csrf.token}",
			type: "post",
			dataType: "json",
			success: function (result) {
				$("#category").empty();
				var str = "";
				
				$.each(result.categoryCodeList, function (index,item) {
					str += "<option value='"+item+"'></option>";
				})
				
				$("#category").append(str);
				
				$.each($("#category option"), function (index,item) {
					$(this).text(result.categoryNameList[index]);
				})
			},
			error : function (request,status,error) {
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});//ajax 끝 
	})
})

moment.locale('ko');

$('#dateChooser').daterangepicker({
    "timePicker": true,
    "locale": {
        "format": "LL LT",
        "separator": " ~ ",
        "applyLabel": "확인",
        "cancelLabel": "취소",
        "daysOfWeek": [
            "일",
            "월",
            "화",
            "수",
            "목",
            "금",
            "토"
        ],
        "monthNames": [
            "1월",
            "2월",
            "3월",
            "4월",
            "5월",
            "6월",
            "7월",
            "8월",
            "9월",
            "10월",
            "11월",
            "12월"
        ],
        "firstDay": 1
    },
    "startDate": moment(),
    "endDate": moment()
}, function(start, end, label) {
});

//Timepicker
$(".timepicker").timepicker({
  showInputs: false
});

</script>



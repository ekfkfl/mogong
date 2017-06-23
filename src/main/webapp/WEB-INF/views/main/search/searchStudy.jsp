<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="/WEB-INF/views/main/header.jsp" />

<!-- daterange picker -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/daterangepicker/daterangepicker.css">
<!-- bootstrap datepicker -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/datepicker/datepicker3.css">
<!-- Ionicons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/datepicker/datepicker3.css">


<!-- Theme style -->
<link rel="stylesheet"    
	href="${pageContext.request.contextPath}/resources/dist/css/AdminLTE.min.css">


<!-- Select2 -->
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/select2/select2.min.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<!-- bootstrap slider -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/bootstrap-slider/slider.css">


<style>
#searchContent{
	width:80%;
	height:auto;
	margin:auto;
}

#pagination{
	width:100%;
	margin:auto;
	text-align:center;
}

/*스터디 정보 테이블 */
.studyInfoTable{
	width:100%;
}
	
/*스터디 정보 셀 공통 적용*/
.studyInfoTable tr{
	border:1px #00acd6 solid;
	border-width:0px 0px 0px 0px;
	height:35px;
	
}


/*스터디 정보 - 카테고리와 사진*/
.studyCategory{
	border:1px #00acd6 solid;
	border-width:0px 1px 0px 0px;
	width:72px;
}
	
/*스터디 정보 - 타이틀*/
.studyName, .studyDate, .studyId,  .studyAreaTime, .studyPeriod, .studyRead{
	border:1px #00acd6 solid;
	border-width:0px 1px 0px 0px;
	text-align:center;
	margin:5px;
}


#optionState {
	padding:0px;
}

#optionStateTitle{
	float:left;
}

.option {
	float:left;
}

.optionValue{
	border-style:none;
	background-color:#00c0ef;
	margin:2px;
	padding:2px;
	border-radius:4px;
	font-weight:bold;
	color:white;
	float:left;
}

#categoryOption ul li{
	float:left;
}

.optionGroupList{
	background-color:white;
}

.optionGroup{
	background-color:#eeeeee;
	padding:2px;
	margin:5px;
	clear:both;
}


.optionGroupTitle, .optionGroupDepth select, .optionGroupDepth option{
	float:left;
	
	padding:2px;
	margin-right:10px;
}

.optionGroupTitle{

}
.optionGroupDepth{
	margin:5px;
}

.optionGroupBody > input{
	margin-left:25px;
	margin-top:10px;
	margin-bottom:10px;
}


.optionName{
		float:left;
		font-weight:bold;
		margin:5px;
	}

#categoryOption, #areaOption, #timeOption, #periodOption, #weekOption{
/*	width:20%;*/
		border:1px #c0c0c0 solid;
		float:left;
		margin:5px 15px 5px 5px;
	border-radius:5px;
	vertical-align:bottom;
}

#categoryOption button, #areaOption button, #timeOption button, #periodOption button, #weekOption button{
	width:20px;height:20px;padding-top:0px;
	margin:5px;
}

/************************** 검색 결과 테이블 *************************/
/*스터디 정보 - 카테고리와 사진*/
.studyCategory{width:72px;}
	
/*스터디 정보 - 타이틀*/
.studyName{background-color:#f9f9f9;font-weight:bold;}
.studyName a{color:black;}
	
/*스터디 정보 - 시작일자~종료일자*/
.studyDate{background-color:#f9f9f9;}

/*스터디 정보 - 작성자 */
.studyId{
	border:1px #00acd6 solid;
	border-width:0px 1px 1px 1px;
}
	
/*스터디 정보 - 조회수 */
.studyRead{
	border:1px #00acd6 solid;
	border-width:0px 1px 1px 1px;
}

/*스터디 정보 - 장소 및 시간*/
.studyAreaTime{border-top-width:0px;
	border:1px #00acd6 solid;
	border-width:0px 1px 1px 1px;
}
	
/*스터디 정보 - 기간*/
.studyPeriod{
	border:1px #00acd6 solid;
	border-width:0px 1px 1px 1px;
}


#searchResult tr:first-child td{
	background-color:#00c0ef;
	font-weight:bold;
	color:white;
	border:1px #00acd6 solid;
	border-width:0px 1px 1px 1px;
}

.studyCategory {
	border:1px #00acd6 solid;
	border-width:1px 1px 1px 1px;
}

#searchOptionTitle{
	margin:0px;
	width:100%;
	padding:5px;
	float:left;
}

#searchOtionDetail{
	margin:0px;
	width:100%;
	padding:5px;
}


@media screen and (min-width: 320px) and (max-width: 520px){
	#searchStudyBox {
		width: 200px;
		margin:auto;
	}

	#categoryBtn {
		width: 50px;
	}
	
	#searchBtn {
		width: 50px;
	}
	
	#searchKeyword{
		width:150px;
	}
}


@media screen and (min-width: 521px) and (max-width: 980px) {
	#searchStudyBox {
		width: 300px;
		margin:auto;
	}

	#categoryBtn {
		width: 80px;
	}
	
	#searchBtn {
		width: 80px;
	}
	
	#searchKeyword{
		width:250px;
	}
}


@media screen and (min-width: 981px){
	#searchStudyBox {
		width: 300px;
		margin:auto;
	}
	#categoryBtn {
		width: 80px;
	}
	#searchBtn {
		width: 80px;
	}
	#searchKeyword{
		width:250px;
	}


	

}

</style>

<script>
var codeDTO=new Array();

function getCodeDTO(){
	$.ajax({
		url : "${pageContext.request.contextPath}/getCommCodeAll",
		type : "post",
		dataType : "json",
		data : "${_csrf.parameterName}=${_csrf.token}",
		success : function(result){			
				codeDTO.length=0;	
				$.each(result, function(index, item) {
					codeDTO.push(item);
				});
				
		},
		error : function(err) {
			alert(err);
		}
	});
}

function getCodeName(code){
	for(var i=0; i<codeDTO.length; i++){
		if(codeDTO[i].commCode==code){
			return codeDTO[i].codeName;
		}
	}
}


//스터디 검색
function getStudyList(params){
	$.ajax({
		url : "${pageContext.request.contextPath}/search",
		type : "post",
		dataType : "json",
		data : params+"&${_csrf.parameterName}=${_csrf.token}",
		success : function(result) {
			printStudy(result);
		},
		error : function(err) {
			alert(err);
		}
	});
}


//데이터 검색
function search(page){
	
	//검색 파라메타 생성
	var name=$("#searchKeyword").val();
	
	if(name==""){
		name="";
	}
	if(page=="" || page==undefined){
		page=1;
	}
	
	var params="name="+name+"&page="+page;

	//alert(params);
	//데이터 검색후 출력
	getStudyList(params);
	
	return false;
}

//데이터 출력
function printStudy(study){
	$("#searchResult table tr:gt(0)").remove();

	if(study.length<=0){
		var table="<table class='.table-striped studyInfoTable'>";
		table+="<tr><td class='studyCategory'>검색된 데이터가 존재하지 않습니다.</td></tr></table>";
		$("#searchResult").append(table);
		return;
	}
	
	var table="";
	for(i=0; i<study.length; i++){
		table+="<tr>";
		table+="<td rowspan='2' class='col-xs-1 studyCategory'>" + study[i].category +" </td>";
		table+="<td class='studyName'><a href='${pageContext.request.contextPath}/search/detail?studyCode=" +study[i].studyCode+ "'>"+study[i].name+"</a></td>";
		table+="<td class='col-xs-2 studyDate'>" + study[i].startDate+"~"+study[i].endDate + "</td>";
		table+="<td rowspan='2' class='col-xs-1 studyId'>"+study[i].id+"</td>";
		table+="<td rowspan='2' class='col-xs-1 studyRead'>" + study[i].read + "</td></tr>";
		
		table+="<tr><td class='studyAreaTime'>" + study[i].area + " | " + study[i].day + " | " + study[i].startTime + "~" + study[i].endTime + "</td>";
		table+="<td class='studyPeriod'>"+"기간...."+"</td></tr>";
		
	}
	
	$("#searchResult table tbody").append(table);

}



$(function(){
	getCodeDTO();
	//search(1);
	
	//카테고리 수정
	$("#optGrpCategory select:eq(0)").change(function(){
		var categoryCode;
		if($(this).val()=="전체"){
			categoryCode="0157";
		}else{
			categoryCode=$(this).val();
		}
		
		$("#optGrpCategory select:gt(0)").remove();

		$.ajax({
			url : "${pageContext.request.contextPath}/getCommCodeList",
			type : "post",
			dataType : "json",
			data : "commCode="+categoryCode+"&${_csrf.parameterName}=${_csrf.token}",
			success : function(result) {
				if(result==null) return;
			
				$("#optGrpCategory .optionGroupBody").empty();
				var checkboxTag="<input type='checkbox' value='전체' checked>전체";
				$.each(result, function(index, item) {
					
					checkboxTag+="<input type='checkbox' value='"+ item.commCode + "'>" + item.codeName;
				})
				$("#optGrpCategory .optionGroupBody").append(checkboxTag);
				
				$("#categoryOption ul").empty();
				var tag="<li><span class='optionValue'>"+ $("#optGrpCategory :selected").text() + "</span></li>";
				$("#categoryOption ul").append(tag);
			},
			error : function(err) {
				alert(err);
			}
		});
	});
	
	//카테고리 체크박스
	$("#optGrpCategory .optionGroupBody").on("change", "input:checkbox", function(){
		if($(this).val()!="전체"){
			$("#optGrpCategory .optionGroupBody input:eq(0)").attr("checked", false);
			
			//var optionValue=$("#categoryOption ul span").text();
			var optionValue=$("#optGrpCategory :selected").text();
			$("#categoryOption ul").empty();
			
			optionValue+="("
					
			var inputNode=$("#optGrpCategory .optionGroupBody").children();
			
			for(i=0; i<inputNode.length; i++){
				if(inputNode[i].checked){
					optionValue+=getCodeName(inputNode[i].value);
					optionValue+=", "
				}
			}
			 optionValue=optionValue.substr(0, optionValue.length-2);
			 optionValue+=")";
			 
			var tag="<li><span class='optionValue'>"+ optionValue + "</span></li>";
			$("#categoryOption ul").append(tag);
			
		}else{
			$("#optGrpCategory .optionGroupBody input:gt(0)").attr("checked", false);
			var optionValue=$("#optGrpCategory :selected").text();
			$("#categoryOption ul").empty();
			var tag="<li><span class='optionValue'>"+ optionValue + "</span></li>";
			$("#categoryOption ul").append(tag);
		}
	})	
	
	
	//지역코드 수정
	$("#optGrpArea select:eq(0)").change(function(){
		$("#optGrpCategory select:gt(0)").remove();
		
		if($(this).val()=="전체"){
			return;
		}
		

		$.ajax({
			url : "${pageContext.request.contextPath}/getCommCodeList",
			type : "post",
			dataType : "json",
			data : "commCode="+$(this).val()+"&${_csrf.parameterName}=${_csrf.token}",
			success : function(result) {
				if(result==null) return;
				console.log($("#optGrpArea .optionGroupBody").empty());
				var checkboxTag="<input type='checkbox' value='전체' checked>전체";
				$.each(result, function(index, item) {
					checkboxTag+="<input type='checkbox' value='"+ item.commCode + "'>" + item.codeName;
				})
				$("#optGrpArea .optionGroupBody").append(checkboxTag);
				
				$("#areaOption ul").empty();
				var tag="<li><span class='optionValue'>"+ $("#optGrpArea :selected").text() + "</span></li>";
				$("#areaOption ul").append(tag);
			},
			error : function(err) {
				alert(err);
			}
		});
	});
	
	
	
	//지역 체크박스
	$("#optGrpArea .optionGroupBody").on("change", "input:checkbox", function(){
		if($(this).val()!="전체"){
			$("#optGrpArea .optionGroupBody input:eq(0)").attr("checked", false);
			
			//var optionValue=$("#categoryOption ul span").text();
			var optionValue=$("#optGrpArea :selected").text();
			$("#areaOption ul").empty();
			
			optionValue+="("
					
			var inputNode=$("#optGrpArea .optionGroupBody").children();
			
			for(i=0; i<inputNode.length; i++){
				if(inputNode[i].checked){
					optionValue+=getCodeName(inputNode[i].value);
					optionValue+=", "
				}
			}
			 optionValue=optionValue.substr(0, optionValue.length-2);
			 optionValue+=")";
			 
			var tag="<li><span class='optionValue'>"+ optionValue + "</span></li>";
			$("#areaOption ul").append(tag);
			
		}else{
			$("#optGrpArea .optionGroupBody input:gt(0)").attr("checked", false);
			var optionValue=$("#optGrpArea :selected").text();
			$("#areaOption ul").empty();
			var tag="<li><span class='optionValue'>"+ optionValue + "</span></li>";
			$("#areaOption ul").append(tag);
		}
	})
	


	//요일 체크박스
	$("#optGrpDay .optionGroupBody").on("change", "input:checkbox", function(){
		if($(this).val()!="전체"){
			$("#optGrpDay .optionGroupBody input:eq(0)").attr("checked", false);
			
			//var optionValue=$("#categoryOption ul span").text();
			var optionValue="";
			$("#weekOption ul").empty();
			
			optionValue+="("
					
			var inputNode=$("#optGrpDay .optionGroupBody").children();
			
			for(i=0; i<inputNode.length; i++){
				if(inputNode[i].checked){
					optionValue+=inputNode[i].value;
					optionValue+=", "
				}
			}
			 optionValue=optionValue.substr(0, optionValue.length-2);
			 optionValue+=")";
			 
			var tag="<li><span class='optionValue'>"+ optionValue + "</span></li>";
			$("#weekOption ul").append(tag);
			
		}else{
			$("#optGrpDay .optionGroupBody input:gt(0)").attr("checked", false);
			var optionValue="";
			$("#weekOption ul").empty();
			var tag="<li><span class='optionValue'>"+ this.value + "</span></li>";
			$("#weekOption ul").append(tag);
		}
	})	
});

</script>


<form action="#" method="post" id="f" name="f" onsubmit="return search()">
<div id="searchContent">
	<!-- 검색 필드 -->
	<div class="input-group input-group-sm" id="searchStudyBox">
		<!-- 카테고리 버튼 -->
    	<div class="input-group-btn" >
        	<button id="categoryBtn" type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown">스터디명
        		<span class="fa fa-caret-down"></span></button>
                  	<ul class="dropdown-menu">
	                    <li><a href="#">스터디명</a></li>
	                    <li><a href="#">모집자</a></li>
                  </ul>
       </div>
       <!-- 검색어 입력란 -->
       <input id="searchKeyword"  name="name" type="text" class="form-control">
       <!-- 검색 버튼 -->
       <span class="input-group-btn">
	      <button id="searchBtn" type="submit" class="btn btn-info btn-flat">검색</button>
       </span>
	</div>
<br>

<div class="row">
          <div class="box box-info collapsed-box">
			<!--box-header 시작 -->
            <div class="box-header with-border" id="optionState">
					<div id="optionStateTitle"><h4> 검색옵션 : </h4></div>
					<!--검색 옵션 : 분류시작-->
					<div  id="categoryOption"><div class="optionName">분류 :</div>
						<ul style="float:left">
							<li><span class="optionValue">전체</span></li>
						</ul>
						<div class="box-tools pull-right"><button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button></div>
					</div><!--검색 옵셥 : 분류끝-->
					<!--검색 옵션 : 장소시작-->
					<div  id="areaOption"><b class="optionName" style="float:left">장소 :</b>
						<ul style="float:left">
							<li><span class="optionValue">전체</span></li>
						</ul>
						<div class="box-tools pull-right"><button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button></div>
					</div><!--검색 옵셥 : 장소끝-->
					<!--검색 옵션 : 요일시작-->
					<div  id="weekOption"><b class="optionName" style="float:left">요일 :</b>
						<ul style="float:left">
							<li><span class="optionValue">전체</span></li>
						</ul>
						<div class="box-tools pull-right"><button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button></div>
					</div><!--검색 옵셥 : 요일끝-->
					<!--검색 옵션 : 시간시작-->
					<div  id="timeOption"><b class="optionName" style="float:left">시간 :</b>
						<ul style="float:left">
							<li><span class="optionValue">전체</span></li>
						</ul>
						<div class="box-tools pull-right"><button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button></div>
					</div><!--검색 옵셥 : 기간끝-->

					<!--검색 옵션 : 기간시작-->
					<div  id="periodOption"><b class="optionName" style="float:left">기간 :</b>
						<ul style="float:left">
							<li><span class="optionValue">전체</span></li>
						</ul>
						<div class="box-tools pull-right"><button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button></div>
					</div><!--검색 옵셥 : 기간끝-->
              <!-- /.box-tools -->
            </div>
            <!--box-header 끝 -->
			<!--box-body 시작 -->
            <div class="box-body">
				<div class="optionGroupList">
				<!--분류 옵션 그룹 시작-->
				<div class="optionGroup" id="optGrpCategory">
					<div class="optionGroupHead">
						<div class="optionGroupTitle">분류</div>
						<div class="optionGroupDepth">
							<select name="category">
								<option value="전체">전체</option>
								<c:forEach items="${categoryMap}" var="map"><option value="${map.value.commCode}">${map.value.codeName}</option></c:forEach>
							</select>
						</div>
					</div>
					<div class="optionGroupBody" style="clear:both;">
						<input type="checkbox" value="전체" checked>전체
						<c:forEach items="${categoryMap}" var="map"><input type="checkbox" value="${map.value.commCode}" name="category">${map.value.codeName}</c:forEach>
					</div>
				</div><!--분류 옵션 그룹 끝-->


				<!--지역 옵션 그룹 시작-->
				<div class="optionGroup" id="optGrpArea">
					<div class="optionGroupHead">
						<div class="optionGroupTitle">지역</div>
						<div class="optionGroupDepth">
							<select name="cityCode">
								<option value="전체">전체
								<c:forEach items="${cityCodeMap}" var="map"><option value="${map.value.commCode}">${map.value.codeName}</c:forEach>
							</select>
						</div>
					</div>
					<div class="optionGroupBody" style="clear:both;">
						<input type="checkbox" value="전체" checked>전체</input>
						<c:forEach items="${cityCodeMap}" var="map"><input type="checkbox" value="${map.value.commCode}" name="cityCode">${map.value.codeName}</input></c:forEach>
					</div>
				</div><!--지역 옵션 그룹 끝-->
				

				<!--요일 옵션 그룹 시작-->
				<div class="optionGroup" id="optGrpDay">
					<div class="optionGroupHead">
						<div class="optionGroupTitle">요일</div>
						<div class="optionGroupDepth">
						</div>
					</div>
					<div class="optionGroupBody" style="clear:both;">
						<input type="checkbox" name="day" value="전체" checked>전체
						<input type="checkbox" name="day" value="월">월
						<input type="checkbox" name="day" value="화">화
						<input type="checkbox" name="day" value="수">수
						<input type="checkbox" name="day" value="목">목
						<input type="checkbox" name="day" value="금">금
						<input type="checkbox" name="day" value="토">토
						<input type="checkbox" name="day" value="일">일
					</div>
				</div><!--요일 옵션 그룹 끝-->

				<!--시간 옵션 그룹 시작-->
				<div class="optionGroup" id="optGrpTime">
					<div class="optionGroupHead">
						<div class="optionGroupTitle">시간대</div>
						<div class="optionGroupDepth">
							<input type="button" value="전체">
							<input type="button" value="오전시간대">
							<input type="button" value="오후시간대">
							<input type="button" value="저녁시간대">
						</div>
					</div>
					<div class="optionGroupBody" style="clear:both;">
                 <input type="text" value="" class="slider form-control" data-slider-min="0" data-slider-max="24"
                         data-slider-step="1" data-slider-value="[0,24]" data-slider-orientation="horizontal"
                         data-slider-selection="before" data-slider-tooltip="show" data-slider-id="aqua">
					</div>
				</div><!--시간 옵션 그룹 끝-->

				<!--기간 옵션 그룹 시작-->
				<div class="optionGroup" id="optGrpPeriod">
					<div class="optionGroupHead">
						<div class="optionGroupTitle">기간</div>
						<div class="optionGroupDepth">
							<input type="button" value="1달">
							<input type="button" value="3달">
							<input type="button" value="6달">
							<input type="button" value="1년">
						</div>
					</div>
					<div class="optionGroupBody" style="clear:both;">
						<div class="form-group">
							<div class="input-group">
							<div class="input-group-addon">
							<i class="fa fa-calendar"></i>
							</div>
							<input type="text" class="form-control pull-right" id="reservation">
							</div>
						</div>
					</div>
				</div><!--기간 옵션 그룹 끝-->
				</div>
            </div>
            <!--box-body 끝 -->
          </div>
          <!-- /.box -->
</div>

</form>

<br>
<div class="row" id="searchResult">
<table class=".table-striped studyInfoTable">
	<tr>
		<td class="col-xs-1 studyCategory">분류</td>
		<td class="studyName">모집명 /장소,시간</td>
		<td class="col-xs-2 studyDate">기간</td>
		<td class="col-xs-1 studyId">모집자</td>
		<td class="col-xs-1 studyRead">조회수</td>
	</tr>
	<tr>
		<td rowspan="2" class="col-xs-1 studyCategory">[일본어]사진</td>
		<td class="studyName"> 일본어 스터디 입니다.</td>
		<td class="col-xs-2 studyDate">2017.05.23~2017.12.31</td>
		<td rowspan="2" class="col-xs-1 studyId">최윤아</td>
		<td rowspan="2" class="col-xs-1 studyRead">54</td>
	</tr>
	<tr>
		<td class="studyAreaTime">경기 성남시 분당구 | 월,화 | 19:00~21:00</td>
		<td class="studyPeriod">6개월</td>
	</tr>


	<tr>
		<td rowspan="2" class="col-xs-1 studyCategory">[일본어]사진</td>
		<td class="studyName"> 일본어 스터디 입니다.</td>
		<td class="col-xs-2 studyDate">2017.05.23~2017.12.31</td>
		<td rowspan="2" class="col-xs-1 studyId">최윤아</td>
		<td rowspan="2" class="col-xs-1 studyRead">54</td>
	</tr>
	<tr>
		<td class="studyAreaTime">경기 성남시 분당구 | 월,화 | 19:00~21:00</td>
		<td class="studyPeriod">6개월</td>
	</tr>

	<tr>
		<td rowspan="2" class="col-xs-1 studyCategory">[일본어]사진</td>
		<td class="studyName"> 일본어 스터디 입니다.</td>
		<td class="col-xs-2 studyDate">2017.05.23~2017.12.31</td>
		<td rowspan="2" class="col-xs-1 studyId">최윤아</td>
		<td rowspan="2" class="col-xs-1 studyRead">54</td>
	</tr>
	<tr>
		<td class="studyAreaTime">경기 성남시 분당구 | 월,화 | 19:00~21:00</td>
		<td class="studyPeriod">6개월</td>
	</tr>

	<tr>
		<td rowspan="2" class="col-xs-1 studyCategory">[일본어]사진</td>
		<td class="studyName"> 일본어 스터디 입니다.</td>
		<td class="col-xs-2 studyDate">2017.05.23~2017.12.31</td>
		<td rowspan="2" class="col-xs-1 studyId">최윤아</td>
		<td rowspan="2" class="col-xs-1 studyRead">54</td>
	</tr>
	<tr>
		<td class="studyAreaTime">경기 성남시 분당구 | 월,화 | 19:00~21:00</td>
		<td class="studyPeriod">6개월</td>
	</tr>
</table>	
	
 <c:forEach items="${studyDTOList}" var="studyDTO">
		<tr>
 	 	<td rowspan='2' class='col-xs-1 studyCategory'>${studyDTO.category}</td>
		
		<td class='studyName'><a href="${pageContext.request.contextPath}/search/detail?studyCode=${studyDTO.studyCode}">${studyDTO.name}</a></td>
		<td class='col-xs-2 studyDate'> ${studyDTO.startDate}~${studyDTO.endDate}</td>
		<td rowspan='2' class='col-xs-1 studyId'>${studyDTO.id}</td>
		<td rowspan='2' class='col-xs-1 studyRead'>${studyDTO.read}</td></tr>
		<tr><td class='studyAreaTime'> ${studyDTO.area} | ${studyDTO.day} | ${studyDTO.startTime} ~ ${startDTO.endTime} </td>
		<td class='studyPeriod'>기간....</td> 
		</tr> 
</c:forEach> 
</table>
</div>
<div class="row" id="pagination">
<ul class="pagination">
	<li><a href="#">1</a></li>
	<li><a href="#">2</a></li>
	<li><a href="#">3</a></li>
	<li><a href="#">4</a></li>			
</ul>
</div>
<jsp:include page="/WEB-INF/views/main/footer.jsp" />


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
var codeDTOArr=new Array();

function getCodes(){
$.ajax({
		url : "/mogong/commCodeList",
		type : "post",
		dataType : "json",
		data : "${_csrf.parameterName}=${_csrf.token}",
		success : function(result) {
			$.each(result, function(index, item) {
				codeDTOArr.push(item);
			})
		},
		error : function(err) {
			alert(err);
		}
	});
}


//스터디 검색
function getStudyList(params){
	$.ajax({
		url : "/mogong/search",
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
	
	console.log("params : " + params);
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
		console.log(study[i].startDate)
		table+="<tr>";
		table+="<td rowspan='2' class='col-xs-1 studyCategory'>" + study[i].category + "</td>";
		table+="<td class='studyName'><a href='${pageContext.request.contextPath}/search/detail?studyCode=" +study[i].studyCode+ "'>"+study[i].name+"</a></td>";
		table+="<td class='col-xs-2 studyDate'>" + study[i].startDate+"~"+study[i].endDate + "</td>";
		table+="<td rowspan='2' class='col-xs-1 studyId'>"+study[i].id+"</td>";
		table+="<td rowspan='2' class='col-xs-1 studyRead'>" + study[i].read + "</td></tr>";
		
		table+="<tr><td class='studyAreaTime'>" + study[i].area + " | " + study[i].day + " | " + study[i].startTime + "~" + study[i].endTime + "</td>";
		table+="<td class='studyPeriod'>"+"기간...."+"</td></tr>";
		
	}
	
	console.log(table);
	$("#searchResult table tbody").append(table);

}


$(function(){
	search(1);
});
</script>


<form action="#" method="post" id="f" name="f" onsubmit="return search()">
<div id="searchContent">
	<!-- 검색 필드 -->
	<div class="input-group input-group-sm" id="searchStudyBox">
		<!-- 카테고리 버튼 -->
    	<div class="input-group-btn" >
        	<button id="categoryBtn" type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown">Action
        		<span class="fa fa-caret-down"></span></button>
                  	<ul class="dropdown-menu">
	                    <li><a href="#">Action</a></li>
	                    <li><a href="#">Another action</a></li>
	                    <li><a href="#">Something else here</a></li>
	                    <li class="divider"></li>
	                    <li><a href="#">Separated link</a></li>
                  </ul>
       </div>
       <!-- 검색어 입력란 -->
       <input id="searchKeyword"  name="name" type="text" class="form-control">
       <!-- 검색 버튼 -->
       <span class="input-group-btn">
	      <button id="searchBtn" type="submit" class="btn btn-info btn-flat">Go!</button>
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
						<div class="box-tools pull-right"><button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></div>
					</div><!--검색 옵셥 : 분류끝-->
					<!--검색 옵션 : 장소시작-->
					<div  id="areaOption"><b class="optionName" style="float:left">장소 :</b>
						<ul style="float:left">
							<li><span class="optionValue">전체</span></li>
						</ul>
						<div class="box-tools pull-right"><button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></div>
					</div><!--검색 옵셥 : 장소끝-->
					<!--검색 옵션 : 요일시작-->
					<div  id="weekOption"><b class="optionName" style="float:left">요일 :</b>
						<ul style="float:left">
							<li><span class="optionValue">전체</span></li>
						</ul>
						<div class="box-tools pull-right"><button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></div>
					</div><!--검색 옵셥 : 요일끝-->
					<!--검색 옵션 : 시간시작-->
					<div  id="timeOption"><b class="optionName" style="float:left">시간 :</b>
						<ul style="float:left">
							<li><span class="optionValue">전체</span></li>
						</ul>
						<div class="box-tools pull-right"><button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></div>
					</div><!--검색 옵셥 : 기간끝-->

					<!--검색 옵션 : 기간시작-->
					<div  id="periodOption"><b class="optionName" style="float:left">기간 :</b>
						<ul style="float:left">
							<li><span class="optionValue">전체</span></li>
						</ul>
						<div class="box-tools pull-right"><button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></div>
					</div><!--검색 옵셥 : 기간끝-->
              <!-- /.box-tools -->
            </div>
            <!--box-header 끝 -->
			<!--box-body 시작 -->
            <div class="box-body">
				<div class="optionGroupList">
				<!--분류 옵션 그룹 시작-->
				<div class="optionGroup">
					<div class="optionGroupHead">
						<div class="optionGroupTitle">분류</div>
						<div class="optionGroupDepth">
							<select>
								<option value="">전체</option>
								<option value="">어학</option>
							</select>
							<select>
								<option value="">전체</option>
								<option value="">어학</option>
							</select>
						</div>
					</div>
					<div class="optionGroupBody" style="clear:both;">
						<input type="checkbox" value="">전체
						<input type="checkbox" value="">어학
						<input type="checkbox" value="">프로그래밍
						<input type="checkbox" value="">고시
					</div>
				</div><!--분류 옵션 그룹 끝-->


				<!--지역 옵션 그룹 시작-->
				<div class="optionGroup">
					<div class="optionGroupHead">
						<div class="optionGroupTitle">지역</div>
						<div class="optionGroupDepth">
							<select>
								<option value="">전체</option>
								<option value="">서울</option>
								<option value="">경기</option>
							</select>
							<select>
								<option value="">전체</option>
								<option value="">강남</option>
							</select>
						</div>
					</div>
					<div class="optionGroupBody" style="clear:both;">
						<input type="checkbox" value="">전체
						<input type="checkbox" value="">어학
						<input type="checkbox" value="">프로그래밍
						<input type="checkbox" value="">고시
					</div>
				</div><!--지역 옵션 그룹 끝-->
				

				<!--요일 옵션 그룹 시작-->
				<div class="optionGroup">
					<div class="optionGroupHead">
						<div class="optionGroupTitle">요일</div>
						<div class="optionGroupDepth">
						</div>
					</div>
					<div class="optionGroupBody" style="clear:both;">
						<input type="checkbox" name="day" value="전체">전체
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
				<div class="optionGroup">
					<div class="optionGroupHead">
						<div class="optionGroupTitle">시간대</div>
						<div class="optionGroupDepth">
							<input type="button" value="오전시간대">
							<input type="button" value="오후시간대">
							<input type="button" value="저녁시간대">
						</div>
					</div>
					<div class="optionGroupBody" style="clear:both;">
                 <input type="text" value="" class="slider form-control" data-slider-min="0" data-slider-max="24"
                         data-slider-step="1" data-slider-value="[8,19]" data-slider-orientation="horizontal"
                         data-slider-selection="before" data-slider-tooltip="show" data-slider-id="aqua">
					</div>
				</div><!--시간 옵션 그룹 끝-->

				<!--기간 옵션 그룹 시작-->
				<div class="optionGroup">
					<div class="optionGroupHead">
						<div class="optionGroupTitle">기간</div>
						<div class="optionGroupDepth">
							<input type="button" value="일주일이상">
							<input type="button" value="한달이상">
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
</div>
<jsp:include page="/WEB-INF/views/main/footer.jsp" />






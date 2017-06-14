<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/main/header.jsp" />


<style>
table {
	width: 500px;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
	border-bottom: 1px solid #444444;
	padding: 10px;
	text-align: center;
}
</style>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/daterangepicker.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/all.css">



<form name="insert" action="${pageContext.request.contextPath}/enroll"
	method="post">

	<table align="center" border="1">

		<tr>
			<td colspan="2"><b> 스터디 등록하기</b></td>
		</tr>

		<tr>
			<td>스터디 이름</td>
			<td><input type="text" name="name"></td>
		</tr>




		<tr>
			<td>종료일</td>
			<td>
				<div class="form-group">
					<label>Date range:</label>

					<div class="input-group">
						<div class="input-group-addon">
							<i class="fa fa-calendar"></i>
						</div>
						<input type="text" class="form-control pull-right"
							id="reservation">
					</div>
					<!-- /.input group -->
				</div>
			</td>
		</tr>

		<tr>
			<td>요일</td>
			<td><input type="checkbox" name="day" value="일">일
				<input type="checkbox" name="day" value="월" >월
				<input type="checkbox" name="day" value="화">화
				<input type="checkbox" name="day" value="수">수
				<input type="checkbox" name="day" value="목">목
				<input type="checkbox" name="day" value="금">금
				<input type="checkbox" name="day" value="토">토
				</td>
		</tr>

		<tr>
			<td>시작시간</td>
			<td> </td>
		</tr>

		<tr>
			<td>종료시간</td>
			<td><input type="text" name="endTime"></td>
		</tr>

		<tr>
			<td>인원</td>
			<td><select name="people">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
			</select></td>

		</tr>

		<tr>
			<td>지역</td>
			<td><select name="area">
					<option value="지역">지역</option>
					<option value="서울/경기">서울/경기</option>
					<option value="인천/부천">인천/부천</option>
					<option value="춘천/강원">춘천/강원</option>
					<option value="부산/울산/경남">부산/울산/경남</option>
					<option value="대구/경북">대구/경북</option>
					<option value="전주/전북">전주/전북</option>
					<option value="광주/전남">광주/전남</option>
					<option value="청주/충북">청주/충북</option>
					<option value="청주/충북">청주/충북</option>
					<option value="대전/충남">대전/충남</option>
					<option value="제주">제주</option>
			</select></td>
		</tr>

		<tr>
			<td>스터디 설명</td>
			<td><textarea rows="8" cols="40" name="description">상세정보  입력하세용 </textarea></td>
		</tr>

		<tr>
			<td colspan="2"><input type=submit value=스터디등록하기> <input
				type=reset value=다시쓰기></td>
		</tr>


	</table>

</form>




<div class="daterangepicker dropdown-menu show-calendar opensleft"
	style="top: 1530px; right: 25px; left: auto; display: none;">
	<div class="calendar left">
		<div class="daterangepicker_input">
			<input class="input-mini active" type="text"
				name="daterangepicker_start" value=""><i
				class="fa fa-calendar glyphicon glyphicon-calendar"></i>
			<div class="calendar-time" style="display: none;">
				<div></div>
				<i class="fa fa-clock-o glyphicon glyphicon-time"></i>
			</div>
		</div>
		<div class="calendar-table">
			<table class="table-condensed">
				<thead>
					<tr>
						<th class="prev available"><i
							class="fa fa-chevron-left glyphicon glyphicon-chevron-left"></i></th>
						<th colspan="5" class="month">Jun 2017</th>
						<th></th>
					</tr>
					<tr>
						<th>Su</th>
						<th>Mo</th>
						<th>Tu</th>
						<th>We</th>
						<th>Th</th>
						<th>Fr</th>
						<th>Sa</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="weekend off available" data-title="r0c0">28</td>
						<td class="off available" data-title="r0c1">29</td>
						<td class="off available" data-title="r0c2">30</td>
						<td class="off available" data-title="r0c3">31</td>
						<td class="active start-date available" data-title="r0c4">1</td>
						<td class="in-range available" data-title="r0c5">2</td>
						<td class="weekend in-range available" data-title="r0c6">3</td>
					</tr>
					<tr>
						<td class="weekend in-range available" data-title="r1c0">4</td>
						<td class="in-range available" data-title="r1c1">5</td>
						<td class="in-range available" data-title="r1c2">6</td>
						<td class="in-range available" data-title="r1c3">7</td>
						<td class="in-range available" data-title="r1c4">8</td>
						<td class="in-range available" data-title="r1c5">9</td>
						<td class="weekend in-range available" data-title="r1c6">10</td>
					</tr>
					<tr>
						<td class="weekend in-range available" data-title="r2c0">11</td>
						<td class="in-range available" data-title="r2c1">12</td>
						<td class="in-range available" data-title="r2c2">13</td>
						<td class="today in-range available" data-title="r2c3">14</td>
						<td class="in-range available" data-title="r2c4">15</td>
						<td class="in-range available" data-title="r2c5">16</td>
						<td class="weekend in-range available" data-title="r2c6">17</td>
					</tr>
					<tr>
						<td class="weekend in-range available" data-title="r3c0">18</td>
						<td class="in-range available" data-title="r3c1">19</td>
						<td class="in-range available" data-title="r3c2">20</td>
						<td class="in-range available" data-title="r3c3">21</td>
						<td class="in-range available" data-title="r3c4">22</td>
						<td class="in-range available" data-title="r3c5">23</td>
						<td class="weekend in-range available" data-title="r3c6">24</td>
					</tr>
					<tr>
						<td class="weekend in-range available" data-title="r4c0">25</td>
						<td class="in-range available" data-title="r4c1">26</td>
						<td class="in-range available" data-title="r4c2">27</td>
						<td class="in-range available" data-title="r4c3">28</td>
						<td class="in-range available" data-title="r4c4">29</td>
						<td class="in-range available" data-title="r4c5">30</td>
						<td class="weekend off in-range available" data-title="r4c6">1</td>
					</tr>
					<tr>
						<td class="weekend off in-range available" data-title="r5c0">2</td>
						<td class="off in-range available" data-title="r5c1">3</td>
						<td class="off in-range available" data-title="r5c2">4</td>
						<td class="off in-range available" data-title="r5c3">5</td>
						<td class="off in-range available" data-title="r5c4">6</td>
						<td class="off in-range available" data-title="r5c5">7</td>
						<td class="weekend off in-range available" data-title="r5c6">8</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="calendar right">
		<div class="daterangepicker_input">
			<input class="input-mini" type="text" name="daterangepicker_end"
				value=""><i
				class="fa fa-calendar glyphicon glyphicon-calendar"></i>
			<div class="calendar-time" style="display: none;">
				<div></div>
				<i class="fa fa-clock-o glyphicon glyphicon-time"></i>
			</div>
		</div>
		<div class="calendar-table">
			<table class="table-condensed">
				<thead>
					<tr>
						<th></th>
						<th colspan="5" class="month">Jul 2017</th>
						<th class="next available"><i
							class="fa fa-chevron-right glyphicon glyphicon-chevron-right"></i></th>
					</tr>
					<tr>
						<th>Su</th>
						<th>Mo</th>
						<th>Tu</th>
						<th>We</th>
						<th>Th</th>
						<th>Fr</th>
						<th>Sa</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="weekend off in-range available" data-title="r0c0">25</td>
						<td class="off in-range available" data-title="r0c1">26</td>
						<td class="off in-range available" data-title="r0c2">27</td>
						<td class="off in-range available" data-title="r0c3">28</td>
						<td class="off in-range available" data-title="r0c4">29</td>
						<td class="off in-range available" data-title="r0c5">30</td>
						<td class="weekend in-range available" data-title="r0c6">1</td>
					</tr>
					<tr>
						<td class="weekend in-range available" data-title="r1c0">2</td>
						<td class="in-range available" data-title="r1c1">3</td>
						<td class="in-range available" data-title="r1c2">4</td>
						<td class="in-range available" data-title="r1c3">5</td>
						<td class="in-range available" data-title="r1c4">6</td>
						<td class="in-range available" data-title="r1c5">7</td>
						<td class="weekend in-range available" data-title="r1c6">8</td>
					</tr>
					<tr>
						<td class="weekend in-range available" data-title="r2c0">9</td>
						<td class="in-range available" data-title="r2c1">10</td>
						<td class="in-range available" data-title="r2c2">11</td>
						<td class="in-range available" data-title="r2c3">12</td>
						<td class="in-range available" data-title="r2c4">13</td>
						<td class="in-range available" data-title="r2c5">14</td>
						<td class="weekend active end-date in-range available"
							data-title="r2c6">15</td>
					</tr>
					<tr>
						<td class="weekend available" data-title="r3c0">16</td>
						<td class="available" data-title="r3c1">17</td>
						<td class="available" data-title="r3c2">18</td>
						<td class="available" data-title="r3c3">19</td>
						<td class="available" data-title="r3c4">20</td>
						<td class="available" data-title="r3c5">21</td>
						<td class="weekend available" data-title="r3c6">22</td>
					</tr>
					<tr>
						<td class="weekend available" data-title="r4c0">23</td>
						<td class="available" data-title="r4c1">24</td>
						<td class="available" data-title="r4c2">25</td>
						<td class="available" data-title="r4c3">26</td>
						<td class="available" data-title="r4c4">27</td>
						<td class="available" data-title="r4c5">28</td>
						<td class="weekend available" data-title="r4c6">29</td>
					</tr>
					<tr>
						<td class="weekend available" data-title="r5c0">30</td>
						<td class="available" data-title="r5c1">31</td>
						<td class="off available" data-title="r5c2">1</td>
						<td class="off available" data-title="r5c3">2</td>
						<td class="off available" data-title="r5c4">3</td>
						<td class="off available" data-title="r5c5">4</td>
						<td class="weekend off available" data-title="r5c6">5</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="ranges">
		<div class="range_inputs">
			<button class="applyBtn btn btn-sm btn-success" type="button">Apply</button>
			<button class="cancelBtn btn btn-sm btn-default" type="button">Cancel</button>
		</div>
	</div>
</div>
<div class="daterangepicker dropdown-menu show-calendar opensleft">
	<div class="calendar left">
		<div class="daterangepicker_input">
			<input class="input-mini" type="text" name="daterangepicker_start"
				value=""><i
				class="fa fa-calendar glyphicon glyphicon-calendar"></i>
			<div class="calendar-time">
				<div></div>
				<i class="fa fa-clock-o glyphicon glyphicon-time"></i>
			</div>
		</div>
		<div class="calendar-table"></div>
	</div>
	<div class="calendar right">
		<div class="daterangepicker_input">
			<input class="input-mini" type="text" name="daterangepicker_end"
				value=""><i
				class="fa fa-calendar glyphicon glyphicon-calendar"></i>
			<div class="calendar-time">
				<div></div>
				<i class="fa fa-clock-o glyphicon glyphicon-time"></i>
			</div>
		</div>
		<div class="calendar-table"></div>
	</div>
	<div class="ranges">
		<div class="range_inputs">
			<button class="applyBtn btn btn-sm btn-success" disabled="disabled"
				type="button">Apply</button>
			<button class="cancelBtn btn btn-sm btn-default" type="button">Cancel</button>
		</div>
	</div>
</div>
<div class="daterangepicker dropdown-menu opensleft">
	<div class="calendar left">
		<div class="daterangepicker_input">
			<input class="input-mini" type="text" name="daterangepicker_start"
				value=""><i
				class="fa fa-calendar glyphicon glyphicon-calendar"></i>
			<div class="calendar-time" style="display: none;">
				<div></div>
				<i class="fa fa-clock-o glyphicon glyphicon-time"></i>
			</div>
		</div>
		<div class="calendar-table"></div>
	</div>
	<div class="calendar right">
		<div class="daterangepicker_input">
			<input class="input-mini" type="text" name="daterangepicker_end"
				value=""><i
				class="fa fa-calendar glyphicon glyphicon-calendar"></i>
			<div class="calendar-time" style="display: none;">
				<div></div>
				<i class="fa fa-clock-o glyphicon glyphicon-time"></i>
			</div>
		</div>
		<div class="calendar-table"></div>
	</div>
	<div class="ranges">
		<ul>
			<li>Today</li>
			<li>Yesterday</li>
			<li>Last 7 Days</li>
			<li>Last 30 Days</li>
			<li>This Month</li>
			<li>Last Month</li>
			<li>Custom Range</li>
		</ul>
		<div class="range_inputs">
			<button class="applyBtn btn btn-sm btn-success" disabled="disabled"
				type="button">Apply</button>
			<button class="cancelBtn btn btn-sm btn-default" type="button">Cancel</button>
		</div>
	</div>
</div>


<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.2.0.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/daterangepicker.js"></script>

<script src="${pageContext.request.contextPath}/resources/js/moment.js"></script>

<script
	src="${pageContext.request.contextPath}/resources/js/icheck.min.js"></script>




<script>
	$(function() {

		$('#reservation').daterangepicker();
		//Date range picker with time picker
		$('#reservationtime').daterangepicker({
			timePicker : true,
			timePickerIncrement : 30,
			format : 'MM/DD/YYYY h:mm A'
		});
		//Date range as a button
		$('#daterange-btn').daterangepicker(
				{
					ranges : {
						'Today' : [ moment(), moment() ],
						'Yesterday' : [ moment().subtract(1, 'days'),
								moment().subtract(1, 'days') ],
						'Last 7 Days' : [ moment().subtract(6, 'days'),
								moment() ],
						'Last 30 Days' : [ moment().subtract(29, 'days'),
								moment() ],
						'This Month' : [ moment().startOf('month'),
								moment().endOf('month') ],
						'Last Month' : [
								moment().subtract(1, 'month').startOf('month'),
								moment().subtract(1, 'month').endOf('month') ]
					},
					startDate : moment().subtract(29, 'days'),
					endDate : moment()
				},
				function(start, end) {
					$('#daterange-btn span').html(
							start.format('MMMM D, YYYY') + ' - '
									+ end.format('MMMM D, YYYY'));
				});

	});
</script>
<jsp:include page="/WEB-INF/views/main/footer.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- jQuery 3.1.1 -->
 <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
 <!-- Bootstrap 3.3.7 -->
 <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath}/resources/dist/js/adminlte.min.js"></script>

<!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/dist/css/AdminLTE.css">

  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/dist/css/skins/skin-blue.css">
	
  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
	
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.0.min.js"></script>

<link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/calendar.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/calendar.js"></script>

<script>

	$(document).ready(function() {
	    var date = new Date();
		var d = date.getDate(); //15
		var m = date.getMonth(); //5
		var y = date.getFullYear(); //2017
	
		$('#external-events div.external-event').each(function() {
		
			// create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
			// it doesn't need to have a start or end
			var eventObject = {
				title: $.trim($(this).text()) // use the element's text as the event title
			};
			
			// store the Event Object in the DOM element so we can get to it later
			$(this).data('eventObject', eventObject);
			
			// make the event draggable using jQuery UI
			$(this).draggable({
				zIndex: 999,
				revert: true,      // will cause the event to go back to its
				revertDuration: 0  //  original position after the drag
			});
			
		});
	
	
		/* initialize the calendar
		-----------------------------------------------------------------*/
				
				var calendar =  $('#calendar').fullCalendar({
					header: {
						left: 'title',
						center: 'agendaDay,agendaWeek,month',
						right: 'prev,next today'
					},
					editable: true,
					firstDay: 1, //  1(Monday) this can be changed to 0(Sunday) for the USA system
					selectable: true,
					defaultView: 'month',
					
					axisFormat: 'h:mm',
					columnFormat: {
		                month: 'ddd',    // Mon
		                week: 'ddd d', // Mon 7
		                day: 'dddd M/d',  // Monday 9/7
		                agendaDay: 'dddd d'
		            },
		            titleFormat: {
		                month: 'MMMM yyyy', // September 2009
		                week: "MMMM yyyy", // September 2009
		                day: 'MMMM yyyy'                  // Tuesday, Sep 8, 2009
		            },
					allDaySlot: false,
					selectHelper: true,
					select: function(start, end, allDay) {
						var title = prompt('Task 제목');
						
						var startDateStr = start.getFullYear()+"-"+(start.getMonth()+1)+"-"+start.getDate()+" "
											+start.getHours()+":"+start.getMinutes()+":"+start.getSeconds();
						
						var endDateStr = end.getFullYear()+"-"+(end.getMonth()+1)+"-"+end.getDate()+" "
										+end.getHours()+":"+end.getMinutes()+":"+end.getSeconds();
						if (title) {
							$.ajax({
								url: "${pageContext.request.contextPath}/member/study/schedule/insert",
								data: "studyCode=6&title="+title+"&start="+startDateStr+"&end="+endDateStr+"&${_csrf.parameterName}=${_csrf.token}",
								type: "post",
								dataType: "text",
								success: function (result) {
									
								},
								error : function (request,status,error) {
									alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
								}
							});//ajax 끝
							
							calendar.fullCalendar('renderEvent',
								{
									title: title,
									start: start,
									end: end,
									allDay: allDay
								},
								true // make the event "stick"
							);
						}
						calendar.fullCalendar('unselect');
					},
					droppable: true, // this allows things to be dropped onto the calendar !!!
					drop: function(date, allDay) { // this function is called when something is dropped
					
						// retrieve the dropped element's stored Event Object
						var originalEventObject = $(this).data('eventObject');
						
						// we need to copy it, so that multiple events don't have a reference to the same object
						var copiedEventObject = $.extend({}, originalEventObject);
						
						// assign it the date that was reported
						copiedEventObject.start = date;
						copiedEventObject.allDay = allDay;
						
						// render the event on the calendar
						// the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
						$('#calendar').fullCalendar('renderEvent', copiedEventObject, true);
						
						// is the "remove after drop" checkbox checked?
						if ($('#drop-remove').is(':checked')) {
							// if so, remove the element from the "Draggable Events" list
							$(this).remove();
						}
						
					},
					
					  events: function (start,end,callback) {
						$.ajax({
							url: "${pageContext.request.contextPath}/member/study/schedule/data",
							data: "${_csrf.parameterName}=${_csrf.token}",
							type: "post",
							dataType: "json",
							success: function (result) {
								var events = [];
								$.each(result , function (index, item) {
									 var sYear;
									var sMonth;
									var sDay;
									var sHour;
									var sMinute;
									var eYear;
									var eMonth;
									var eDay;
									var eHour;
									var eMinute;
									var sDate;
									var eDate;
									
									if(item.startDate){
										sDate = new Date(Date.parse(item.startDate));
										 sYear = sDate.getFullYear();
										 sMonth = sDate.getMonth();
										 sDay = sDate.getDate();
										 sHour = sDate.getHours();
										 sMinute = sDate.getMinutes();
									} 
									if(item.endDate){
										eDate = new Date(Date.parse(item.endDate));
										 eYear = eDate.getFullYear();
										 eMonth = eDate.getMonth();
										 eDay = eDate.getDate();
										 eHour = eDate.getHours();
										 eMinute = eDate.getMinutes();
									} 
									
									if(sDate || eDate){
										events.push({
											title: item.title,
											start: new Date(sYear,sMonth,sDay,sHour,sMinute),
											end : new Date(eYear,eMonth,eDay,eHour,eMinute),
											allDay: false
										});
									}
								});
								callback(events);
							},
							error : function (request,status,error) {
								alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
							}
						})//ajax 끝
					}, 
					
				}); //calendar 끝
			
	});//function 끝

</script>
<style>

	body {
	    margin-bottom: 40px;
		margin-top: 40px;
		font-size: 14px;
		font-family: 'Roboto', sans-serif;
		}
		
	#wrap {
		width: 1100px;
		margin: 0 auto;
		}
		
	#external-events {
		float: left;
		width: 150px;
		padding: 0 10px;
		text-align: left;
		}
		
	#external-events h4 {
		font-size: 16px;
		margin-top: 0;
		padding-top: 1em;
		}
		
	.external-event { /* try to mimick the look of a real event */
		margin: 10px 0;
		padding: 2px 4px;
		background: #3366CC;
		color: #fff;
		font-size: .85em;
		cursor: pointer;
		}
		
	#external-events p {
		margin: 1.5em 0;
		font-size: 11px;
		color: #666;
		}
		
	#external-events p input {
		margin: 0;
		vertical-align: middle;
		}

	#calendar {
/* 		float: right; */
        margin: 0 auto;
		width: 900px;
		background-color: #FFFFFF;
		  border-radius: 6px;
        box-shadow: 0 1px 2px #C3C3C3;
		-webkit-box-shadow: 0px 0px 21px 2px rgba(0,0,0,0.18);
-moz-box-shadow: 0px 0px 21px 2px rgba(0,0,0,0.18);
box-shadow: 0px 0px 21px 2px rgba(0,0,0,0.18);
		}

</style>

</head>
<body>
<section class="content-header">
      <h1>
        스터디 일정
        <small>Task 일정을 보여줍니다.</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Study</a></li>
        <li class="active">Schedule</li>
      </ol>
</section>

<section class="content container-fluid">
 	<div class="box box-primary">
 	<br><br>
 		<div id='calendar'></div>
	<div style='clear:both'></div>
 </div>
</section>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>모여서 공부하자</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
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
   
   <script type="text/javascript">
      $(function () {
         $("#logo").hover(
            function () {
               $(this).css('background-color','white');
               $("#logoText").css('color','#349fda');
            },      
            function () {
               $("#logoText").css('color','#367fa9');
            }
         )
         
         $("#toggle").hover(
            function () {
               $("#toggle").css('background-color','#e1e1e1');
            },
            function () {
               $("#toggle").css('background-color','white');
            }
         )
         $("#progress1").hover(
            function () {
               $(this).css('background-color','#e1e1e1')
            },
            function () {
               $(this).css('background-color','white')
            }
         )
          $("#progress2").hover(
            function () {
               $(this).css('background-color','#e1e1e1')
            },
            function () {
               $(this).css('background-color','white')
            }
         )

         $("#progress3").hover(
            function () {
               $(this).css('background-color','#e1e1e1')
            },
            function () {
               $(this).css('background-color','white')
            }
         )

         $("#progress4").hover(
            function () {
               $(this).css('background-color','#e1e1e1')
            },
            function () {
               $(this).css('background-color','white')
            }
         )
         
         $("#rightSide").focusout(function () {
            $("#rightTab").hide();
         })
         $("#rightSide").focusin(function () {
            $("#rightTab").show();
         })
      })
   </script>
</head>
<!--
BODY TAG OPTIONS:
=================
Apply one or more of the following classes to get the
desired effect
|---------------------------------------------------------|
| SKINS         | skin-blue                               |
|               | skin-black                              |
|               | skin-purple                             |
|               | skin-yellow                             |
|               | skin-red                                |
|               | skin-green                              |
|---------------------------------------------------------|
|LAYOUT OPTIONS | fixed                                   |
|               | layout-boxed                            |
|               | layout-top-nav                          |
|               | sidebar-collapse                        |
|               | sidebar-mini                            |
|---------------------------------------------------------|
-->
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <!-- Main Header -->
  <header class="main-header">
   
   <section class="main-header">
    <!-- Logo -->
    <a href="${pageContext.request.contextPath}/" class="logo" id="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>모공</b></span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg" id="logoText"><b style="font-size:35px">모</b>여서<b style="font-size:30px">공</b>부하자</span>
    </a>
    </section>

    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top" role="navigation">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button" id="toggle">
        <span class="sr-only">Toggle navigation</span>
      </a>
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- Messages: style can be found in dropdown.less-->
          <li class="dropdown messages-menu">
            <!-- Menu toggle button -->
            <a>
              <i class="fa fa-envelope-o"></i>
              <span class="label label-success">${messageCount}</span>
            </a>
          </li>
          <!-- /.messages-menu -->
          <!-- User Account Menu -->
          <li class="dropdown user user-menu">
            <!-- Menu Toggle Button -->
            <a>
              <img src='${pageContext.request.contextPath}${sessionScope.userDTO.path}' class="user-image" alt="User Image">
              <span class="hidden-xs">${sessionScope.userDTO.name}</span>
            </a>
          </li>
         <!-- Control Sidebar Toggle Button -->
          <li>
            <a href="#" id="rightSide" data-toggle="control-sidebar" ><i class="fa  fa-bar-chart"></i></a>
          </li>
        </ul>
      </div>
    </nav>
  </header>
  <!-- ***********왼쪽 사이드바********** -->
  <aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

      <!-- Sidebar user panel (optional) -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="${pageContext.request.contextPath}${sessionScope.userDTO.path}" class="img-circle" alt="User Image" style="height:50px">
        </div>
        <div class="pull-left info">
          <p>${sessionScope.userDTO.name}</p>
          <!-- Status -->
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">Study Menu</li>
        <!-- Optionally, you can add icons to the links -->
        <li class="active" id="sideMain"><a id="main" href="#"><i class="fa fa-pencil-square-o"></i> <span>스터디 메인</span></a></li>
        <li id="sideSchedule"><a id="schedule" href="#"><i class="fa fa-calendar"></i> <span>스터디 일정</span></a></li>
        <li id="sideTask"><a id="task" href="#"><i class="fa fa-calendar"></i> <span>Task 관리</span></a></li>
        <li id="sideChatting"><a href="#" id="chatting"><i class="fa fa-wechat"></i> <span>채팅</span></a></li>
        <li id="sideBoard"><a href="#" id="board"><i class="fa fa-list"></i> <span>게시판</span></a></li>
        <c:choose>
        	<c:when test="${requestScope.memberGrade eq '0146'}">
        		<li id="sideMemberAdmin"><a href="#" id="memberAdmin"><i class="fa fa-cog"></i> <span>맴버 관리</span></a></li>
        	</c:when>
        </c:choose>
      </ul>
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Main content -->
    <section class="content container-fluid">

      <!--------------------------
        | Your Page Content Here |
        -------------------------->
         
         <iframe src="${pageContext.request.contextPath}/member/study/task/main?studyCode=${studyCode}" id="iframe" width="100%" height="1500px" frameborder="0" scrolling="no"></iframe>
         
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Main Footer -->
  <footer class="main-footer">
    <!-- To the right -->
    <div class="pull-right hidden-xs">
      Anything you want
    </div>
    <!-- Default to the left -->
    <strong>Copyright &copy; 2016 <a href="#">Company</a>.</strong> All rights reserved.
  </footer>
  
  
 <!-- **** 오른쪽 사이드 바 **** -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Create the tabs -->
    <!-- Tab panes -->
    <div class="tab-content" id="rightTab">
      <!-- Home tab content -->
      <div class="tab-pane active" id="control-sidebar-home-tab">
        <h3 class="control-sidebar-heading">진행 상황</h3>
        
        <!-- 차트 -->
      <div id="container" style="min-width: 210px; height: 300px; max-width: 400px; margin: 0 auto"></div>       
        
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:void(0)" id="progress1">
              <h4 class="control-sidebar-subheading">
                완료(<span id="doneSp"></span>)
                <span id="doneSpan" class="label label-info pull-right"></span>
              </h4>

              <div class="progress progress-xxs">
                <div id="doneProgress" class="progress-bar progress-bar-danger" style="width: 25%"></div>
              </div>
            </a>
          </li>
          
          <li>
            <a href="javascript:void(0)" id="progress3">
              <h4 class="control-sidebar-subheading">
                계획됨(<span id="todoSp"></span>)
                <span id="todoSpan" class="label label-warning pull-right"></span>
              </h4>

              <div class="progress progress-xxs">
                <div id="todoProgress" class="progress-bar progress-bar-warning" style="width: 25%"></div>
              </div>
            </a>
          </li>
          <li>
            <a href="javascript:void(0)" id="progress4">
              <h4 class="control-sidebar-subheading">
                진행중(<span id="doingSp"></span>)
                <span id="doingSpan" class="label label-primary pull-right"></span>
              </h4>

              <div class="progress progress-xxs">
                <div id="doingProgress" class="progress-bar progress-bar-primary" style="width: 25%"></div>
              </div>
            </a>
          </li>
        </ul>
        <br>
        <h3 class="control-sidebar-heading">해야할 일</h3>
        
           <!-- 차트 2 -->
           <div id="container2" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
      </div>
     </div>
    </div>
  </aside>
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- REQUIRED JS SCRIPTS -->

<!-- jQuery 3.1.1 -->
 <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
 <!-- Bootstrap 3.3.7 -->
 <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath}/resources/dist/js/adminlte.min.js"></script>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>

<script type="text/javascript">
   $(function () {
      // Build the chart
       Highcharts.chart('container', {
           chart: {
               plotBackgroundColor: null,
               plotBorderWidth: null,
               plotShadow: false,
               type: 'pie'
           },
           credits:{
              enabled: false
           },
           exporting:{
              enabled: false
           },
           title: {
               text: ''
           },
           tooltip: {
               pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
           },
           plotOptions: {
               pie: {
                   allowPointSelect: true,
                   cursor: 'pointer',
                   dataLabels: {
                       enabled: false
                   },
                   showInLegend: true
               }
           },
           series: [{
               name: '진행률',
               colorByPoint: true,
               data: [{
                   name: '완료',
                   color:'#51a8ff',
                   y: 25
               }, {
                   name: '마감일 지남',
                   color:'#fd6a6a',
                   y: 25,
                   sliced: true,
                   selected: true
               }, {
                   name: '계획됨',
                   color:'#f9c62d',
                   y: 25
               }, {
                   name: '마감일 없음',
                   color:'#c0c0c0',
                   y: 25
               }]
           }]
       });
      
      
   })

   $(function () {
      
         $("#rightSide").click(function () {
         $.ajax({
            url: "${pageContext.request.contextPath}/member/study/task/chartResult",
            data: "${_csrf.parameterName}=${_csrf.token}&studyCode=${studyCode}",
            type:"post",
            dataType:"json",
            success: function (result) {
               
               var done = parseInt(result.done)/(parseInt(result.done)+parseInt(result.todo)+parseInt(result.doing))*100;
                var doing = parseInt(result.doing)/(parseInt(result.done)+parseInt(result.todo)+parseInt(result.doing))*100;
                var todo = parseInt(result.todo)/(parseInt(result.done)+parseInt(result.todo)+parseInt(result.doing))*100;
               
               var colors = Highcharts.getOptions().colors,
               categories = ['To Do', 'Doing', 'Done'],
               data = [{
                  
                   color: "#f39c12",
                   drilldown: {
                       name: '계획됨(To Do)',
                       categories: ['계획됨(To Do)'],
                       data: [todo/(done+todo+doing)*100],
                       color: "#f39c12"
                   }
               }, {
                
                   color: "#ff00ff",
                   drilldown: {
                       name: '진행중(Doing)',
                       categories: ['진행중(Doing)'],
                       data: [doing/(done+todo+doing)*100],
                       color: colors[1]
                   }
               }, {
                   
                   color: colors[1],
                   drilldown: {
                       name: '완료(Done)',
                       categories: ['완료(Done)'],
                       data: [done/(done+todo+doing)*100],
                       color: colors[2]
                   }
               }],
               browserData = [],
               versionsData = [],
               i,
               j,
               dataLen = data.length,
               drillDataLen,
               brightness; //var 선언 끝


               //Build the data arrays
               for (i = 0; i < dataLen; i += 1) {
               // add version data
               drillDataLen = data[i].drilldown.data.length;
               for (j = 0; j < drillDataLen; j += 1) {
                   brightness = 0.2 - (j / drillDataLen) / 5;
                   versionsData.push({
                       name: data[i].drilldown.categories[j],
                       y: data[i].drilldown.data[j],
                       color: Highcharts.Color(data[i].color).brighten(brightness).get()
                   });
               }
               }
               // Create the chart
               Highcharts.chart('container', {
                   chart: {
                       type: 'pie'
                   },
                  credits:{
                      enabled: false
                  },
                  exporting:{
                     enabled: false
                  },
                   title: {
                       text: ''
                   },
                   plotOptions: {
                       pie: {
                           shadow: false,
                           center: ['50%', '50%']
                       }
                   },
                   tooltip: {
                       valueSuffix: '%'
                   },
                   series: [{
                       name: '진행률',
                       data: versionsData,
                       size: '60%',
                       innerSize: '70%',
                      
                   }]
               }); //하이차트 끝
                   
                   $("#doneSpan").text(done.toFixed(1)+"%");
                   $("#doneSp").text(result.done);
                   $("#doneProgress").css('width',done+'%');
                   $("#doingSpan").text(doing.toFixed(1)+"%");
                   $("#doingSp").text(result.doing);
                   $("#doingProgress").css('width',doing+'%');
                   $("#todoSpan").text(todo.toFixed(1)+"%");
                   $("#todoSp").text(result.todo);
                   $("#todoProgress").css('width',todo+'%');
                 
                //막대차트 시작
                   Highcharts.chart('container2', {

                       chart: {
                           type: 'column'
                       },

                       title: {
                           text: ''
                       },
                       exporting:{
                        enabled: false
                     },
                       legend: {
                           align: 'right',
                           verticalAlign: 'middle',
                           layout: 'vertical'
                       },

                       xAxis: {
                           categories: ['오늘까지', '이번 주까지', '이번 달까지','마감일 없음','마감일 지남','이번 달 이후'],
                           labels: {
                               x: -10
                           }
                       },

                       yAxis: {
                           allowDecimals: false,
                           title: {
                               text: 'Amount'
                           }
                       },

                       series: [{
                           name: '계획됨(To Do)',
                           data: [result.todaytodo,result.weektodo,result.monthtodo,result.noendtodo,result.endtodo,result.aftertodo]
                       }, {
                           name: '진행중(Doing)',
                           data: [result.todaydoing, result.weekdoing, result.monthdoing,result.noenddoing,result.enddoing,result.afterdoing]
                       }],

                       responsive: {
                           rules: [{
                               condition: {
                                   maxWidth: 500
                               },
                               chartOptions: {
                                   legend: {
                                       align: 'center',
                                       verticalAlign: 'bottom',
                                       layout: 'horizontal'
                                   },
                                   yAxis: {
                                       labels: {
                                           align: 'left',
                                           x: 0,
                                           y: -5
                                       },
                                       title: {
                                           text: null
                                       }
                                   },
                                   subtitle: {
                                       text: null
                                   },
                                   credits: {
                                       enabled: false
                                   }
                               }
                           }]
                       }
                   });
               
                   
            },//success 끝
            error: function (err) {
               alert("chart Ajax Error");
            }
         }); //ajax 끝
      });
      
     
      
       $("#task").click(function() {
         $("#iframe").attr('src','${pageContext.request.contextPath}/member/study/task?studyCode=${studyCode}');
         $("#sideTask").attr('class','active');
         $("#sideMain").attr('class','');
         $("#sideSchedule").attr('class','');
         $("#sideBoard").attr('class','');
         $("#sideChatting").attr('class','');
         $("#sideMemberAdmin").attr('class','');
      })
      $("#main").click(function() {
         $("#iframe").attr('src','${pageContext.request.contextPath}/member/study/task/main?studyCode=${studyCode}');
         $("#sideTask").attr('class','');
         $("#sideMain").attr('class','active');
         $("#sideSchedule").attr('class','');
         $("#sideBoard").attr('class','');
         $("#sideChatting").attr('class','');
         $("#sideMemberAdmin").attr('class','');
      })
	$("#sideSchedule").click(function () {
		$("#iframe").attr('src','${pageContext.request.contextPath}/member/study/schedule?studyCode=${studyCode}');
		$("#sideSchedule").attr('class','active');
		$("#sideTask").attr('class','');
		$("#sideMain").attr('class','');
		$("#sideBoard").attr('class','');
		$("#sideChatting").attr('class','');
		$("#sideMemberAdmin").attr('class','');
	  })
	  $("#chatting").click(function() {
			$("#iframe").attr('src','${pageContext.request.contextPath}/member/study/chatting?studyCode=${studyCode}');
			$("#sideTask").attr('class','');
			$("#sideMain").attr('class','');
			$("#sideSchedule").attr('class','');
			$("#sideBoard").attr('class','');
			$("#sideChatting").attr('class','active');
			$("#sideMemberAdmin").attr('class','');
		})
	  $("#board").click(function () {
		$("#iframe").attr('src','${pageContext.request.contextPath}/member/study/board/selectAll?studyCode=${studyCode}');
		$("#sideBoard").attr('class','active');
		$("#sideSchedule").attr('class','');
		$("#sideTask").attr('class','');
		$("#sideMain").attr('class','');
		$("#sideChatting").attr('class','');
		$("#sideMemberAdmin").attr('class','');
	  })
	  $("#memberAdmin").click(function () {
		$("#iframe").attr('src','${pageContext.request.contextPath}/member/study/memberAdmin?studyCode=${studyCode}');
		$("#sideBoard").attr('class','');
		$("#sideSchedule").attr('class','');
		$("#sideTask").attr('class','');
		$("#sideMain").attr('class','');
		$("#sideChatting").attr('class','');
		$("#sideMemberAdmin").attr('class','active');
	  })
   })

</script>


</body>
</html>
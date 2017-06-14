<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-envelope-o"></i>
              <span class="label label-success">4</span>
            </a>
            <ul class="dropdown-menu">
              <li class="header">You have 4 messages</li>
              <li>
                <!-- inner menu: contains the messages -->
                <ul class="menu">
                  <li><!-- start message -->
                    <a href="#">
                      <div class="pull-left">
                        <!-- User Image -->
                        <img src="${pageContext.request.contextPath}/resources/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                      </div>
                      <!-- Message title and timestamp -->
                      <h4>
                        Support Team
                        <small><i class="fa fa-clock-o"></i> 5 mins</small>
                      </h4>
                      <!-- The message -->
                      <p>Why not buy a new awesome theme?</p>
                    </a>
                  </li>
                  <!-- end message -->
                </ul>
                <!-- /.menu -->
              </li>
              <li class="footer"><a href="#">See All Messages</a></li>
            </ul>
          </li>
          <!-- /.messages-menu -->

          <!-- Notifications Menu -->
          <li class="dropdown notifications-menu">
            <!-- Menu toggle button -->
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-bell-o"></i>
              <span class="label label-warning">10</span>
            </a>
            <ul class="dropdown-menu">
              <li class="header">You have 10 notifications</li>
              <li>
                <!-- Inner Menu: contains the notifications -->
                <ul class="menu">
                  <li><!-- start notification -->
                    <a href="#">
                      <i class="fa fa-users text-aqua"></i> 5 new members joined today
                    </a>
                  </li>
                  <!-- end notification -->
                </ul>
              </li>
              <li class="footer"><a href="#">View all</a></li>
            </ul>
          </li>
          <!-- Tasks Menu -->
          <li class="dropdown tasks-menu">
            <!-- Menu Toggle Button -->
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-flag-o"></i>
              <span class="label label-danger">9</span>
            </a>
            <ul class="dropdown-menu">
              <li class="header">You have 9 tasks</li>
              <li>
                <!-- Inner menu: contains the tasks -->
                <ul class="menu">
                  <li><!-- Task item -->
                    <a href="#">
                      <!-- Task title and progress text -->
                      <h3>
                        Design some buttons
                        <small class="pull-right">20%</small>
                      </h3>
                      <!-- The progress bar -->
                      <div class="progress xs">
                        <!-- Change the css width attribute to simulate progress -->
                        <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar"
                             aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">20% Complete</span>
                        </div>
                      </div>
                    </a>
                  </li>
                  <!-- end task item -->
                </ul>
              </li>
              <li class="footer">
                <a href="#">View all tasks</a>
              </li>
            </ul>
          </li>
          <!-- User Account Menu -->
          <li class="dropdown user user-menu">
            <!-- Menu Toggle Button -->
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <!-- The user image in the navbar-->
              <img src="${pageContext.request.contextPath}/resources/dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
              <!-- hidden-xs hides the username on small devices so only the image appears. -->
              <span class="hidden-xs">Alexander Pierce</span>
            </a>
            <ul class="dropdown-menu">
              <!-- The user image in the menu -->
              <li class="user-header">
                <img src="${pageContext.request.contextPath}/resources/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">

                <p>
                  Alexander Pierce - Web Developer
                  <small>Member since Nov. 2012</small>
                </p>
              </li>
              <!-- Menu Body -->
              <li class="user-body">
                <div class="row">
                  <div class="col-xs-4 text-center">
                    <a href="#">Followers</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">Sales</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">Friends</a>
                  </div>
                </div>
                <!-- /.row -->
              </li>
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="#" class="btn btn-default btn-flat">Profile</a>
                </div>
                <div class="pull-right">
                  <a href="#" class="btn btn-default btn-flat">Sign out</a>
                </div>
              </li>
            </ul>
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
          <img src="${pageContext.request.contextPath}/resources/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>Alexander Pierce</p>
          <!-- Status -->
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">Study Menu</li>
        <!-- Optionally, you can add icons to the links -->
        <li class="active" id="sideMain"><a id="main" href="#"><i class="fa fa-link"></i> <span>스터디 메인</span></a></li>
        <li><a href="#"><i class="fa fa-link"></i> <span>스터디 일정</span></a></li>
        <li id="sideTask"><a id="task" href="#"><i class="fa fa-link"></i> <span>Task 관리</span></a></li>
        <li><a href="#"><i class="fa fa-link"></i> <span>채팅</span></a></li>
        <li><a href="#"><i class="fa fa-link"></i> <span>게시판</span></a></li>
        <li><a href="#"><i class="fa fa-link"></i> <span>맴버 관리</span></a></li>
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
         
         <iframe src="${pageContext.request.contextPath}/member/study/task/main" id="iframe" width="100%" height="1500px" frameborder="0" scrolling="no"></iframe>
         
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
      
   		$("#rightSide").click(function () {
			$.ajax({
				url: "${pageContext.request.contextPath}/member/study/task/chartResult",
				type:"post",
				dataType:"json",
				success: function (result) {
					var colors = Highcharts.getOptions().colors,
					categories = ['To Do', 'Doing', 'Done'],
					data = [{
					   
					    color: "#f39c12",
					    drilldown: {
					        name: '계획됨',
					        categories: ['계획됨'],
					        data: [result.todo/(result.done+result.todo+result.doing)*100],
					        color: "#f39c12"
					    }
					}, {
					 
					    color: "#ff00ff",
					    drilldown: {
					        name: '진행중',
					        categories: ['진행중'],
					        data: [result.doing/(result.done+result.todo+result.doing)*100],
					        color: colors[1]
					    }
					}, {
					    
					    color: colors[1],
					    drilldown: {
					        name: '완료',
					        categories: ['완료'],
					        data: [result.done/(result.done+result.todo+result.doing)*100],
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
				       var done = result.done/(result.done+result.todo+result.doing)*100;
				       var doing = result.doing/(result.done+result.todo+result.doing)*100;
				       var todo = result.todo/(result.done+result.todo+result.doing)*100;
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
				    	        categories: ['오늘까지', '이번 주까지', '이번 달까지','마감일 없음','마감일 지남'],
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
				    	        data: [result.todaytodo,result.weektodo,result.monthtodo,result.noendtodo,result.endtodo]
				    	    }, {
				    	        name: '진행중(Doing)',
				    	        data: [result.todaydoing, result.weekdoing, result.monthdoing,result.noenddoing,result.enddoing]
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
         $("#iframe").attr('src','${pageContext.request.contextPath}/member/study/task');
         $("#sideTask").attr('class','active');
         $("#sideMain").attr('class','');
      })
      $("#main").click(function() {
         $("#iframe").attr('src','${pageContext.request.contextPath}/member/study/task/main');
         $("#sideTask").attr('class','');
         $("#sideMain").attr('class','active');
      })
   })

</script>


</body>
</html>
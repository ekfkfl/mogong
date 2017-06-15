<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
  <!-- daterange picker -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/daterangepicker.css">
  <!-- Select2 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/select2.min.css">  
  <!-- Theme style -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/dist/css/AdminLTE.css">
  <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
        page. However, you can choose any other skin. Make sure you
        apply the skin class to the body tag so the changes take effect. -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/dist/css/skins/skin-blue.css">
	
  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
	
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/sockjs.js"></script>
	
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
		})
	
	</script>
	<style>
  		#todo, #doing,#done {
    		border: 1px dashed #eee;
    		min-height: 40px;
  		}
  	</style>
</head>
<body>
<input type="hidden" name="studyCode" id="studyCode" value="6"/>
    <section class="content-header">
      <h1>
        Chatting
        <small>멤버들과 이야기를 나눌 수 있습니다.</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Study</a></li>
        <li class="active">Task</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content container-fluid">
    	<div class="col-md-8">
            <!-- DIRECT CHAT PRIMARY -->
            <div class="box box-primary direct-chat direct-chat-primary">
              <div class="box-header with-border">
                <h3 class="box-title">Direct Chat</h3>
                <div class="box-tools pull-right">
                  <span data-toggle="tooltip" title="3 New Messages" class="badge bg-light-blue">3</span>
                  <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                  <button class="btn btn-box-tool" data-toggle="tooltip" title="Contacts" data-widget="chat-pane-toggle"><i class="fa fa-comments"></i></button>
                  <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                </div>
              </div><!-- /.box-header -->
              <div class="box-body">
                <!-- Conversations are loaded here -->
                <div class="direct-chat-messages">
                  <!-- Message. Default to the left -->
                  <div class="direct-chat-msg">
                    <div class="direct-chat-info clearfix">
                      <span class="direct-chat-name pull-left">Alexander Pierce</span>
                      <span class="direct-chat-timestamp pull-right">23 Jan 2:00 pm</span>
                    </div><!-- /.direct-chat-info -->
                    <img class="direct-chat-img" src="../dist/img/user1-128x128.jpg" alt="message user image"><!-- /.direct-chat-img -->
                    <div class="direct-chat-text">
                      Is this template really for free? That's unbelievable!
                    </div><!-- /.direct-chat-text -->
                  </div><!-- /.direct-chat-msg -->

                  <!-- Message to the right -->
                  <div class="direct-chat-msg right">
                    <div class="direct-chat-info clearfix">
                      <span class="direct-chat-name pull-right">Sarah Bullock</span>
                      <span class="direct-chat-timestamp pull-left">23 Jan 2:05 pm</span>
                    </div><!-- /.direct-chat-info -->
                    <img class="direct-chat-img" src="../dist/img/user3-128x128.jpg" alt="message user image"><!-- /.direct-chat-img -->
                    <div class="direct-chat-text">
                      You better believe it!
                    </div><!-- /.direct-chat-text -->
                  </div><!-- /.direct-chat-msg -->
                </div><!--/.direct-chat-messages-->

                <!-- Contacts are loaded here -->
                <div class="direct-chat-contacts">
                  <ul class="contacts-list">
                    <li>
                      <a href="#">
                        <img class="contacts-list-img" src="../dist/img/user1-128x128.jpg" alt="Contact Avatar">
                        <div class="contacts-list-info">
                          <span class="contacts-list-name">
                            Count Dracula
                            <small class="contacts-list-date pull-right">2/28/2015</small>
                          </span>
                          <span class="contacts-list-msg">How have you been? I was...</span>
                        </div><!-- /.contacts-list-info -->
                      </a>
                    </li><!-- End Contact Item -->
                  </ul><!-- /.contatcts-list -->
                </div><!-- /.direct-chat-pane -->
              </div><!-- /.box-body -->
              <div class="box-footer">
                <form action="#" method="post">
                  <div class="input-group">
                    <input type="text" name="message" placeholder="Type Message ..." class="form-control">
                    <span class="input-group-btn">
                      <button type="button" class="btn btn-primary btn-flat">Send</button>
                    </span>
                  </div>
                </form>
              </div><!-- /.box-footer-->
            </div><!--/.direct-chat -->
          </div><!-- /.col -->
    </section>
    <!-- /.content -->
  <!-- /.content-wrapper -->
		

<!-- jQuery 3.1.1 -->
 <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
 <!-- jQuery UI 1.11.4 -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 <!-- Bootstrap 3.3.7 -->
 <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath}/resources/dist/js/adminlte.min.js"></script>
<!-- taskmain.js -->
<script src="${pageContext.request.contextPath}/resources/js/taskmain.js"></script>

<script src="${pageContext.request.contextPath}/resources/js/sockjs.js"></script>
	
	<script type="text/javascript">
		var sock = null;
		
		$(document).ready(function(){
			
			sock = new SockJS("/mogong/echo-ws");
		   /*sock.onopen=function(){
				sock.send("반갑?");
			}
			
			sock.onclose= function(){
				sock.send("10.255.152.165 퇴장");
			} */
			sock.onmessage = function(evt){
				$("#chatMessage").append(evt.data+"<br/>");
			}
			
			$("#sendMessage").click(function(){
				if($("#message").val() != ""){
					sock.send($("#message").val());
					/* $("#chatMessage").append("나->"+$("#message").val()+"<br/>"); */
					$("#message").val("");
				}
			})
			
		})
		
	</script>
	
</body>
</html>
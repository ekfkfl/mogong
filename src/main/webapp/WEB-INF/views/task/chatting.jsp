<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
	 
	$(document).ready(function(){
        $("#sendMessage").click(function(){
            
        	var str = $.trim($('#message').val())
        	if(str==""){
            	$('#message').focus()
            	return
            }else{
            	sendMessage();
            }
        });
        
        $("#message").keydown(function (key) {
            if (key.keyCode == 13) {
               $("#sendMessage").click();
            }
         });
        
    });
	
	//websocket을 지정한 URL로 연결
    var sock= new SockJS("<c:url value="/echo-ws"/>");
    //websocket 서버에서 메시지를 보내면 자동으로 실행된다.
    sock.onmessage = onMessage;
    //websocket 과 연결을 끊고 싶을때 실행하는 메소드
    sock.onclose = onClose;
	
   
    function sendMessage(){
        //websocket으로 메시지를 보내겠다.
        var date = new Date();
        
        var presentDate = (date.getMonth()+1)+"월 "+date.getDate()+"일 "+addZero(date.getHours())+":"+addZero(date.getMinutes())
     
        var message = $('#message').val()
        
        sock.send("${requestScope.sessionId}"+","+$("#message").val()+","+presentDate+","+"${requestScope.sessionPhoto}");
        $("#chatMessage").append(
	    		"<div class='direct-chat-msg right'>"+
                "<div class='direct-chat-info clearfix'>"+
                 "<span class='direct-chat-name pull-right'>"+"${requestScope.sessionId}"+"</span>"+
                 "<span class='direct-chat-timestamp pull-left'>"+presentDate+"</span>"+
                "</div>"+
                "<img class='direct-chat-img' src='${requestScope.sessionPhoto}' alt='message user image'>"+
                "<div class='direct-chat-text'>"+
                $("#message").val()+
                "</div>"+
         		"</div>"
	    		);
        $("#message").val("");
        $("#chatMessage").scrollTop($("#chatMessage")[0].scrollHeight);
        $.ajax({
  			  url: "${pageContext.request.contextPath}/member/task/fileSave" , //서버 요청 이름(주소)
  			  type: "get" ,//method방식(get, post)
  			  data: "sessionId=${requestScope.sessionId}&message="+message+"&date="+presentDate+"&photo=${requestScope.sessionPhoto}" ,//서버에게 보낼 parameter 정보
  			  success: function(result){
  				 
  			  }
        })
        
	}
        
	//evt 파라미터는 websocket이 보내준 데이터다.
	function onMessage(evt){  //변수 안에 function자체를 넣음.
	    var data = evt.data;
		var dataContent = data.split(',');
	    $("#chatMessage").append(
	    		"<div class='direct-chat-msg'>"+
                "<div class='direct-chat-info clearfix'>"+
                 "<span class='direct-chat-name pull-left'>"+dataContent[0]+"</span>"+
                 "<span class='direct-chat-timestamp pull-right'>"+dataContent[2]+"</span>"+
                "</div>"+
                "<img class='direct-chat-img' src='"+dataContent[3]+"' alt='message user image'>"+
                "<div class='direct-chat-text'>"+
                 dataContent[1]+
                "</div>"+
         		"</div>"
	    		);
	    $("#chatMessage").scrollTop($("#chatMessage")[0].scrollHeight);
	    /* sock.close(); */
	     /* $.ajax({
  			  url: "${pageContext.request.contextPath}/member/task/fileSave" , //서버 요청 이름(주소)
  			  type: "get" ,//method방식(get, post)
  			  data: "sessionId="+dataContent[0]+"&message="+dataContent[1]+"&date="+dataContent[2]+"&photo="+dataContent[3] ,//서버에게 보낼 parameter 정보
  			  success: function(result){
  				  
  			  }
        	}) */
	}
	
	function onClose(evt){
	    $("#chatMessage").append("연결 끊김");
	}
	
	function addZero(i) {
	    if (i < 10) {
	        i = "0" + i;
	    }
	    return i;
	}
    
	function scroll(){
		$("#chatMessage").scrollTop($("#chatMessage")[0].scrollHeight);
	}
		
	</script>
</head>
<body onload="scroll()">
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
              </div><!-- /.box-header -->
              <div class="box-body">
                <!-- Conversations are loaded here -->
                <div class="direct-chat-messages" id=chatMessage style="overflow:auto; height:500px" >
                <c:choose>
                	<c:when test="${empty chatList}">
                	
                	</c:when>
                	<c:otherwise>
                		<c:forEach items="${chatList}" var="chatList">
                			<c:choose>
                				<c:when test="${chatList.sessionId eq requestScope.sessionId }">
                					<div class='direct-chat-msg right'>
						                <div class='direct-chat-info clearfix'>
							                <span class='direct-chat-name pull-right'>${chatList.sessionId}</span>
							                <span class='direct-chat-timestamp pull-left'>${chatList.date}</span>
						                </div>
						                <img class='direct-chat-img' src='${chatList.path}' alt='message user image'>
						                <div class='direct-chat-text'>${chatList.content}</div>
					         		</div>
                				</c:when>
                				<c:otherwise>
                					<div class='direct-chat-msg'>
						                <div class='direct-chat-info clearfix'>
							                <span class='direct-chat-name pull-left'>${chatList.sessionId}</span>
							                <span class='direct-chat-timestamp pull-right'>${chatList.date}</span>
						                </div>
						                <img class='direct-chat-img' src='${chatList.path}' alt='message user image'>
						                <div class='direct-chat-text'>${chatList.content}</div>
					         		</div>
                				</c:otherwise>
                			</c:choose>
                		</c:forEach>
                	</c:otherwise>
                </c:choose>
                </div><!-- /.box-body -->
              <div class="box-footer">
                  <div class="input-group" id="sendDiv">
                    <input type="text" name="message" id="message" placeholder="Type Message ..." class="form-control">
                    <span class="input-group-btn">
                      <button type="button" id="sendMessage" class="btn btn-primary btn-flat">Send</button>
                    </span>
                  </div>
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
	
	
	
</body>
</html>
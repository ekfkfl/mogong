<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/sockjs.js"></script>
	
	<script type="text/javascript">
	$(document).ready(function(){
        $("#sendMessage").click(function(){
            sendMessage();
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
        sock.send($("#message").val());
        $("#message").val("");
    
	}
        
	//evt 파라미터는 websocket이 보내준 데이터다.
	function onMessage(evt){  //변수 안에 function자체를 넣음.
	    var data = evt.data;
	    $("#chatMessage").append(data+"<br/>");
	    /* sock.close(); */
	}
	
	function onClose(evt){
	    $("#chatMessage").append("연결 끊김");
	}

    
		
	</script>

</head>
<body>
<h1>test Chatting 입니다</h1>
<input type="text" id="message">
<input type="button" id="sendMessage" value="메세지 보내기" >

<div id="chatMessage" style="overflow: auto; max-height: 500px"></div>

</body>
</html>
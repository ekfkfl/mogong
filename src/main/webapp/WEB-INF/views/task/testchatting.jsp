<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.0.min.js"></script>
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

</head>
<body>
<h1>test Chatting 입니다</h1>
<input type="text" id="message">
<input type="button" id="sendMessage" value="메세지 보내기" >

<div id="chatMessage" style="overflow: auto; max-height: 500px"></div>

</body>
</html>
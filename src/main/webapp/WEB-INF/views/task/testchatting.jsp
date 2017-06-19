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
	//websocket�� ������ URL�� ����
    var sock= new SockJS("<c:url value="/echo-ws"/>");
    //websocket �������� �޽����� ������ �ڵ����� ����ȴ�.
    sock.onmessage = onMessage;
    //websocket �� ������ ���� ������ �����ϴ� �޼ҵ�
    sock.onclose = onClose;
	
    
    function sendMessage(){
        //websocket���� �޽����� �����ڴ�.
        sock.send($("#message").val());
        $("#message").val("");
    
	}
        
	//evt �Ķ���ʹ� websocket�� ������ �����ʹ�.
	function onMessage(evt){  //���� �ȿ� function��ü�� ����.
	    var data = evt.data;
	    $("#chatMessage").append(data+"<br/>");
	    /* sock.close(); */
	}
	
	function onClose(evt){
	    $("#chatMessage").append("���� ����");
	}

    
		
	</script>

</head>
<body>
<h1>test Chatting �Դϴ�</h1>
<input type="text" id="message">
<input type="button" id="sendMessage" value="�޼��� ������" >

<div id="chatMessage" style="overflow: auto; max-height: 500px"></div>

</body>
</html>
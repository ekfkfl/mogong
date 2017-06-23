<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="kosta.web.mogong.util.CodeUtil" %>
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
  <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
        page. However, you can choose any other skin. Make sure you
        apply the skin class to the body tag so the changes take effect. -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/dist/css/skins/skin-blue.css">
<!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
	<!-- jQuery 3.1.1 -->
 <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		recvMailsList()
		
		$("#check_all").click(function() {
			  $("input[name=messageCode]:checkbox").prop("checked", "checked");
			});
		$("#uncheck_all").click(function() {
			  $("input[name=messageCode]:checkbox").removeProp("checked");
			});
		
		
		$("#div_content").on("click","#delete",function(){
			var val = checkedValuesGet()
			 $.ajax({
				  url: "${pageContext.request.contextPath}/member/mypage/delete" , //서버 요청 이름(주소)
				  type: "post" ,//method방식(get, post)
				  data: "messageCode="+val ,//서버에게 보낼 parameter 정보
				  success: function(){
					  $(':checkbox[name=messageCode]:checked').parent().parent().remove();
				  }
			  }); 
		})
		
		$(document).on("click","#agree",function(){
			var studyCode = $(this).attr("name");
			$.ajax({
					url : "${pageContext.request.contextPath}/member/mypage/inviteAgree" ,
					type: "post",
					dataType: "json",
					data: "studyCode="+studyCode ,
					success: function(result){
						recvMailsList()
					}
				}) 
		})
		
		$(document).on("click","#rejection", function(){
			var idAndStudyCode = $(this).attr("name");
			$.ajax({
				url : "${pageContext.request.contextPath}/member/mypage/inviteRejection" ,
				type: "post",
				dataType: "json",
				data: "idAndStudyCode="+idAndStudyCode ,
				success: function(result){
					recvMailsList()
				}
			}) 
		})
		
	})
	
	function checkedValuesGet() {
		var chked_val = "";
		  $(":checkbox[name='messageCode']:checked").each(function(pi,po){
		    chked_val += ","+po.value;
		  });
		  if(chked_val!="")chked_val = chked_val.substring(1);
		  return chked_val;
	}
	
	
	function recvMailsList(){
		$.ajax({
			  url: "${pageContext.request.contextPath}/member/mypage/recvMailsList" , //서버 요청 이름(주소)
			  type: "post" ,//method방식(get, post)
			  dataType:"json",//요청결과타입(text, html, xml, json)
			  //data:  ,//서버에게 보낼 parameter 정보
			  success: function(result){
				  var str="";
				  if(result == ""){
					  str+="<tr><td colspan='6'>"+"<p align='center'><b><span style='font-size:20pt;'>받은 쪽지가 없습니다</span></b></p>"+"</td></tr>"
				  }else{
					  $.each(result, function(index, item){
							  str+="<tr>"
			                  str+="<td><input type='checkbox' name='messageCode' value="+item.recvMessageCode+"></td>"
			                  str+="<td class='mailbox-star'>"+(index+1)+"</td>"
			                  str+="<td class='mailbox-subject'>"
			                  str+="<a href='${pageContext.request.contextPath}/member/mypage/readMail?recvMessageCode="+item.recvMessageCode+"'>"
			                  str+="<b>"+item.title+"</b></a>"
			                  str+="</td>"
			                  str+="<td class='mailbox-subject'><b>"+item.content+"</b></td>"
			                  str+="<td class='mailbox-name'>"+item.sendId+"</td>"
			                  str+="<td class='mailbox-attachment'>"+item.writeDate+"</td>"
			                  str+="<td class='mailbox-date'>"
			                  if(item.studyCode!=""){
			                	  if(item.joinStatus=='신청중'){
				                	  str+="<input type='button' name='"+item.studyCode+"' id='agree' value='수락' class='btn btn-primary btn-xs'>"
					                  str+="<input type='button' name='"+item.sendId+","+item.studyCode+"' id='rejection' value='거절' class='btn btn-primary btn-xs'>"
				                  }else{
				                	  str+="<b>"+item.joinStatus+"</b>"
				                  }
			                  }else{
			                	  str+=item.confirm
			                  }
			                  str+="</td>"
			                  str+="</tr>"
					  })
				  }
				  $("#recvList").find("tr:gt(0)").remove();
				  $("#recvList").append(str);
			  },
			  error: function(err){
				  alert("오류발생 : "+ err);
			  }
		 });
	}
	
</script>
<style type="text/css">
	a{
		color:black
	}
	
	a:hover{
		color:sky-blue
	}
</style>

</head>

<body class="hold-transition skin-blue sidebar-mini">
<!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md-12">
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">받은쪽지함</h3>

              <div class="box-tools pull-right">
                <div class="has-feedback">
                   <form name="search" id="search" action="${pageContext.request.contextPath}/member/mypage/searchRecvMail" method="post">
	                  <input type="text" class="form-control input-sm" placeholder="Search Mail" name="word" id="keyWord">
	                  <span class="glyphicon glyphicon-search form-control-feedback"></span>
                  </form>
                </div>
              </div>
              <!-- /.box-tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding" id="div_content">
            	 <div class="box-footer no-padding">
              <div class="mailbox-controls">
                <!-- Check all button -->
                <button type="button" class="btn btn-default btn-sm checkbox-toggle" id="check_all">전체선택</button>
                <button type="button" class="btn btn-default btn-sm checkbox-toggle" id="uncheck_all">전체해제</button>
                <div class="btn-group">
                  <button type="button" class="btn btn-default btn-sm" id="delete"><i class="fa fa-trash-o"></i></button>
                  <button type="button" class="btn btn-default btn-sm"><i class="fa fa-reply"></i></button>
                  <button type="button" class="btn btn-default btn-sm"><i class="fa fa-share"></i></button>
                </div>
                <!-- /.btn-group -->
                <a href="${pageContext.request.contextPath}/member/mypage/recvMail">
                <button type="button" class="btn btn-default btn-sm"><i class="fa fa-refresh"></i></button></a>
                <!-- /.pull-right -->
              </div>
            </div>
              <div class="mailbox-controls">
	              <table class="table table-hover table-striped" id="recvList">
	              <tr>
	              	<td>선택</td>
	              	<td>번호</td>
	              	<td>제목</td>
	              	<td>내용</td>
	              	<td>보낸이</td>
	              	<td>받은날짜</td>
	              	<td>확인여부</td>
	              </tr>
	             
              </table>
              <!-- /.mail-box-messages -->
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /. box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
      </div>
    </section>
    <!-- /.content -->
<!-- ./wrapper -->

<!-- REQUIRED JS SCRIPTS -->

<!-- jQuery 3.1.1 -->
 <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
 <!-- Bootstrap 3.3.7 -->
 <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath}/resources/dist/js/adminlte.min.js"></script>


</body>
</html>
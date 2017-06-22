<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<script type="text/javascript">
		$(function(){
			printMemberAll()
			
			$("#invite").click(function(){
				$("#inviteModal").modal();
			})
			
			$("#memberList").on("click","#update", function(){
				$("#updateModal").modal();
			})
			
			$("#memberList").on("click","#delete", function(){
				
				var id = $(this).attr("name");
				
				if(confirm("해당 멤버를 탈퇴하시겠습니까?")==true){
					$.ajax({
						url:"${pageContext.request.contextPath}/member/study/memberDelete",
						type: "post",
						data: "id="+id+"&studyCode="+12 ,
						success: function(result){
							$("tr[name="+id+"]").remove();
							printMemberAll()
						}
					})
				}else{
					return
				}
				
			})
			
			$("#btn1").click(function(){
				updateGrade()
			})
			
			 $("#keyWord").keyup(function(){
				 if($(this).val()==""){
					 $("#suggest").hide();
					 return;
				 }
				  $.ajax({
					  url: "${pageContext.request.contextPath}/member/study/searchID" , //서버 요청 이름(주소)
					  type: "post" ,//method방식(get, post)
					  dataType: "json",//요청결과타입(text, html, xml, json)
					  data: "keyWord="+$(this).val() ,//서버에게 보낼 parameter 정보
					  success: function(result){
						  var str="";
						  $.each(result, function(index, item){
							  str+="<a href=#>"+item+"</a><br>";
						  })
						  $("#suggest").html(str);
						  $("#suggest").show();
					  },
					  error: function(err){
						  alert("오류발생 : "+ err);
					  }
				  }); 
			  });
			
			$("#suggest").on("click", "a", function(){
				 $("#keyWord").val($(this).text());
				 $("#suggest").hide();
			});
			
			$("#idSearch").click(function(){
				var id = $("#keyWord").val()
			})
			  
		})
		
		function printMemberAll(){
			$.ajax({
				  url: "${pageContext.request.contextPath}/member/study/memberListAll" , //서버 요청 이름(주소)
				  type: "post" ,//method방식(get, post)
				  dataType: "json",//요청결과타입(text, html, xml, json)
				  //data:  ,//서버에게 보낼 parameter 정보
				  success: function(result){
					  var str="";
					  if(result == ""){
						  str+="<tr><td colspan='9'>"+"<p align='center'><b><span style='font-size:20pt;'>멤버가 없습니다</span></b></p>"+"</td></tr>"
					  }else{
						  $.each(result, function(index, item){
							  str+="<tr name='"+item.id+"'><td class='mailbox-star' value='1'>"+(index+1)+"</td>"
							  str+="<td class='mailbox-name'>"+item.id+"</td>"
							  str+="<td class='mailbox-name'><a><b>"+item.name+"</b></a></td>"
							  str+="<td class='mailbox-name'>"+item.birth+"</td>"
							  str+="<td class='mailbox-name'>"+item.gender+"</td>"
							  str+="<td class='mailbox-name'>"+item.phone+"</td>"
							  str+="<td class='mailbox-name'>"+"${CodeUtil.getCodeName("+item.memberDTO.grade+")}</td>"
							  str+="<td><input type='button' name='"+item.id+"' value='수정' id='update' class='btn btn-primary btn-xs'></td>"
							  str+="<td><input type='button' name='"+item.id+"' value='탈퇴' id='delete' class='btn btn-primary btn-xs'></td></tr>"
						  })
					  }
					  $("#memberList").find("tr:gt(0)").remove();
					  $("#memberList").append(str);
				  },
				  error: function(err){
					  alert("오류발생 : "+ err);
				  }
			 });
		}
		
		function updateGrade(){
			//스터디 코드 넘겨받을수 있으면 꼭 수정
			var grade = $(':radio[name="grade"]:checked').val();
			var id = $("#update").attr("name");
			$.ajax({
				  url: "${pageContext.request.contextPath}/member/study/updateGrade" , //서버 요청 이름(주소)
				  type: "post" ,//method방식(get, post)
				  dataType: "text",//요청결과타입(text, html, xml, json)
				  data: "grade="+grade+"&id="+id+"&studyCode="+12 ,//서버에게 보낼 parameter 정보
				  success: function(result){
					 
				  },
				  error: function(err){
					  alert("오류발생 : "+ err);
				  }
			 });
		}
	
	</script>
	
</head>
<body>
   <section class="content-header">
      <h1>
        멤버 관리
        <small>그룹장이 멤버 정보 확인 및 관리 할 수 있습니다. </small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Study</a></li>
        <li class="active">Board</li>
      </ol>
	</section>
	
	<section class="content container-fluid">
		<div class="row">
        <div class="col-md-12">
        	<!-- 초대하기 Modal -->
        	<div class="modal modal-info fade" id="inviteModal">
        		<div class="modal-dialog">
        			<div class="modal-content">
        				<!-- header -->
						<div class="modal-header">
						    <!-- 닫기(x) 버튼 -->
						  <button type="button" class="close" data-dismiss="modal">×</button>
						  <!-- header title -->
						  <h4 class="modal-title">멤버초대하기</h4>
						 </div>
						  <!-- body -->
						  <div class="modal-body">
							    <b>ID 검색</b> 
							    <input type="text" name="word" id="keyWord" style="color: black">
							   	(검색한 ID를 선택하여주세요)
							    <div id="suggest" style="display:none;">
							    </div>
						  </div>
						  <!-- Footer -->
					      <div class="modal-footer">
						  <button type="button" class="btn btn-default" data-dismiss="modal" id="idSearch">초대하기</button>
						  <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						  </div>
        			</div>
        		</div>
        	</div>
         	<!--초대하기 Modal 마지막 -->
         	
         	<!-- 수정하기 Modal -->
        	<div class="modal modal-info fade" id="updateModal">
        		<div class="modal-dialog">
        			<div class="modal-content">
        				<!-- header -->
						<div class="modal-header">
						    <!-- 닫기(x) 버튼 -->
						  <button type="button" class="close" data-dismiss="modal">×</button>
						  <!-- header title -->
						  <h4 class="modal-title">등급수정</h4>
						 </div>
						  <!-- body -->
						  <div class="modal-body">
							    <input type="radio" name="grade" value="0146">그룹장
							    <input type="radio" name="grade" value="0147" checked="checked">멤버
						  </div>
						  <!-- Footer -->
					      <div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal" id="btn1">완료</button>
						  	<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						  </div>
        			</div>
        		</div>
        	</div>
         	<!--수정하기 Modal 마지막 -->
         	
         
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">스터디 이름</h3>
              <div class="box-tools pull-right">
              	<input type="button" name="invite" value="초대하기" id="invite" class="btn btn-primary btn-xs">
              </div>
              <!-- /.box-tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding" id="div_content">
              <div class="mailbox-controls">
	              <table class="table table-hover table-striped" id="memberList">
	              <tr>
	              	<td>번호</td>
	              	<td>ID</td>
	              	<td>이름</td>
	              	<td>생년월일</td>
	              	<td>성별</td>
	              	<td>전화번호</td>
	              	<td>등급</td>
	              	<td>등급수정</td>
	              	<td>탈퇴</td>
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
		</div>
</section>
    

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
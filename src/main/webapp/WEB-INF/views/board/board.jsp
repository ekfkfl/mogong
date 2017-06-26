<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	
	<script type="text/javascript">
		$(function () {
			$("#write").click( function () {
				location.href="${pageContext.request.contextPath}/member/study/writeForm?studyCode=${studyCode}";
			});
		})	
		function fn_movePage(val) {
				$("input[name=pageNo]").val(val);
				$("form[name=form]").attr("method","get");
				$("form[name=form]").attr("action","${pageContext.request.contextPath}/member/study/board/selectAll?pageNo="+$("input[name=pageNo]").val()).submit();
			}
		function fn_search() {
			
			if($("#filed").val()==""){
				$("input[name=pageNo]").val("1");
				$("form[name=form]").attr("method","get");
				$("form[name=form]").attr("action","${pageContext.request.contextPath}/member/study/board/selectAll?pageNo="+$("input[name=pageNo]").val()).submit();
			} else{
				$("input[name=pageNo]").val("1");
				$("form[name=form]").attr("method","get");
				$("form[name=form]").attr("action","${pageContext.request.contextPath}/member/study/board/selectAll?pageNo="+$("input[name=pageNo]").val()+"&filed="+$("#filed").val()).submit();
			}
		}
	</script>
	<style type="text/css">
		th,td{text-align:center;}
		th{background:#dfdfdf;}
		li{float:left;list-style:none;margin:0 auto;}
		.number:hover{background:#eeeeee;}
	</style>
</head>
<body>
<section class="content-header">
      <h1>
        자유 게시판
        <small>공지사항 및 게시글을 올릴 수 있습니다.</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Study</a></li>
        <li class="active">Board</li>
      </ol>
</section>
    
	<section class="content container-fluid">
		 <form name="form">
		 	<input type="hidden" name="pageNo"/>
		 	<input type="hidden" name="studyCode" value="${studyCode}">
	
		 <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">&nbsp;</h3>
              <div class="box-tools pull-right">
                <div class="has-feedback">
                  <input type="text" id="filed" name="filed" onkeydown="javascript:if(event.keyCode==13){fn_search()}" class="form-control input-sm" placeholder="제목으로 검색하기">
                  <span class="glyphicon glyphicon-search form-control-feedback"></span>
                </div>
              </div>
              <!-- /.box-tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
              <div class="mailbox-controls">
                <button id="write" type="button" class="btn btn-default btn-sm checkbox-toggle">글쓰기</button>
              </div>
              <div class="table-responsive mailbox-messages">
                <table class="table table-hover table-striped">
                  <tbody>
                  <tr>
                  	<th width="5%">번호</th>
                  	<th width="40%">제목</th>
                  	<th width="10%">작성자</th>
                  	<th width="15%">작성일</th>
                  	<th width="5%">조회</th>
                  	<th width="5%">첨부</th>
                  </tr>
                  <c:forEach items="${requestScope.list}" var="dto">
                  	<tr>
                  		<c:if test="${dto.notice == '1'}">
                  			<td><button type="button" class="btn btn-block btn-danger btn-xs">공지</button></td>
                  		</c:if>
                  		<c:if test="${dto.notice=='0'}">
                  			<td>${dto.boardCode}</td>
                  		</c:if>
	                    <td><a href="${pageContext.request.contextPath}/member/study/board/selectById?boardCode=${dto.boardCode}">${dto.title}</a></td>
	                    <td>${dto.name}</td>
	                    <td>${dto.writeDate}</td>
	                    <td>${dto.hit}</td>
	                    <c:if test="${dto.fileName != null}">
	                   		<td><i class="fa fa-file-o"></i></td> 
	                    </c:if>
	                    <c:if test="${dto.fileName == null}">
	                   		<td>&nbsp;</td> 
	                    </c:if>
                    </tr>
                  
                  </c:forEach>
                  </tbody>
                </table>
                <!-- /.table -->
              </div>
              
              <!-- /.mail-box-messages -->
            </div>
          <!-- /. box -->
        </div>
        <br>
        <div id="page" style="text-align:center">
        <c:if test="${boardDTO.pageNo != 0}">
        	<c:if test="${boardDTO.pageNo > boardDTO.pageBlock}">
        		<a href="javascript:fn_movePage(${boardDTO.firstPageNo})" class="number" style="padding:15px;display:inline"><i class="fa fa-chevron-left"></i><i class="fa fa-chevron-left"></i></a>
        	</c:if>
        	<c:if test="${boardDTO.pageNo != 1}">
        		<a href="javascript:fn_movePage(${boardDTO.prevPageNo})" class="number" style="padding:15px;display:inline"><i class="fa fa-chevron-left"></i></a>
        	</c:if>
        	<span>
        		<c:forEach var="i" begin="${boardDTO.startPageNo}" end="${boardDTO.endPageNo}" step="1">
        			<c:choose>
        				<c:when test="${i eq boardDTO.pageNo}">
        					<a href="javascript:fn_movePage(${i})" class="number" style="padding:15px;display:inline">
        						<font style="font-weight:bold;">${i}</font>
        					</a>
        				</c:when>
        				<c:otherwise>
        					<a href="javascript:fn_movePage(${i})" class="number" style="padding:15px;display:inline">${i}</a>
        				</c:otherwise>			
        			</c:choose>
        		</c:forEach>
        	</span>
			<c:if test="${boardDTO.pageNo != boardDTO.finalPageNo}">
				<a href="javascript:fn_movePage(${boardDTO.nextPageNo})" class="number" style="padding:15px;display:inline"><i class="fa fa-chevron-right"></i></a>
			</c:if>
        	<c:if test="${boardDTO.endPageNo < boardDTO.finalPageNo}">
        		<a href="javascript:fn_movePage(${boardDTO.finalPageNo})" class="number" style="padding:15px;display:inline"><i class="fa fa-chevron-right"></i><i class="fa fa-chevron-right"></i></a>
        	</c:if>
        </c:if>
		
		</div>
		</form>
	</section>
</body>
</html>
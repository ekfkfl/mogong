<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/dist/css/skins/_all-skins.min.css">
	<!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
<!-- jQuery 3.1.1 -->
<script src="${pageContext.request.contextPath}/resources/plugins/jQuery/jquery-3.1.1.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="${pageContext.request.contextPath}/resources/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="${pageContext.request.contextPath}/resources/plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath}/resources/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="${pageContext.request.contextPath}/resources/dist/js/demo.js"></script>

<script type="text/javascript">
	$(function () {
		$("#btn").click(function () {
			location.href="${pageContext.request.contextPath}/member/study/board/selectAll?studyCode=${studyCode}";
		})
	})
</script>

</head>
<body>
<div class="box box-info">
            <div class="box-header">
              <h3 class="box-title">자유게시판</h3>
              <button type="button" id="btn" class="btn btn-default btn-sm pull-right">목록으로</button>
            </div>
            <!-- /.box-header -->
            <div class="box-body pad">
		<div class="col-md-6" style="width:100%">
          <!-- Box Comment -->
          <div class="box box-widget">
            <div class="box-header with-border">
              <div class="user-block">
                <img class="img-circle" src="${pageContext.request.contextPath}${boardDTO.path}" alt="User Image">
                <span class="username"><a href="#">${boardDTO.name }</a></span>
                <span class="description">${boardDTO.title} - ${boardDTO.writeDate}</span>
              </div>
              
              <!-- /.box-tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body" style="position:relative">
            <!-- Social sharing buttons -->
              <span class="pull-right text-muted">
              	<c:if test="${boardDTO.fileName != null }">
              	<a href="${pageContext.request.contextPath}/member/study/board/download?fname=${boardDTO.fileName}"><i class="fa fa-file-text-o"></i>&nbsp;&nbsp;${boardDTO.fileName}</a>
              	</c:if>
              </span>
              <br>
              ${boardDTO.content}
              <br><br><br>
            </div>
            <!-- /.box-body -->
            <c:if test="${!empty list}">
            <div class="box-footer box-comments" style="position:relative">
       
            <c:forEach items="${list}" var="dto">
              <div class="box-comment">
                <!-- User image -->
                <img class="img-circle img-sm" src="${pageContext.request.contextPath}${dto.path}" alt="User Image">

                <div class="comment-text">
                      <span class="username">
                        ${dto.name}
                        <span class="text-muted pull-right">${dto.writeDate}</span>
                      </span><!-- /.username -->
						${dto.content}                  

                </div>
              </div>
            </c:forEach>
            </div>
            </c:if>
            <!-- /.box-footer -->
            <div class="box-footer">
              <form action="${pageContext.request.contextPath}/member/study/board/selectById" method="post">
				<input type="hidden" name="boardCode" value="${boardDTO.boardCode}">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                <input type="hidden" name="flag" value="true">
                <img class="img-responsive img-circle img-sm" src="${pageContext.request.contextPath}${sessionScope.userDTO.path}" alt="Alt Text">
                <div class="img-push">
                  <input type="text" id="textbox" name="content" class="form-control input-sm" placeholder="댓글을 입력해주세요">
                </div>
              </form>
            </div>
            <!-- /.box-footer -->
          </div>
          <!-- /.box -->
        </div>
      </div>
    </div>
</body>
</html>
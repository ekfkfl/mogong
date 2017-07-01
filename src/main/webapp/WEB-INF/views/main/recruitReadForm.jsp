<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
  <!-- bootstrap wysihtml5 - text editor -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">

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
<!-- CK Editor -->
<script src="https://cdn.ckeditor.com/4.5.7/standard/ckeditor.js"></script>
<!-- Bootstrap WYSIHTML5 -->
<script src="${pageContext.request.contextPath}/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<jsp:include page="/WEB-INF/views/main/header.jsp" />

<style type="text/css">
#searchContent{
	width:75%;
	height:auto;
	margin:auto;
}
</style>
<body>
<div id="searchContent">
<section class="content-header">
      <h1>
        맴버 모집
        
      </h1>
</section>
<section class="content container-fluid">
           <div class="box box-primary">
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
              <br><br><br><br><br><br>
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
                        ${dto.id}
                        <span class="text-muted pull-right">${dto.writeDate}</span>
                      </span><!-- /.username -->
						${dto.content}                  
                </div>
              </div>
            </c:forEach>
            </div>
            </c:if>
            <br><br>
            <!-- /.box-footer -->
            <div class="box-footer">
              <form action="${pageContext.request.contextPath}/main/study/board/selectById" method="post">
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
          <button type="button" style="width:100px;height:40px" id="btn" class="btn btn-default btn-sm pull-right">목록으로</button>
          <script type="text/javascript">
          	$("#btn").click(function () {
				location.href="${pageContext.request.contextPath}/main/study/board/selectAll"
			})
          </script>
          
          <!-- /.box -->
        </div>
      </div>
           
           
           </div>
</section>
</div>
<div id="bottom-footer" class="hidden-xs">
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<div class="footer-left">
						&copy; MyBix Theme. All rights reserved
						<div class="credits">
							<!-- 
                                    All the links in the footer should remain intact. 
                                    You can delete the links only if you purchased the pro version.
                                    Licensing information: https://bootstrapmade.com/license/
                                    Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=MyBiz
                                -->
							Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
						</div>
					</div>
				</div>

				<div class="col-md-8">
					<div class="footer-right">
						<ul class="list-unstyled list-inline pull-right">
							<li><a href="#home">Home</a></li>
							<li><a href="#about">About</a></li>
							<li><a href="#service">Service</a></li>
							<li><a href="#portfolo">Portfolio</a></li>
							<li><a href="#contact">Contact</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script>
  $(function () {
    CKEDITOR.replace('editor1');
    $(".textarea").wysihtml5();
  });
  
  function checkValid() {
	var f= window.document.boardForm;
	
	if(f.title.value==""){
		alert("제목을 입력해주세요.");
		return false;
	}
	
	return true;
}
</script>

</head>
<body>
<div class="box box-info">
            <div class="box-header">
              <h3 class="box-title">글쓰기</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body pad">
            <form class="form-horizontal" method="post" name="boardForm" action="${pageContext.request.contextPath}//member/study/board/insert" enctype="multipart/form-data">
                <div class="form-group">
                  <label class="col-sm-2 control-label">제목</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" name="title" placeholder="제목">
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label">파일</label>

                  <div class="col-sm-10">
                    <input type="file" name="file">
                  </div>
                </div>
                <div class="form-group">
                  <div class="col-sm-offset-2 col-sm-10">
                    <div class="checkbox">
                      <label>
                        <input type="checkbox" name="check"> 공지글로 올리기
                      </label>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                	 <div class="col-sm-offset-2 col-sm-10">
                		<textarea id="editor1" name="content" rows="10" cols="80"></textarea>
                	</div>
                </div>
              <!-- /.box-body -->
              <div class="box-footer">
                <button type="reset" class="btn btn-default pull-right">Cancel</button>
                <button type="submit" class="btn btn-info pull-right">글쓰기</button>
              </div>
            </form>
          </div>
</body>
</html>
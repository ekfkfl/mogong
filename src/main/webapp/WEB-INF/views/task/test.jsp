<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<!-- Select2 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/select2.min.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.0.min.js"></script>
 <!-- Bootstrap 3.3.7 -->
 <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<!-- Select2 -->
<script src="${pageContext.request.contextPath}/resources/js/select2.full.min.js"></script>


</head>
<body>
<div id="someSelect"></div>
<script>
var data = [{ id: 'KOR', text: 'Korea' }, { id: 'JPN', text: 'Japan' }]; $('#someSelect').select2({ data: data, width: '100%' });
</script>
</body>
</html>
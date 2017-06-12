<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/admin/header.jsp"/>    
<jsp:include page="/WEB-INF/views/admin/sidebar.jsp"/>     


<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
<%-- <iframe name="mainContent" width="100%" height="700" frameborder="0"  src="${pageContext.request.contextPath}/admin/commCodeList"></iframe> --%>
<jsp:include page="/WEB-INF/views/admin/commCode.jsp"/>        
<!-- /.content -->
</div>  
<jsp:include page="/WEB-INF/views/admin/footer.jsp"/>   
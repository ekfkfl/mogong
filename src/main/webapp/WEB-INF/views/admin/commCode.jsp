<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="box">
	<br>
	<div class="box-header">
		<h3 class="box-title">공통코드</h3>
	</div>
	<button type="button" class="btn btn-block btn-primary"
		data-toggle="modal" data-target="#addCodeModal"
		style="width: 100px; margin: 5px">코드등록</button>
	<!-- /.box-header -->
	<div class="box-body">
		<table id="commCodeTable" class="table ">
			<thead>
				<tr>
					<th>번호</th>
					<th>코드번호</th>
					<th>코드명</th>
					<th>코드설명</th>
					<th>부모코드</th>
					<th>사용유무</th>
					<th>코드순서</th>
					<th>등록일</th>
					<th>수정일</th>
					<th>편집</th>
				</tr>
			</thead>
			<tbody>

			</tbody>
		</table>
	</div>
	<!-- /.box-body -->
</div>
<!-- /.box -->



<style>
.modal {
	text-align: center;
}

@media screen and (min-width: 868px) {
	.modal:before {
		display: inline-block;
		vertical-align: middle;
		content: " ";
		height: 100%;
	}
}

.modal-dialog {
	display: inline-block;
	text-align: left;
	vertical-align: middle;
}
</style>
<script>
$(function() {
	printCommCodeList();
	
	//공통코드 추가
	$("#saveBtn").click(function(){
		var actionName = "${pageContext.request.contextPath}/admin/insertCommCode";

		var ajaxTransData = $("#codeForm").serialize();

		$.ajax({
			url : actionName,
			type : "post",
			dataType : "text",
			data : ajaxTransData,
			success : function(result) {
				if(result>0){
					$("#cancelBtn").trigger("click");
					printCommCodeList();
				}else{
					alert("공통코드 생성에 필요한 입력값을 확인해주세요");
				}
			},
			error : function(err) {
				alert("ajax error" + err);
			}
		});

	});//공통코드 추가
})

//공통코드 출력
function printCommCodeList() {
	$.ajax({
		url : "${pageContext.request.contextPath}/admin/commCodeList",
		type : "post",
		dataType : "json",
		data : "",
		success : function(result) {
			var row = "";
			$.each(result, function(index, item) {
				var cols = "<tr>";
				cols += "<td>" + (index+1) + "</td>";
				cols += "<td>" + item.commCode + "</td>";
				cols += "<td>" + item.codeName + "</td>";
				cols += "<td>" + item.codeDesc + "</td>";
				if(item.parentCode==null){
					cols+="<td> - </td>";
				}else{ 
					cols += "<td>" + item.parentCode + "</td>";
				}
				cols += "<td>" + item.codeUsed + "</td>";
				cols += "<td>" + item.codeOrder + "</td>";
				cols += "<td>" + item.regDate + "</td>";
				if(item.updateDate==null){
					cols+="<td> - </td>";
				}else{ 
					cols+="<td>" + item.updateDate  + "</td>";
				}
				cols += "<td><a class='btn btn-xs btn-info' id='editCodeBtn' data-toggle='modal' data-target='#replaceCodeModal'><i class='fa fa-edit'></i></a> <a  class='btn btn-xs btn-danger' id='deleteCodeBtn'><i class='fa fa-trash-o'></i></a></td>";
				cols += "</tr>"
				row += cols;
			})

			$("#commCodeTable tr:gt(0)").remove();
			$("#commCodeTable").append(row);
		},
		error : function(err) {
			alert(err);
		}
	});
}

//공통코드 삭제 시작
$("#commCodeTable").on("click", "#deleteCodeBtn", function(){
	var rowNoElement=$(this).parent().parent().children().first();
	var commCode=$(rowNoElement).next().text();
	var commName=$(rowNoElement).next().next().text();
	
	var deleteKey=confirm(commName+" ("+ commCode + ") " + "해당 코드를 삭제하시겠습니까?");
	
	if(!deleteKey) return;

	 $.ajax({
		url : "${pageContext.request.contextPath}/admin/deleteCommCode",
		type : "post",
		dataType : "json",
		data : "commCode="+commCode,
		success : function(result) {
			if(result>=0){
				printCommCodeList();
			}
		},
		error : function(err) {
			alert(err);
		}
	}); 
	
}) //공통코드 삭제


</script>

<!--  공통 코드 추가 모달 다이얼로그 시작 -->
<div class="modal fade" id="addCodeModal">
	<div class="modal-dialog">
		<div class="modal-content">
		<form role="form" id="codeForm">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">코드등록</h4>
			</div>
			<div class="modal-body">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">새로운 코드를 입력합니다.</h3>
					</div>
					<!-- /.box-header -->
					<!-- form start -->
					
						<div class="box-body">
							<div class="form-group">
								<label>부모코드</label> <select class="form-control"
									name="parentCode">
									<option value="">부모코드 없음(코드 그룹 생성)</option>
									<c:forEach items="${commCodeDTOList}" var="codeDTO">
										<option value="${codeDTO.commCode}">${codeDTO.codeName}(${codeDTO.commCode})</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group">
								<label for="codeName">코드명</label> <input type="text"
									class="form-control" id="codeName" name="codeName"
									placeholder="코드의 이름을 입력하세요">
							</div>
							<div class="form-group">
								<label for="codeDesc">코드설명</label> <input type="text"
									class="form-control" id="codeDesc" name="codeDesc"
									placeholder="코드에 대한 간략한 설명을 입력하세요">
							</div>
							<div class="form-group">
								<label for="codeUsed">코드 사용 유무</label><br> <input
									type="checkbox" name="codeUsed" checked="checked"> 코드를
								생성하고 사용상태로 만듭니다. <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;체크를
								해제하면 코드만 생성되고 미사용상태로 만들어집니다.
							</div>
						</div>
						<!-- /.box-body -->
				</div>
				<!-- /.box -->
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default pull-left"
					data-dismiss="modal" id="cancelBtn">취소</button>
				<button type="button" class="btn btn-primary" id="saveBtn">저장완료</button>
			</div></form>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!--  공통 코드 추가 모달 다이얼로그 끝 -->



<!--  공통 코드 수정 모달 다이얼로그 시작 -->
<div class="modal fade" id="replaceCodeModal">
	<div class="modal-dialog">
		<div class="modal-content">
		<form role="form" id="codeForm">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">코드수정</h4>
			</div>
			<div class="modal-body">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title"> 코드를 수정합니다.</h3>
					</div>
					<!-- /.box-header -->
					<!-- form start -->
					
						<div class="box-body">
							<div class="form-group">
								<label>부모코드</label> 
								<select class="form-control" name="parentCode">
									<option value="">부모코드 없음(코드 그룹 생성)</option>
									<c:forEach items="${commCodeDTOList}" var="codeDTO">
										<option value="${codeDTO.commCode}">${codeDTO.codeName}(${codeDTO.commCode})</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group">
								<label for="commCode">코드번호</label>
								<input type="text" class="form-control" id="commCode" name="commCode" placeholder="코드의 이름을 입력하세요" disabled>
							</div>
							
							<div class="form-group">
								<label for="codeName">코드명</label> <input type="text"
									class="form-control" id="codeName" name="codeName"
									placeholder="코드의 이름을 입력하세요">
							</div>
							<div class="form-group">
								<label for="codeDesc">코드설명</label> <input type="text"
									class="form-control" id="codeDesc" name="codeDesc"
									placeholder="코드에 대한 간략한 설명을 입력하세요">
							</div>
							<div class="form-group">
								<label for="codeUsed">코드 사용 유무</label><br> <input
									type="checkbox" name="codeUsed" checked="checked"> 코드를
								생성하고 사용상태로 만듭니다. <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;체크를
								해제하면 코드만 생성되고 미사용상태로 만들어집니다.
							</div>
						</div>
						<!-- /.box-body -->
				</div>
				<!-- /.box -->
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default pull-left"
					data-dismiss="modal" id="cancelBtn">취소</button>
				<button type="button" class="btn btn-primary" id="saveBtn">저장완료</button>
			</div></form>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!--  공통 코드 수정 모달 다이얼로그 끝 -->
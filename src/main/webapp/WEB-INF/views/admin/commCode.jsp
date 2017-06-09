<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--   ${commCodeDTOList} --%>
 <div class="box">
 			<br>
            <div class="box-header">
            <h3 class="box-title">공통코드</h3>
            </div>
            <button type="button" class="btn btn-block btn-primary" data-toggle="modal" data-target="#modal-default" style="width:100px; margin:5px">코드등록</button>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="table ">
                <thead>
                <tr>
                  <th>번호</th>
                  <th>코드번호</th>
                  <th>코드명</th>
                  <th>코드설명</th>
                  <th>부모코드</th>
                  <th>코드사용유무</th>
				  <th>코드순서</th>
				  <th>등록일</th>
				  <th>수정일</th>  
                </tr>
                </thead>
                <tbody>

 				<c:forEach items="${commCodeDTOList}" var="codeDTO" varStatus="status">
					<tr>
						<td>${status.index}</td>
						<td>${codeDTO.commCode}</td>
						<td>${codeDTO.codeName}</td>						
						<td>${codeDTO.codeDesc}</td>						
						<td>${codeDTO.parentCode}</td>						
						<td>${codeDTO.codeUsed}</td>						
						<td>${codeDTO.codeOrder}</td>
						<td>${codeDTO.regDate}</td>						
						<td>${codeDTO.updateDate}</td>						
					</tr>
				</c:forEach> 
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
$(function(){
	//학생정보 추가/수정
	$("#saveBtn").click(function(){
		
		 var actionName="${pageContext.request.contextPath}/admin/insertCommCode";
		
		var ajaxTransData=$("#codeForm").serialize();

		/* if($("#btn").val()=="가입하기"){
			var actionName="insertStudent";
		}else{
			var actionName="updateStudent";
		} */
		
		alert(ajaxTransData);
		$.ajax({
			url: actionName,
			type: "post",
			dataType:"text",
			data: ajaxTransData,
			success:function(result){
				alert(result);
			},
			error:function(err){
				alert("ajax error"+err);
			}
			
		});
		
	});//학생정보 추가/삭제 끝
})


//학생정보 출력
function selectStudentInfo(){
	$.ajax({
		url: "studentList",
		type: "post",
		dataType: "json",
		data: "",
		success: function(result){
			var studentRows="";
			$.each(result, function(index, item){
				var row="<tr>";
				row+="<td>"+item.stuNo+"</td>";
				row+="<td>"+item.stuName+"</td>";
				row+="<td>"+item.stuAge+"</td>";
				row+="<td>"+item.stuPhone+"</td>";
				row+="<td>"+item.stuAddr+"</td>";
				row+="<td><input type='button' value='삭제'></td>";
				row+="</tr>"
				studentRows+=row;
			})

			$("#listTable tr:gt(0)").remove();
			$("#listTable").append(studentRows);
		},
		error: function(err){
			alert(err);
		}
	});
}
</script>
<div class="modal fade" id="modal-default">
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
								<label>Select</label> <select class="form-control"
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
									type="checkbox" name="codeUsed" checked="true"> 코드를
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
					data-dismiss="modal">취소</button>
				<button type="button" class="btn btn-primary" id="saveBtn">저장완료</button>
			</div></form>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->


$(function() {
	$('#todo,#doing,#done').sortable({
		placeholder : 'sort-highlight',
		connectWith : '.todo-list',
		forcePlaceholderSize : true
	}).disableSelection();
	
	$("#todoInsert").click(function() {
		$("#todoInsertBox").show();
	})
	
	$("#doingInsert").click(function() {
		$("#doingInsertBox").show();
	})
	
	$("#doneInsert").click(function() {
		$("#doneInsertBox").show();
	})
	
	$("#todoInsertBoxCancle").click(function() {
		$("#todoInsertBox").hide();
	})
	
	$("#doingInsertBoxCancle").click(function() {
		$("#doingInsertBox").hide();
	})
	
	$("#doneInsertBoxCancle").click(function() {
		$("#doneInsertBox").hide();
	})
	
	$("#todoInsertBoxSubmit").click(function() {
		insertTask($("#todoTitle").val(),'0001');
	})
	
	$("#doingInsertBoxSubmit").click(function() {
		insertTask($("#doingTitle").val(),'0002');
	})
	
	$("#doneInsertBoxSubmit").click(function() {
		insertTask($("#doneTitle").val(),'0003');
	})
	
	function insertTask(title,progressStatus) {
		$.ajax({
			type: "post",
			url: "task/insertTask",
			data: "studyCode="+$("#studyCode").val()+"&title="+title+"&progressStatus="+progressStatus
		})
	}
	
	function selectTask(title,progressStatus) {
		$.ajax({
			type: "post",
			url: "task/insertTask",
			data: "studyCode="+$("#studyCode").val()+"&title="+title+"&progressStatus="+progressStatus
		})
	}
});

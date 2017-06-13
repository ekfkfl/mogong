$(function() {
	$(".select2").select2();
	
	moment.locale('ko');
	
	$('#dateChooser').daterangepicker({
	    "timePicker": true,
	    "locale": {
	        "format": "LL LT",
	        "separator": " - ",
	        "applyLabel": "확인",
	        "cancelLabel": "취소",
	        "daysOfWeek": [
	            "일",
	            "월",
	            "화",
	            "수",
	            "목",
	            "금",
	            "토"
	        ],
	        "monthNames": [
	            "1월",
	            "2월",
	            "3월",
	            "4월",
	            "5월",
	            "6월",
	            "7월",
	            "8월",
	            "9월",
	            "10월",
	            "11월",
	            "12월"
	        ],
	        "firstDay": 1
	    },
	    "startDate": '20131224130309',
	    "endDate": '20131224130309'
	}, function(start, end, label) {
		//alert(start.format('YYYY-MM-DD') + end.format('YYYY-MM-DD')  + label);
	});

	$('#todo,#doing,#done').sortable({
		placeholder : 'sort-highlight',
		connectWith : '.todo-list',
		forcePlaceholderSize : true,
		start: function(event, ui) {
            var start_pos = ui.item.index();
            ui.item.data('start_pos', start_pos);
        },
		update: function(event, ui) {
			var start_pos = ui.item.data('start_pos');
			var end_pos = ui.item.index();
			
			if (this === ui.item.parent()[0]) {
		        if (ui.sender !== null) {
		        	updateAnother(ui.sender.context.id,start_pos,ui.item.context.parentNode.id,end_pos);
		        } else {
		        	updateSame(ui.item.context.parentNode.id,start_pos,end_pos);
		        }
			}
		}
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
			dataType: "json",
			data: "studyCode="+$("#studyCode").val()+"&title="+title+"&progressStatus="+progressStatus,
			success: function(data) {
				var progress,str;
				
				if(data.progressStatus=='0001') {
					progress="#todo";
				} else if(data.progressStatus=='0002') {
					progress="#doing";
				} else if(data.progressStatus=='0003') {
					progress="#done";
				}
				
				str="<li id='task'><span data-toggle='modal' data-target='#modal-default' class='text' data-code='"+data.taskCode+"'>"+data.title+"</span><i id='deleteTask' class='fa fa-fw fa-trash-o pull-right'></i></li>";
				
				$(progress).prepend(str);
			}
		})
	}
	
	function selectOneTask(taskCode) {
		$.ajax({
			type: "post",
			url: "task/selectOneTask",
			data: "taskCode="+taskCode,
			dataType: "json",
			success: function(data) {
				$(".modal-title").text(data.title);
				$("#content").val(data.content);
				
				
				
				if(data.startDate != "") {
					$('#dateChooser').data('daterangepicker').setStartDate(moment(data.startDate, moment.ISO_8601));
					$('#dateChooser').data('daterangepicker').setEndDate(moment(data.endDate, moment.ISO_8601));
				}
				
//				selectMember(data.taskMemberList);
				
				if(data.taskMemberList == "") {
					$("#member option").remove();
				} else {
					var str="";
					
					$.each(data.taskMemberList,function(index, item) {
						str+="<option value="+item.memberCode+">"+item.name+"";
					})
					$("#member option:gt(0)").remove();
					
					
					$("#member").append(str);
				}
			}
		})
	}
	$("#taskUpdate").click(function() {
		alert($("#member").select2("val"));
	})
	
	function selectAllTask(studyCode) {
		$.ajax({
			type: "post",
			url: "task/selectAllTask",
			data: "studyCode="+studyCode,
			dataType: "json",
			success: function(data) {
				$.each(data, function(index,item){
					
				})
				str="<li id='task' data-toggle='control-sidebar'><span class='text' id='"+data.taskCode+"'>"+data.title+"</span><i id='deleteTask' class='fa fa-fw fa-trash pull-right'></i></li>";
			}
		})
	}
	
	function deleteTask(taskCode) {
		if(confirm("정말 삭제하시겠습니까?") == true) {
			$.ajax({
				type: "post",
				url: "task/deleteTask",
				data: "taskCode="+taskCode,
				success: function() {
					$("#"+taskCode).parent().remove();
				}
			})
		} else {
			return;
		}
	}
	
	$(document).on('click','#task',function() {
		var taskCode;
		taskCode=$(this).find('span').attr('id');
		
		selectOneTask(taskCode);
	})
	
	$(document).on('click','#deleteTask',function() {
		var taskCode;
		taskCode=$(this).parent().find('span').attr('id');
		
		deleteTask(taskCode);
	})
	
	function updateAnother(start_pro,start_pos,end_pro,end_pos) {
		console.log('시작 '+start_pro+' '+start_pos+' 끝 '+end_pro+' '+end_pos);
	}
	
	function updateSame(start_pro,start_pos,end_pos) {
		console.log('시작 '+start_pro+' '+start_pos+' 끝 '+end_pos);
	}
	
	/*function selectMember(data) {
		var select= $(".select2");
		
		select.select2();
		
		var option = $("<option ")
	}*/
	
	/*function printTaskNum() {
		$("#todoNum").text("진행 중인 Task "+$(".todoNum").length+"개");
		$("#doingNum").text("진행 중인 Task "+$(".doingNum").length+"개");
		$("#doneNum").text("진행 중인 Task "+$(".doneNum").length+"개");
	}*/	
});
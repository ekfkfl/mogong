$(function() {
	
	var taskCode;
	
	$(".select2").select2({"language": {
	       "noResults": function(){
	           return "스터디에 가입 된 멤버가 없습니다.";
	       }
	   }});
	
	moment.locale('ko');
	
	$('#dateChooser').daterangepicker({
	    "timePicker": true,
	    "locale": {
	        "format": "LL LT",
	        "separator": " ~ ",
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
	    "startDate": moment(),
	    "endDate": moment()
	}, function(start, end, label) {
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
		var progress;
		
		if(progressStatus=='0001') {
			progress="#todo";
		} else if(progressStatus=='0002') {
			progress="#doing";
		} else if(progressStatus=='0003') {
			progress="#done";
		}
		
		$.ajax({
			type: "post",
			url: "task/insertTask",
			dataType: "json",
			data: "studyCode="+$("#studyCode").val()+"&title="+title+"&progressStatus="+progressStatus+"&taskIndex="+$(progress+" li").length+"&"+$("#csrf").attr('name')+"="+$("#csrf").val(),
			success: function(data) {
				var str="";
				
				str="<li id='task'><span data-toggle='modal' data-target='#modal-default' class='text' id='"+data.taskCode+"'>"+data.title+"</span><i id='deleteTask' class='fa fa-fw fa-trash-o pull-right'></i></li>";
				
				$(progress).append(str);
			}
		})
	}
	
	function selectOneTask(taskCode) {
		$.ajax({
			type: "post",
			url: "task/selectOneTask",
			data: "taskCode="+taskCode+"&studyCode="+$("#studyCode").val()+"&"+$("#csrf").attr('name')+"="+$("#csrf").val(),
			dataType: "json",
			success: function(data) {
				$("#title").val(data.title);
				$("#content").val(data.content);
				
				if(data.startDate != null && data.endDate != null) {
					$('#dateChooser').data('daterangepicker').setStartDate(moment(data.startDate, moment.ISO_8601));
					$('#dateChooser').data('daterangepicker').setEndDate(moment(data.endDate, moment.ISO_8601));
				} else {
					$('#dateChooser').data('daterangepicker').setStartDate(moment());
					$('#dateChooser').data('daterangepicker').setEndDate(moment());
				}
				
				if(data.taskMemberList == "") {
					$("#member option").remove();
				} else {
					var str="";
					
					$.each(data.taskMemberList,function(index,item) {
						if(item.select===1) {
							str+="<option value="+item.memberCode+" selected>"+item.name+"";
						} else {
							str+="<option value="+item.memberCode+">"+item.name+"";
						}
					})
					
					$("#member option:gt(0)").remove();
					
					
					$("#member").append(str);
				}
			}
		})
	}

	$("#taskUpdate").click(function() {
		
		var taskDTO = new Object();
		var taskMemberList = new Array();
		
		taskDTO.taskCode=taskCode;
		taskDTO.title=$("#title").val();
		taskDTO.content=$("#content").val();
		
		var date=$("#dateChooser").val();
		var dateArray=date.split(' ~ ');
		var startDate=dateArray[0];
		var endDate=dateArray[1];
		
		startDate=moment(startDate,"LL LT").format("YYYYMMDDHHmm");
		endDate=moment(endDate,"LL LT").format("YYYYMMDDHHmm");
		
		taskDTO.startDate=startDate;
		taskDTO.endDate=endDate;
		
		var memberCodeArray=$("#member").select2("val");
		
		for(var i=0; i<memberCodeArray.length; i++) {
			taskDTO['taskMemberList['+i+'].taskCode']=taskCode;
			taskDTO['taskMemberList['+i+'].memberCode']=memberCodeArray[i];
		}
			
		updateTask(taskDTO);
	})
	
	function updateTask(taskDTO) {
		$.ajax({
			type: "post",
			url: "task/updateTask",
			data: taskDTO+"&"+$("#csrf").attr('name')+"="+$("#csrf").val(),
			success: function() {
				selectOneTask(taskCode);
				alert('저장 완료');
			}
		})
	}
	
	function selectAllTask(studyCode) {
		$.ajax({
			type: "post",
			url: "task/selectAllTask",
			data: "studyCode="+studyCode+"&"+$("#csrf").attr('name')+"="+$("#csrf").val(),
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
				data: "taskCode="+taskCode+"&"+$("#csrf").attr('name')+"="+$("#csrf").val(),
				success: function() {
					$("#"+taskCode).parent().remove();
				}
			})
		} else {
			return;
		}
	}
	
	$(document).on('click','#task',function() {
		taskCode=$(this).find('span').attr('id');
		
		selectOneTask(taskCode);
	})
	
	$(document).on('click','#deleteTask',function() {
		taskCode=$(this).parent().find('span').attr('id');
		
		deleteTask(taskCode);
	})
	
	function updateAnother(start_pro,start_pos,end_pro,end_pos) {
		console.log('시작 '+start_pro+' '+start_pos+' 끝 '+end_pro+' '+end_pos);
		
		var allTaskCode1=new Array();
		var allTaskCode2=new Array();
		
		for(var i=0; i<$("#"+start_pro+" li").size(); i++) {
			var oneTaskCode=$("#"+start_pro+" li:eq("+i+") span").attr('id');
			allTaskCode1.push(oneTaskCode);
		}
		
		for(var i=0; i<$("#"+end_pro+" li").size(); i++) {
			var oneTaskCode=$("#"+end_pro+" li:eq("+i+") span").attr('id');
			allTaskCode2.push(oneTaskCode);
		}
		
		moveTask(allTaskCode1,allTaskCode2);
	}
	
	function updateSame(start_pro,start_pos,end_pos) {
		console.log('시작 '+start_pro+' '+start_pos+' 끝 '+end_pos);
		
		var allTaskCode=new Array();
		
		for(var i=0; i<$("#"+start_pro+" li").size(); i++) {
			var oneTaskCode=$("#"+start_pro+" li:eq("+i+") span").attr('id');
			allTaskCode.push(oneTaskCode);
		}
		
		moveTask(allTaskCode);
	}
	
	function moveTask(allTaskCode1,allTaskCode2) {
		var allTaskCodeDTO=new Object();
		
		allTaskCodeDTO.allTaskCode1=allTaskCode1;
		
		if(allTaskCode2 != null) {
			allTaskCodeDTO.allTaskCode2=allTaskCode2;
		}
		
		$.ajax({
			type: "post",
			url: "task/moveTask",
			data: allTaskCodeDTO+"&"+$("#csrf").attr('name')+"="+$("#csrf").val()
		})
	}
});
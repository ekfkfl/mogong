$(function() {
	jQuery.ajaxSettings.traditional = true;
	var taskCode;
	var csrf_token = $("#csrf").val();
	
	$(document).bind("ajaxSend", function(elm, xhr, s){
		  if (s.type == "POST") {
		     xhr.setRequestHeader('X-CSRF-Token', csrf_token);
		  }
	});
	
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
		insertTask($("#todoTitle").val(),'0142');
	})
	
	$("#doingInsertBoxSubmit").click(function() {
		insertTask($("#doingTitle").val(),'0143');
	})
	
	$("#doneInsertBoxSubmit").click(function() {
		insertTask($("#doneTitle").val(),'0144');
	})
	
	$("#todoTitle").keyup(function(e) {
		if(e.keyCode == 13) 
		insertTask($("#todoTitle").val(),'0142');
	})
	
	$("#doingTitle").keyup(function(e) {
		if(e.keyCode == 13)
		insertTask($("#doingTitle").val(),'0143');
	})
	
	$("#doneTitle").keyup(function(e) {
		if(e.keyCode == 13)
		insertTask($("#doneTitle").val(),'0144');
	})
	
	$("#inputTaskComment").keyup(function(e) {
		if(e.keyCode == 13)
		insertTaskComment();
	})
	
	$("#inputTaskComment").click(function() {
		insertTaskComment();
	})
	
	$("#comment").click(function() {
		selectTaskComment();
	})
	
	function insertTask(title,progressStatus) {
		var progress;
		
		if(title.trim() == "") {
			return;
		}
		
		if(progressStatus=='0142') {
			progress="#todo";
		} else if(progressStatus=='0143') {
			progress="#doing";
		} else if(progressStatus=='0144') {
			progress="#done";
		}
		
		$.ajax({
			type: "post",
			url: "task/insertTask",
			dataType: "json",
			data: "studyCode="+$("#studyCode").val()+"&title="+title+"&progressStatus="+progressStatus+"&taskIndex="+$(progress+" li").length,
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
			data: "taskCode="+taskCode+"&studyCode="+$("#studyCode").val(),
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
		
		if(memberCodeArray != null) {
		
			for(var i=0; i<memberCodeArray.length; i++) {
				taskDTO['taskMemberList['+i+'].taskCode']=taskCode;
				taskDTO['taskMemberList['+i+'].memberCode']=memberCodeArray[i];
			}
		}
		
		updateTask(taskDTO);
		
	})
	
	function updateTask(taskDTO) {
		$.ajax({
			type: "post",
			url: "task/updateTask",
			data: taskDTO,
			success: function() {
//				$("#modal-default").modal("hide");
				$("#"+taskDTO.taskCode).text(taskDTO.title);
				selectOneTask(taskCode);
				alert('저장 완료');
			}
		})
	}
	
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
		taskCode=$(this).find('span').attr('id');
		
		$("attribute").parent().addClass('active');
		$("content").parent().removeClass('active');
		$("fileUpload").parent().removeClass('active');
		
		selectOneTask(taskCode);
	})
	
	$(document).on('click','#deleteTask',function() {
		taskCode=$(this).parent().find('span').attr('id');
		
		deleteTask(taskCode);
	})
	
	function updateAnother(start_pro,start_pos,end_pro,end_pos) {
		var progressStatus="";
		var selectCode=$("#"+end_pro+" li:eq("+end_pos+") span").attr('id');
		
		if(end_pro == "todo") {
			progressStatus='0142';
		} else if(end_pro == "doing") {
			progressStatus='0143';
		} else if(end_pro == "done") {
			progressStatus='0144';
		}
		
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
		
		if(allTaskCode1.length == 0) {
			allTaskCode1=null;
		}
		
		if(allTaskCode2.length == 0) {
			allTaskCode2=null;
		}
		
		moveTask(allTaskCode1,allTaskCode2,selectCode,progressStatus);
	}
	
	function updateSame(start_pro,start_pos,end_pos) {
		var selectCode=$("#"+end_pro+" li:eq("+end_pos+") span").attr('id');
		var allTaskCode=new Array();
		
		for(var i=0; i<$("#"+start_pro+" li").size(); i++) {
			var oneTaskCode=$("#"+start_pro+" li:eq("+i+") span").attr('id');
			allTaskCode.push(oneTaskCode);
		}
		
		moveTask(allTaskCode,selectCode);
	}
	
	function moveTask(allTaskCode1,allTaskCode2,selectCode,progressStatus) {
		var allTaskCodeDTO=new Object();
		
		allTaskCodeDTO.allTaskCode1=allTaskCode1;
		
		if(allTaskCode2 != null) {
			allTaskCodeDTO.allTaskCode2=allTaskCode2;
		}
		
		if(progressStatus != "") {
			allTaskCodeDTO.progressStatus=progressStatus;
		}
		
		allTaskCodeDTO.taskCode=parseInt(selectCode);
		
		$.ajax({
			type: "post",
			url: "task/moveTask",
			data: allTaskCodeDTO
		})
	}
	
	function inserTaskComment(taskCommentDTO) {
		$.ajax({
			type: "post",
			url: "task/inserTaskComment",
			data: taskCommentDTO,
			success: function() {
				alert(taskCommentDTO);
			}
		})
	}
	
	function selectTaskComment() {
		scroll();
		
		$.ajax({
			type: "post",
			url: "task/selectTaskComment",
			data: "taskCode="+taskCode,
			success: function() {
				alert(taskCommentDTO);
			}
		})
	}
	
	function scroll(){
		$("#chatMessage").scrollTop($("#chatMessage")[0].scrollHeight);
	}
	
	/*function sendMessage(){
        var date = new Date();
        
        var presentDate = (date.getMonth()+1)+"월 "+date.getDate()+"일 "+addZero(date.getHours())+":"+addZero(date.getMinutes())
     
        var message = $('#message').val()
        
        sock.send("${requestScope.sessionId}"+","+$("#message").val()+","+presentDate+","+"${requestScope.sessionPhoto}");
        $("#chatMessage").append(
	    		"<div class='direct-chat-msg right'>"+
                "<div class='direct-chat-info clearfix'>"+
                 "<span class='direct-chat-name pull-right'>"+"${requestScope.sessionId}"+"</span>"+
                 "<span class='direct-chat-timestamp pull-left'>"+presentDate+"</span>"+
                "</div>"+
                "<img class='direct-chat-img' src='${requestScope.sessionPhoto}' alt='message user image'>"+
                "<div class='direct-chat-text'>"+
                $("#message").val()+
                "</div>"+
         		"</div>"
	    		);
        $("#message").val("");
        $("#chatMessage").scrollTop($("#chatMessage")[0].scrollHeight);
        $.ajax({
  			  url: "${pageContext.request.contextPath}/member/task/fileSave" , //서버 요청 이름(주소)
  			  type: "get" ,//method방식(get, post)
  			  data: "sessionId=${requestScope.sessionId}&message="+message+"&date="+presentDate+"&photo=${requestScope.sessionPhoto}" ,//서버에게 보낼 parameter 정보
  			  success: function(result){
  				 
  			  }
        })
        
	}
        
	function onMessage(evt){  //변수 안에 function자체를 넣음.
	    var data = evt.data;
		var dataContent = data.split(',');
	    $("#chatMessage").append(
	    		"<div class='direct-chat-msg'>"+
                "<div class='direct-chat-info clearfix'>"+
                 "<span class='direct-chat-name pull-left'>"+dataContent[0]+"</span>"+
                 "<span class='direct-chat-timestamp pull-right'>"+dataContent[2]+"</span>"+
                "</div>"+
                "<img class='direct-chat-img' src='"+dataContent[3]+"' alt='message user image'>"+
                "<div class='direct-chat-text'>"+
                 dataContent[1]+
                "</div>"+
         		"</div>"
	    		);
	    $("#chatMessage").scrollTop($("#chatMessage")[0].scrollHeight);
	     sock.close(); 
	     $.ajax({
  			  url: "${pageContext.request.contextPath}/member/task/fileSave" , //서버 요청 이름(주소)
  			  type: "get" ,//method방식(get, post)
  			  data: "sessionId="+dataContent[0]+"&message="+dataContent[1]+"&date="+dataContent[2]+"&photo="+dataContent[3] ,//서버에게 보낼 parameter 정보
  			  success: function(result){
  				  
  			  }
        })
	}*/
});
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/main/header.jsp" />


<!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- daterange picker -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/daterangepicker.css">
  <!-- bootstrap datepicker -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/datepicker3.css">
  <!-- Bootstrap time Picker -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-timepicker.min.css">
  <!-- Select2 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/select2.min.css">





<script>

   //스터디 기간 자르기.
   function splitDate() {

      var datePeriod = $("#datePeriod").val();
      console.log(datePeriod);
      var strArray = datePeriod.split('-');
      //console.log(strArray);
      console.log(strArray[0] + ',' + strArray[1]);
   }

   function subject() {

      var studyName = $("#name").val();
      console.log(studyName);
   }

   function checkValid() {

      subject();
      splitDate();
      schedule();

      return false;

   }
</script>




<form class="form-horizontal" method="post"
   action="${pageContext.request.contextPath}/enroll2" name="insert"
   id="insert" onSubmit='return checkValid()'>

   <div class="container">
      <div class="row">
         <div
            class="col-xs-12 col-sm-9 col-md-6 col-sm-offset-2 col-md-offset-3">
            <div class="box box-info">
               <div class="box-header with-border">
                  <h3 class="box-title">스터디 등록하기</h3>
               </div>
               <div class="box-body">
                  <div class="form-group">
                     <div class="col-sm-12">
                        <input type="text" class="form-control" id="name" name="name"
                           placeholder="스터디 제목을 입력하세요">
                     </div>
                  </div>
                   <div class="form-group">
                <label>Date:</label>

                <div class="input-group date">
                  <div class="input-group-addon">
                    <i class="fa fa-calendar"></i>
                  </div>
                  <input type="text" class="form-control pull-right" id="datepicker">
                </div>
                <!-- /.input group -->
              </div>
                  <input type="hidden" name="startDate"> 
                  <input type="hidden" name="endDate">

               </div>


            </div>
         </div>
      </div>
   </div>

   <div class="container">
      <div class="row">
         <div
            class="col-xs-12 col-sm-9 col-md-6 col-sm-offset-2 col-md-offset-3">
            <div class="box box-info">
               <div class="box-header with-border">
                  <h3 class="box-title">스케줄 선택하기</h3>
               </div>
               <div class="checkbox">
                  <label> <input type="checkbox" name="day" value="일">일
                  </label> <label> <input type="checkbox" name="day" value="월">월
                  </label> <label> <input type="checkbox" name="day" value="화">화
                  </label> <label> <input type="checkbox" name="day" value="수">수
                  </label> <label> <input type="checkbox" name="day" value="목">목
                  </label> <label> <input type="checkbox" name="day" value="금">금
                  </label> <label> <input type="checkbox" name="day" value="토">토
                  </label>
               </div>
               <br>
               <div>
                  <label>스터디 시간</label>
               </div>
               <div>
                  <br>
               </div>
               <div class="bootstrap-timepicker"><div class="bootstrap-timepicker-widget dropdown-menu"><table><tbody><tr><td><a href="#" data-action="incrementHour"><i class="glyphicon glyphicon-chevron-up"></i></a></td><td class="separator">&nbsp;</td><td><a href="#" data-action="incrementMinute"><i class="glyphicon glyphicon-chevron-up"></i></a></td><td class="separator">&nbsp;</td><td class="meridian-column"><a href="#" data-action="toggleMeridian"><i class="glyphicon glyphicon-chevron-up"></i></a></td></tr><tr><td><span class="bootstrap-timepicker-hour">11</span></td> <td class="separator">:</td><td><span class="bootstrap-timepicker-minute">15</span></td> <td class="separator">&nbsp;</td><td><span class="bootstrap-timepicker-meridian">AM</span></td></tr><tr><td><a href="#" data-action="decrementHour"><i class="glyphicon glyphicon-chevron-down"></i></a></td><td class="separator"></td><td><a href="#" data-action="decrementMinute"><i class="glyphicon glyphicon-chevron-down"></i></a></td><td class="separator">&nbsp;</td><td><a href="#" data-action="toggleMeridian"><i class="glyphicon glyphicon-chevron-down"></i></a></td></tr></tbody></table></div>
                <div class="form-group">
            
                  <div class="input-group">
                    <input type="text" class="form-control timepicker">

                    
                  </div>
                  <!-- /.input group -->
                </div>
                <!-- /.form group -->
              </div>

            </div>
         </div>
      </div>
   </div>
   <div class="container">
      <div class="row">
         <div
            class="col-xs-12 col-sm-9 col-md-6 col-sm-offset-2 col-md-offset-3">
            <div class="box box-info">
               <div class="box-header with-border">
                  <h3 class="box-title">스터디 구성 선택하기</h3>
               </div>
               <label>인원 수</label> <select class="form-control" name="people"
                  id="people">
                  <option>1명</option>
                  <option>2명</option>
                  <option>3명</option>
                  <option>4명</option>
                  <option>5명</option>
               </select> <label>지역 선택</label> <select class="form-control" name="area">
                  <option value="지역">지역</option>
                  <option value="서울/경기">서울/경기</option>
                  <option value="인천/부천">인천/부천</option>
                  <option value="춘천/강원">춘천/강원</option>
                  <option value="부산/울산/경남">부산/울산/경남</option>
                  <option value="대구/경북">대구/경북</option>
                  <option value="전주/전북">전주/전북</option>
                  <option value="광주/전남">광주/전남</option>
                  <option value="청주/충북">청주/충북</option>
                  <option value="청주/충북">청주/충북</option>
                  <option value="대전/충남">대전/충남</option>
                  <option value="제주">제주</option>
               </select>

            </div>



         </div>
      </div>
   </div>

   <div class="container">
      <div class="row">
         <div
            class="col-xs-12 col-sm-9 col-md-6 col-sm-offset-2 col-md-offset-3">
            <div class="box box-warning col-xs-12">
               <div class="box-header with-border">
                  <h3 class="box-title">스터디 상세정보 입력</h3>
               </div>
               <div class="box-body">
                  <!-- textarea -->
                  <div class="form-group">
                     <textarea class="form-control" id="description"
                        name="description" rows="5" placeholder="스터디에 대한 상세정보를 알려주세요"></textarea>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>

   <div class="container">
      <div class="row">
         <div
            class="col-xs-12 col-sm-9 col-md-6 col-sm-offset-2 col-md-offset-3"
            style="text-align: center">
            <div class="box-body">
               <input type="reset" value="재입력" class="btn">&nbsp;&nbsp;&nbsp;&nbsp;
               <input type="submit" value="제출하기" class="btn">
            </div>
         </div>
      </div>
   </div>
</form>
<!-- jQuery 3.1.1 -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.0.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<!-- Select2 -->
<script src="${pageContext.request.contextPath}/resources/js/select2.full.min.js"></script>
<!-- Select2 -->
<script src="${pageContext.request.contextPath}/resources/js/select2.js"></script>
<!-- InputMask -->
<script src="${pageContext.request.contextPath}/resources/js/jquery.inputmask.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.inputmask.date.extensions.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.inputmask.extensions.js"></script>
<!-- bootstrap datepicker -->
<script src="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/daterangepicker.js"></script>

<script src="${pageContext.request.contextPath}/resources/js/icheck.min.js"></script>

<script>
$(function () {
    //Initialize Select2 Elements
    $(".select2").select2();

    //Datemask dd/mm/yyyy
    $("#datemask").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
    //Datemask2 mm/dd/yyyy
    $("#datemask2").inputmask("mm/dd/yyyy", {"placeholder": "mm/dd/yyyy"});
    //Money Euro
    $("[data-mask]").inputmask();

    //Date range picker
    $('#reservation').daterangepicker();
    //Date range picker with time picker
    $('#reservationtime').daterangepicker({timePicker: true, timePickerIncrement: 30, format: 'MM/DD/YYYY h:mm A'});
    //Date range as a button
    $('#daterange-btn').daterangepicker(
        {
          ranges: {
            'Today': [moment(), moment()],
            'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
            'Last 7 Days': [moment().subtract(6, 'days'), moment()],
            'Last 30 Days': [moment().subtract(29, 'days'), moment()],
            'This Month': [moment().startOf('month'), moment().endOf('month')],
            'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
          },
          startDate: moment().subtract(29, 'days'),
          endDate: moment()
        },
        function (start, end) {
          $('#daterange-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
        }
    );

    //Date picker
    $('#datepicker').datepicker({
      autoclose: true
    });

    //iCheck for checkbox and radio inputs
    $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
      checkboxClass: 'icheckbox_minimal-blue',
      radioClass: 'iradio_minimal-blue'
    });
    //Red color scheme for iCheck
    $('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
      checkboxClass: 'icheckbox_minimal-red',
      radioClass: 'iradio_minimal-red'
    });
    //Flat red color scheme for iCheck
    $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
      checkboxClass: 'icheckbox_flat-green',
      radioClass: 'iradio_flat-green'
    });

    //Colorpicker
    $(".my-colorpicker1").colorpicker();
    //color picker with addon
    $(".my-colorpicker2").colorpicker();

    //Timepicker
    $(".timepicker").timepicker({
      showInputs: false
    });
  });

</script>

<jsp:include page="/WEB-INF/views/main/footer.jsp" />


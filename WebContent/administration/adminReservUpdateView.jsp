<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.function.Function"%>

<%@ page import="reserv.*" %>
<%
int pageN = Integer.parseInt(request.getParameter("page"));
int resnum = Integer.parseInt(request.getParameter("resnum"));
ReservDTO info = ReservDAO.info(resnum); 
%>
<!DOCTYPE html>
<html lang="ko">
	<head>	
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>관리자페이지 - 예약추가</title>
    <style type="text/css">
    	h4 { font-weight: bold; }
    	select { height: 21px;}
    	.ddsd {margin: auto; text-align: center;}
    </style>

<!-- 1. jQuery 및 jQuery-ui.css 로드 -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>


<style type="text/css">
.ui-datepicker-year {
	margin-right: -5px;
}
</style>
<!-- 2. 인풋 아이디 datepicker를 클릭시 달력을 보여주기 위한 코드 -->

<script type="text/javascript">
 $(document).ready(function(){  
	 $("#fromDate").datepicker({     
		  showMonthAfterYear:true
		  , monthNames:['년 1월','년 2월','년 3월','년 4월','년 5월','년 6월','년 7월','년 8월','년 9월','년 10월','년 11월','년 12월']
		  , monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
		  , dayNamesMin: ['일','월','화','수','목','금','토']
		  , weekHeader: 'Wk'
		  , dateFormat: 'yy-mm-dd'
		  , minDate: 'today'
		  ,showAnim: 'clip'
		  , beforeShowDay: no_view	      
		  ,onClose: function( selectedDate ) {    
		      // 시작일(fromDate) datepicker가 닫힐때
		      // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
			  $("#toDate").datepicker( "option", "minDate", selectedDate );
		  }
	 
		  });  $("#toDate").datepicker({     
			  showMonthAfterYear:true
			  , monthNames:['년 1월','년 2월','년 3월','년 4월','년 5월','년 6월','년 7월','년 8월','년9월','년 10월','년 11월','년 12월']
			  , monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
			  , dayNamesMin: ['일','월','화','수','목','금','토']
			  , weekHeader: 'Wk'
			  , dateFormat: 'yy-mm-dd'
			  , beforeShowDay: no_view
				  , showAnim: 'clip'
				  ,numberOfMonths: 1      //달력 표시숫자(1~)
			      ,showCurrentAtPos: 0    //숫자만큼 해당개월전을 표시(0~)
			      ,onClose: function( selectedDate ) {    
			      // 시작일(fromDate) datepicker가 닫힐때
			      // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
				  $("#fromDate").datepicker( "option", "maxDate", selectedDate );
				  if (!$("#fromDate").val()) {
						alert("체크인 날짜를 선택하세요");
						return false;
					}
				  var date1 = new Date($("#fromDate").datepicker("getDate"));
				  var date2 = new Date($("#toDate").datepicker("getDate"));
				  var term = (((date2 - date1)/60)/60/24/1000)+1;
				  $("#term").val(term);
			  }

			  });
  

  // 특정일 선택 막기
  function no_view(date) {
   var tmp_chk = 1; 
   //매월 12월 21일은 선택 안되도록 
   if(date.getDate()  == "8" && date.getMonth() == "1"){
    tmp_chk =0;
   }
   return [tmp_chk != 0, ''];
  }

 });
</script>
<script type="text/javascript">
	function roomChange(optionRoom) {
		if (optionRoom == "option") {
			$("#numberOfPeople").empty();
			$("#numberOfPeople").append(
					"<option value='option'>인원을 선택하세요</option>");

		} else if (optionRoom == "normalRoomA" || optionRoom == "normalRoomB"
				|| optionRoom == "normalRoomC") {
			$("#numberOfPeople").empty();
			$("#numberOfPeople").append(
					"<option value='option'>인원을 선택하세요</option>");
			$("#numberOfPeople").append("<option value='1'>1</option>");
			$("#numberOfPeople").append("<option value='2'>2</option>");
			$("#numberOfPeople").append("<option value='3'>3</option>");
			$("#numberOfPeople").append("<option value='4'>4</option>");

		}  else if (optionRoom == "deluxeRoomA" || optionRoom == "deluxeRoomB"
				|| optionRoom == "deluxeRoomC") {
			$("#numberOfPeople").empty();
			$("#numberOfPeople").append(
					"<option value='option'>인원을 선택하세요</option>");
			$("#numberOfPeople").append("<option value='1'>1</option>");
			$("#numberOfPeople").append("<option value='2'>2</option>");
			$("#numberOfPeople").append("<option value='3'>3</option>");
			$("#numberOfPeople").append("<option value='4'>4</option>");

		} else if (optionRoom == "sweetRoomA" || optionRoom == "sweetRoomB"
				|| optionRoom == "sweetRoomC") {
			$("#numberOfPeople").empty();
			$("#numberOfPeople").append(
					"<option value='option'>인원을 선택하세요</option>");
			$("#numberOfPeople").append("<option value='1'>1</option>");
			$("#numberOfPeople").append("<option value='2'>2</option>");
		}
	};
</script>
	

    
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
<body>
	<form action="/terra/ReservUpdateAction.res" method="post">
		<input hidden="hidden" name="pageN" value="<%=pageN%>">					
		<article class="container">
	       <div class="page-header">
	          <h1>관리자페이지 - 예약수정</h1>
	        </div>
	        <div class="col-md-6 col-md-offset-3">
	        	<div class="form-group">
	        	<input type="text" hidden="hidden" name="resnum" id="resnum" value="<%=info.getResnum()%>" >
	              <label for="InputID">예약자 아이디</label>
	              <input type="text" class="form-control" name="user_id" id="user_id" readonly="readonly"  value="<%=info.getUser_id()%>">
	            </div>
	            
	            <div class="form-group">
	              <label for="roomname">방 선택</label>
	              <select class="form-control" id="roomname"
								name="roomname" onchange="roomChange(this.value);">
									<option value="option" selected="selected">방을 선택하세요</option>
									<option value="normalRoomA">일반A</option>
									<option value="normalRoomB">일반B</option>
									<option value="normalRoomC">일반C</option>
									<option value="deluxeRoomA">디럭스A</option>
									<option value="deluxeRoomB">디럭스B</option>
									<option value="deluxeRoomC">디럭스C</option>
									<option value="sweetRoomA">스위트A</option>
									<option value="sweetRoomB">스위트B</option>
									<option value="sweetRoomC">스위트C</option>
							</select>
	            </div>
	            <div class="form-group">
	              <label for="InputFromdate">체크인 날짜</label>
	              <input type="text" class="form-control" name="fromdate" id="fromDate" readonly="readonly"  value="<%=info.getFromdate()%>">
	            </div>
	            <div class="form-group">
	              <label for="InputTodate">체크아웃 날짜</label>
	              <input type="text" class="form-control" name="todate" id="toDate" readonly="readonly" value="<%=info.getTodate()%>">
	            </div>
	            <div class="form-group">
	              <label for="InputTerm">일수</label>
	              <input type="text" class="form-control"  name="term" id="term" readonly="readonly" value="<%=info.getTerm()%>" >
	            </div>
	            <div class="form-group">
	              <label for="InputNumberOfPeople">인원</label>
	              <select class="form-control" name="numberOfPeople" id="numberOfPeople" value="<%=info.getNumberOfPeople()%>">
									<option value="option">인원을 선택하세요</option>
							</select>
	            </div>
	            <div class="form-group">
	            	<input type="submit" value="수정하기" class="btn btn-info">
	            	<input type="button" value="BACK" onclick="history.back();" class="btn btn-default">
	            </div>
			</div>
			
		</article>
	</form>
</body>
</html>
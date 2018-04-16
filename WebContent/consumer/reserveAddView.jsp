<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
session.setAttribute("loadpage", "/terra/consumer/reserveAddView.jsp?room=");
%>
<%@ page import="reserv.*"%>
<%@page import="java.util.List"%>
<%
//List<ReservDTO> reservDateList = ReservDAO.reservdate("normalRoomA"); 
//System.out.print(reservDateList.size());
//List<String> reservedDate = null;
//for(int i=0;i<reservDateList.size();i++){
//	String fromDate = reservDateList.get(i).getFromdate();
//	System.out.print(fromDate);
//	String toDate = reservDateList.get(i).getTodate();
//	System.out.print(toDate);
//}
%>
<%
String room = request.getParameter("room");
String user_id = (String) session.getAttribute("user_id");
String fromdate = "";
if(request.getParameter("fromdate")!=null){
	fromdate = request.getParameter("fromdate");
}
String todate = "";
if(request.getParameter("todate")!=null){
	todate = request.getParameter("todate");
}
%>


<%-- <%Reserv deluxe = ReservAction.info(1); %>
<%Reserv sweet = ReservAction.info(2); %> --%>

<!doctype html>
<html lang="ko">

	<head>
	
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<!--[if IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
			<scirpt src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
		<title>언제나 Terra Hotel</title>
		
<script>
	function button_check() {
		alert("로그인이 필요합니다.");
	}
</script>
		
		<style>
.carousel-inner>.item>img, .carousel-inner>.item>a>img {
	height: 300px;
	width: 800px;
	margin: auto;
}
table{
	border-spacing: 5px;
}
.a {
	/*text-align:right;*/
	width: 40%;
}
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
		  , minDate: 0
		  ,showAnim: 'clip'
		  , beforeShowDay: nationalDays      
		  ,onClose: function( selectedDate ) {    
		      // 시작일(fromDate) datepicker가 닫힐때
		      // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
		      var date3 = new Date(selectedDate);
		      var m = date3.getMonth()+1, d = date3.getDate()+1, y = date3.getFullYear();
		      var date4 = y+'-'+m+'-'+d;
		      if(m<10&&d<10){date4 = y+'-0'+m+'-0'+d;
		      }else if(m<10){date4 = y+'-0'+m+'-'+d;
		      }else if(d<10){date4 = y+'-'+m+'-0'+d;}
		      $("#toDate").val('');  
			  $("#toDate").datepicker( "option", "minDate", date4 );
		  }
	 
		  });  $("#toDate").datepicker({     
			  showMonthAfterYear:true
			  , monthNames:['년 1월','년 2월','년 3월','년 4월','년 5월','년 6월','년 7월','년 8월','년9월','년 10월','년 11월','년 12월']
			  , monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
			  , dayNamesMin: ['일','월','화','수','목','금','토']
			  , weekHeader: 'Wk'
			  , dateFormat: 'yy-mm-dd'
			, minDate: 0
			  , beforeShowDay: nationalDays
				  , showAnim: 'clip'
				  ,numberOfMonths: 1      //달력 표시숫자(1~)
			      ,showCurrentAtPos: 0    //숫자만큼 해당개월전을 표시(0~)
			      ,onClose: function( selectedDate ) {
			    	  if (!$("#fromDate").val()) {
			    			alert("체크인 날짜를 먼저 선택하세요");
			    			return false;
			    		}
			      // 시작일(fromDate) datepicker가 닫힐때
			      // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
				  $("#fromDate").datepicker( "option", "maxDate", selectedDate );
				  var date1 = new Date($("#fromDate").datepicker("getDate"));
				  var date2 = new Date($("#toDate").datepicker("getDate"));
				  var term = ((date2 - date1)/60/60/24/1000)+1;
				  $("#term").val(term);
				  
			  }

			  });
	
});
/* create an array of days which need to be disabled */
var disabledDays = ["2017-1-10"];

/* utility functions */
function nationalDays(date) {
  var m = date.getMonth(), d = date.getDate(), y = date.getFullYear();
//console.log('Checking (raw): ' + m + '-' + d + '-' + y);
  for (i = 0; i < disabledDays.length; i++) {
    if($.inArray(y+ '-' + (m+1) + '-' + d,disabledDays) != -1) {
     //console.log('bad: ' + (m+1) + '-' + d + '-' + y + ' / ' + disabledDays[i]);
      return [false];
    }
  }
//console.log('good: ' + (m+1) + '-' + d + '-' + y);
  return [true];
}

</script>
<script type="text/javascript">

	function roomChange(optionRoom) {
		if (optionRoom == "option") {
			document.getElementById("img1").src = "./consumer/roomimg/sweet1.jpg";
			document.getElementById("img2").src = "./consumer/roomimg/sweet2.jpg";
			document.getElementById("img3").src = "./consumer/roomimg/sweet3.jpg";
			document.getElementById("img4").src = "./consumer/roomimg/sweet4.jpg";
			$("#numberOfPeople").empty();
			$("#numberOfPeople").append(
					"<option value='option'>인원을 선택하세요</option>");

			//앞에 페이지에서 받아온 놈의 img로 바꿔주는 코드 짜기
		} else if (optionRoom == "familyRoomA" || optionRoom == "familyRoomB"
				|| optionRoom == "familyRoomC") {
			document.getElementById("img1").src = "./consumer/roomimg/family1.jpg";
			document.getElementById("img2").src = "./consumer/roomimg/family2.jpg";
			document.getElementById("img3").src = "./consumer/roomimg/family3.jpg";
			document.getElementById("img4").src = "./consumer/roomimg/family4.jpg";
			$("#numberOfPeople").empty();
			$("#numberOfPeople").append(
					"<option value='option'>인원을 선택하세요</option>");
			$("#numberOfPeople").append("<option value='1'>1</option>");
			$("#numberOfPeople").append("<option value='2'>2</option>");
			$("#numberOfPeople").append("<option value='3'>3</option>");
			$("#numberOfPeople").append("<option value='4'>4</option>");
			$("#numberOfPeople").append("<option value='5'>5</option>");
			$("#numberOfPeople").append("<option value='6'>6</option>");
			$("#roominfodeluxe").css("display","none");
			$("#roominfosweet").css("display","none");
			$("#roominfofamily").css("display","block");

			//var detail = "";
		}  else if (optionRoom == "deluxeRoomA" || optionRoom == "deluxeRoomB"
				|| optionRoom == "deluxeRoomC") {
			document.getElementById("img1").src = "./consumer/roomimg/deluxe1.jpg";
			document.getElementById("img2").src = "./consumer/roomimg/deluxe2.jpg";
			document.getElementById("img3").src = "./consumer/roomimg/deluxe3.jpg";
			document.getElementById("img4").src = "./consumer/roomimg/deluxe4.jpg";
			$("#numberOfPeople").empty();
			$("#numberOfPeople").append(
					"<option value='option'>인원을 선택하세요</option>");
			$("#numberOfPeople").append("<option value='1'>1</option>");
			$("#numberOfPeople").append("<option value='2'>2</option>");
			$("#numberOfPeople").append("<option value='3'>3</option>");
			$("#numberOfPeople").append("<option value='4'>4</option>");
			$("#roominfodeluxe").css("display","block");
			$("#roominfosweet").css("display","none");
			$("#roominfofamily").css("display","none");

			//var detail = "";
		} else if (optionRoom == "sweetRoomA" || optionRoom == "sweetRoomB"
				|| optionRoom == "sweetRoomC") {
			document.getElementById("img1").src = "./consumer/roomimg/sweet1.jpg";
			document.getElementById("img2").src = "./consumer/roomimg/sweet2.jpg";
			document.getElementById("img3").src = "./consumer/roomimg/sweet3.jpg";
			document.getElementById("img4").src = "./consumer/roomimg/sweet4.jpg";
			$("#numberOfPeople").empty();
			$("#numberOfPeople").append(
					"<option value='option'>인원을 선택하세요</option>");
			$("#numberOfPeople").append("<option value='1'>1</option>");
			$("#numberOfPeople").append("<option value='2'>2</option>");
			$("#roominfodeluxe").css("display","none");
			$("#roominfosweet").css("display","block");
			$("#roominfofamily").css("display","none");
		}
	};
</script>
<%
if(room.trim().equals("deluxe")){
%>
<script type="text/javascript">
	$(function() {
		document.getElementById("img1").src = "./consumer/roomimg/deluxe1.jpg";
		document.getElementById("img2").src = "./consumer/roomimg/deluxe2.jpg";
		document.getElementById("img3").src = "./consumer/roomimg/deluxe3.jpg";
		document.getElementById("img4").src = "./consumer/roomimg/deluxe4.jpg";
		$("#roomname").empty();
		$("#roomname").append("<option value='option'>방을 선택하세요</option>");
		$("#roomname").append("<option value='deluxeRoomA'selected='selected'>디럭스A</option>");
		$("#roomname").append("<option value='deluxeRoomB'>디럭스B</option>");
		$("#roomname").append("<option value='deluxeRoomC'>디럭스C</option>");
		$("#roomname").append("<option value='sweetRoomA' >스위트A</option>");
		$("#roomname").append("<option value='sweetRoomB'>스위트B</option>");
		$("#roomname").append("<option value='sweetRoomC'>스위트C</option>");
		$("#roomname").append("<option value='familyRoomA'>패밀리 스위트A</option>");
		$("#roomname").append("<option value='familyRoomB'>패밀리 스위트B</option>");
		$("#roomname").append("<option value='familyRoomC'>패밀리 스위트C</option>");
		$("#numberOfPeople").empty();
		$("#numberOfPeople").append(
				"<option value='option'>인원을 선택하세요</option>");
		$("#numberOfPeople").append("<option value='1'>1</option>");
		$("#numberOfPeople").append("<option value='2'>2</option>");
		$("#numberOfPeople").append("<option value='3'>3</option>");
		$("#numberOfPeople").append("<option value='4'>4</option>");
		$("#roominfodeluxe").css("display","block");
		$("#roominfosweet").css("display","none");
		$("#roominfofamily").css("display","none");

	});
</script>
<%}
else if(room.trim().equals("sweet")){
%>
<script type="text/javascript">
	$(function() {
		document.getElementById("img1").src = "./consumer/roomimg/sweet1.jpg";
		document.getElementById("img2").src = "./consumer/roomimg/sweet2.jpg";
		document.getElementById("img3").src = "./consumer/roomimg/sweet3.jpg";
		document.getElementById("img4").src = "./consumer/roomimg/sweet4.jpg";
		$("#roomname").empty();
		$("#roomname").append("<option value='option'>방을 선택하세요</option>");
		$("#roomname").append("<option value='deluxeRoomA'>디럭스A</option>");
		$("#roomname").append("<option value='deluxeRoomB'>디럭스B</option>");
		$("#roomname").append("<option value='deluxeRoomC'>디럭스C</option>");
		$("#roomname").append("<option value='sweetRoomA'  selected='selected'>스위트A</option>");
		$("#roomname").append("<option value='sweetRoomB'>스위트B</option>");
		$("#roomname").append("<option value='sweetRoomC'>스위트C</option>");
		$("#roomname").append("<option value='familyRoomA'>패밀리 스위트A</option>");
		$("#roomname").append("<option value='familyRoomB'>패밀리 스위트B</option>");
		$("#roomname").append("<option value='familyRoomC'>패밀리 스위트C</option>");
		$("#numberOfPeople").empty();
		$("#numberOfPeople").append(
				"<option value='option'>인원을 선택하세요</option>");
		$("#numberOfPeople").append("<option value='1'>1</option>");
		$("#numberOfPeople").append("<option value='2'>2</option>");
		$("#roominfodeluxe").css("display","none");
		$("#roominfosweet").css("display","block");
		$("#roominfofamily").css("display","none");

	});
</script>
<%}
else if(room.trim().equals("family")){
%>
<script type="text/javascript">
	$(function() {
		document.getElementById("img1").src = "./consumer/roomimg/family1.jpg";
		document.getElementById("img2").src = "./consumer/roomimg/family2.jpg";
		document.getElementById("img3").src = "./consumer/roomimg/family3.jpg";
		document.getElementById("img4").src = "./consumer/roomimg/family4.jpg";
		$("#roomname").empty();
		$("#roomname").append("<option value='option'>방을 선택하세요</option>");
		$("#roomname").append("<option value='deluxeRoomA'>디럭스A</option>");
		$("#roomname").append("<option value='deluxeRoomB'>디럭스B</option>");
		$("#roomname").append("<option value='deluxeRoomC'>디럭스C</option>");
		$("#roomname").append("<option value='sweetRoomA'>스위트A</option>");
		$("#roomname").append("<option value='sweetRoomB'>스위트B</option>");
		$("#roomname").append("<option value='sweetRoomC'>스위트C</option>");
		$("#roomname").append("<option value='familyRoomA' selected='selected'>패밀리 스위트A</option>");
		$("#roomname").append("<option value='familyRoomB'>패밀리 스위트B</option>");
		$("#roomname").append("<option value='familyRoomC'>패밀리 스위트C</option>");
		$("#numberOfPeople").empty();
		$("#numberOfPeople").append(
				"<option value='option'>인원을 선택하세요</option>");
		$("#numberOfPeople").append("<option value='1'>1</option>");
		$("#numberOfPeople").append("<option value='2'>2</option>");
		$("#roominfodeluxe").css("display","none");
		$("#roominfosweet").css("display","none");
		$("#roominfofamily").css("display","block");

	});
</script>
<%}
else{
%>
<script type="text/javascript">
	$(function() {
		document.getElementById("img1").src = "./consumer/roomimg/sweet1.jpg";
		document.getElementById("img2").src = "./consumer/roomimg/sweet2.jpg";
		document.getElementById("img3").src = "./consumer/roomimg/sweet3.jpg";
		document.getElementById("img4").src = "./consumer/roomimg/sweet4.jpg";
		if ($("#fromDate").val()&&$("#toDate").val()) {
			  var date1 = new Date($("#fromDate").datepicker("getDate"));
			  var date2 = new Date($("#toDate").datepicker("getDate"));
			  var term = ((date2 - date1)/60/60/24/1000)+1;
			  $("#term").val(term);
		}
		$("#roominfodeluxe").css("display","none");
		$("#roominfosweet").css("display","block");
		$("#roominfofamily").css("display","none");
	});
</script>
<%}%>
<script>
function button_check(){
	alert("로그인이 필요합니다.");
}
</script>
<style type="text/css">
.room{
width: 100%;
}
</style>
	</head>
	<body>
	<jsp:include page="header.jsp"/>
    <div class="container"> 
		<h2>Welcome to Terra</h2>
		<hr>
		<div class=" row">
			<div class="col-sm-6">
				<!-- 슬라이드바 -->
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
					  <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					  <li data-target="#myCarousel" data-slide-to="1"></li>
					  <li data-target="#myCarousel" data-slide-to="2"></li>
					  <li data-target="#myCarousel" data-slide-to="3"></li>
					</ol>
					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
					 	<div class="item active">
						<a href="#">
							<img id="img1" alt="img1" class="img-responsive">
						</a>
						</div>

						<div class="item">
						<a href="#">
							<img id="img2" alt="img2" class="img-responsive">
						</a>
						</div>

						<div class="item">
							<img id="img3" alt="img3" class="img-responsive">
						</div>

						<div class="item">
							<img id="img4" alt="img4" class="img-responsive">
						</div>
					</div>
					
					<!-- Left and right controls -->
					  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
						<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					  </a>
					  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
						<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					  </a>
				</div>
			</div>
			<div class="form-group col-sm-6">
				<form class="form-horizontal" action="/terra/ReservAddAction.res" method="post">
					<input hidden="hidden" name="user_id" value="<%=user_id%>">
					<div class="form-group">
						<label class=" col-sm-4" for="roomname">방 선택 : </label>
						<div class="col-sm-8">
							<select class="form-control" id="roomname"
								name="roomname" onchange="roomChange(this.value);">
									<option value="option" selected="selected">방을 선택하세요</option>
									<option value="deluxeRoomA">디럭스A</option>
									<option value="deluxeRoomB">디럭스B</option>
									<option value="deluxeRoomC">디럭스C</option>
									<option value="sweetRoomA">스위트A</option>
									<option value="sweetRoomB">스위트B</option>
									<option value="sweetRoomC">스위트C</option>
									<option value='familyRoomA'>패밀리 스위트A</option>
									<option value='familyRoomB'>패밀리 스위트B</option>
									<option value='familyRoomC'>패밀리 스위트C</option>
							</select>
						</div>
					</div><div class="form-group">
						<label class="col-sm-4" for="fromdate">체크인 날짜 : </label>
						<div class="col-sm-8">
						<%if(fromdate.trim().length()>0){ %>
							<input type="text" class="form-control" name="fromdate" id="fromDate"readonly="readonly"  value=<%=fromdate %>>
						<%}else {%>
							<input type="text" class="form-control" name="fromdate" id="fromDate"readonly="readonly"  placeholder="오늘 이후 날짜로 선택 가능합니다.">
						<%} %>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4" for="todate">체크아웃 날짜 : </label>
						<div class="col-sm-8">
						<%if(todate.trim().length()>0){ %>
							<input type="text" class="form-control" name="todate" id="toDate"readonly="readonly"  value=<%=todate %>>
						<%}else {%>
							<input type="text" class="form-control" name="todate" id="toDate"readonly="readonly"  placeholder="체크인 이후 날짜로 선택 가능합니다.">
						<%} %>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4" for="term">숙박 일 수 : </label>
						<div class="col-sm-8">
							<input type="text" class="form-control"  name="term" id="term" readonly="readonly">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-4" for="todate">인원 : </label>
						<div class="col-sm-8">
							<select class="form-control" name="numberOfPeople" id="numberOfPeople">
									<option value="option">인원을 선택하세요</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-4 col-sm-8">
						 <%if(session.getAttribute("user_id") == null){%>
						 	<input type="submit" formaction="login.jsp"  class="btn btn-default" onclick="button_check();" value="예약하기">
        	  			<%}else{ %>
						 	<input type="submit" class="btn btn-default" value="예약하기">
						<%} %>
						</div>
					</div>
				</form>
			</div>
		</div>
		
		<div  id="roominfodeluxe">
			<br><br>
			<h3>객실 상세 정보</h3>
			<hr>
			<img class="img-responsive room" src="./consumer/roomimg/deluxedetail2.jpg" alt="img1">
			<br><br>
			<h3>시설 안내</h3>
			<hr>
			<div class= "row">
				<div class="col-xs-3" >
				<img class="img-responsive" src="./consumer/roomimg/bed.jpg" alt="img1" >
		       <div>최고급 침구</div><div>(폴란드 구스)</div>
				</div>
				<div class="col-xs-3">
				<img class="img-responsive" src="./consumer/roomimg/wifi.jpg" alt="img1">
				<div>유/무선</div><div>인터넷(무료)</div>
				</div>
				<div class="col-xs-3">
				<img class="img-responsive" src="./consumer/roomimg/food.jpg" alt="img1">
				<div>고급스러운</div><div>조식</div>
				</div>
				<div class="col-xs-3">
				<img class="img-responsive" src="./consumer/roomimg/money.jpg" alt="img1">
				</div>
		        <div>디지털</div><div>개인금고</div>

			<!-- <span class="glyphicon glyphicon-log-in"></span> -->
		</div>

</div>
		<div  id="roominfosweet">
			<br><br>
			<h3>객실 상세 정보</h3>
			<hr>
			<img class="img-responsive room" src="./consumer/roomimg/sweetdetail2.jpg" alt="img1">
			
			<br><br>
			<h3>시설 안내</h3>
			<hr>
			<div class= "row">
				<div class="col-xs-3" >
				<img class="img-responsive" src="./consumer/roomimg/bed.jpg" alt="img1" >
		       <div>최고급 침구</div><div>(폴란드 구스)</div>
				</div>
				<div class="col-xs-3">
				<img class="img-responsive" src="./consumer/roomimg/wifi.jpg" alt="img1">
				<div>유/무선</div><div>인터넷(무료)</div>
				</div>
				<div class="col-xs-3">
				<img class="img-responsive" src="./consumer/roomimg/food.jpg" alt="img1">
				<div>고급스러운</div><div>조식</div>
				</div>
				<div class="col-xs-3">
				<img class="img-responsive" src="./consumer/roomimg/money.jpg" alt="img1">
				</div>
		        <div>디지털</div><div>개인금고</div>

			<!-- <span class="glyphicon glyphicon-log-in"></span> -->
		</div>
</div>
		<div  id="roominfofamily">
			<br><br>
			<h3>객실 상세 정보</h3>
			<hr>
			<img class="img-responsive room" src="./consumer/roomimg/familydetail2.jpg" alt="img1">
			<br><br>
			<h3>시설 안내</h3>
			<hr>
			<div class= "row">
				<div class="col-xs-3" >
				<img class="img-responsive" src="./consumer/roomimg/bed.jpg" alt="img1" >
		       <div>최고급 침구</div><div>(폴란드 구스)</div>
				</div>
				<div class="col-xs-3">
				<img class="img-responsive" src="./consumer/roomimg/wifi.jpg" alt="img1">
				<div>유/무선</div><div>인터넷(무료)</div>
				</div>
				<div class="col-xs-3">
				<img class="img-responsive" src="./consumer/roomimg/food.jpg" alt="img1">
				<div>고급스러운</div><div>조식</div>
				</div>
				<div class="col-xs-3">
				<img class="img-responsive" src="./consumer/roomimg/money.jpg" alt="img1">
				</div>
		        <div>디지털</div><div>개인금고</div>

			<!-- <span class="glyphicon glyphicon-log-in"></span> -->
		</div>
</div>


	</div>


	<br><br>
	<jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>

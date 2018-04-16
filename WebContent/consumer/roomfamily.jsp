<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
session.setAttribute("loadpage", "/terra/consumer/roomfamily.jsp");
%>
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
			var con = confirm("로그인이 필요합니다");
			if(con == true){ location.replace("/terra/consumer/login.jsp"); }
			else{}
		}function go_reserv() {
			location.href = "/terra/reservefamily.res";
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
    <h2>패밀리 스위트</h2>
	<div class="pull-right">
    <%if(session.getAttribute("user_id") == null){%>
	<input type="button" class="btn btn-primary" onclick="button_check();" value="예약하기">
	<%}else{ %>
	<input type="button" class="btn btn-primary" onclick="go_reserv();" value="예약하기">
	<%} %>
	</div>
<p>패밀리 스위트 룸은 가족 단위 고객이 편안히 머무실 수 있도록 퀸베드와 싱글베드가 비치되어 있습니다.
안락하고 품격 있는 공간에서 여유로운 휴식을 경험하실 수 있습니다.</p>
<br>
			<!-- 슬라이드바 -->
			<div id="myCarousel" class="carousel slide  roomimg" data-ride="carousel">
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
						<img src="./roomimg/family1.jpg" alt="img1" class="img-responsive room"style="max-height: 500px;">
					</div>

					<div class="item">
						 <img src="./roomimg/family2.jpg" alt="img2" class="img-responsive room"style="max-height: 500px;">
					</div>

					<div class="item">
						 <img src="./roomimg/family3.jpg" alt="img3" class="img-responsive room"style="max-height: 500px;">
					</div>

					<div class="item">
						 <img src="./roomimg/family4.jpg" alt="img4" class="img-responsive room"style="max-height: 500px;">
					</div>
				</div>

				<!-- Left and right controls -->
				<a class="left carousel-control" href="#myCarousel" role="button"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#myCarousel" role="button"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
			<br><br>
			<h2 class="text-center">객실 상세 정보</h2>
			<hr>
			<img class="img-responsive room" src="./roomimg/familydetail2.jpg" alt="img1">
			<br><br>
			<h2 class="text-center">시설 안내</h2>
			<hr>
			<div class= "row">
				<div class="col-xs-3" >
				<img class="img-responsive" src="./roomimg/bed.jpg" alt="img1" >
		       <div>최고급 침구</div><div>(폴란드 구스)</div>
				</div>
				<div class="col-xs-3">
				<img class="img-responsive" src="./roomimg/wifi.jpg" alt="img1">
				<div>유/무선</div><div>인터넷(무료)</div>
				</div>
				<div class="col-xs-3">
				<img class="img-responsive" src="./roomimg/food.jpg" alt="img1">
				<div>고급스러운</div><div>조식</div>
				</div>
				<div class="col-xs-3">
				<img class="img-responsive" src="./roomimg/money.jpg" alt="img1">
				</div>
		        <div>디지털</div><div>개인금고</div>

			<!-- <span class="glyphicon glyphicon-log-in"></span> -->
		</div>
</div>

	<br><br>
	<jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>
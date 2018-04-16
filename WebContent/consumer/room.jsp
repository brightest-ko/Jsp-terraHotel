<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
session.setAttribute("loadpage", "/terra/consumer/room.jsp");
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
		}function go_reservDeluxe() {
			location.href = "/terra/reservedeluxe.res";
		}function go_reservSweet() {
			location.href = "/terra/reservesweet.res";
		}function go_reservFamily() {
			location.href = "/terra/reservefamily.res";
		}
</script>
	</head>
	<body>
	<jsp:include page="header.jsp"/>

 
    <div class="container">
			<section>
				<!-- page title -->
				<div class="">
					<h3>객실 종합 안내</h3>
					<p>Terra Hotel 내 객실의 위치 및 정보를 알려드립니다.</p>
				</div>
			</section>
		<section class="row">
			<!-- 딜럭스-->
			<div class="col-sm-6">
				<img src="./roomimg/deluxe1.jpg" alt="딜럭스 객실 사진"
					class="img-responsive roomimg">
			</div>
			<div class="col-sm-6">
				<h4>
					<p> Deluxe </p>
					딜럭스룸
				</h4>
				<p>딜럭스 룸은 창 밖으로 펼쳐지는 한강과 아차산의 수려한 경관을 조망할 수 있어 상쾌함과 편안함을 선사합니다</p>
				<ul>
					<li>위치 : 호텔 3층~11층 (360실)</li>
				</ul>
				<button type="button" class="btn btn-default"
					onclick="location.href='roomdeluxe.jsp'">MORE</button>

				<%
					if (session.getAttribute("user_id") == null) {
				%>
				<button type="button" class="btn btn-primary"
					onclick="button_check();">예약하기</button>
				<%
					} else {
				%>
				<button type="button" class="btn btn-primary"
					onclick="go_reservDeluxe();">예약하기</button>
				<%} %>
			</div>
		</section>
		<br>
		<hr>
		<br>
		<section class="row">
			<!-- 스위트-->
			<div class="col-sm-6">
				<img src="./roomimg/sweet1.jpg" alt="스위트 객실 사진"
					class="img-responsive roomimg">
			</div>
			<div class="col-sm-6">
				<h4>
					<p>Sweet</p>
					스위트룸
				</h4>
				<p>클럽 스위트 룸은 아늑한 분위기의 고급스럽고 품격 있는 공간으로 여유로운 휴식을 제공합니다. 클럽 라운지에서는
					호텔 수석 조리장이 준비한 조식과 해피아워 서비스를 경험하실 수 있습니다.</p>
				<ul>
					<li>위치 : 호텔 15층에서 16층 (29실)</li>
				</ul>
				<button type="button" class="btn btn-default"
					onclick="location.href='roomsweet.jsp'">MORE</button>
				<%
					if (session.getAttribute("user_id") == null) {
				%>
				<input type="button" class="btn btn-primary"
					onclick="button_check();" value="예약하기">
				<%
					} else {
				%>
				<input type="button" class="btn btn-primary" onclick="go_reservSweet();"
					value="예약하기">
				<%} %>	
			</div>
		</section>
		<br>
		<hr>
		<br>
		<section class="row">
			<!-- 스위트-->
			<div class="col-sm-6">
				<img src="./roomimg/family3.jpg" alt="패밀리 스위트 객실 사진"
					class="img-responsive roomimg">
			</div>
			<div class="col-sm-6">
				<h4>
					<p>Family Sweet</p>
					패밀리 스위트 룸
				</h4>
				<p>패밀리 스위트 룸은 가족 단위 고객이 편안히 묵으실 수 있도록 퀸베드와 싱글베드가 비치되어 있습니다. 안락하고 품격 있는 공간에서 여유로운 휴식을 경험하실 수 있습니다.</p>
				<ul>
					<li>위치 : 호텔 14층 (20실)</li>
				</ul>
				<button type="button" class="btn btn-default"
					onclick="location.href='roomfamily.jsp'">MORE</button>
				<%
					if (session.getAttribute("user_id") == null) {
				%>
				<input type="button" class="btn btn-primary"
					onclick="button_check();" value="예약하기">
				<%
					} else {
				%>
				<input type="button" class="btn btn-primary" onclick="go_reservFamily();"
					value="예약하기">
				<%} %>	
			</div>
		</section>
		<br>
		<hr>
		<br>
	</div>
	<br><br>
	<jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>
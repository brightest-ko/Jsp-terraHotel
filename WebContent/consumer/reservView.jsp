<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="reserv.*"%>
<%@page import="java.util.List"%>
<%
String user_id = (String)session.getAttribute("user_id");
int resnum =Integer.parseInt(request.getParameter("resnum"));
ReservDTO bean = ReservDAO.info(resnum);
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


<script>
function button_check(){
	alert("로그인이 필요합니다.");
}function go_reserv(){
	location.replace("/terra/reservinfo.res");
}
</script>
<%
String roomname= bean.getRoomname().trim();
if(roomname.equals("familyRoomA")||roomname.equals("familyRoomB")||roomname.equals("familyRoomC")){
%>
<script type="text/javascript">
$(function() {
		document.getElementById("img1").src = "/terra/consumer/roomimg/family1.jpg";
});
</script>
<%}else if(roomname.equals("sweetRoomA")||roomname.equals("sweetRoomB")||roomname.equals("sweetRoomC")){ %>
<script type="text/javascript">
$(function() {
		document.getElementById("img1").src = "/terra/consumer/roomimg/sweet1.jpg";
});
</script>
<%}else if(roomname.equals("deluxeRoomA")||roomname.equals("deluxeRoomB")||roomname.equals("deluxeRoomC")){ %>
<script type="text/javascript">
$(function() {
		document.getElementById("img1").src = "/terra/consumer/roomimg/deluxe1.jpg";
});
</script>
<%}%>
	</head>
	<body>
	
	<jsp:include page="header.jsp"/>
	
    <div class="container"> 
		<h2>예약페이지 확인</h2>
		<div class="table-responsive">
			<table class="table">
			<caption>※예약이 완료되었습니다.예약정보를 확인하세요</caption>
				<tr>
					<th colspan="4" class="text-center hidden-xs">
					<div>Terra Hotel에서 편안한 밤 보내세요. 최선을 다해 모시겠습니다.</div>
					</th>
					<th colspan="4" class="text-center visible-xs">
					<div>Terra Hotel에서 편안한 밤 보내세요.</div>
					<div>최선을 다해 모시겠습니다.</div>
					</th>
				</tr>
				<tr class="row">
					<td class="field-label col-md-3 active"><label>예약번호</label></td>
					<td class="col-md-9"><%=bean.getResnum() %></td>
				</tr>
				<tr class="row">
					<td class="field-label col-md-3 active"><label>방이름</label></td>
					<td class="col-md-9"><%=bean.getRoomname() %></td>
					<!-- <td class="col-md-3"><img id="img1" alt="예약한 방 이미지" class="img-responsive" style="width: 100%; max-height: ;">
					<div>※실제 방은 상기 이미지와 약간 다를 수 있습니다.※</div></td> -->
				</tr>
				<tr class="row">
					<td class="field-label col-md-3 active"><label>체크인 날짜</label></td>
					<td class="col-md-9"><%=bean.getFromdate() %></td>
				</tr>
				<tr class="row">
					<td class="field-label col-md-3 active"><label>체크아웃 날짜</label></td>
					<td class="col-md-9"><%=bean.getTodate() %></td>
				</tr>
				<tr class="row">
					<td class="field-label col-md-3 active"><label>기간</label></td>
					<td class="col-md-9"><%=bean.getTerm() %></td>
				</tr>
				<tr class="row">
					<td class="field-label col-md-3 active"><label>예약 인원</label></td>
					<td class="col-md-9"><%=bean.getNumberOfPeople() %></td>
				</tr>
				<tr class="row">
					<td class="field-label col-md-3 active"><label>예약날짜</label></td>
					<td class="col-md-9" colspan="2" ><%=bean.getResdate() %></td>
				</tr>
			</table>
		</div>
		
		<div class="pull-right">
	<input type="button" class="btn btn-default" onclick="location.replace('/terra/userlogout.ro');" value="HOME">
    <%if(session.getAttribute("user_id") == null){%>
	<input type="button" class="btn btn-default" onclick="button_check();" value="내 예약정보 확인">
	<%}else{ %>
	<input type="button" class="btn btn-default" onclick="go_reserv();" value="내 예약정보 확인">
	<%} %>
	<br>
	</div>
	</div>
	<br><br>
	<jsp:include page="footer.jsp"></jsp:include>
	
	</body>
</html>

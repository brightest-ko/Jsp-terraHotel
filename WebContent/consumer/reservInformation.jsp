<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="reserv.*" %>
<%@page import="java.util.List"%>
<%
session.setAttribute("loadpage", "/terra/consumer/reserveAddView.jsp?room=");
%>
<%
String user_id = (String)session.getAttribute("user_id");
List<ReservDTO> list1 = ReservDAO.userinfo1(user_id);
List<ReservDTO> list2 = ReservDAO.userinfo2(user_id);

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
<script type="text/javascript">		
function deletereserv(num){
	var con = confirm("예약을 취소하시겠습니까?");
	if(con == true){ location.replace("/terra/ReservRemoveAction.res?delete="+num); }
	else{}
}
function go(resnum){
	location.href="/terra/consumer/reservInfoView.jsp?resnum="+resnum;
}
</script>
<style type="text/css">
.td-style{cursor:pointer;}
</style>
	</head>
	<body>
		<jsp:include page="header.jsp"/>
		<article class="container">
			<div class= "row">
				<div class="col-sm-2">
					<jsp:include page="myinfosidemenu.jsp"/>
				</div>
		        <div class="col-sm-10">
			        <div class="page-header">
			          <h1>예약현황</h1>
			        </div>
		        	<h4>※ 체크인 날짜가 지난 예약은 아래쪽에 위치하며, 취소가 불가 합니다.※</h4>
				<table class="table table-bordered table-hover">
					<thead>
						<tr class="info">
							<th>예약번호</th>
							<th class="hidden-xs">방이름</th>
							<th class="hidden-xs">체크인 날짜</th>
							<th class="hidden-xs">체크아웃 날짜</th>
							<th class="visible-xs"><div>방이름</div><div>체크인날짜</div><div>체크아웃날짜</div></th>
							<th class="hidden-sm hidden-xs">기간</th>
							<th class="hidden-sm hidden-xs">예약 인원</th>
							<th class="hidden-sm hidden-xs">예약일</th>
							<th>&nbsp;&nbsp;</th>
						</tr>
					</thead>
					<tbody>
						<%
							if (list1.size() > 0) {
								for (int i = 0; i < list1.size(); i++) {
									ReservDTO r = (ReservDTO) list1.get(i);
						%>
						<tr>
							<td><%=r.getResnum()%></td>
							<td class="td-style hidden-xs" onClick="go(<%=r.getResnum()%>);"><%=r.getRoomname()%></td>
							<td class="td-style hidden-xs" onClick="go(<%=r.getResnum()%>);"><%=r.getFromdate()%></td>
							<td class="td-style hidden-xs" onClick="go(<%=r.getResnum()%>);"><%=r.getTodate()%></td>
							<td class="td-style visible-xs" onClick="go(<%=r.getResnum()%>);"><div><%=r.getRoomname()%></div>
							<div><%=r.getFromdate()%></div><div><%=r.getTodate()%></div></td>
							<td class="td-style hidden-sm hidden-xs" onClick="go(<%=r.getResnum()%>);"><%=r.getTerm()%></td>
							<td class="td-style hidden-sm hidden-xs" onClick="go(<%=r.getResnum()%>);"><%=r.getNumberOfPeople()%>명</td>
							<td class="td-style hidden-sm hidden-xs" onClick="go(<%=r.getResnum()%>);"><%=r.getResdate()%></td>
							<td><a
								href="javascript:deletereserv(<%=list1.get(i).getResnum()%>)">예약 취소</a></td>
						</tr>
						<%}}
							if (list2.size() > 0) {
								for (int i = 0; i < list2.size(); i++) {
									ReservDTO r = (ReservDTO) list2.get(i);
						%>
						<tr>
							<td><%=r.getResnum()%></td>
							<td class="td-style hidden-xs" onClick="go(<%=r.getResnum()%>);"><%=r.getRoomname()%></td>
							<td class="td-style hidden-xs" onClick="go(<%=r.getResnum()%>);"><%=r.getFromdate()%></td>
							<td class="td-style hidden-xs" onClick="go(<%=r.getResnum()%>);"><%=r.getTodate()%></td>
							<td class="td-style visible-xs" onClick="go(<%=r.getResnum()%>);"><div><%=r.getRoomname()%></div>
							<div><%=r.getFromdate()%></div><div><%=r.getTodate()%></div></td>
							<td class="td-style hidden-sm hidden-xs" onClick="go(<%=r.getResnum()%>);"><%=r.getTerm()%></td>
							<td class="td-style hidden-sm hidden-xs" onClick="go(<%=r.getResnum()%>);"><%=r.getNumberOfPeople()%>명</td>
							<td class="td-style hidden-sm hidden-xs" onClick="go(<%=r.getResnum()%>);"><%=r.getResdate()%></td>
							<td></td>
						</tr>
						<%
								}
							}
						if (list1.size() <= 0 && list2.size() <= 0) { 
						%>
						<tr>
							<td colspan="8">예약 정보가 없습니다.</td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>

			</div>
			</div>
		</article>
		<br><br>
		<jsp:include page="footer.jsp"/>
	</body>
</html>
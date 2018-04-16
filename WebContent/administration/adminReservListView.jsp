<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="reserv.*" %>
<%
//List<ReservDTO> list = ReservDAO.list();
session.setAttribute("adminloadpage", "adminReservListView.jsp");
%>
<%
//List<MemberBean> list = MemberDAO.list();
//System.out.println(request.getAttribute("memberboardlist"));
List<ReservDTO> list = (List)request.getAttribute("reservboardlist");
int pageNo = ((Integer) request.getAttribute("pageNo")).intValue();
int prevPage = ((Integer) request.getAttribute("prevPage")).intValue();
int beginPage = ((Integer) request.getAttribute("beginPage")).intValue();
int endPage = ((Integer) request.getAttribute("endPage")).intValue();
int nextPage = ((Integer) request.getAttribute("nextPage")).intValue();

// list.jsp?pageNo=1과 같은 형식으로 호출

%>
<!DOCTYPE html>
<html>
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
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
.td-style{cursor:pointer;}
</style>
<script type="text/javascript">
function allChk(obj){
    var chkObj = document.getElementsByName("delete");
    var rowCnt = chkObj.length - 1;
    var check = obj.checked;
    if (check) {﻿
        for (var i=0; i<=rowCnt; i++){
         if(chkObj[i].type == "checkbox"){ chkObj[i].checked = true; } 
        }
    } else {
        for (var i=0; i<=rowCnt; i++) {
         if(chkObj[i].type == "checkbox"){ chkObj[i].checked = false; }
        }
    }
} 

function go(resnum,pageno){
	location.href="./administration/adminReservUpdateView.jsp?resnum="+resnum+"&page="+pageno;
}
</script>
</head>
<body>

	<jsp:include page="header.jsp"/>
	
	<div class="container">
		<h2>예약현황</h2>
		<form action="administration/adminReservAddView.jsp"  method="post">
			<p class="pull-right">
			<button type="submit" name="insert" class="btn btn-default">추가</button>&nbsp;
			<button type="submit" formaction="adminReservRemoveAction.res" name="deleteSubmit" class="btn btn-default">삭제</button>
			<table class="table table-hover">
			<thead>
				<tr class="info row">
					<th class="col-md-1">예약번호</th>
					<th class="col-md-1">예약ID</th>
					<th class="col-md-2 hidden-xs">방이름</th>
					<th class="col-md-2 hidden-xs">체크인 날짜</th>
					<th class="col-md-2 hidden-xs">체크아웃 날짜</th>
					<th class="col-md-2 visible-xs"><div>방이름</div><div>체크인날짜</div><div>체크아웃날짜</div></th>
					<th class="col-md-1 hidden-sm hidden-xs">기간</th>
					<th class="col-md-1 ">예약 인원</th>
					<th class="col-md-2 ">예약일</th>	
					<th><input id="allCheck" type="checkbox" onclick="allChk(this);"/> </th>
				</tr>
			</thead>
				<tbody>
					<%
					if(list.size()>0){
						for (int i = 0; i < list.size(); i++) {
							ReservDTO r = (ReservDTO) list.get(i);
				%>
					<tr class="row">
						<td><%=r.getResnum()%></td>
						<td class="col-md-1 td-style" onClick="go(<%=r.getResnum()%>,<%=pageNo%>);"><%=r.getUser_id()%></td>
						<td class="td-style hidden-xs" onClick="go(<%=r.getResnum()%>,<%=pageNo%>);"><%=r.getRoomname()%></td>
						<td class="td-style hidden-xs" onClick="go(<%=r.getResnum()%>,<%=pageNo%>);"><%=r.getFromdate()%></td>
						<td class="td-style hidden-xs" onClick="go(<%=r.getResnum()%>,<%=pageNo%>);"><%=r.getTodate()%></td>
						<td class="td-style visible-xs" onClick="go(<%=r.getResnum()%>,<%=pageNo%>);">
						<div><%=r.getRoomname()%></div>
						<div><%=r.getFromdate()%></div>
						<div><%=r.getTodate()%></div>
						</td>
						<td class="td-style hidden-sm hidden-xs" onClick="go(<%=r.getResnum()%>,<%=pageNo%>);"><%=r.getTerm()%></td>
						<td class="td-style " onClick="go(<%=r.getResnum()%>,<%=pageNo%>);"><%=r.getNumberOfPeople()%>명</td>
						<td class="td-style " onClick="go(<%=r.getResnum()%>,<%=pageNo%>);"><%=r.getResdate()%></td>
						<td><input type="checkbox" name="delete" value="<%=r.getResnum()%>" /></td>
					</tr>
					<%
						}
								%>

					<tr>
						<td style="text-align: center;" colspan="10">
							<%
								if (prevPage != 0) {
							%>
							<button type="button" class="btn btn-default"
								onclick="location.href='./adminReservListviews.res?page=<%=prevPage%>'">이전</button>&nbsp;
							<%
								}
							%> <%
 	for (int i = beginPage; i <= endPage; i++) {
 		if (i == pageNo) {
 %>
							<button type="button" class="btn btn-warnning"><%=i%></button>&nbsp;
							<%
								} else {
							%>
							<button type="button" class="btn btn-default"
								onclick="location.href='./adminReservListviews.res?page=<%=i%>'"><%=i%></button>&nbsp;
							<%
								}
								}
							%> <%
 	if (nextPage != 0) {
 %>
							<button type="button" class="btn btn-default"
								onclick="location.href='./adminReservListviews.res?page=<%=nextPage%>'">다음</button>&nbsp;
							<%
					}
				%>
						</td>
					</tr>
					<% }else {
					%>
					<tr>
						<td colspan="10">예약 정보가 없습니다.</td>
					</tr>
					<%
						}
					%>
					
					<tr>
					<td class = "form-inline"  id="selectlist" colspan="10">
						<select name="selectType" id="selectType" class="form-control">
							<option value="sl" selected="selected"> 검색 조건 </option>
							<option value="user_id"> 아이디 </option>
							<option value="roomname"> 방 이름 </option>
						</select>
						<input type="text" class="form-control" id="selectWord" name="selectWord" />
						<input type="submit" formaction="adminReservListviews.res" class="btn btn-info" id="search" value="검색"/>
					</td>
				</tr>
				</tbody>
			</table>
		
		</form>
	</div>
	<br><br>
	<jsp:include page="footer.jsp"/>
</body>
</html>
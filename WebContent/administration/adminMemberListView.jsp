<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="member.*" %>
<%
//List<MemberBean> list = MemberDAO.list();
//System.out.println(request.getAttribute("memberboardlist"));
List<MemberBean> list = (List)request.getAttribute("memberboardlist");
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
	<title>언제나 Terra Hotel</title>
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
	<style>
		.jumbotron { margin-bottom: 0; }
		.navbar { margin-bottom: 0; border-radius: 0; }
		.row.content { height: 450px }
		.sidenav { padding-top: 20px; background-color: #f1f1f1; height: 100%; }
		@media screen and (max-width: 767px) {
			.sidenav {  height: auto; padding: 15px; }
			.row.content { height: auto; }
		}
		#notmember { text-align: center; }
		.input-group { z-index: -1000; }
		#pagings { text-align: center; }
		th { background-color: #f0fcf0 ; font-size: 11px; font-weight: bold;}
		table { font-size: 11px; font-weight: bold;}
		#mobileview { 
		border-top: 3px solid #ccc; 
		border-bottom: 1px solid #ccc;
		margin-top: -17px;
		padding: 10px 0;
		width: 100%;
		font-size: 12px;
		}
		.col-xs-3 {  border-right: 1px solid #ccc;}
		.desctoplist { cursor:pointer; }
		#selectlist { margin: auto; text-align: center; }
	</style>
</head>
<body>
	<jsp:include page="header.jsp"/>
	
	
	<div id="bodycontainer">
		<div class="container">
			<h2>회원현황</h2>
			<form action="memberListviews.ro" method="post">
				<p class="pull-right"></p>
				<table class="table table-bordered table-hover hidden-xs">
					<caption></caption>
					<tr class="">
						<th class="">번호</th>
						<th class="">아이디</th>
						<th class="">이름</th>
						<th class="">이메일</th>
						<th class="">성별</th>
						<th class="hidden-md hidden-sm">우편번호</th>
						<th class="hidden-md hidden-sm">주소</th>
						<th class="hidden-md hidden-sm">상세주소</th>
						<th class="hidden-sm">지역번호</th>
						<th class="hidden-sm">전화번호</th>
						<th class="hidden-sm">생년월일</th>
						<th class="">가입일</th>
						<th class="">등급</th>
					</tr>
	
					<% 
						if(list.size()>0){
							for (int i = 0; i < list.size(); i++) { MemberBean r = (MemberBean) list.get(i); 
					%>
					
					<tr class="hidden-xs">
						<td><%=r.getRownum() %></td>
						<td><%=r.getUser_id() %></td>
						<!-- <td><a href="관리자페이지회원상세정보?user_id=<%=r.getUser_id()%>"><%=r.getUser_id()%></a></td> -->
						<td class="desctoplist"  onClick = " location.href='./administration/AdminMemberUpdateView.ro?user_id=<%=r.getUser_id()%>&amp;page=<%=pageNo%>' "> <%=r.getUname()%> </td>
						<td class="desctoplist"  onClick = " location.href='./administration/AdminMemberUpdateView.ro?user_id=<%=r.getUser_id()%>&amp;page=<%=pageNo%>' "> <%=r.getEmail()%> </td>
						<td class="desctoplist"  onClick = " location.href='./administration/AdminMemberUpdateView.ro?user_id=<%=r.getUser_id()%>&amp;page=<%=pageNo%>' "> <%=r.getGender()%> </td>
						<td class="desctoplist hidden-md hidden-sm"  onClick = " location.href='./administration/AdminMemberUpdateView.ro?user_id=<%=r.getUser_id()%>&amp;page=<%=pageNo%>' "> <%=r.getPostnum()%> </td>
						<td class="desctoplist hidden-md hidden-sm"  onClick = " location.href='./administration/AdminMemberUpdateView.ro?user_id=<%=r.getUser_id()%>&amp;page=<%=pageNo%>' "> <%=r.getAddr()%> </td>
						<td class="desctoplist hidden-md hidden-sm"  onClick = " location.href='./administration/AdminMemberUpdateView.jsp?user_id=<%=r.getUser_id()%>&amp;page=<%=pageNo%>' "> <%=r.getDetailaddress()%> </td>
						<td class="desctoplist hidden-sm"  onClick = " location.href='./administration/AdminMemberUpdateView.jsp?user_id=<%=r.getUser_id()%>&amp;page=<%=pageNo%>' "> <%=r.getAreacode()%> </td>
						<td class="desctoplist hidden-sm"  onClick = " location.href='./administration/AdminMemberUpdateView.jsp?user_id=<%=r.getUser_id()%>&amp;page=<%=pageNo%>' "> <%=r.getTel()%> </td>
						<td class="desctoplist hidden-sm"  onClick = " location.href='./administration/AdminMemberUpdateView.jsp?user_id=<%=r.getUser_id()%>&amp;page=<%=pageNo%>' "> <%=r.getBirth()%> </td>
						<td class="desctoplist"  onClick = " location.href='./administration/AdminMemberUpdateView.jsp?user_id=<%=r.getUser_id()%>&amp;page=<%=pageNo%>' "> <%=r.getJoinDate()%> </td>
						<td class="desctoplist"  onClick = " location.href='./administration/AdminMemberUpdateView.jsp?user_id=<%=r.getUser_id()%>&amp;page=<%=pageNo%>' "> <%=r.getGrade()%> </td>
					</tr>
					<%
							}
						}
						else{
					%>
					<tr class="hidden-xs">
						<td colspan="13">회원이 없습니다.</td>
					</tr>
					<% 
						} 
					%>
					</table>
					<% 
						if(list.size()>0){
							for (int i = 0; i < list.size(); i++) { MemberBean r = (MemberBean) list.get(i); 
					%>
						<table class="desctoplist visible-xs" id="mobileview" onClick = " location.href='./administration/AdminMemberUpdateView.ro?user_id=<%=r.getUser_id()%>&amp;page=<%=pageNo%>' ">
							<caption></caption>
							<tr class="row">
								<td class="col-xs-2"><%=r.getRownum() %></td><td class="col-xs-3">아이디</td><td class="col-xs-7"><%=r.getUser_id()%></td>
							</tr>
							<tr class="row">
								<td class="col-xs-2"></td><td class="col-xs-3">이메일</td><td class="col-xs-7"><%=r.getEmail()%></td>
							</tr>
							<tr class="row">
								<td class="col-xs-2"></td><td class="col-xs-3">이름</td><td class="col-xs-7"><%=r.getUname()%></td>
							</tr>
							<tr class="row">
								<td class="col-xs-2"></td><td class="col-xs-3">등급</td><td class="col-xs-7"><%=r.getGrade()%></td>
							</tr>
						</table>
					<%
							}
						}
					else{
					%>
					<tr class="hidden-xs">
						<td colspan="3">회원이 없습니다.</td>
					</tr>
					<% 
						} 
					%>
					
					<table class="table">
					<caption></caption>
					<tr>
						<td id="pagings"  colspan="13">
					<% 
						if (prevPage != 0) {
					%>
						<button type="button" class="btn btn-default" 
						onclick="location.href='./memberListviews.ro?page=<%=prevPage%>'"> 이전 </button>&nbsp;
					<% }
						for (int i = beginPage; i <= endPage; i++) {
							if (i == pageNo) {
					%>
						<button type="button" class="btn btn-warnning"><%=i%></button>&nbsp;
						<% 
							}
							else {
						%>
						<button type="button" class="btn btn-default" 
						onclick="location.href='./memberListviews.ro?page=<%=i%>'"><%=i%></button>&nbsp; 
					<% 
							}
						}
					 	if (nextPage != 0) {
					 %>
						<button type="button" class="btn btn-default"
						onclick="location.href='./memberListviews.ro?page=<%=nextPage%>'">다음</button>&nbsp;
					<% 
						} 
					%>
						</td>
					</tr>
					<tr>
						<td id="selectlist" colspan="5">
							<select name="selectType" id="selectType" class="form-control ">
								<option value="user_id" selected="selected">아이디</option>
								<option value="uname">이름</option>
								<option value="email">이메일</option>
								<option value="grade">등급</option>
							</select>
						</td>
						<td colspan="4">
							<input type="text" class="form-control" id="selectWord" name="selectWord" />
						</td>
						<td colspan="3">
							<input type="submit" class="btn btn-info" id="search" value="검색"/>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	
	<jsp:include page="footer.jsp"/>
	
</body>
</html>
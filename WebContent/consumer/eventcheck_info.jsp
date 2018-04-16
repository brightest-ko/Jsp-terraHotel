<%@page import="member.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd");
	String today = formatter.format(new java.util.Date());
	
	MemberBean bean = MemberDAO.memberInformation((String)session.getAttribute("user_id"));
	session.setAttribute("setuser_id", request.getParameter("user_id"));
	String keyword = bean.getAreacode();
	String gender = bean.getGender();
	String grade = bean.getGrade();
%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="eventboard.*"%>
<%
	String id = null;
	if (session.getAttribute("user_id") != null) {
		id = (String) session.getAttribute("user_id");
	}
%>
<%
	List boardList = (List) request.getAttribute("eventboardlistc");//일단 너만 받아봄
	//수정 해야함@@@
	int pagenoc = ((Integer) request.getAttribute("pagenoc")).intValue();
	int prevpagec = ((Integer) request.getAttribute("prevPagec")).intValue();
	int nextpagec = ((Integer) request.getAttribute("nextPagec")).intValue();
	int beginpagec = ((Integer) request.getAttribute("beginPagec")).intValue();
	int endpagec = ((Integer) request.getAttribute("endPagec")).intValue();
	
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
		<style type="text/css">
		</style>
		<script type="text/javascript">
	function allChk(obj) { //체크박스 처리하는 방법 물어보기
		var chkObj = document.getElementsByName("delete");
		var rowCnt = chkObj.length - 1;
		var check = obj.checked;
		if (check) {
			for (var i = 0; i <= rowCnt; i++) {
				if (chkObj[i].type == "checkbox") {
					chkObj[i].checked = true;
				}
			}
		} else {
			for (var i = 0; i <= rowCnt; i++) {
				if (chkObj[i].type == "checkbox") {
					chkObj[i].checked = false;
				}
			}
		}
	}
</script>
		
		
	</head>
	<body>
	
		<jsp:include page="header.jsp"/>
		
		<article class="container">
			<div class= "row">
				<div class="col-sm-4 col-lg-2">
					<jsp:include page="myinfosidemenu.jsp"/>
				</div>
		        <div class="col-sm-6 col-lg-10">
			        <div class="page-header">
			          <h1>회원 이벤트 응모 정보</h1>
			        </div>
		        	<h2>이벤트 응모 현황</h2>
		        </div>
		<form action="./EventCheckDeleteAction.ro">
			<p class="pull-right">	
			<input type="hidden" name="pagenoc" value="<%=pagenoc%>">	
				<!-- <button type="submit" name="insert" class="btn btn-default">추가</button> -->
				&nbsp;
				<button type="submit" name="deleteSubmit" class="btn btn-default">삭제</button>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>이벤트 NO.</th>
						<th>이벤트 참여 아이디</th>												
						<th>참여 날짜</th>						
						<th><input id="allCheck" type="checkbox"
							onclick="allChk(this);" /></th>
					</tr>
				</thead>
				<tbody>
					<%
		if(boardList.size() > 0){
			for (int i = 0; i < boardList.size(); i++) {//이벤트 체크빈 수정
				EventCheckBean b = (EventCheckBean) boardList.get(i);
		%>	<tr>
						<td><%=b.getEc_num()%></td>						
						<td><%=b.getEc_id()%></td>
						<td><%=b.getEc_date()%></td>						
						<td><input type="checkbox" name="delete"value="<%=b.getEc_num()%>" /></td>
					</tr>
					</form>				
					<%
						}
						} else {
					%>
					<tr>
						<td colspan="4">이벤트 정보가 없습니다.</td>
					</tr>
					<%
						}
					%>
				</tbody>			
			<tr>
						<td style="text-align: center;" colspan="8">
							<%
								if (prevpagec != 0) {
							%>
							<button type="button" class="btn btn-default"
								onclick="location.href='./EventCheckInfo.ro?pagenoc=<%=prevpagec%>'">이전</button>&nbsp;
							<%
								}
							%> <%
 	for (int i = beginpagec; i <= endpagec; i++) {
 		if (i == pagenoc) {
 %>
							<button type="button" class="btn btn-warnning"><%=i%></button>&nbsp;
							<%
								} else {
							%>
							<button type="button" class="btn btn-default"
								onclick="location.href='./EventCheckInfo.ro?pagenoc=<%=i%>'"><%=i%></button>&nbsp;
							<%
								}
								}
							%> <%
 	if (nextpagec != 0) {
 %>
							<button type="button" class="btn btn-default"
								onclick="location.href='./EventCheckInfo.ro?pagenoc=<%=nextpagec%>'">다음</button>&nbsp;
							<%
					}
				%>
						</td>
					</tr>
		</table>
		</article>
		<br><br>
		<jsp:include page="footer.jsp"/>
	</body>
</html>
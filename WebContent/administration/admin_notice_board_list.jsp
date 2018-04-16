<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="noticeboard.*"%>
<%
	String id = null;
	if (session.getAttribute("user_id") != null) {
		id = (String) session.getAttribute("user_id");
	}
%>
<%
	List boardList = (List) request.getAttribute("adminnoticelist");//일단 너만 받아봄	
	
	int pageno = ((Integer) request.getAttribute("PageNo")).intValue();
	int prevpage = ((Integer) request.getAttribute("prevPage")).intValue();
	int nextpage = ((Integer) request.getAttribute("nextPage")).intValue();
	int beginpage = ((Integer) request.getAttribute("beginPage")).intValue();
	int endpage = ((Integer) request.getAttribute("endPage")).intValue();
%>
<!DOCTYPE html>
<html>
<head>
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
	
	<div class="container">
		<h2>공지 게시판</h2>
		<form action="./AdminNoticeDeleteAction.ro">
			<p class="pull-right">
			<input class="btn btn-default" type="button" value="글쓰기" onclick="location='AdminNoticeWrite.ro'">
				<!-- <button type="submit" name="insert" class="btn btn-default">추가</button> -->
				&nbsp;
				
			<table class="table  table_hover table-bordered">	
	 <thead>
	<tr >
	<th class="text-center">글번호</th>
	<th class="text-center"> 제목</th>
	<th class="text-center">등록일</th>
	<th class="text-center">조회수</th>
	</tr>
	</thead>
	 <tbody>
		<%
		if(boardList.size() > 0){
			for (int i = 0; i < boardList.size(); i++) {
				NoticeBean bl = (NoticeBean) boardList.get(i);
		%>
		<tr style = "cursor:pointer;" onClick ="location.href='AdminNoticeBoardDetailAction.ro?num=<%=bl.getN_num()%>' ">		
		<td class="text-center"><%=bl.getN_num()%></td>
		<td class="text-center"><%=bl.getN_subject()%></td>
		<td class="text-center"><%=bl.getN_date()%></td>
		<td class="text-center"><%=bl.getN_readcount()%>
						<%--  <%
							if (!(bl.getRev_file() == null)) {//첨부파일이 널이 아니면
						%> --%>  
					<!-- 	<img src="./img/file.gif"> -->
						 <%-- <%	} %> --%>
 <!--댓글 갯수 추가 예정 @@@@ -->
 </td> 		
		
		</tr>
		
	<%}%>
	<tr>
						<td style="text-align: center;" colspan="8">
							<%
								if (prevpage != 0) {
							%>
							<button type="button" class="btn btn-default"
								onclick="location.href='./AdminNoticeListAction.ro?page=<%=prevpage%>'">이전</button>&nbsp;
							<%
								}
							%> <%
 	for (int i = beginpage; i <= endpage; i++) {
 		if (i == pageno) {
 %>
							<button type="button" class="btn btn-warnning"><%=i%></button>&nbsp;
							<%
								} else {
							%>
							<button type="button" class="btn btn-default"
								onclick="location.href='./AdminNoticeListAction.ro?page=<%=i%>'"><%=i%></button>&nbsp;
							<%
								}
								}
							%> <%
 	if (nextpage != 0) {
 %>
							<button type="button" class="btn btn-default"
								onclick="location.href='./AdminNoticeListAction.ro?page=<%=nextpage%>'">다음</button>&nbsp;
							<%
					}
				%>
						</td>
					</tr>
	
	
	<%} else { %>
	<tr>
		<td colspan="6"> &nbsp; &nbsp; &nbsp;게시판에 글이 없습니다. &nbsp; &nbsp; &nbsp; </td>
		<tr>
		<%}  %>	
		</tbody>		
	</table>
	
	<hr>	
	<div>
	<!-- 
        <form>
        <div class = "form-inline">
            <select name="opt" class="form-control">
                <option value="0">제목</option>
                <option value="1">내용</option>
                <option value="2">제목+내용</option>
                <option value="3">글쓴이</option>
            </select>           
            <input type="text" size="20" name="searchfield" class="form-control"/>&nbsp;
             <input type="button" value="검색" onclick="location='/AdminNoticeBoardSea -->rchAction.ro'" class="btn btn-default"> -->
</div>

</div>
</form>
</div>
	</div>
	<br><br>
	<jsp:include page="footer.jsp"/>
 </body>
</html>
			
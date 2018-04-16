<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
session.setAttribute("loadpage", "/terra/NoticeBoardListAction.ro");
%>	
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
	List boardList = (List) request.getAttribute("noticeboardlist");//일단 너만 받아봄
	System.out.println(boardList);
	
	int listcount = ((Integer) request.getAttribute("listcount"))
			.intValue();	
	int nowpage = ((Integer) request.getAttribute("page")).intValue();
	int maxpage = ((Integer) request.getAttribute("maxpage"))
			.intValue();
	int startpage = ((Integer) request.getAttribute("startpage"))
			.intValue();
	int endpage = ((Integer) request.getAttribute("endpage"))
			.intValue();	
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
		<script type="text/javascript">
			function pagemove(str) {
				if(str=="1"){ location.href="consumer/login.html" }
				else if(str=="2"){ location.href="consumer/signup.jsp" }
			}
			function logout(){
				var con = confirm("접속을 종료하시겠습니까");
				if(con == true){
				location.replace("consumer/userlogout.jsp");
				}else{}
			}
		</script>
		<!--  이 부분 체크-->
		<script type="text/javascript">
function button_check(){	
		alert("로그인이 필요합니다.");		
			location.href="consumer/login.html"
}
		</script>		
	</head>
	<body>
	<jsp:include page="header1.jsp"/>
	
	<div class="table-responsive">
	<div class="container">
	 <h2>공지사항 게시판</h2>
	<table class="table  table_hover table-bordered">	
	 <thead>
	<tr>
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
		<tr style = "cursor:pointer;" onClick ="location.href='NoticeBoardDetailAction.ro?num=<%=bl.getN_num()%>' ">		
		<td class="text-center"><%=bl.getN_num()%></td>
		<td class="text-center"><%=bl.getN_subject()%></td>
		<td class="text-center"><%=bl.getN_date()%></td>
		<td class="text-center"><%=bl.getN_readcount()%>
 </td> 		
		
		</tr>
		
	<%}%>
	<tr>
			<td style=text-align:center; colspan="7" >
				<%
					if (nowpage <= 1) {
				%> [이전]&nbsp; <%
 	} else {
 %> <a href="./NoticeBoardListAction.ro?page=<%=nowpage - 1%>">[이전]</a>&nbsp; <%
 	}
 %> <%
 	for (int a = startpage; a <= endpage; a++) {
 		if (a == nowpage) {
 %> [<%=a%>] <%
 	} else {
 %> <a href="./NoticeBoardListAction.ro?page=<%=a%>">[<%=a%>]
			</a> &nbsp; <%
 	}
 %> <%
 	}
 %> <%
 	if (nowpage >= maxpage) {
 %> [다음] <%
 	} else {
 %> <a href="./NoticeBoardListAction.ro?page=<%=nowpage + 1%>">[다음]</a> <%
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
	<!--검색 수정 예정-->
        <form>
            <select name="opt">
                <option value="0">제목</option>
                <option value="1">내용</option>
                <option value="2">제목+내용</option>
                <!-- <option value="3">글쓴이</option> -->
            </select>           
            <input type="text" size="20" name="searchfield"/>&nbsp;
             <input type="button" value="검색" onclick="location='/NoticeBoardSearchAction.ro'">
             
           
              <%if(session.getAttribute("user_id") != null ){%>              
<%} else { %>
<%} %>
</div>
</form>
</div>
	</div>
	<br><br>
	<jsp:include page="footer.jsp"/>
 </body>
</html>

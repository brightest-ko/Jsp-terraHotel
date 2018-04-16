<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="qnaboard.*"%>
<%
	String id = null;
	if (session.getAttribute("user_id") != null) {
		id = (String) session.getAttribute("user_id");
	}	
	%>
	<%
	List boardList = (List) request.getAttribute("qnaboardlist");//일단 너만 받아봄
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
				if(str=="1"){ location.href="consumer/login.jsp" }
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
			location.href="consumer/login.jsp"
}
		</script>		
	</head>
	<body>
	<jsp:include page="header1.jsp"/>
	<div class="container">		 <h2>QNA 게시판</h2>
	<table class="table  table_hover table-bordered">	
	 <thead>
	<tr>
	<th>글번호</th>
	<th> 제목</th>
	<th>등록일</th>
	<th>조회수</th>
	</tr>
	</thead>
	 <tbody>
		<%
		if(boardList.size() > 0){
			for (int i = 0; i < boardList.size(); i++) {
				QnaBean bl = (QnaBean) boardList.get(i);
		%>
		<tr style = "cursor:pointer;" onClick ="location.href='QnaBoardDetailAction.ro?num=<%=bl.getQ_num()%>' ">	
		<td><%=bl.getQ_num()%></td>
		<td><%=bl.getQ_subject()%></td>
		<td><%=bl.getQ_date()%></td>
		<td><%=bl.getQ_readcount()%>
						
 </td> 		
		</tr>
		
	<%}%>
	<tr>
			<td style=text-align:center; colspan="7" >
				<%
					if (nowpage <= 1) {
				%> [이전]&nbsp; <%
 	} else {
 %> <a href="./QnaBoardListAction.ro?page=<%=nowpage - 1%>">[이전]</a>&nbsp; <%
 	}
 %> <%
 	for (int a = startpage; a <= endpage; a++) {
 		if (a == nowpage) {
 %> [<%=a%>] <%
 	} else {
 %> <a href="./QnaBoardListAction.ro?page=<%=a%>">[<%=a%>]
			</a> &nbsp; <%
 	}
 %> <%
 	}
 %> <%
 	if (nowpage >= maxpage) {
 %> [다음] <%
 	} else {
 %> <a href="./QnaBoardListAction.ro?page=<%=nowpage + 1%>">[다음]</a> <%
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
	<div>
	<!--검색 수정 예정-->
        <form>
          
           
              <%if(session.getAttribute("user_id") != null ){%>              
<input type="button" value="글쓰기" onclick="location='QnaBoardWrite.ro'"class="btn btn-info">
<%} else { %>
<input type="button" value="글쓰기" onclick="button_check();"class="btn btn-info">
<%} %>
</div>
</form>
</div>
	</div>
	</div>
	
 <br><br>
 <jsp:include page="footer.jsp"/>
 </body>
</html>

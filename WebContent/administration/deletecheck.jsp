<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="noticeboard.*"%>

<%
	NoticeBean board = (NoticeBean) request.getAttribute("noticebean");

%>
<% System.out.println(board); %>
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
	//alert("로그인이 필요합니다.");	
	var id = '<%=(String)session.getAttribute("user_id")%>';	
	if(id==null) {		
		alert("로그인이 필요합니다.");
		location.href="consumer/login.html" 
	}	else {	
	location.href="consumer/qna_board_write.jsp"	
	}
}
		</script>		
	</head>
	<body>
	<header>
		<jsp:include page="header.jsp"/>
	 <div class="table-responsive">
	<div class="container">
	 <h2>공지사항 게시판</h2>
	<table class="table table-bordered">		
		 <thead>
	<tr>
	<th>글번호</th><td><%=board.getN_num()%></td>
	<th>작성자</th><td><%=board.getN_id()%></td>
	<th>날짜</th><td><%=board.getN_date()%></td>
	<th>조회수</th><td><%=board.getN_readcount()%></td>
	</tr>
	<tr>
	<th>제목</th><td colspan="7"><%=board.getN_subject()%></td>
	</tr>	
	</thead>
	 <tbody>
	 <tr>
	 <td>
	 <div>내용</div>
	 </td>
	 <!-- 이부분 물어보기@@@@@ -->
		<td colspan="7" rowspan="6"><%=board.getN_content()%><br>
		
		</tr>
		</tbody>
		</table>		
		<form action="./AdminNoticeBoardDeleteAction.ro" method="post" 
		name="Deleteform">
				<table class="table table-bordered">
				<tr>
				<td>
			<input type="hidden" name="n_num" value="<%=board.getN_num()%>">
		</td>
		<td>
		<input type="hidden" name="n_id" value="<%=board.getN_id()%>">
				</td>
				<td>
		<input type="hidden" name="n_pw" value="<%=board.getN_pw()%>">
				</td>
				</tr>				
		<tr>
						<td>비밀번호</td>
						<td><input type="password" name="n_pw2"size="8" maxlength="8">8자 이하 입력</td>
					</tr>								
				</table>
				<tr>				
				<input type="submit" name="modify" value="삭 제 ">
		<input type="button" name="back" value="뒤 로" onclick="location='AdminQnaBoardDetailAction.ro?num=<%=board.getN_num()%>'">
				</tr>
</form>
 </div></div>
 <br><br>
 <jsp:include page="footer.jsp"/>
	</body>
	</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="noticeboard.*"%>
<%
/*
	String id = null;
	if (session.getAttribute("id") != null) {
		id = (String) session.getAttribute("id");
	}
	*/
	List boardList = (List) request.getAttribute("noticeboarlist");//일단 너만 받아봄
	NoticeBean board = (NoticeBean) request.getAttribute("noticebean");
	/*
	int listcount = ((Integer) request.getAttribute("listcount"))
			.intValue();
	int nowpage = ((Integer) request.getAttribute("page")).intValue();
	int maxpage = ((Integer) request.getAttribute("maxpage"))
			.intValue();
	int startpage = ((Integer) request.getAttribute("startpage"))
			.intValue();
	int endpage = ((Integer) request.getAttribute("endpage"))
			.intValue();
	*/
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
	

		
	</head>
	<body>
	<jsp:include page="header.jsp"/>
	
	<div class="table-responsive">
	<div class="container">
	<h2>Notice 게시판</h2>
	<form action="AdminNoticeBoardModifyAction.ro" method="post" name="modifyform">
	<input type="hidden" name="n_num" value="<%=board.getN_num()%>">
		<input type="hidden" name="n_id" value="<%=board.getN_id()%>">
		<input type="hidden" name="n_pw" value="<%=board.getN_pw()%>">
		<table class="table table-border">
		<tr>
		<td>제 목</td> <td><input name="n_subject" size="50" maxlength="100"
					value="<%=board.getN_subject()%>"> </td>
		</tr>
		<tr>
		<td>내 용</td>
				<td>
				<textarea name="n_content" cols="60" rows="15">
				<%=board.getN_content()%></textarea>
				</td>
				
			</tr>
			<tr>
			<span class="glyphicon fa fa-upload">첨부 파일</span><!-- 이 부분 if문으로 묶어야함 -->
			<%-- <%
					if (!(board.getN_file() == null)) {
				%> 
			<td><%String imgPath=request.getContextPath() + "/noticeupload/"+board.getN_file(); %>
				<img src="<%=imgPath%>"alt="엑스박스" title="첨부이미지" >			 
			 </td>
			 <%} else { %>
			 <td>첨부 이미지가 없습니다.</td>
			 <%} %>			 
			</tr> --%>
		<tr>
						<td>비밀번호</td>
						<td><input type="password" name="n_pw2" size="8">8자 이하 입력</td>
					</tr>		
		</table>			
	<input type="submit" name="modify" value="수 정"  class="btn btn-info">
	<input type="submit" name="back" value="뒤 로" onclick="javascript:history.go(-1)" class="btn btn-default">
	</form>	
	</div>
	</div>
	<br><br>
	<jsp:include page="footer.jsp"/>
</body>
</html>
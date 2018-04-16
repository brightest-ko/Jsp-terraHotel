<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="qnaboard.*"%>

<%
	QnaBean board = (QnaBean) request.getAttribute("qnabean");
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
		
	
		<!--  이 부분 체크-->
		<script type="text/javascript">
function button_check(){	
		alert("로그인이 필요합니다.");		
			location.href="consumer/login.html"
}
		</script>		
<meta charset="UTF-8">
<title>게시판</title>
<script type="text/javascript">
	function replyboard() {
		boardform.submit();
	}
</script>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="container">
<h2>답글</h2>
<form action="AdminQnaBoardReplyAction.ro" method="post" name="boardform">
<input type="hidden" name="q_re_ref" value="<%=board.getQ_re_ref()%>">
<table cellspacing="0">
	
	<tr>
		<td style="font-family: 돋음; font-size: 12;" height="16">
			<div align="center">글쓴이</div>
		</td>
		<td><input name="q_id" type="text"  value="admin" /></td>
	</tr>
	<tr>
		<td style="font-family: 돋음; font-size: 12;" height="16">
			<div align="center">제 목</div>
		</td>
		<td>
			<input name="q_subject" type="text" size="50" maxlength="100"	value="      Re: <%=board.getQ_subject() %>" />
		</td>
	</tr>
	<tr>
		<td style="font-family: 돋음; font-size: 12;">
			<div align="center">내 용</div>
		</td>
		<td>
			<textarea rows="15" cols="67" name="q_content"></textarea>
		</td>
	</tr>
	<tr>
		<td style="font-family: 돋음; font-size: 12;">
			<div align="center">비밀번호</div>
		</td>
		<td><input name="q_pw" type="password" /></td>
	</tr>
	<tr bgcolor="cccccc">
		<td colspan="2" style="height: 1px;"></td>
	</tr>
	<tr>
		<td colspan="2">&nbsp;</td>
	</tr>
	<tr align="center" valign="middle">
		<td colspan="5">
			<a href="javascript:replyboard()">[ 등 록 ]</a>&nbsp;&nbsp;
			<a href="javascript:history.go(-1)">[ 뒤 로 ]</a>&nbsp;&nbsp;
		</td>
	</tr>
	</table>
</form>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
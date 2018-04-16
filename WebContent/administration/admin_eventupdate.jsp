<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="eventboard.*"%>

<%
int num2=Integer.parseInt(request.getParameter("num"));
System.out.println(num2+"이벤트업데이트 페이지 넘어옴못넘어오냐???");
EventBean info= EventDAO.info(Integer.parseInt(request.getParameter("num"))); 
int pageno = Integer.parseInt(request.getParameter("pageno"));
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
<meta charset="UTF-8">
		<title>관리자페이지 이벤트수정</title>
	</head>
	<body>
		<div class="table-responsive">
	<div class="container">
	<h2>Event 게시판</h2>
	<form action="./AdminEventUpdateAction.ro?pageno=<%=pageno %>" method="post" name="modifyform"enctype="multipart/form-data">
	<input type="hidden" name="ev_num" value="<%=info.getEv_num()%>">
		<input type="hidden" name="ev_id" value="<%=info.getEv_id()%>">		
		<table class="table table-bordered">
		<tr>
		<td class="col-xs-3">제 목</td> <td class="col-xs-9"><textarea class="form-control"  name="ev_subject" 
					value="<%=info.getEv_subject()%>"></textarea> </td>
		</tr>
		<tr>
		<td class="col-xs-3">이벤트제한 숫자</td> <td class="col-xs-9"><textarea class="form-control" name="ev_count" 
					value="<%=info.getEv_count()%>"></textarea> </td>
		</tr>
		<tr>
		<td class="col-xs-3">내 용</td>
				<td class="col-xs-9">
				<textarea name="ev_content" class="form-control" rows="10">
				<%=info.getEv_content().replace("\n", "<br>")%></textarea>
				</td>				
			</tr>
			<tr>
		<td class="col-xs-3">
					<div>파일 첨부</div>
				</td>
				<!-- 파일첨부 이미지로 제한@@@ -->
				<td class="col-xs-9"><input name="ev_file" type="file" accept="image/*" />&nbsp;첨부시 이전 파일이 삭제됩니다.</td>
			</tr>				
		<tr>
			</table>			
	<input type="submit" class="btn btn-default pull-right" name="modify" value="수 정" >
	<input type="submit" class="btn btn-default pull-right" name="back" value="뒤 로" onclick="javascript:history.go(-1)">
	</form>	
	</div>
	</div>
	</body>
	</html>
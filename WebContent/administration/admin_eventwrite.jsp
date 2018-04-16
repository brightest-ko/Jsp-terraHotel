<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    <%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="eventboard.*"%>   

<%
	String id = null;
	if (session.getAttribute("user_id") != null) {
		id = (String) session.getAttribute("user_id");
		System.out.println(id);
	}
	//int pageno = Integer.parseInt(request.getParameter("pageno"));
%>
<%//페이지 파라미터도 받아야함@@@ %>
<!DOCTYPE html >
<html lang="ko">
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    	
    	<!--  이 부분 체크-->
	
<title>관리자페이지 이벤트글 추가</title>
</head>
<body>
<div class="table-responsive">
	<div class="container">
	 <h2>Event 게시판</h2>
	 <form action="./AdminEventAddAction.ro" method="post" enctype="multipart/form-data"
		name="boardform">
	<table class="table table-bordered">	
	 <thead>
	 <tr>
		<input type="hidden" name="ev_id" value="<%=id%>">				
			</tr>
	<tr>	
	<th>작성자</th><td><%=id%></td>	
	</tr>
	<tr>
	<th>제목</th><td ><textarea class="form-control" name="ev_subject"  value="" ></textarea></td>
	</tr>
	<tr>
	<th>이벤트제한 숫자</th><td ><textarea class="form-control" name="ev_count"  value="" ></textarea></td>
	</tr>		
	</thead>
	 <tbody>
	 <tr>
	 <td>
	 <div>내용</div>
	 </td>
		<td><textarea name="ev_content"class="form-control" rows="10"></textarea>		
		</td>			
		</tr>
		</tbody>
		<tr>
		<td>
					<div>파일 첨부</div>
				</td>
				<!-- 파일첨부 이미지로 제한@@@ -->
				<td><input name="ev_file" type="file" accept="image/*" /></td>
			</tr>				 	
		</table>
		<input type="submit" class="btn btn-default pull-right" name="admin_add" value="등 록">
		<input type="submit" class="btn btn-default pull-right" name="back" value="뒤 로" onclick="javascript:history.go(-1)">
			</form>
	</div></div>
</body>
</html>
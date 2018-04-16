<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    <%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="reviewboard.*"%>  
 

<%
	String id = null;
	if (session.getAttribute("user_id") != null) {
		id = (String) session.getAttribute("user_id");
		System.out.println(id);
	}
		
%>
<%//페이지 파라미터도 받아야함@@@ %>
<!DOCTYPE html >
<html lang="ko">
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    	
    	

<title>관리자페이지 리뷰글 추가</title>
</head>
<body>
<div class="table-responsive">
	<div class="container">
	 <h2>Review 게시판</h2>
	 <form action="./AdminReviewAddAction.ro" method="post" enctype="multipart/form-data"
		name="boardform">
	<table class="table table-bordered ">	
	 <thead>
	 <tr>
		<input type="hidden" name="rev_id" value="<%=id%>">				
			</tr>
	<tr>	
	<th class="text-center">작성자</th><td  class="form-control text-center"><%=id%></td>	
	</tr>
	<tr>
	<th class="text-center">제목</th><td><input type="text" name="rev_subject"  class="form-control"value=""  ></textarea></td>
	</tr>	
	</thead>
	
	 <tbody>
	 <tr>
	 <td class="text-center">
	 <div >내용</div>
	 </td>
		<td><textarea name="rev_content" class="form-control"  rows="15"></textarea>		
		</td>
		</tr>
		</tbody>
		<tr>
		<td class="text-center">
					<div>파일 첨부</div>
				</td>
				<!-- 파일첨부 이미지로 제한@@@ -->
				<td><input name="rev_file" type="file" accept="image/*" /></td>
				</tr>
				<hr>
			</tr>
			<tr >
						<td class="text-center">비밀번호</td>
						<td><input type="password" class="form-control" name="rev_pw">8자 이하 입력</td>
					</tr>
					</table>		
		<input type="submit" name="modify"class="btn btn-default pull-right"  value="등 록">
		<input type="submit" name="back" class="btn btn-default pull-right" value="뒤 로" onclick="javascript:history.go(-1)">
			</form>			
			
	</div></div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String id = (String) session.getAttribute("user_id");
%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="reviewboard.*"%>	
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
	//alert("로그인이 필요합니다.");	
	var id = '<%=(String)session.getAttribute("user_id")%>';
		//System.out.println(id);	
	//String id = null;
	//String id =null;	
	// request에서 id 파라미터를 가져온다
	if(id==null) {
		// id가 Null 이거나 없을 경우
		alert("로그인이 필요합니다.");
		location.href="consumer/login.html" 
	}	else {	
	location.href="ReviewBoardWrite.ro"
	//location.href="/ReviewBoardDeleteAction.ro"
	}
}
		</script>		
		
	</head>
	<body>
	<jsp:include page="header.jsp"/>
	<div class="table-responsive">
	<div class="container">
	 <h2>Review 게시판</h2>
	 <form action="./ReviewBoardAddAction.ro" method="post" enctype="multipart/form-data"
		name="boardform">
	<table class="table table-bordered">	
	 <thead>
	 <tr>
		<input type="hidden" name="rev_id" value="<%=id%>">				
			</tr>
	<tr>	
	<th>작성자</th><td><%=id%></td>	
	</tr>
	<tr>
	<th>제목</th><td colspan="7"><input name="rev_subject" type="text" class="form-control"value="" /></td>
	</tr>	
	</thead>
	 <tbody>
	 <tr>
	 <td>
	 <div>내용</div>
	 </td>
		<td colspan="7" ><textarea name="rev_content"  class="form-control" rows="15"></textarea>		
		</td>
		</tr>
			</tbody>
		<tr>
		<td>
					<div>파일 첨부</div>
				</td>
				<!-- 파일첨부 이미지로 제한@@@ -->
				<td><input name="rev_file" type="file" accept="image/*" /></td>
			</tr>
			
			<tr>
						<td>비밀번호</td>
						<td><input type="password" name="rev_pw" class="form-control">8자 이하 입력</td>
					</tr>				
			</table>
			
		<input type="submit" name="modify"class="btn btn-default pull-right"  value="등 록">
		<input type="submit" name="back" class="btn btn-default pull-right" value="뒤 로" onclick="javascript:history.go(-1)">
			
		
			</form>
		
	</div></div> <br><br>
 	<jsp:include page="footer.jsp"/>
</body>
</html>
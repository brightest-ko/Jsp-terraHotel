<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<%@ page import="noticeboard.*"%>
<%
	NoticeBean board = (NoticeBean) request.getAttribute("noticebean");
	session.setAttribute("loadpage", "/terra/AdminNoticeBoardDetailAction.ro?num="+board.getN_num());
%>
<% System.out.println(board); %>
<% System.out.println("넘어 오긴 하냐??"); %>
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
				if(str=="1"){ location.href="admin.html" }
			}
			function logout(){
				var con = confirm("접속을 종료하시겠습니까");
				if(con == true){
				location.replace("admin.jsp");
				}else{}
			}
		</script>
		<!--  이 부분 체크-->
		<script type="text/javascript">
function button_check(){
	//alert("로그인이 필요합니다.");		
	if(<%=(String)session.getAttribute("user_id")%>==null) {		
		alert("로그인이 필요합니다.");
		location.href="consumer/login.html" 
	}	
	/*
	else {	
	location.href="noticeboard/notice_board_write.jsp"	
	}*/
}
		</script>
		<script>
function button_event(){//수정 이동
	<%
	String id=(String)session.getAttribute("user_id");
	 String id2=(String)board.getN_id();
	System.out.println(id  + id2);//값은 다받음	
	String num98=  Integer.toString(board.getN_num());
	if (id==id2){ %>
	//확인		
	location.href="AdminNoticeBoardModify.ro?num=num98 "	
		//location.href="AdminNoticeBoardModify.ro?num=num98"	
	
	<%}%>
		return;
}
</script>
		<script>
function button_event2(){//삭제	
	<%
	String id3=(String)session.getAttribute("user_id");
	 String id4=(String)board.getN_id();
	String num99=  Integer.toString(board.getN_num());
	System.out.println(id  + id2);//값은 다받음
	if (id3==id4){ %>	   //확인		
	location.href="AdminNoticeBoardDeleteAction.ro?num=<%=board.getN_num()%>";
	location.href="AdminNoticeBoardDeleteCheckView.ro?num=num99"	
	
		// location.href= "AdminNoticeBoardDeleteCheckView.ro?num=num99"		 
<%	}%>
		return;
}
</script>	
		
	</head>
	<body>
	<jsp:include page="header.jsp"/>
<body>
 	 <div class="table-responsive">
	<div class="container">
	 <h2>Notice 게시판</h2>
	 
	<table class="table table-bordered">		
		 <thead>
	<tr>
	<th class="text-center">글번호</th><td><%=board.getN_num()%></td>
	<th class="text-center">작성자</th><td><%=board.getN_id()%></td>
	<th class="text-center">날짜</th><td><%=board.getN_date()%></td>
	<th class="text-center">조회수</th><td><%=board.getN_readcount()%></td>
	</tr>
	<tr>
	<th class="text-center">제목</th><td colspan="7"><%=board.getN_subject()%></td>
	</tr>	
	</thead>
	 <tbody>
	  <tr>
	 <td>
	 <div class="text-center">내용</div>
	 </td>
	 <!-- 이부분 물어보기@@@@@ -->
		<td colspan="7" rowspan="6"><%=board.getN_content().replace("\n", "<br>")%><br>
		<%-- <%
					if (!(board.getN_file() == null)) {
				%> 
				<%String imgPath=request.getContextPath() + "/noticeupload/"+board.getN_file(); %>
				<img src="<%=imgPath%>"alt="엑스박스" title="첨부이미지"  > 					
			 
			 <% } %>			  --%>
			 </td>
		</tr>
		</tbody>										
				</table>								
				<%if(session.getAttribute("user_id") != null ){%>
<input  type="button" value="수정" onclick="location='AdminNoticeBoardModify.ro?num=<%=board.getN_num() %>'" class="btn btn-info">
<input  type="button" value="삭제" onclick="location='AdminNoticeBoardDeleteCheckView.ro?num=<%=board.getN_num() %>'" class="btn btn-danger">
<input  type="button" value="목록" onclick="location='AdminNoticeBoardListAction.ro'" class="btn btn-default">
<%} else {%>			
<input  type="button" value="수정" onclick="button_check();" class="btn btn-info">
<input  type="button" value="삭제" onclick="button_check();" class="btn btn-danger">
<input  type="button" value="목록" onclick="location='AdminNoticeBoardListAction.ro'" class="btn btn-default">

<%}%>
 </div></div>
 <br><br>
 <jsp:include page="footer.jsp"/>
	</body>
	</html>
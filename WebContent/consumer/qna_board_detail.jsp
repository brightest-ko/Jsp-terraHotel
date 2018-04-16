<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="qnaboard.*"%>

<%
	QnaBean board = (QnaBean) request.getAttribute("qnabean");

%>
<% System.out.println(board); %>
<% System.out.println("넘어 오긴 하냐??"); %>
<!DOCTYPE html>
<html>
<jsp:include page="header1.jsp"/>

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
	if(<%=(String)session.getAttribute("user_id")%>==null) {		
		alert("로그인이 필요합니다.");
		location.href="consumer/login.jsp" 
	}	
	/*
	else {	
	location.href="qnaboard/qna_board_write.jsp"	
	}*/
}
		</script>
		<script>
function button_event(){//수정 이동
	<%
	String id=(String)session.getAttribute("user_id");
	 String id2=(String)board.getQ_id();
	System.out.println(id  + id2);//값은 다받음	
	String num98=  Integer.toString(board.getQ_num());
	if (id==id2){ %>
	//확인		
	location.href="QnaBoardModify.ro?num=num98 "	
		//location.href="QnaBoardModify.ro?num=num98"	
	
	<%}%>
		return;
}
</script>
		<script>
function button_event2(){//삭제	
	<%
	String id3=(String)session.getAttribute("user_id");
	 String id4=(String)board.getQ_id();
	String num99=  Integer.toString(board.getQ_num());
	System.out.println(id  + id2);//값은 다받음
	if (id3==id4){ %>	   //확인		
	location.href="QnaBoardDeleteAction.ro?num=<%=board.getQ_num()%>";
	location.href="QnaBoardDeleteCheckView.ro?num=num99"	
	
		// location.href= "QnaBoardDeleteCheckView.ro?num=num99"		 
<%	}%>
		return;
}
</script>	
		
	</head>
	<body>

<body>
 	 <div class="table-responsive">
	<div class="container">
	 <h2>Qna 게시판</h2>
	 
	<table class="table table-bordered">		
		 <thead>
	<tr>
	<th>글번호</th><td><%=board.getQ_num()%></td>
	<th>작성자</th><td><%=board.getQ_id()%></td>
	<th>날짜</th><td><%=board.getQ_date()%></td>
	<th>조회수</th><td><%=board.getQ_readcount()%></td>
	</tr>
	<tr>
	<th>제목</th><td colspan="7"><%=board.getQ_subject()%></td>
	</tr>	
	</thead>
	 <tbody>
	  <tr>
	 <td>
	 <div>내용</div>
	 </td>
	 <!-- 이부분 물어보기@@@@@ -->
		<td colspan="7" rowspan="6"><%=board.getQ_content()%><br>
		<%-- <%
					if (!(board.getQ_file() == null)) {
				%> 
				<%String imgPath=request.getContextPath() + "/qnaupload/"+board.getQ_file(); %>
				<img src="<%=imgPath%>"alt="엑스박스" title="첨부이미지"  > 					
			 
			 <% } %>			  --%>
			 </td>
		</tr>
		</tbody>										
				</table>								
				<%if(session.getAttribute("user_id") != null ){%>
<input  type="button" value="수정" onclick="location='QnaBoardModifyView.ro?num=<%=board.getQ_num() %>'">
<input  type="button" value="삭제" onclick="location='QnaBoardDeleteCheckView.ro?num=<%=board.getQ_num() %>'">
<input  type="button" value="목록" onclick="location='QnaBoardListAction.ro'">

<%} else {%>		
<input  type="button" value="수정" onclick="button_check();">
<input  type="button" value="삭제" onclick="button_check();">
<input  type="button" value="목록" onclick="location='QnaBoardListAction.ro'">

<%}%>
 </div></div>
 <br><br>
 <jsp:include page="footer.jsp"/>
	</body>
	</html>
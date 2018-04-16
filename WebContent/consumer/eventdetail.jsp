<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="eventboard.*"%>
<%
//session.setAttribute("loadpage", "eventdetail.jsp");
%>
<%
	EventBean board = (EventBean) request.getAttribute("eventbean");
	
String id = null;
	if (session.getAttribute("user_id") != null) {
		id = (String) session.getAttribute("user_id");
	}


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
		
	if(<%=(String)session.getAttribute("user_id")%>==null) {		
		alert("로그인이 필요합니다.");
		location.href="consumer/login.jsp" 
		//체크중
	}	
}
		</script>	
		<!-- 이미지 조절용@@@@ -->
		<script>
function AutoResize(MaxWidth) {
  for(var i=0;i<document.images.length;i++) {
    if(document.images[i].width > MaxWidth) {
      document.images[i].width=MaxWidth;
      document.images[i].height-=document.images[i].height*(document.images[i].width-MaxWidth)/document.images[i].width;
    }
  }
}
</script>	
	</head>
	<body >
	<jsp:include page="header.jsp"/>

 	 <div class="table-responsive">
	<div class="container">
	 <h2>Event 게시판</h2>
	 
	<table class="table table-bordered">		
		 <thead>
	<tr class="text-center">
	<td   >글번호</td><td class="col-xs-1" ><%=board.getEv_num()%></td>
	<td class=" hidden-xs">작성자</td><td >관리자</td><!-- 관리자로 그냥 처리해야겠다<%=board.getEv_id()%> -->
	<td class=" hidden-xs">날짜</td><td ><%=board.getEv_date()%></td>	
	</tr>
	
	<tr>
	<th>제목</th><td colspan="6"><%=board.getEv_subject()%></td>
	</tr>	
	</thead>
	 <tbody>
	  <tr>
	 <td>
	 내용
	 </td>
	 <!-- 이부분 물어보기@@@@@ -->
		<td  colspan="5"><%=board.getEv_content().replace("\n", "<br>") %>
		<%
					if (!(board.getEv_file() == null)) {
				%> 
				<%String imgPath=request.getContextPath() + "/eventupload/"+board.getEv_file(); %>
				<%System.out.println("impPath 경로 체크중@@@@@"+imgPath); %>
				<img class="img-responsive"  src="<%=imgPath%>"alt="엑스박스" title="첨부이미지"  > 			 
			 <% } %>			 
			 </td>
		</tr>
		
		
		</tbody>										
				</table>
				
				<hr>
				<div>
				 <form action="EventAction.ro" method="post" name="Eventform"><!-- 아이디랑 -->
				<input type="hidden" name="ev_id" value="<%=id%>">	
				<input type="hidden" name="ev_num" value="<%=board.getEv_num()%>">	
				<input type="hidden" name="ev_count" value="<%=board.getEv_count()%>">	
												
				<%if(session.getAttribute("user_id") != null ){%>
				<td ><%=board.getEv_count() %>개가 남았습니다.</td>
<input  type="submit" class="btn btn-default pull-right" value="응모" name="event" >
<input  type="submit" class="btn btn-default pull-right" value="뒤로" onclick="javascript:history.go(-1)">
<input  type="button" class="btn btn-default pull-right" value="목록" onclick="location='EventListAction.ro'">

<%} else {%>	
<td ><%=board.getEv_count() %>개가 남았습니다.</td>		
<input  type="button" class="form-control btn btn-default pull-right" value="응모" onclick="button_check();">
<input  type="button" class="form-control btn btn-default pull-right" value="뒤로" onclick="javascript:history.go(-1)">
<input  type="button"  class="form-control btn btn-default pull-right" value="목록" onclick="location='EventListAction.ro'"><!-- 페이징 더해서 겟방식 처리해야함 -->
<%}%>
</form>
</div>
 </div></div> 
	<br><br>
	<jsp:include page="footer.jsp"></jsp:include>
	</body>
	</html>
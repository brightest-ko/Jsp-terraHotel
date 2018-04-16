<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="reviewboard.*"%>
<%
	String id = null;
	if (session.getAttribute("user_id") != null) {
		id = (String) session.getAttribute("user_id");
	}	
	%>
		
	<%
	//리스트를  디테일 액션에서 이벤트 댓글 받아와야함
	List commentList = (List) request.getAttribute("reviewcommentlistc");
	System.out.println("코멘트리스트"+commentList);
	//이름 변경해야함@@@@@
	
	int pagenoc = ((Integer) request.getAttribute("pagenoc")).intValue();
	int prevpagec = ((Integer) request.getAttribute("prevPagec")).intValue();
	int nextpagec = ((Integer) request.getAttribute("nextPagec")).intValue();
	int beginpagec = ((Integer) request.getAttribute("beginPagec")).intValue();
	int endpagec = ((Integer) request.getAttribute("endPagec")).intValue();	
	int pageno = Integer.parseInt(request.getParameter("pageno"));
	request.setCharacterEncoding("UTF-8");//한글깨짐
	response.setCharacterEncoding("UTF-8");//한글깨짐
	String selectType=null;
	String selectWord=null;
	if(request.getAttribute("selectType")!=null) {
		selectType= (String)request.getAttribute("selectType");
		selectWord= (String)request.getAttribute("selectWord");
	}	
%>
<%
	ReviewBean board = (ReviewBean) request.getAttribute("reviewbean");
	session.setAttribute("loadpage", "/terra/ReviewBoardDetailAction.ro?num="+board.getRev_num());

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
	//alert("로그인이 필요합니다.");		
	if(<%=(String)session.getAttribute("user_id")%>==null) {		
		alert("로그인이 필요합니다.");
		location.href="consumer/login.jsp" 
	}		
}
		</script>
		
	<script type="text/javascript">
function del_check(){//이거 중요
	 if(confirm("정말 삭제 하시겠습니까?")) { 
		       return true; 
		        } else { 
		        return false;
		     } 
		    return false; 
		  } 
		</script>
		
	</head>
	<body>
	<jsp:include page="header.jsp"/>
<body>
 	 <div class="table-responsive">
	<div class="container">
	 <h2>Review 게시판</h2>	 
	<table class="table table-bordered">		
		 <thead>
	<tr class="text-center">
	<th class="text-center">글번호</th><td><%=board.getRev_num()%></td>
	<th class="text-center">작성자</th><td><%=board.getRev_id()%></td>
	<th class="hidden-xs text-center">날짜</th><td class="hidden-xs"><%=board.getRev_date()%></td>
	<th class="hidden-xs text-center">조회수</th><td class="hidden-xs"><%=board.getRev_readcount()%></td>
	</tr>
	<tr>
	<th>제목</th><td colspan="7"><%=board.getRev_subject()%></td>
	</tr>	
	</thead>
	 <tbody>
	  <tr>
	 <td>
	 <div>내용</div>
	 </td>
	 <!-- 이부분 물어보기@@@@@ -->
		<td colspan="7"><%=board.getRev_content().replace("\n", "<br>")%><br>
		<%
					if (!(board.getRev_file() == null)) {
				%> 
				<%String imgPath=request.getContextPath() + "/reviewupload/"+board.getRev_file(); %>
				<img class="img-responsive" src="<%=imgPath%>"alt="엑스박스" title="첨부이미지"  > 					
			 
			 <% } %>			 
			 </td>
		</tr>
		</tbody>										
				</table>								
				<%if(session.getAttribute("user_id") != null ){%>
<input  type="button" class="btn btn-default pull-right"  value="수정" onclick="location='ReviewBoardModify.ro?num=<%=board.getRev_num() %>&pageno=<%=pageno%>'">
<input  type="button" class="btn btn-default pull-right" value="삭제" onclick="location='ReviewBoardDeleteCheckView.ro?num=<%=board.getRev_num() %>&pageno=<%=pageno%>'">
<input  type="button" class="btn btn-default pull-right" value="뒤로" onclick="location.href='ReviewBoardListAction.ro?num=<%=board.getRev_num()%>&pageno=<%=pageno%>'">
<%} else {%>			
<input  type="button"  class="btn btn-default pull-right" value="수정" onclick="button_check();">
<input  type="button" class="btn btn-default pull-right"  value="삭제" onclick="button_check();">
<input  type="button" class="btn btn-default pull-right" value="뒤로" onclick="location.href='ReviewBoardListAction.ro?num=<%=board.getRev_num()%>&pageno=<%=pageno%>'">
<%}%>
</div></div>
 <div class="table-responsive">
	<div class="container">
<form action="./ReviewCommentAddAction.ro?pageno=<%=pageno%>" method="post" >
	<table class="table table-bordered">	
	 <tbody>
	 <tr>
		<input type="hidden" name="rc_id" value="<%=id%>">				
		<input type="hidden" name="rc_num" value="<%=board.getRev_num()%>">
		<input type="hidden" name="pageno" value="<%=pageno%>">	<!-- 기존 페이지 번호 보냄 -->							
			</tr>
	<tr>	
	<td class="text-center col-xs-1">댓 글</td>					
	<td class="col-xs-10"><textarea name="rc_content" type="text" class="form-control" value="" ></textarea></td>
	<% if(session.getAttribute("user_id") != null ){%>
	<td class="col-xs-1"><input type="submit" class="btn btn-default pull-right" name="addcoment" value="등 록">
		</td>
		<% } else { %>
		<td class="col-xs-1"><input type="button" class="btn btn-default pull-right" name="addcoment" value="등 록" onclick="button_check();">
		</td>
		<%} %>		
	</tr>
	</tbody>	
	</table>
</form>

<form action="./ReviewCommentDeleteAction.ro?pageno=<%=pageno%>" method="post" >
<table class="table table-bordered">	
	 <thead>
<%
		if(commentList.size() > 0){
			for (int i = 0; i < commentList.size(); i++) {
				ReviewCommentBean b = (ReviewCommentBean) commentList.get(i);
		%>
   <tr>	
   <input type="hidden" name="pageno" value="<%=pageno%>">
   <input type="hidden" name="rc_no" value="<%=b.getRc_no()%>">
   <input type="hidden" name="rc_id11" value="<%=b.getRc_id()%>">
   <input type="hidden" name="rev_id2" value="<%=board.getRev_id()%>">
   <input type="hidden" name="rev_num2" value="<%=board.getRev_num()%>">
   <td class="col-xs-1">아이디:</td><td class="col-xs-1"><%=b.getRc_id() %></td>
	<td class="col-xs-1">댓 글</td><td class="col-xs-6"><%=b.getRc_content().replace("\r\n","<br>") %></td><!-- 문자열 출력시 교체@@@ -->
	<td class="col-xs-1">날 짜:</td><td class="col-xs-1"><%=b.getRc_date() %></td>
	<% if(session.getAttribute("user_id") != null ){%>				
	<td text-align="center;">		
		<input type="submit" name="delete" class="btn btn-default pull-right"  value="삭 제"  onclick="del_check();">
		</td>
		<% } else { %>		
		<input type="button" name="delete"  class="btn btn-default pull-right" value="삭 제" onclick="button_check();">
		</td>
		<%} %>				
	</tr>
	<%} %>
	</thead>
		<tbody>
			<tr>
						<td style="text-align: center;" colspan="8">
							<%
								if (prevpagec != 0) {
							%>
							<button type="button" class="btn btn-default"
								onclick="location.href='./ReviewBoardDetailAction.ro?pagenoc=<%=prevpagec%>&pageno=<%=pageno%>&num=<%=board.getRev_num()%>'">이전</button>&nbsp;
							<%
								}
							%> <%
 	for (int i = beginpagec; i <= endpagec; i++) {
 		if (i == pagenoc) {
 %>
							<button type="button" class="btn btn-warnning"><%=i%></button>&nbsp;
							<%
								} else {
							%>
							<button type="button" class="btn btn-default"
								onclick="location.href='./ReviewBoardDetailAction.ro?pagenoc=<%=i%>&pageno=<%=pageno%>&num=<%=board.getRev_num()%>'"><%=i%></button>&nbsp;
							<%
								}
								}
							%> <%
 	if (nextpagec != 0) {
 %>
							<button type="button" class="btn btn-default"
								onclick="location.href='./ReviewBoardDetailAction.ro?pagenoc<%=nextpagec%>&pageno=<%=pageno%>&num=<%=board.getRev_num()%>'">다음</button>&nbsp;
							<%
					}
				%>
						</td>
					</tr>
	<%} else { %>
	<tr>
		<td colspan="6"> &nbsp; &nbsp; &nbsp; 댓글이 없습니다. &nbsp; &nbsp; &nbsp; </td>
		</tr>
		<%}  %>	
	</tbody>				
	</table>
	
	</form>
 </div></div>
 
 <br><br><!-- 푸터 -->
 	<jsp:include page="footer.jsp"/>
	</body>
	</html>
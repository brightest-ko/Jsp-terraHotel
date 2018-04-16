<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
session.setAttribute("loadpage", "/terra/ReviewBoardListAction.ro");
%>		
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
	request.setCharacterEncoding("UTF-8");//한글깨짐
	response.setCharacterEncoding("UTF-8");//한글깨짐
	List<ReviewBean> boardList = (List) request.getAttribute("reviewboardlist");//일단 너만 받아봄		
	int pageno = ((Integer) request.getAttribute("pageno")).intValue();
	int prevpage = ((Integer) request.getAttribute("prevPage")).intValue();
	int nextpage = ((Integer) request.getAttribute("nextPage")).intValue();
	int beginpage = ((Integer) request.getAttribute("beginPage")).intValue();
	int endpage = ((Integer) request.getAttribute("endPage")).intValue();
	
	String selectType=null;
	String selectWord=null;
	if(request.getAttribute("selectType")!=null) {
		selectType= (String)request.getAttribute("selectType");
		selectWord= (String)request.getAttribute("selectWord");
	}	
	
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
		<!--  이 부분 체크-->
		<script type="text/javascript">
function button_check(){	
		alert("로그인이 필요합니다.");		
			location.href="consumer/login.jsp"
}
		</script>		
	</head>
	<body>
	<jsp:include page="header.jsp"/>
	
	<div class="table-responsive">
	<div class="container">
	 <h2>Review 게시판</h2>
	<table class="table  table_hover table-condensed">	
	 <thead>
	<tr>
	<th>글번호</th>
	<th>작성자</th>
	<th colspan="3">제목</th>	
	<th class="hidden-xs">날짜</th>
	<th class="hidden-xs">조회수</th>
	</tr>
	</thead>
	 <tbody>
		<%
		if(boardList.size() > 0){
			for (int i = 0; i < boardList.size(); i++) {
				ReviewBean bl = (ReviewBean) boardList.get(i);
		%>
		<tr style = "cursor:pointer;" onClick ="location.href='ReviewBoardDetailAction.ro?num=<%=bl.getRev_num()%>&pageno=<%=pageno%>' ">		
		<td><%=bl.getRev_num()%></td>
		<td><%=bl.getRev_id()%></td>
		<td colspan="3"><%=bl.getRev_subject()%>
		
						<%
							if (!(bl.getRev_file() == null)) {//첨부파일이 널이 아니면
						%> 
						<span class="glyphicons glyphicons-camera"></span>
						 <%	} %>
 <!--댓글 갯수 추가 예정 @@@@ -->
 </td> 		
		<td class="hidden-xs"><%=bl.getRev_date()%></td>
		<td class="hidden-xs"><%=bl.getRev_readcount()%></td>
		</tr>
		
	<%}%>
	
	
	<tr>
						<td style="text-align: center;" colspan="8">
							<%
								if (prevpage != 0) {
							%>
							<% if (request.getAttribute("selectType")==null) { %>
							<button type="button" class="btn btn-default"
								onclick="location.href='./ReviewBoardListAction.ro?pageno=<%=prevpage%>'">이전</button>&nbsp;
								<% }else { %>
								<button type="button" class="btn btn-default"
								onclick="location.href='./ReviewBoardListAction.ro?pageno=<%=prevpage%>&selectType=<%=selectType %>&selectWord=<%=selectWord%>'">이전</button>&nbsp;
								<%} %>
							<%
								}
							%> 
							<%
 	for (int i = beginpage; i <= endpage; i++) {
 		if (i == pageno) {
 %>
							<button type="button" class="btn btn-warnning"><%=i%></button>&nbsp;
							<%
								} else {
							%>
							
							<% if (request.getAttribute("selectType")==null) { %>
							<button type="button" class="btn btn-default"
								onclick="location.href='./ReviewBoardListAction.ro?pageno=<%=i%>'"><%=i%></button>&nbsp;
							<%}else{ %>
								<button type="button" class="btn btn-default"
								onclick="location.href='./ReviewBoardListAction.ro?pageno=<%=i%>&selectType=<%=selectType%>&selectWord=<%=selectWord%>'"><%=i%></button>&nbsp;
							<%} %>
							
							<%
								}
								}
							%> <%
 	if (nextpage != 0) {
 %>
 			
 			<% if (request.getAttribute("selectType")==null) { %>
							<button type="button" class="btn btn-default"
								onclick="location.href='./ReviewBoardListAction.ro?pageno=<%=nextpage%>'">다음</button>&nbsp;
							<%}else{ %>
								<button type="button" class="btn btn-default"
								onclick="location.href='./ReviewBoardListAction.ro?pageno=<%=nextpage%>&selectType=<%=selectType%>&selectWord=<%=selectWord%>'">다음</button>&nbsp;
							<%} %>
							
							<%
					}
				%>
						</td>
					</tr>
	
	
	<%} else { %>
	<tr>
		<td colspan="7"> &nbsp; &nbsp; &nbsp;게시판에 글이 없습니다. &nbsp; &nbsp; &nbsp; </td>
		<tr>
		<%}  %>	
	
	
	
					
					
					<hr>	
	<div>	
      <tr class="text-center">	
         <td class = "form-inline"  id="selectlist" colspan="10">
               <form name="serach"  >
						<select name="selectType" id="selectType" class="form-control">
							<option value="sl" selected="selected"> 검색 조건 </option>
							<option value="user_id"> 아이디 </option>							
							<option value="subject">제 목 </option>
							<option value="content">내 용 </option>
						</select>
        <input type="text" class="form-control" id="selectWord" name="selectWord" />
					<input type="submit" formaction="ReviewBoardListAction.ro" class="btn btn-default" id="search" value="검색"/>
					   <%if(session.getAttribute("user_id") != null ){%>              
<input type="button" value="글쓰기"  class="btn btn-default pull-center" onclick="location='ReviewBoardWrite.ro'">
<%} else { %>
<input type="button" value="글쓰기"class="btn btn-default pull-center"  onclick="button_check();">
<%} %>			
	</form>  	    
					</td>
				</tr>				
             </div>	      
             	</tbody>		
	</table>  

</div>
	</div>
	 <br><br>
 	<jsp:include page="footer.jsp"/>
 </body>
</html>

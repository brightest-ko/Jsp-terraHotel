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
<%
int num2=Integer.parseInt(request.getParameter("num"));
System.out.println(num2+"이벤트업데이트 페이지 넘어옴못넘어오냐???");
ReviewBean info= ReviewDAO.info(Integer.parseInt(request.getParameter("num"))); 
%>
<%
	//리스트를  디테일 액션에서 이벤트 댓글 받아와야함
	List commentList = (List) request.getAttribute("admincommentlistc");
	System.out.println("코멘트리스트"+commentList);
	//이름 변경해야함@@@@@		
	int pagenoc = ((Integer) request.getAttribute("pagenoc")).intValue();
	int prevpagec = ((Integer) request.getAttribute("prevPagec")).intValue();
	int nextpagec = ((Integer) request.getAttribute("nextPagec")).intValue();
	int beginpagec = ((Integer) request.getAttribute("beginPagec")).intValue();
	int endpagec = ((Integer) request.getAttribute("endPagec")).intValue();
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

		<title>관리자페이지 리뷰수정</title>
	
	<!--  삭제 체크-->
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
	<div class="table-responsive">
	<div class="container">
	<h2>Review 게시판</h2>	
	<form action="AdminReviewUpdateAction.ro?pageno=<%=pageno %>" method="post" name="modifyform" enctype="multipart/form-data">
	
	<input type="hidden" name="rev_num" value="<%=info.getRev_num()%>">
		<input type="hidden" name="rev_id" value="<%=info.getRev_id()%>">
		<input type="hidden" name="rev_pw" value="<%=info.getRev_pw()%>">		
		
			
		<table class="table table-bordered ">
		<tr>
		<td class="col-xs-1 text-center">제 목</td> <td class="col-xs-11"><textarea  class="form-control" name="rev_subject" 
					value="<%=info.getRev_subject()%>"> </textarea></td>
		</tr>
		<tr>
		<td class="col-xs-1 text-center">내 용</td>
				<td class="col-xs-11">
				<textarea name="rev_content" class="form-control" rows="10">
				<%=info.getRev_content().replace("\n","<br>") %></textarea>
				</td>				
			</tr>
		<tr>
		<td class="col-xs-2">
					<div class="text-center" >파일 첨부</div>
				</td>
				<!-- 파일첨부 이미지로 제한@@@ -->
				<td class="col-xs-10 "><input name="rev_file" type="file" accept="image/*" />&nbsp;첨부시 이전 파일이 삭제됩니다.</td>
			</tr>				
		<tr>
						<td class="col-xs-2 text-center">비밀번호</td>
						<td class="col-xs-10"><input type="password"class="form-control"  name="rev_pw2" value="<%=info.getRev_pw()%>">8자 이하 필수입력</td>
					</tr>		
		</table>			
	<input type="submit"class="btn btn-default pull-right"  name="modify" value="수 정" >
	
		<input type="submit" class="btn btn-default pull-right" name="back" value="뒤 로" onclick="location.href='ReviewBoardListAction.ro?num=<%=info.getRev_num()%>&pageno=<%=pageno%>">
	
	</form>	
	</div></div>
	
	<div class="table-responsive">
	<div class="container">	
<form action="./AdminCommentAddAction.ro?pageno=<%=pageno %>" method="post" >
	
	<table class="table table-bordered">	
	 <thead>
	 <tr>
	
		<input type="hidden" name="rc_id" value="<%=id%>">				
		<input type="hidden" name="rc_num" value="<%=info.getRev_num()%>">						
			</tr>
	<tr>	
	<td class="text-center col-xs-1">댓 글</td>					
	<td class="col-xs-11"><textarea class="form-control" name="rc_content"value="" ></textarea></td>
	
	<td class="col-xs-2"><input type="submit" class="btn btn-default pull-right text-center" name="addcoment" value="등 록">
		</td>
		
				
	</tr>
	</thead>	
	</table>
</form>
<form action="./AdminCommentDeleteAction.ro?pageno=<%=pageno %>" method="post" >

<table class="table table-bordered">	
	 <thead>
<%
		if(commentList.size() > 0){
			for (int i = 0; i < commentList.size(); i++) {
				ReviewCommentBean bs = (ReviewCommentBean) commentList.get(i);
		%>
   <tr>	
   
   <input type="hidden" name="rc_no" value="<%=bs.getRc_no()%>">
   <input type="hidden" name="rc_id11" value="<%=bs.getRc_id()%>">
   <input type="hidden" name="rev_id2" value="<%=info.getRev_id()%>">
   <input type="hidden" name="rev_num2" value="<%=info.getRev_num()%>">
   <td class="col-xs-1 text-center">아이디:</td><td class="col-xs-1"><%=bs.getRc_id() %></td>
	<td class="col-xs-1 text-center">댓 글</td><td class="col-xs-10"><%=bs.getRc_content() %></td>
	<td class="hidden-xs col-xs-1 text-center">날 짜:</td><td  class="hidden-xs col-xs-1""><%=bs.getRc_date() %></td>
	<% if(session.getAttribute("user_id") != null ){%>				
	<td >		
		<input type="submit"class="btn btn-default pull-right" name="delete" value="삭 제"  onclick="del_check();">
		</td>
		<% } else { %>		
		<input type="button" class="btn btn-default pull-right" name="delete" value="삭 제" onclick="button_check();">
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
								onclick="location.href='./AdminReviewUpdateViewAction.ro?pagenoc=<%=prevpagec%>&pageno=<%=pageno%>'">이전</button>&nbsp;
						
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
								onclick="location.href='./AdminReviewUpdateViewAction.ro?pagenoc=<%=i%>&pageno=<%=pageno%>'"><%=i%></button>&nbsp;
						
							<%
								}
								}
							%> <%
 	if (nextpagec != 0) {
 %> 							
							<button type="button" class="btn btn-default"
								onclick="location.href='./AdminReviewUpdateViewAction.ro?pagenoc=<%=nextpagec%>&pageno=<%=pageno%>'">다음</button>&nbsp;
						
							<%
					}
				%>
						</td>
					</tr>
	<%} else { %>
	<tr>
		<td colspan="6"> &nbsp; &nbsp; &nbsp; 댓글이 없습니다. &nbsp; &nbsp; &nbsp; </td>
		</tr>
		<%
		}  
		%>	
	</tbody>				
	</table>	
	</form>
 </div></div>	
	</body>
	</html>
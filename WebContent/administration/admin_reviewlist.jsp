<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="reviewboard.*"%>
<%
request.setCharacterEncoding("UTF-8");//한글깨짐
response.setCharacterEncoding("UTF-8");//한글깨짐
	String id = null;
	if (session.getAttribute("user_id") != null) {
		id = (String) session.getAttribute("user_id");
	}
%>
<%
	List<ReviewBean> boardList = (List) request.getAttribute("adminreviewlist");//일단 너만 받아봄
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
	function allChk(obj) { //체크박스 처리하는 방법 물어보기
		var chkObj = document.getElementsByName("delete");
		var rowCnt = chkObj.length - 1;
		var check = obj.checked;
		if (check) {
			for (var i = 0; i <= rowCnt; i++) {
				if (chkObj[i].type == "checkbox") {
					chkObj[i].checked = true;
				}
			}
		} else {
			for (var i = 0; i <= rowCnt; i++) {
				if (chkObj[i].type == "checkbox") {
					chkObj[i].checked = false;
				}
			}
		}
	}
</script>
<!-- 삭제 체크 -->
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
	<div class="table-responsive">
	<div class="container">
		<h2>리뷰 게시판</h2>
		<form action="./AdminReviewDeleteAction.ro">
			<p class="pull-right">
			<input type="hidden" name="pageno" value="<%=pageno%>">
			<input class="btn btn-default" type="button" value="글쓰기" onclick="location='AdminReviewWrite.ro'">
				<!-- <button type="submit" name="insert" class="btn btn-default">추가</button> -->
				&nbsp;
				<button type="submit" name="deleteSubmit" class="btn btn-default" onclick="del_check()">삭제</button>
			<table class="table table-condensed  table-hover">
				<thead>
					<tr>
						<th class="hidden-xs">글번호</th>
						<th>작성자</th>
						<th>제목</th>						
						<th class="hidden-xs">날짜</th>						
						<th><input id="allCheck" type="checkbox"
							onclick="allChk(this);" /></th>
					</tr>
				</thead>
				<tbody>
					<%
		if(boardList.size() > 0){
			for (int i = 0; i < boardList.size(); i++) {
				ReviewBean b = (ReviewBean) boardList.get(i);
		%>	<tr>
						<td class="hidden-xs"><%=b.getRev_num()%></td>										
						<td style="cursor: pointer;"
							onClick=" location.href='./AdminReviewUpdateViewAction.ro?num=<%=b.getRev_num()%>&pageno=<%=pageno%>' "><%=b.getRev_id()%></td>
							<td style="cursor: pointer;"
							onClick=" location.href='./AdminReviewUpdateViewAction.ro?num=<%=b.getRev_num()%>&pageno=<%=pageno%>' "><%=b.getRev_subject()%></td>						
						<td class="hidden-xs" style="cursor: pointer;"
							onClick=" location.href='./AdminReviewUpdateViewAction.ro?num=<%=b.getRev_num()%>&pageno=<%=pageno%>"><%=b.getRev_date()%></td>						
						<td><input type="checkbox" class="btn btn-default" name="delete"value="<%=b.getRev_num()%>" /></td>
					</tr>
					</form>	
									
					<%
						}
						} else {
					%>
					<tr>
						<td colspan="4">리뷰 정보가 없습니다.</td>
					</tr>
					<%
						}
					%>			
					
			<tr>
						<td style="text-align: center;" colspan="8">
							<%
								if (prevpage != 0) {
							%>
							<% if (request.getAttribute("selectType")==null) { %>
							<button type="button" class="btn btn-default"
								onclick="location.href='./AdminReviewListAction.ro?pageno=<%=prevpage%>'">이전</button>&nbsp;
								<% }else { %>
								<button type="button" class="btn btn-default"
								onclick="location.href='./AdminReviewListAction.ro?pageno=<%=prevpage%>&selectType=<%=selectType %>&selectWord=<%=selectWord%>'">이전</button>&nbsp;
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
								onclick="location.href='./AdminReviewListAction.ro?pageno=<%=i%>'"><%=i%></button>&nbsp;
							<%}else{ %>
								<button type="button" class="btn btn-default"
								onclick="location.href='./AdminReviewListAction.ro?pageno=<%=i%>&selectType=<%=selectType%>&selectWord=<%=selectWord%>'"><%=i%></button>&nbsp;
							<%} %>
							
							<%
								}
								}
							%> <%
 	if (nextpage != 0) {
 %>
 			
 			<% if (request.getAttribute("selectType")==null) { %>
							<button type="button" class="btn btn-default"
								onclick="location.href='./AdminReviewListAction.ro?pageno=<%=nextpage%>'">다음</button>&nbsp;
							<%}else{ %>
								<button type="button" class="btn btn-default"
								onclick="location.href='./AdminReviewListAction.ro?pageno=<%=nextpage%>&selectType=<%=selectType%>&selectWord=<%=selectWord%>'">다음</button>&nbsp;
							<%} %>
							
							<%
					}
				%>
						</td>
					</tr>

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
					<input type="submit" formaction="AdminReviewListAction.ro" class="btn btn-default" id="search" value="검색"/>			
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
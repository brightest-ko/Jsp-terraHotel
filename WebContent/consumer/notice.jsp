<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
session.setAttribute("loadpage", "/terra/consumer/notice.jsp");
%>
<!doctype html>
<html lang="ko">
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
				if(str=="1"){ location.href="../consumer/login.jsp" }
				else if(str=="2"){ location.href="../consumer/signup.jsp" }
				else if(str=="3"){ location.href="../consumer/userInformation.jsp"}
			}
			function logout(){
				var con = confirm("접속을 종료하시겠습니까");
				if(con == true){ location.replace("../consumer/userlogout.jsp"); }
				else{}
			}
		</script>
	</head>
	<body>
	
	<jsp:include page="header.jsp"/>
	
	
<head>
<title>공지사항 </title>
</head>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr height="5"><td width="5"></td></tr>
 <tr style="background:url('img/table_mid.gif') repeat-x; text-align:center;">
   <td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
   <td width="73">번호</td>
   <td width="379">제목</td>
   <td width="73">작성자</td>
   <td width="164">작성일</td>
   <td width="58">조회수</td>
   </td>
  </tr>
  
<tr height="25" align="center">
</tr>
  <tr height="1" bgcolor="#D2D2D2"><td colspan="6"></td></tr>

 <tr height="1" bgcolor="#82B5DF"><td colspan="6" width="752"></td></tr>
 </table>
 <script type="text/javascript">
function searchMessage(){
if(document.search.keyWord.value==""){
alert("검색어를 입력하세요");
document.search.keyWord.focus();
return false;
}
return true;
}
</script>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr><td colspan="4" height="5"></td></tr>
  <tr align="center">
   <td><input type=button value="글쓰기" OnClick="window.location='notice_write.jsp'">></td>
  </tr>
  
<c:if test="${page.count > 0}">
<c:set var="pageCount" value="${(page.count - 1) / page.pageSize + 1}"/>
<c:set var="pageBlock" value="${10}"/>
<fmt:parseNumber var="rs" value="${(currentPage - 1) / pageBlock}" integerOnly="true" />
<c:set var="startPage" value="${rs*pageBlock+1}"/>
<c:set var="endPage" value="${startPage + pageBlock-1}"/>
<c:if test="${endPage > pageCount}">
<c:set var="endPage" value="${pageCount}"/>
</c:if>
<c:if test="${startPage > pageBlock}">
<a href="list.do?pageNum=${startPage - pageBlock }&keyField=${page.keyField}&keyWord=${page.keyWord}">[이전]</a>
</c:if>
<c:forEach var="i" begin="${startPage}" end="${endPage}">
<c:if test="${i == page.currentPage}">
[${i}]
</c:if>
<c:if test="${i != page.currentPage}">
<a href="list.do?pageNum=${i}&keyField=${page.keyField}&keyWord=${page.keyWord}">[${i}]</a>
</c:if>
</c:forEach>
 
<c:if test="${endPage < pageCount}">
<a href="list.do?pageNum=${startPage + pageBlock}&keyField=${page.keyField}&keyWord=${page.keyWord}">[다음]</a>
</c:if>
</c:if>
</td></tr>
</table>


<jsp:include page="footer.jsp"/>
		
		
		
<%-- <%-- <title>공지사항</title>
<script type="text/javascript">
function searchMessage(){
if(document.search.keyWord.value==""){
alert("검색어를 입력하세요");
document.search.keyWord.focus();
return false;
}
return true;
}
</script>
</head>
<body>

<c:if test="${page.count == 0}">
<table width="70%" border="1" cellpadding="0" cellspacing="0" align="center">
<tr>
<td bgcolor="#e9e9e9">
전체:
</td>
</table>
</c:if>
<c:if test="${page.count > 0}">
<table width="70%" border="1" cellpadding="0" cellspacing="0" align="center">
<tr><td colspan="6" align="center"><h1>22</h1></td></tr>
<tr bgcolor="gray">
<td width="70">번호</td>
<td width="100">제목</td>   
<td></td>
<td width="120">조회수</td>
 
<td width="150">작성일 </td>
</tr>
<c:set var="number" value="${page.number}"/>
<c:forEach var="album" items="${albumList}">
<tr>
<td>${number}<c:set var="number" value="${number - 1}"/></td>
<td>${album.num}</td>   
<td><a href="content.do?num=${album.num}">${album.subject}</a></td>
<td>${album.writer}</td>
<td>${album.readcount}</td>
<td><fmt:formatDate value="${album.reg_date}" pattern="yyyy년MM월dd일"/></td>
</tr>
</c:forEach>
</table>
</c:if>
<form action="list.do" name="search" method="get" onsubmit="return searchMessage()">
<table width="70%" border="1" align="center" cellpadding="4" cellspacing="0">
<tr><td width="200"><a href="writeForm.do">글쓰기</a></td>
<td align="center" valign="bottom">
<select name="keyField">
<option value="subject">제목</option>     
<option value="writer">이름</option>
<option value="content">내용</option>
</select></td>
<td><input type="text" size=16 name="keyWord"><input type="submit" value="찾기"></td>
</tr>
<tr><td colspan="3" align="center">
 
<c:if test="${startPage > pageBlock}">
<a href="list.do?pageNum=${startPage - pageBlock }&keyField=${page.keyField}&keyWord=${page.keyWord}">[이전]</a>
</c:if>
 
<c:forEach var="i" begin="${startPage}" end="${endPage}">
<c:if test="${i == page.currentPage}">
[${i}]
</c:if>
<c:if test="${i != page.currentPage}">
<a href="list.do?pageNum=${i}&keyField=${page.keyField}&keyWord=${page.keyWord}">[${i}]</a>
</c:if> 
 
<c:if test="${endPage < pageCount}">
<a href="list.do?pageNum=${startPage + pageBlock}&keyField=${page.keyField}&keyWord=${page.keyWord}">[다음]</a>
</c:if>
</c:forEach>
</td></tr> --%> 
</body>
</html>
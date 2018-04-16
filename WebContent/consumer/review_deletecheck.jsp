<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="reviewboard.*"%>

<%
	ReviewBean board = (ReviewBean) request.getAttribute("reviewbean");
int pageno = Integer.parseInt(request.getParameter("pageno"));
%>
<% System.out.println(board); %>
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
		<style>
			.jumbotron {margin-bottom: 0;}
			/* 메뉴바 css */
			.affix { top: 0; width: 100%; }
			.affix + .jumbotron { padding-top: 70px; }		
			.navbar { border-radius: 0; z-index: 1000; width: 100%; background-color: #aabbff; }
			/* 메뉴바 축소할 때 css*/
			.navbar-toggle { background: #aaaaee; }
			.icon-bar { background: #fff; }			
			.test{ text-align: center; }
		</style>		
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
	if(id==null) {		
		alert("로그인이 필요합니다.");
		location.href="consumer/login.html" 
	}	else {	
	location.href="reviewboard/review_board_write.jsp"	
	}
}
		</script>
		
				
	</head>
	<body>
	<header>
		<!-- 최상단  로고-->
		<div class="jumbotron">
			<div class="container text-center">
				<h1>Online Store</h1>      
				<p>Mission, Vission & Values</p>
			</div>
		</div>
		<nav class="navbar" data-spy="affix" data-offset-top="204">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">WebSiteName</a>
				</div>
				<div class="collapse navbar-collapse" id="myNavbar">
					<%if(session.getAttribute("user_id") == null && session.getAttribute("grade") == null){%>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="javascript:pagemove(1)"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
						<li><a href="javascript:pagemove(2)"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>
					</ul>
					<%}else{%>
					<table class="nav navbar-nav navbar-right row">
						<tr class="test">
							<td colspan="2" class="col-xs-12"><span class="glyphicon glyphicon-grain"></span> <%=session.getAttribute("user_id")%>님 환영합니다.</td>
						</tr>
						<tr>
							<td class="col-xs-6">
							<a href="javascript:logout()"><span class="glyphicon glyphicon-log-out"></span> 로그아웃</a></li>
							</td>
							<td class="col-xs-6">
							<a href=""><span class="glyphicon glyphicon-cog"></span> 마이정보</a></li>
							</td>
						</tr>
					</table>
					<%}%>
					<ul class="nav navbar-nav">
						<li class="active"><a href="#">Home</a></li>
						<li><a href="#">Page 1</a></li>
						<li><a href="#">Page 2</a></li>
						<li><a href="#">Page 3</a></li>
					</ul>	
					
				</div>
			</div>
		</nav>
	</header>
	 <div class="table-responsive">
	<div class="container">
	 <h2>Review 게시판</h2>
	<table class="table table-bordered">		
		 <thead>
	<tr class="text-center">
	<th class="text-center">글번호</th><td><%=board.getRev_num()%></td>
	<th class="text-center">작성자</th><td><%=board.getRev_id()%></td>
	<th class="hidden-xs text-center">날짜</th><td class="hidden-xs" ><%=board.getRev_date()%></td>
	<th class="hidden-xs text-center">조회수</th><td class="hidden-xs"><%=board.getRev_readcount()%></td>
	</tr>
	<tr>
	<th>제목</th><td colspan="8"><%=board.getRev_subject()%></td>
	</tr>	
	</thead>
	
	 <tbody>
	 <tr>
	 <td>
	 <div>내용</div>
	 </td>
	 <!-- 이부분 물어보기@@@@@ -->
		<td colspan="8"  ><%=board.getRev_content().replace("\n","<br>")%><br>
		</tr>
		<tr>
		<td>
		<div>첨부 파일</div>
		</td>
		<td colspan="8">
		<%
					if (!(board.getRev_file() == null)) {
				%> 
				<%String imgPath=request.getContextPath() + "/reviewupload/"+board.getRev_file(); %>
				<img class="img-responsive" src="<%=imgPath%>"alt="엑스박스" title="첨부이미지"  > 					
			
			
			 <% 	}else {%>
			 첨부된 이미지가 없습니다.</td>	 
			<%} %>			
		</tr>
		</tbody>
		</table>		
		<form action="./ReviewBoardDeleteAction.ro?pageno=<%=pageno %>" method="post" 
		name="Deleteform">
				<table class="table table-bordered">				
			<input type="hidden" name="rev_num" value="<%=board.getRev_num()%>">
		
		<input type="hidden" name="rev_id" value="<%=board.getRev_id()%>">
				
		<input type="hidden" name="rev_pw" value="<%=board.getRev_pw()%>">
				
							
		<tr>
						<td class="con-xs-3">비밀번호</td>
						<td class="col-xs-9"><input type="password" class="form-control" name="rev_pw2"size="8" maxlength="8">8자 이하 입력</td>
					</tr>								
				</table>
				<tr>				
				<input type="submit" class="btn btn-default pull-right "modify" value="삭 제 ">
		<input type="button" class="btn btn-default pull-right"back" value="뒤 로" onclick="location='ReviewBoardDetailAction.ro?num=<%=board.getRev_num()%>'">
				</tr>
</form>
 </div></div>
	</body>
	</html>
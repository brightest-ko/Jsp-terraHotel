<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

		

	@import url(http://fonts.googleapis.com/earlyaccess/jejugothic.css);
	@import url(http://fonts.googleapis.com/earlyaccess/jejuhallasan.css);
	
	.jumbotron, .navbar{ font-family: 'Jeju Gothic', serif; }
	
	.affix { top: 0; width: 100%; }
	.navbar {
		border-radius: 0;
		z-index: 1000; 
		width: 100%; 
		background-color: #aabbff; 
		margin-top:-30px
	}
	.navbar-toggle { background: #aaaaee; }
	.icon-bar { background: #fff; }
	.test{ text-align: center; }
</style>
<script type="text/javascript">
$(function(){
	$(window).scroll(function () {
        var height = $(document).scrollTop(); 
        var windowWidth = $( window ).width();
        if(windowWidth > 412){
	        if (parseInt(height) > 204) { 
	            $('#headjumbo').css({ "margin-bottom":"30px" });
	            $('.navbar').css({ "margin-top":"0px" });
	        } else { 
	            $('#headjumbo').css({ "margin-bottom":"0px" });
				$('.navbar').css({ "margin-top":"-30px" });
	        } 
        }
        if(windowWidth < 412){
        	 if (parseInt(height) > 204) { 
		            $('#headjumbo').css({ "margin-bottom":"30px" });
		            $('.navbar').css({ "margin-top":"0px" });
		        } else { 
		            $('#headjumbo').css({ "margin-bottom":"0px" });
					$('.navbar').css({ "margin-top":"-30px" });
		        } 
        }
        else {}
    }); 
});
function pagemove(str) {
	if(str=="1"){ location.href="/terra/consumer/login.jsp" }
	else if(str=="2"){ location.href="/terra/consumer/signup.jsp" }
	else if(str=="3"){ location.href="/terra/myreservinfo.ro";}
}
function logout(){
	var con = confirm("접속을 종료하시겠습니까");
	if(con == true){ location.replace("/terra/consumer/userlogout.jsp"); }
	else{}
}	
function reservation(){
	var con = confirm("로그인이 필요합니다");
	if(con == true){ location.replace("/terra/consumer/login.jsp"); }
	else{}
}
</script>
</head>
<body>
<header>
		<!-- 최상단  로고-->
		<div class="jumbotron" id="headjumbo">
			<div class="container text-center" onclick="location.href='/terra/userlogout.ro'">
				<h1>Terra Hotel</h1>      
				<p>편안하고 포근한 잠자리.</p>
			</div>
		</div>

		<nav class="navbar" data-spy="affix" data-offset-top="204">
			<div class="col-md-1 col-sm-0">
			</div>
			
			
			<div class="col-md-10 col-sm-12">
				<div class="container-fluid">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="/terra/userlogout.ro">Terra Hotel</a>
					</div>
					<div class="collapse navbar-collapse" id="myNavbar">
						<ul class="nav navbar-nav">
							<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Terra호텔<span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a data-toggle="tab"  href="#hotelinfo">호텔 소개</a></li>
									<li><a href="/terra/consumer/map.jsp">오시는 길</a></li>
								</ul>
							</li>
							<li><a href="/terra/consumer/room.jsp">객실정보</a></li>
							<%
								if (session.getAttribute("user_id") == null && session.getAttribute("grade") == null) {
							%>
							<li><a href="javascript:reservation()">예약</a></li>
							<%}else{ %>
							<li><a href="/terra/reserve.res">예약</a></li>
							<%} %>
							<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">커뮤니티<span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="/terra/NoticeBoardListAction.ro">공지</a></li>
									<li><a href="/terra/EventListAction.ro">이벤트</a></li>
									<li><a href="/terra/ReviewBoardListAction.ro">리뷰</a></li>
									<li><a href="/terra/consumer/faq.jsp">FAQ</a></li>
									<li><a href="/terra/QnaBoardListAction.ro">QnA</a></li>
								</ul>
							</li>
						</ul>
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
								<a href="javascript:logout()"><span class="glyphicon glyphicon-log-out"></span> 로그아웃</a>
								</td>
								<td class="col-xs-6">
								<a href="javascript:pagemove(3)"><span class="glyphicon glyphicon-cog"></span> 마이정보</a>
								</td>
							</tr>
						</table>
						<%}%>
					</div>
				</div>
			</div>
			
			
			<div class="col-md-1 col-sm-0">
			</div>
		</nav>
	</header>
</body>
</html>
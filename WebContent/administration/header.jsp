<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
	<style>
		
		@import url(http://fonts.googleapis.com/earlyaccess/jejuhallasan.css);
		.jumbotron, .navbar-brand{ font-family: 'Jeju Hallasan', serif; }
		.navbar-brand{ font-size: 25px;}
		.collapse { font-weight: bold; }
		/* 메뉴바 css */
		.affix { top: 0; width: 100%; }
		.navbar {
			border-radius: 0;
			z-index: 1000; 
			width: 100%; 
			background-color: #aabbff; 
			margin-top:-30px
		}
		/* 메뉴바 축소할 때 css*/
		.navbar-toggle { background: #aaaaee; }
		.icon-bar { background: #fff; }
	</style>
	<script type="text/javascript">
		function logout(){
			var con = confirm("접속을 종료하시겠습니까");
			if(con == true){ location.replace("administration/adminlogout.jsp"); }
			else{}
		}
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
	</script>
</head>
<body>
<header>
		<!-- 최상단  로고-->
		<div class="jumbotron">
			<div class="container text-center">
				<h1>Terra Hotel</h1>      
				<p>관리 페이지 입니다</p>
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
					<a class="navbar-brand" href="adminReservListviews.res">Terra Hotel</a>
				</div>
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav hidden-sm">
						<li><a href="adminReservListviews.res">예약관리</a></li>
						<li><a href="memberListviews.ro" >회원관리</a></li>
						<li><a href="AdminQnaBoardListAction.ro">Q&amp;A관리</a></li>
						<li><a href="AdminNoticeBoardListAction.ro">공지관리</a></li>
						<li><a href="AdminReviewListAction.ro">리뷰관리</a></li>
						<li><a href="AdminEventListAction.ro">이벤트관리</a></li>
					</ul>
					<ul class="nav navbar-nav visible-sm">
						<li><a href="ReservList.res" >예약관리</a></li>
						<li><a href="memberListviews.ro" >회원관리</a></li>
						<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">커뮤니티 관리<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a data-toggle="tab" href="">공지관리</a></li>
								<li><a href="AdminReviewListAction.ro">리뷰관리</a></li>
								<li><a href="AdminEventListAction.ro">이벤트관리</a></li>
								<li><a data-toggle="tab" href="#menu3">Q&amp;A관리</a></li>
							</ul>
						</li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="javascript:logout()"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
</body>
</html>
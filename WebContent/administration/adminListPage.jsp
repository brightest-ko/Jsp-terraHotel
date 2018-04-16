<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
	<style>
		body { font-family: "malgu"; margin-bottom: 20%;}
		/* 메뉴바 css */
		.affix { top: 0; width: 100%; }
		.navbar {
			border-radius: 0;
			z-index: 1000; 
			width: 100%; 
			background-color: #aabbff; 
			margin-top:-30px;
			padding-bottom:10%;
		}
		/* 메뉴바 축소할 때 css*/
		.navbar-toggle { background: #aaaaee; }
		.icon-bar { background: #fff; }
		footer {
			position: absolute;
			bottom: 0;
			width: 100%;
			height: 10%;
			background-color: #555;
      		padding: 10px 0;
			text-align: center;
			color: white;
			<!--font-size: 20%;-->
		}
		
		.footers { color: #fff ; font-weight: bold; }
		
	</style>
</head>
<body>

	<jsp:include page="header.jsp" />
	
	<div class="panel-body">
		<div class="tab-content">
			<div id="home" class="tab-pane fade in active">
				<% 
				String str = (String)session.getAttribute("adminloadpage"); 
				if (str == null || str.equals("")){
					str = "adminReservListView.jsp";
				}
				%>
				<jsp:include page="<%=str %>"></jsp:include>
			</div>
			<div id="menu1" class="tab-pane fade"><br>
				<jsp:include page="adminReservListView.jsp" flush="false"/>
			</div>
			<div id="menu2" class="tab-pane fade"><br>
				<jsp:include page="adminMemberListView.jsp" flush="false"/>
			</div>
			<div id="menu3" class="tab-pane fade"><br>
				<div class="row">
					<h3>Q&amp;A관리</h3>
				</div>
			</div>
			<div id="menu4" class="tab-pane fade"><br>
				<div class="row">
					<h3>공지관리</h3>
				</div>
			</div>
			<div id="menu5" class="tab-pane fade"><br>
				<div class="row">
					<h3>리뷰관리</h3>
				</div>
			</div>
			<div id="menu6" class="tab-pane fade"><br>
				<div class="row">
					<h3>이벤트관리</h3>
				</div>
			</div>
		</div>
		<a href="#" class="footers glyphicon glyphicon-eject">위로</a>
	</div>
	
	<jsp:include page="footer.jsp" />
</body>
</html>
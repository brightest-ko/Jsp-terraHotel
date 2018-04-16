<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% System.out.println(request.getParameter("user_id")); %>
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
<title>Insert title here</title>

<style type="text/css">
	table{ margin: auto; }
	
	.trd { text-align: center; height: 50px;}
	
	caption { text-align: center; font-size: 20px; font-weight: bold; }
	
</style>

</head>
<body>
	
	<jsp:include page="header.jsp"/>
	
	<article class="container">
		<div class= "row">
			<div class="col-sm-4 col-lg-2">
				<jsp:include page="myinfosidemenu.jsp"/>
			</div>
	        <div class="col-sm-6 col-lg-10">
		        <div class="page-header">
		          <h1>회원탈퇴</h1>
		        </div>
		        
		        <div>
			        <table id="sdsssd">
			        	<caption>회원탈퇴 약관</caption>
				        <tr>
				        	<td>
				        		<ul>
				        		<li>
				        		회원 탈퇴는 참여하신 이벤트나 예약이 없어야 가능하며,
								탈퇴 완료시에는 본사에 저장된 회원님의 모든 정보가 삭제됩니다.
								</li>
								<li>
				        		삭제된 정보는 복구하실 수 없으며,
				        		이에 따른 불이익에 대하여 본 사는 책임이 없음을 알려드립니다.
				        		</li>
				        		</ul>
				        	</td>
				        </tr>
			        </table>
		        </div>
		        <hr>
	        	<form action="memberdeletequestion.ro" method="post">
					<table>
						<tr class="trd">
							<td>
								<label>비밀번호</label>
							</td>
							<td>
								<input type="password" name="pw" required="required">
							</td>
						</tr>
						<tr class="trd">
							<td></td>
							<td>
								<input type="submit" class="btn btn-danger" value="확인">
								<input type="button" class="btn btn-success" onclick="history.back();" value="취소">
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</article>
	<br><br>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
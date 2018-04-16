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
			div{ margin: auto; }
			table{ margin: auto; }
			tr { text-align: center; height: 50px;}
			.topb { border-top: 1px solid #ccc; }
			caption { text-align: center; font-size: 20px; font-weight: bold; }
		</style>
		<script type="text/javascript">
		function signupbutton(){
			location.href = "signup.jsp";
		}
		</script>
	</head>
	<body>
	
		<jsp:include page="header.jsp"/>
	
		<article class="container-fluid">
			<form action="login.ro" method="post">
				<div>
					<table>
						<caption>회원 로그인</caption>
						<tr class="topb">
							<td>아이디</td>
							<td><input type="text" name="user_id"></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="pw"></td>
						</tr>
						<tr class="topb">
							<td colspan="2">
								<input type="submit" class="btn btn-success"  value="로그인" onclick="javascript:logingrade();">
								<input type="button" class="btn btn-success"  value="회원가입" onclick="javascript:signupbutton();">
								<input type="button" class="btn btn-success" value="돌아가기" onclick="location.href=document.referrer">
							</td>
						</tr>
					</table>
				</div>
			</form>
			<br>
			<br>
		</article>
		
		<jsp:include page="footer.jsp"/>
		
	</body>
</html>
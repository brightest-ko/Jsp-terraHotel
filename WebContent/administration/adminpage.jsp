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
	<title>Insert title here</title>
	<style type="text/css">
		*{ font-family: "gulimche"; }
		div{ margin: auto; }
		table{ margin: auto; }
		tr { text-align: center; height: 50px;}
		#idpw { height: 0;}
		caption { text-align: center; font-size: 20px; font-weight: bold; }
		.topb { border-top: 1px solid #ccc; }
	</style>
</head>
<body>
	<form action="/terra/adminlogin.ro" method="post">
			<div>
				<table>
					<caption>어드민 로그인</caption>
					<tr class="topb idpw">
						<td>아이디&nbsp;</td>
						<td><input type="text" class="form-control" name="user_id"></td>
					</tr>
					<tr>
						<td class="idpw">비밀번호&nbsp;</td>
						<td><input type="password" class="form-control" name="pw"></td>
					</tr>
					<tr id="lrbtd" class="topb">
					<td colspan="2"><input type="submit" class="btn btn-success" value="로그인" onclick="javascript:logingrade();"></td>
					</tr>
				</table>
			</div>
		</form>
</body>
</html>
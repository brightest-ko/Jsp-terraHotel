<%@page import="member.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd");
	String today = formatter.format(new java.util.Date());
	
	MemberBean bean = MemberDAO.memberInformation((String)session.getAttribute("user_id"));
	session.setAttribute("setuser_id", request.getParameter("user_id"));
	String keyword = bean.getAreacode();
	String gender = bean.getGender();
	String grade = bean.getGrade();
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
		<style type="text/css">
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
			          <h1>회원정보</h1>
			        </div>
		        	<h4>※ 필수입력 ※</h4>
		        	<hr>
		        	<div class="form-group">
						<label for="Inputid">아이디(*)</label>
							<input type="text" class="form-control" name="user_id" id="user_id"  required="required" placeholder="아이디" value="<%=bean.getUser_id()%>" disabled="disabled">
					</div>
					<div class="form-group">
						<label for="username">이름(*)</label>
						<input type="text" class="form-control" name="uname" id="username" required="required" placeholder="이름을 입력해 주세요" value="<%=bean.getUname() %>"disabled="disabled">
		            </div>
		            <div class="form-group">
		              <label for="InputEmail">이메일(*)</label>
		              <input type="email" class="form-control" name="email" id="InputEmail" required="required" placeholder="이메일 주소" value="<%=bean.getEmail() %>" disabled="disabled">
		            </div>
		            <div class="from-group">
		            	<br>
		            	<label for="InputGender" >성별(*)</label>
		            	<br>
		            	<div class="ddsd">
		            		<label><input type="radio" class="form-control" id="InputGender"  name="gender" value="남" <%=gender.equals("남")?"checked='checked'" : "" %> disabled="disabled"/>남성</label>
		            		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		            		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		            		<label><input type="radio" class="form-control" id="InputGender" name="gender" value="여"<%=gender.equals("여")?"checked='checked'" : "" %> disabled="disabled">여성</label>
	            		</div>
		            </div>
		            <br>
		            <div class="form-group">
		            	<label for="username" >전화번호(*)</label>
		            		<div class="form-group">
			            	<select name="areacode" class="form-control" name="areacode" id="postnumselect" disabled="disabled">
			            		<option value="010" <%=keyword.equals("010")?" selected":""%>>010</option>
			            		<option value="011" <%=keyword.equals("011")?" selected":""%>>011</option>
			            		<option value="016" <%=keyword.equals("016")?" selected":""%>>016</option>
			            		<option value="017" <%=keyword.equals("017")?" selected":""%>>017</option>
			            		<option value="018" <%=keyword.equals("018")?" selected":""%>>018</option>
			            		<option value="019" <%=keyword.equals("019")?" selected":""%>>019</option>
			            		<option value="02" <%=keyword.equals("02")?" selected":""%>>02</option>
			            		<option value="051" <%=keyword.equals("051")?" selected":""%>>051</option>
			            		<option value="053" <%=keyword.equals("053")?" selected":""%>>053</option>
			            		<option value="032" <%=keyword.equals("032")?" selected":""%>>032</option>
			            		<option value="062" <%=keyword.equals("062")?" selected":""%>>062</option>
			            		<option value="042" <%=keyword.equals("042")?" selected":""%>>042</option>
			            		<option value="052" <%=keyword.equals("052")?" selected":""%>>052</option>
			            		<option value="044" <%=keyword.equals("044")?" selected":""%>>044</option>
			            		<option value="031" <%=keyword.equals("031")?" selected":""%>>031</option>
			            		<option value="033" <%=keyword.equals("033")?" selected":""%>>043</option>
			            		<option value="041" <%=keyword.equals("041")?" selected":""%>>041</option>
			            		<option value="063" <%=keyword.equals("063")?" selected":""%>>063</option>
			            		<option value="061" <%=keyword.equals("061")?" selected":""%>>061</option>
			            		<option value="054" <%=keyword.equals("054")?" selected":""%>>054</option>
			            		<option value="055" <%=keyword.equals("055")?" selected":""%>>055</option>
			            		<option value="064" <%=keyword.equals("064")?" selected":""%>>064</option>
			            	</select>
		                	<input type="text" class="form-control"  id="username" name="tel" required="required" placeholder="- 없이 입력해 주세요" onkeydown="return showKeyCode(event)" value="<%=bean.getTel() %>"disabled="disabled">
			            </div>
		            </div>
		            <div class="form-group">
						<label for="usergrade">등급(*)</label>
						<select name="areacode" class="form-control" name="grade" id="gradeselect" disabled="disabled">
		            		<option value="admin" <%=grade.equals("admin")?" selected":""%>>admin</option>
		            		<option value="gold" <%=grade.equals("gold")?" selected":""%>>gold</option>
		            		<option value="silver" <%=grade.equals("silver")?" selected":""%>>silver</option>
	            		</select>
		            </div>
		            <br><br>
		            <h4>※ 선택입력 ※</h4>
		            <hr>
		            <div class="form-group">
						<label for="username" >생년월일</label>
						<input type="text" id="datepicker" name="birth" class="form-control" placeholder="선택시 달력이 뜹니다." value="<%=bean.getBirth()%>" disabled="disabled" />
					</div>
		            <div class="form-group">
		            	<label for="username" >주소</label>
		            	<div class="input-group">
							<input type="text" class="form-control" id="sample6_postcode" name="postnum" placeholder="우편번호" value="<%=bean.getPostnum()%>" disabled="disabled"/>
							<span class="input-group-btn">
								<input type="button" class="btn btn-success" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" disabled="disabled"/><br>
							</span>
						</div>
						<input type="text" class="form-control" id="sample6_address" name="addr" placeholder="주소" value="<%=bean.getAddr()%>" disabled="disabled"/>
						<input type="text" class="form-control" id="sample6_address2"  name="detailaddress" placeholder="상세주소"  value="<%=bean.getDetailaddress()%>" disabled="disabled"/>
					</div>
		            <div class="form-group text-center">
		              <button type="button" class="btn btn-info" onclick="location.href='memberpwquestion.ro';">정보 수정<i class="fa fa-check spaceLeft"></i></button>
		            </div>
				</div>
			</div>
		</article>
		<br><br>
		<jsp:include page="footer.jsp"/>
	</body>
</html>
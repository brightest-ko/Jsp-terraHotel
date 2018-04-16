<%@page import="java.sql.Date"%>
<%@page import="java.util.function.Function"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd");
	String today = formatter.format(new java.util.Date());
%>
<!DOCTYPE html>
<html lang="ko">
	<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
	<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>회원가입</title>
    <style type="text/css">
    	h4 { font-weight: bold; }
    	select { height: 21px;}
    	.ddsd {margin: auto; text-align: center;}
    </style>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
	<body>
	<form action="region.ro" method="post">
		<article class="container">
	        <div class="page-header">
	          <h1>회원가입</h1>
	        </div>
	        <div class="col-md-6 col-md-offset-3">
	        	<h4>※ 필수입력 ※</h4>
	        	<hr>
	        	<div class="form-group">
					<label for="Inputid">아이디(*)</label>
					<div class="input-group">
						<input type="text" class="form-control" name="user_id" id="user_id"  required="required" placeholder="아이디" onkeyup="idCheck()">
						<span class="input-group-btn">
							<input type="button" class="btn btn-success" id="userIdCheck" value="중복체크">
						</span>
					</div>
					<div id="message">
						<p>※ 아이디 입력 후 반드시 중복체크를 해주세요. ※</p>
					</div>
					
				</div>
	            <div class="form-group">
					<label for="InputPassword1">비밀번호(*)</label>
					<input type="password" class="form-control"  name="pw" id="pw"  required="required" placeholder="비밀번호"  onkeyup="passCheck()">
	            </div>
	            <div class="form-group">
					<label for="InputPassword2">비밀번호 확인(*)</label>
					<input type="password" class="form-control" id="pw2"  required="required" placeholder="비밀번호 확인" onkeyup="passCheck()">
					<p id="pwCheckText">비밀번호 확인을 위해 다시한번 입력 해 주세요</p>
				</div>
				<div class="form-group">
					<label for="username">이름(*)</label>
					<input type="text" class="form-control" name="uname" id="username" required="required" placeholder="이름을 입력해 주세요">
	            </div>
	            <div class="form-group">
	              <label for="InputEmail">이메일(*)</label>
	              <input type="email" class="form-control" name="email" id="InputEmail" required="required" placeholder="이메일 주소">
	            </div>
	            <div class="from-group">
	            	<br>
	            	<label for="InputGender">성별(*)</label>
	            	<br>
	            	<div class="ddsd">
	            		<label><input type="radio" class="form-control" id="InputGender"  name="gender" value="남" checked="checked"/>남성</label>
	            		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	            		<label><input type="radio" class="form-control" id="InputGender" name="gender" value="여"/>여성</label>
            		</div>
	            </div>
	            <br>
	            <div class="form-group">
	            	<label for="username" >전화번호(*)</label>
	            		<div class="form-group">
		            	<select name="areacode" class="form-control" name="areacode">
		            		<option value="010">010</option><option value="011">011</option><option value="016">016</option>
		            		<option value="017">017</option><option value="018">018</option><option value="019">019</option>
		            		<option value="02">02</option><option value="051">051</option><option value="053">053</option>
		            		<option value="032">032</option><option value="062">062</option><option value="042">042</option>
		            		<option value="052">052</option><option value="044">044</option><option value="031">031</option>
		            		<option value="033">043</option><option value="041">041</option><option value="063">063</option>
		            		<option value="061">061</option><option value="054">054</option><option value="055">055</option>
		            		<option value="064">064</option>
		            	</select>
	                	<input type="text" class="form-control"  id="username" name="tel" required="required" placeholder="- 없이 입력해 주세요" onkeydown="return showKeyCode(event)">

		            </div>
	            </div>
	            <br><br>
	            <h4>※ 선택입력 ※</h4>
	            <hr>
	            <div class="form-group">
					<label for="username" >생년월일</label>
					<input type="text" id="datepicker" name="birth" class="form-control" placeholder="선택시 달력이 뜹니다.">
				</div>
				
	            <div class="form-group">
	            	<label for="username" >주소</label>
	            	<div class="input-group">
						<input type="text" class="form-control" id="sample6_postcode" name="postnum" placeholder="우편번호">
						<span class="input-group-btn">
							<input type="button" class="btn btn-success" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
						</span>
					</div>
					<input type="text" class="form-control" id="sample6_address" name="addr" placeholder="주소">
					<input type="text" class="form-control" id="sample6_address2"  name="detailaddress" placeholder="상세주소">
				</div>
	            <div class="form-group text-center">
	              <button type="submit" class="btn btn-info">회원가입<i class="fa fa-check spaceLeft"></i></button>
	              <button type="button" class="btn btn-warning" onclick="history.back();">가입취소<i class="fa fa-times spaceLeft"></i></button>
	            </div>
			</div>
		</article>
	</form>
<script type="text/javascript">
    $(function(){
		$('#userIdCheck').click(function(){
			var user_id = $('#user_id').val();
			var sendData = 'check_id='+ user_id;
			$.post("checkId.jsp", sendData, function(msg) { $('#message').html(msg);} );
			return false;
		});
	});
    
	$(function() {
		$( "#datepicker" ).datepicker( { dateFormat: 'yy/mm/dd' } );
	});
	
	function passCheck() {
		var pw = document.getElementById("pw").value;
		var pwCheck = document.getElementById("pw2").value;
		if(pwCheck==""){
			document.getElementById("pwCheckText").innerHTML="<span>비밀번호 확인을 위해 다시한번 입력 해 주세요</span>";
		}
		else if(pw != pwCheck){
			document.getElementById("pwCheckText").innerHTML = "<span class='text-warning'><strong>비밀번호가 일치하지않습니다.</strong></span>"
		}
		else {
			document.getElementById("pwCheckText").innerHTML = "<span class='text-success'><strong>비밀번호가 일치합니다.</strong></span>"
		}
	}
	function idCheck(){
		var user_id = document.getElementById("user_id").value;
		if(user_id == ""){
			document.getElementById("message").innerHTML="<span>※ 아이디 입력 후 반드시 중복체크를 해주세요. ※</span>";
		}
	}
	function showKeyCode(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;
		if( ( keyID >=48 && keyID <= 57 ) || ( keyID >=96 && keyID <= 105 ) || keyID == 8) { return; }
		else { return false; }
	}
	
	function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수
                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }
                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script>
</body>
</html>
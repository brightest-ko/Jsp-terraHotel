<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
session.setAttribute("loadpage", "/terra/consumer/faq.jsp");
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
   
      <title>언제나 Terra Hotel</title>

   </head>
 
 
 <body>
 <jsp:include page="header1.jsp"/>
<div class="container">
  <h1>The Terra House FAQ</h1>
  <p>자주하는 질문 및 답변</p>
<div class="panel-group" id="accordion">
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">
        <strong> 객실 내에 무료로 이용 가능한 비품에는 무엇이 있습니까?</strong></a>
      </h4>
    </div>
    <div id="collapse1" class="panel-collapse collapse in">
      <div class="panel-body">Lorem ipsum dolor sit amet, consectetur adipisicing elit,
      - 생수 두 병, 샴푸, 린스, 샤워젤, 바디로션, 빗, 반짇고리, 샤워캡, 면봉, 화장솜, 드라이기, 다리미, 다림판, 녹차, 홍차, 전기 포트, 금고, 슬리퍼, 가운, 필기도구 등
       <hr>- 가습기, DVD 플레이어 & CD 플레이어, 바둑판 등은 고객 센터로 연락 주시면 객실로 가져다 드립니다.</div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">
        <strong> 객실 사용 인원에 대한 제한이 있나요?</strong></a>
      </h4>
    </div>
    <div id="collapse2" class="panel-collapse collapse">
      <div class="panel-body">Lorem ipsum dolor sit amet, consectetur adipisicing elit,
      - 디럭스 객실: 4인 기준 / 스위트 객실: 2인 기준 / 패밀리 스위트 객실: 6인 기준(성인 4인, 어린이 2인)</div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">
        <strong> 적립 된 포인트와 현금을 동시에 사용할 수 있나요?</strong></a>
      </h4>
    </div>
    <div id="collapse3" class="panel-collapse collapse">
      <div class="panel-body"> 네, AMBASSADOR CLUB 포인트는 가용 포인트와 현금 및 신용카드 등 타 결제 수단과 동시 사용이 가능합니다.

예를 들어, 30,000포인트를 가지고 계신 고객이 100,000원만큼의 상품/서비스를 구매하실 경우 30,000포인트와 현금 70,000원을 지불하여 구매 하실 수 있습니다.

이 때 현금으로 지불하신 70,000원에 대해서 해당 적립율 기준으로 정상 적립해 드립니다.
(객실 5%, 레스토랑 1%, 연회 0.5% (식사 및 음료 금액에 한함.))</div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapse4">
        <strong> 객실 예약 취소는 언제까지 해야 합니까?</strong></a>
      </h4>
    </div>
    <div id="collapse4" class="panel-collapse collapse">
      <div class="panel-body"> 투숙 하루 전 오후 6시까지
- 이후 발생되는 취소 및 변경의 경우 1박 요금 100%의 penalty가 부과될 수 있습니다.
- 특정 행사 또는 festive day의 경우 취소 및 변경 규정이 다르게 적용될 수 있습니다.</div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapse5">
        <strong> 사우나 요금은 얼마입니까?</strong></a>
      </h4>
    </div>
    <div id="collapse5" class="panel-collapse collapse">
      <div class="panel-body">- 객실 투숙객만 이용 가능하시며 요금은 33,000원(남성 전용)입니다. (세금 및 봉사료 포함)</div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapse6">
        <strong> 아기 침대가 준비됩니까?</strong></a>
      </h4>
    </div>
    <div id="collapse6" class="panel-collapse collapse">
      <div class="panel-body">- 요청하시면 객실에 준비해드리며, 무료로 이용 가능합니다. 
- 수량이 한정되어 있으니 사전 문의 바랍니다.</div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapse7">
        <strong> 체크인과 체크아웃 시간이 어떻게 됩니까?</strong></a>
      </h4>
    </div>
    <div id="collapse7" class="panel-collapse collapse">
      <div class="panel-body">- 체크인 오후 2시 / 체크아웃 오후 12시</div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapse8">
        <strong> 헬스클럽 & 수영장 이용 요금은 어떻게 됩니까?</strong></a>
      </h4>
    </div>
    <div id="collapse8" class="panel-collapse collapse">
      <div class="panel-body">- 일반 객실(2인 기준) 투숙객의 경우, 체련장과 실내 수영장을 무료로 이용 가능합니다.
- 단, 추가 인원 발생 시 16,500원의 이용요금이 부과됩니다.(세금 및 봉사료 포함)
- 체련장은 만 15세 이상만 이용 가능합니다.</div>
    </div>
  </div>
</div>
</div>
   <br><br>
   <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
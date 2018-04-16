<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
session.setAttribute("loadpage", "/terra/consumer/map.jsp");
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
            if(str=="1"){ location.href="../consumer/login.jsp" }
            else if(str=="2"){ location.href="../consumer/signup.jsp" }
            else if(str=="3"){ location.href="../consumer/userInformation.jsp"}
         }
         function logout(){
            var con = confirm("접속을 종료하시겠습니까");
            if(con == true){ location.replace("../consumer/userlogout.jsp"); }
            else{}
         }
      </script>
   </head>
   <body>
   <jsp:include page="header1.jsp"/>
  <h1><strong> 오시는길 </strong></h1>
  <hr>
  <p>더 테라에 오시는 방법및 호텔내에서 이동하는방법</p>
  <header>
<!-- <!--   <div class="main">
<div class="row">
<div class="hidden-xs col-xs-0" id="col2">
</div>

<div class=" col-sm-9" id="col1">   
<section id="content">
<div id="map" style="width:1000px;height:500px;">
</header>
 --> 
</div>

   <div id="map" style="width:100%;height:550px;"></div>

   <script src="//apis.daum.net/maps/maps3.js?apikey=
8c6b89685ac971e468bd2ce08fe75329"></script>
   <script>
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
          mapOption = {
              center: new daum.maps.LatLng(37.499183, 127.030795), // 지도의 중심좌표
              level: 5, // 지도의 확대 레벨
              mapTypeId : daum.maps.MapTypeId.ROADMAP // 지도종류
          }; 

      // 지도를 생성한다 
      var map = new daum.maps.Map(mapContainer, mapOption); 

      // 지도에 마커를 생성하고 표시한다
      var marker = new daum.maps.Marker({
          position: new daum.maps.LatLng(37.499183, 127.030795), // 마커의 좌표
          map: map // 마커를 표시할 지도 객체
      });

   </script>
   <h3>버스 이용시</h3>
   <h3>버스 이용시</h3>
   <h3>버스 이용시</h3>
   <h3>버스 이용시</h3>
   
   </div>

   <br><br>
   <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% System.out.println(request.getParameter("user_id")); %>

<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="reviewboard.*"%>
<% 
List<ReviewBean> list = (List)ReviewDAO.list();

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
		
		<!-- 1. jQuery 및 jQuery-ui.css 로드 -->
		<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
		<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
		<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>


		<style type="text/css">
			.ui-datepicker-year { margin-right: -5px; }
			table { vertical-align: middle; text-align: center; margin: auto;}
			.mobilereservtable { height: 70px; }
			caption { text-align: center; }
		</style>
		<!-- 2. 인풋 아이디 datepicker를 클릭시 달력을 보여주기 위한 코드 -->
				
		<script type="text/javascript">
			$(document).ready(function(){  
				$("#fromDate").datepicker({     
					showMonthAfterYear:true, 
					monthNames:['년 1월','년 2월','년 3월','년 4월','년 5월','년 6월','년 7월','년 8월','년 9월','년 10월','년 11월','년 12월'], 
					monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], 
					dayNamesMin: ['일','월','화','수','목','금','토'], 
					weekHeader: 'Wk', 
					dateFormat: 'yy-mm-dd', 
					minDate: 0,
					showAnim: 'clip', 
					beforeShowDay: nationalDays,
					 
					onClose: function( selectedDate ) {    
						// 시작일(fromDate) datepicker가 닫힐때
						// 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
						var date3 = new Date(selectedDate);
						var m = date3.getMonth()+1, d = date3.getDate()+1, y = date3.getFullYear();
						var date4 = y+'-'+m+'-'+d;
						if(m<10&&d<10){date4 = y+'-0'+m+'-0'+d;
						}else if(m<10){date4 = y+'-0'+m+'-'+d;
						}else if(d<10){date4 = y+'-'+m+'-0'+d;}
						$("#toDate").val('');  
						$("#toDate").datepicker( "option", "minDate", date4 );
					}
				 
				});  
				$("#toDate").datepicker({     
					showMonthAfterYear:true,
					monthNames:['년 1월','년 2월','년 3월','년 4월','년 5월','년 6월','년 7월','년 8월','년9월','년 10월','년 11월','년 12월'],
					monthNamesShort:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
					dayNamesMin: ['일','월','화','수','목','금','토'],
					weekHeader: 'Wk',
					dateFormat: 'yy-mm-dd',
					minDate: 0,
					beforeShowDay: nationalDays,
					showAnim: 'clip',
					numberOfMonths: 1,      //달력 표시숫자(1~)
					showCurrentAtPos: 0,    //숫자만큼 해당개월전을 표시(0~)
					onClose: function( selectedDate ) {
						if (!$("#fromDate").val()) { alert("체크인 날짜를 먼저 선택하세요"); return false; }
						// 시작일(fromDate) datepicker가 닫힐때
						// 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
						$("#fromDate").datepicker( "option", "maxDate", selectedDate );
						var date1 = new Date($("#fromDate").datepicker("getDate"));
						var date2 = new Date($("#toDate").datepicker("getDate"));
						var term = ((date2 - date1)/60/60/24/1000)+1;
						$("#term").val(term);  
					}
				});
			});
			/* create an array of days which need to be disabled */
			var disabledDays = ["2017-1-10"];

			/* utility functions */
			function nationalDays(date) {
			var m = date.getMonth(), d = date.getDate(), y = date.getFullYear();
			//console.log('Checking (raw): ' + m + '-' + d + '-' + y);
			for (i = 0; i < disabledDays.length; i++) {
				if($.inArray(y+ '-' + (m+1) + '-' + d,disabledDays) != -1) { return [false]; }
			}
			//console.log('good: ' + (m+1) + '-' + d + '-' + y);
			return [true];
			}	
			function resrvation(){
				var con = confirm("로그인이 필요합니다");
				if(con == true){ location.replace("/terra/consumer/login.jsp"); }
				else{}
			}
		</script>
	</head>
	<body>
	<jsp:include page="consumer/header.jsp"/>

	<div class=" container">
		<div class="tab-content">
			<div id="home" class= "tab-pane fade in active">
				<article>
					<div class="container" style="margin-top:50px">
						<div class ="panel-body">
							<!-- 슬라이드바 -->
							<div id="myCarousel" class="carousel slide" data-ride="carousel">
								<!-- Indicators -->
								<ol class="carousel-indicators">
								  <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
							  <li data-target="#myCarousel" data-slide-to="1"></li>
								  <li data-target="#myCarousel" data-slide-to="2"></li>
								</ol>
								
								<!-- Wrapper for slides -->
								<div class="carousel-inner" role="listbox">
									
									<div class="item active">
										<a href="EventListAction.ro">
											<img  src="img/event3.jpg"style="width: 100%; max-height: 700px;'"alt="Flower" class="img-responsive">
										</a>
									</div>
									<div class="item">
										<a href="EventListAction.ro">
											<img src="img/event1.jpg" style="width: 100%; max-height: 700px;'"  alt="Chania" class="img-responsive">
										</a>
									</div>
									<div class="item">
										<a href="EventListAction.ro">
											<img src="img/event2.jpg" style="width: 100%; max-height: 700px;'"alt="Chania" class="img-responsive">
										</a>
									</div>
								</div>
									
								<!-- Left and right controls -->
								<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
									<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
									<span class="sr-only">Previous</span>
								</a>
								<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
									<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
									<span class="sr-only">Next</span>
								</a>	
							</div>
							
							<div class="table-responsive hidden-xs">
								<form class="form-horizontal " action="/terra/reserve.res" method="post">
									<table>
										<caption></caption>
										<tr>
											<th>예약</th> <th>숙박 기간</th>
											<th><input type="text" class="form-control" name="fromdate" id="fromDate"readonly="readonly"  placeholder="당일 예약은 불가능합니다."></th>
											<th><div class="glyphicon glyphicon-menu-right"></div></th>
											<th><input type="text" class="form-control" name="todate" id="toDate"readonly="readonly"  placeholder="체크인 당일에는 불가능합니다."></th>
											<% if (session.getAttribute("user_id") == null && session.getAttribute("grade") == null) { %>
											<th><input type="button" class="btn btn-primary" value="예약하기" onclick="resrvation()"></th>
											<% }else{ %>
											<th><input type="submit" class="btn btn-primary" value="예약하기"></th>
											<% } %>
										</tr>
									</table>
								</form>
							</div>
							
							<div class="visible-xs">
								<form class="form-horizontal " action="/terra/reserve.res" method="post">
									<table>
										<caption>호텔 예약</caption>
										<tr>
											<th>
												<input type="text" class="form-control" name="fromdate" id="fromDate"readonly="readonly"  placeholder="체크인 날짜"></th>
											<th rowspan="2">
												<% if (session.getAttribute("user_id") == null && session.getAttribute("grade") == null) { %>
												<input type="button" class="mobilereservtable btn btn-primary" value="예약" onclick="resrvation()">
												<% }else{ %>
												<input type="submit" class="mobilereservtable btn btn-primary" value="예약">
												<% } %>
											</th>
										</tr>
										<tr>
											<th><input type="text" class="form-control" name="todate" id="toDate"readonly="readonly"  placeholder="체크아웃 날짜"></th>
										</tr>
									</table>
								</form>
							</div>
							
							
							
							
							
							
							
							
							
							<br><br>
							<div class="row">
								<div class="col-sm-6 text-main-div">
									<table class="table table-hover">
										<caption>리뷰게시판</caption>										
										<tr>
											<th class="text-center">번호</th>											
											<th class="text-center">작성자</th>
											<th class="text-center">제목</th>
										</tr>
										
										<%
										for (int i = 0; i < list.size(); i++) {
											ReviewBean bl = (ReviewBean) list.get(i);
									     %>
										   <%if(i==6) { %>
										   <% break;}%>										   
										<tr style = "cursor:pointer;" onClick ="location.href='ReviewBoardDetailAction.ro?num=<%=bl.getRev_num()%>&pageno=<%=1%>' ">		
											<td><%=bl.getRev_num()%></td>
		                                     <td><%=bl.getRev_id()%></td>
		                                     <td><%=bl.getRev_subject()%></td>											
										</tr>
										<%} %>
									</table>
								</div>
								
								
								<div class="col-sm-6">
									<label class="text-main">이번주 추천 방</label>
									<hr>
									<div class="row">
										<div class="col-sm-6">
											<a href="consumer/roomfamily.jsp"><img src="consumer/roomimg/family1.jpg"
													class="img-responsive" style="width: 100%" alt="Image">
											가족여행의 편안함</a>
										</div>
										<div class="col-sm-6">
											<a href="consumer/roomsweet.jsp"><img src="consumer/roomimg/sweet1.jpg"
													class="img-responsive" style="width: 100%" alt="Image">
											커플들을 위한 포근함</a>
										</div>
									</div>
								</div>
							</div>
							<br><br>
						</div>
					</div>	
				</article>
			</div>
		</div>
	</div>

	<jsp:include page="consumer/footer.jsp"/>
	
	</body>
</html>
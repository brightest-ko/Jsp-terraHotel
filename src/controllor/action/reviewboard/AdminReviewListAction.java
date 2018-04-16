package controllor.action.reviewboard;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controllor.action.Action;
import controllor.action.ActionForward;
import reviewboard.ReviewBean;
import reviewboard.ReviewDAO;

public class AdminReviewListAction implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");		
		ActionForward forward = new ActionForward();			
		//받을 객체 생성
		ReviewDAO reviewdao = new ReviewDAO();		
		ReviewBean reviewbean = new ReviewBean();
		List<ReviewBean> adminreviewlist = new ArrayList();	
		//이벤트 페이징 교체	
	//왜 안넘어오지???
	String type = request.getParameter("selectType");
	String word = (String)request.getParameter("selectWord");//한글깨짐
	
	 if(request.getParameter("selectType")!=null) {
		String stype = request.getParameter("selectType");
		String sword = (String)request.getParameter("selectWord");
		request.setAttribute("selectType", stype);
		request.setAttribute("selectWord", sword);
	}	
	
	
	int pageno = 1;  //pageno		
	//if (request.getParameter("pageno") != null) {
	//	pageno = Integer.parseInt(request.getParameter("pageno"));
	//}
	
	String tempNo = request.getParameter("pageno");
	if (tempNo!=null){pageno = Integer.parseInt(tempNo);}
	try { pageno = Integer.parseInt(tempNo); }
	catch (Exception e) { /*null 이거나, 문자를 숫자로 바꾸려 해서 에러가 나거나 무조건 pageNo=1*/ }
	
final int ROW_PER_PAGE = 4; // 페이지당 레코드 출력 갯수
	int begin = (pageno - 1) * ROW_PER_PAGE + 1;
	int end = pageno * ROW_PER_PAGE;	
	
	adminreviewlist = reviewdao.getARBoardList(begin, end, type, word);//getEventRListCount
	//System.out.println("이벤트 검색 체크중eventboardlist@@"+eventboardlist);
	//listcount =  eventdao.getListCount();//총 글갯수였나??		
	int totalRows = reviewdao.getARListCount(type, word); // 전체 게시물 갯수
	//System.out.println("이벤트 검색 체크중totalRows@@"+totalRows);	
	int totalPages = (int) Math.ceil((double) totalRows / ROW_PER_PAGE);
	// 전체 페이지 갯수
	final int PAGE_PER_PAGE = 5; // 화면당 페이지 출력 갯수
	int totalRanges = (int) Math.ceil((double) totalPages / PAGE_PER_PAGE); // 전체 Range 갯수
	int currentRange = (int) Math.ceil((double) pageno / PAGE_PER_PAGE);
	//요청된 pageNo의 현재 range
	//System.out.println("이벤트 검색 체크중@@currentRange");
	int beginPage = (currentRange - 1) * PAGE_PER_PAGE + 1; // 시작 페이지 번호
	int endPage = currentRange * PAGE_PER_PAGE; // 마지막 페이지 번호
	if (currentRange == totalRanges) endPage = totalPages; // currentRange가 맨 마지막 range인 경우
	int prevPage = 0;
	if (currentRange != 1) prevPage = (currentRange - 2) * PAGE_PER_PAGE + 1;
	int nextPage = 0;
	if (currentRange != totalRanges) nextPage = currentRange * PAGE_PER_PAGE + 1;		
	//System.out.println("이벤트 검색 체크중@@set url");//여기  안읽음 @@@@;;		
	
			
	request.setAttribute("pageno", pageno);
	request.setAttribute("beginPage", beginPage);
	request.setAttribute("endPage", endPage);
	request.setAttribute("prevPage", prevPage);		
	request.setAttribute("nextPage", nextPage);//여기까지 페이징인가??
	request.setAttribute("adminreviewlist", adminreviewlist);
	//forward.setUrl("adminstration/admin_eventlist.jsp");
	forward.setUrl("./administration/admin_reviewlist.jsp");//	
	forward.setRedirect(false);
	return forward;		
	}
}
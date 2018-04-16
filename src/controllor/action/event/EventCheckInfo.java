package controllor.action.event;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controllor.action.Action;
import controllor.action.ActionForward;
import eventboard.EventBean;
import eventboard.EventCheckBean;
import eventboard.EventDAO;

public class EventCheckInfo implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		//System.out.println("보드리스트넘어옴@@@@@@");
		ActionForward forward = new ActionForward();		
		//받을 객체 생성
		EventDAO eventdao = new EventDAO();
		EventBean eventbean = new EventBean();
		EventCheckBean eventcheck = new EventCheckBean();//해당 글 검색한것을 받음
		//ReviewDAO reviewdao = new ReviewDAO();		
		//ReviewBean reviewbean = new ReviewBean();
		List eventboardlistc = new ArrayList();//이벤트 관리자용 출력@@
		//리스트 객체 만듬 페이지 리미트 처리용
		
		
		
		//페이징 교체
int pagenoc = 1;  //pageno
		
		if (request.getParameter("pagenoc") != null) {
			pagenoc = Integer.parseInt(request.getParameter("pagenoc"));
		}	
				
		final int ROW_PER_PAGE = 5; // 페이지당 레코드 출력 갯수
		int begin = (pagenoc - 1) * ROW_PER_PAGE + 1;
		int end = pagenoc * ROW_PER_PAGE;	
		
		
		HttpSession session = request.getSession();
		String uid=(String)session.getAttribute("user_id");//회원 로그인 아이디 받아옴
	
		eventcheck.setBegin(begin);  //시작과 끝 
		eventcheck.setEnd(end);	//아이디로 이벤트 체크에서		
		eventcheck.setEc_id(uid);
	
				
		int totalRows =  eventdao.eventCheckgetListCount(uid);//총 글갯수였나?? 		
		int totalPages = (int) Math.ceil((double) totalRows / ROW_PER_PAGE);
		//System.out.println("보드리스트넘어옴 메소드 통과@@@@@@"+listcount);
		//페이징 처리
		final int PAGE_PER_PAGE = 5; // 화면당 페이지 출력 갯수
		int totalRanges = (int) Math.ceil((double) totalPages/ PAGE_PER_PAGE); // 전체 Range 갯수
		int currentRange = (int) Math.ceil((double) pagenoc / PAGE_PER_PAGE);
		//요청된 pageNo의 현재 range
		int beginPagec = (currentRange - 1) * PAGE_PER_PAGE + 1; // 시작 페이지 번호
		int endPagec = currentRange * PAGE_PER_PAGE; // 마지막 페이지 번호
		if (currentRange == totalRanges)
			endPagec = totalPages; // currentRange가 맨 마지막 range인 경우
		 
		int prevPagec = 0;
		if (currentRange != 1)
			prevPagec = (currentRange - 2) * PAGE_PER_PAGE + 1;
		int nextPagec = 0;
		if (currentRange != totalRanges)
			nextPagec = currentRange * PAGE_PER_PAGE + 1;
		
		eventboardlistc= eventdao.CgetBoardList(eventcheck); //총글갯수??? 		
		
		request.setAttribute("pagenoc", pagenoc);
		request.setAttribute("prevPagec", prevPagec);
		request.setAttribute("nextPagec", nextPagec);
		request.setAttribute("beginPagec", beginPagec);		
		request.setAttribute("endPagec", endPagec);//여기까지 페이징인가??
		request.setAttribute("eventboardlistc", eventboardlistc);  //???
		forward.setRedirect(false);
		forward.setUrl("./consumer/eventcheck_info.jsp");
		return forward;
	}
}
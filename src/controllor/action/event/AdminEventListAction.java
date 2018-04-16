package controllor.action.event;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controllor.action.Action;
import controllor.action.ActionForward;
import eventboard.EventBean;
import eventboard.EventDAO;

public class AdminEventListAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");		
		ActionForward forward = new ActionForward();		
		//받을 객체 생성
		EventDAO eventdao = new EventDAO();
		EventBean eventbean = new EventBean();		
		List <EventBean> eventboardlist = new ArrayList();//이벤트 관리자용 출력@@
	
//		if (request.getParameter("page") != null) {
//			tempNo = Integer.parseInt(request.getParameter("page"));
//		}		
		
		
		
		String type = request.getParameter("selectType");
		String word = (String)request.getParameter("selectWord");//한글깨짐
		
		 if(request.getParameter("selectType")!=null) {
			String stype = request.getParameter("selectType");
			String sword = (String)request.getParameter("selectWord");
			request.setAttribute("selectType", stype);
			request.setAttribute("selectWord", sword);
		}
		
		//String tempNo = request.getParameter("pageno");	//page->pageno	
		//page가 아마 리턴 받아오는 값인듯@@@@
		
		//기존 페이징
		int pageno = 1;  //pageno		
		//if (request.getParameter("pageno") != null) {
		//	pageno = Integer.parseInt(request.getParameter("pageno"));
		//}	
		
		//???페이지 이동이 안됨@@@@  이해가 안됨  포워딩 방식도 모르겠음
		//int pageno = 1;
		
		String tempNo = request.getParameter("pageno");
		if (tempNo!=null){pageno = Integer.parseInt(tempNo);}
		try { pageno = Integer.parseInt(tempNo); }
		catch (Exception e) { /*null 이거나, 문자를 숫자로 바꾸려 해서 에러가 나거나 무조건 pageNo=1*/ }
		
	final int ROW_PER_PAGE = 4; // 페이지당 레코드 출력 갯수
		int begin = (pageno - 1) * ROW_PER_PAGE + 1;
		int end = pageno * ROW_PER_PAGE;	
		
		eventboardlist = eventdao.getEventBoardList(begin, end, type, word);//getEventRListCount
		//System.out.println("이벤트 검색 체크중eventboardlist@@"+eventboardlist);
		//listcount =  eventdao.getListCount();//총 글갯수였나??		
		int totalRows = eventdao.getEventEListCount(type, word); // 전체 게시물 갯수
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
		
		//forward.setUrl("/AdminShowEvent.ro");		
		request.setAttribute("pageno", pageno);
		request.setAttribute("beginPage", beginPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("prevPage", prevPage);		
		request.setAttribute("nextPage", nextPage);//여기까지 페이징인가??
		request.setAttribute("eventboardlist", eventboardlist);
		System.out.println("이벤트 검색 체크중@@set url통과");		
		
		
		//forward.setUrl("adminstration/admin_eventlist.jsp");
		forward.setUrl("/administration/admin_eventlist.jsp");//?pageno="+pageno		
		forward.setRedirect(false);		
		System.out.println("이벤트 검색 체크중@@리턴 바로앞");		
		return forward;
		//System.out.println(eventboardlist);
		//forward.setRedirect(false);
		//forward.setUrl("./administration/admin_eventlist.jsp");
		//return forward;
	}
}
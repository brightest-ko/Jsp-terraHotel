package controllor.action.noticeboard;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controllor.action.Action;
import controllor.action.ActionForward;
import controllor.action.*;
import noticeboard.*;
public class AdminNoticeBoardListAction implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();		
		//받을 객체 생성
		NoticeDAO noticedao = new NoticeDAO();		
		NoticeBean noticebean = new NoticeBean();
		List adminnoticelist = new ArrayList();
		
		//리스트 객체 만듬 페이지 리미트 처리용
		//List boardList = (List) request.getAttribute("noticeboardlist");
		//List<int[]> pagelist = new ArrayList();
		//noticeboardlist = noticedao.list();		
		//BoardDAO boarddao = new BoardDAO();
		//List boardlist = new ArrayList();
		int pageno = 1;  //pageno
		int limit = 10;
		int listcount=0;
		if (request.getParameter("page") != null) {
			pageno = Integer.parseInt(request.getParameter("page"));
		}	
		//실험중  페이지리스에 담음
		//pagelist.c .add(0,page);
		//pagelist.add(1,limit);
		
		final int ROW_PER_PAGE = 5; // 페이지당 레코드 출력 갯수
		int begin = (pageno - 1) * ROW_PER_PAGE + 1;
		int end = pageno * ROW_PER_PAGE;
		//NoticeDAO noticedao = new NoticeDAO();
		
		
		// 시작 페이지와 끝 페이지를 조건으로 리스트 가져오기
		int totalRows = noticedao.getListCount(); // 전체 게시물 갯수
		int totalPages = (int) Math.ceil((double) totalRows / ROW_PER_PAGE);
		// 전체 페이지 갯수
		 
		 
		final int PAGE_PER_PAGE = 5; // 화면당 페이지 출력 갯수
		int totalRanges = (int) Math.ceil((double) totalPages
				/ PAGE_PER_PAGE); // 전체 Range 갯수
		int currentRange = (int) Math.ceil((double) pageno / PAGE_PER_PAGE);
		//요청된 pageNo의 현재 range
		int beginPage = (currentRange - 1) * PAGE_PER_PAGE + 1; // 시작 페이지 번호
		int endPage = currentRange * PAGE_PER_PAGE; // 마지막 페이지 번호
		if (currentRange == totalRanges)
			endPage = totalPages; // currentRange가 맨 마지막 range인 경우
		 
		int prevPage = 0;
		if (currentRange != 1)
			prevPage = (currentRange - 2) * PAGE_PER_PAGE + 1;
		int nextPage = 0;
		if (currentRange != totalRanges)
			nextPage = currentRange * PAGE_PER_PAGE + 1;
		
		adminnoticelist = noticedao.getBoardList(begin, end);  //총 수량 먼저 갖구옴
		
		request.setAttribute("PageNo", pageno);
		request.setAttribute("prevPage", prevPage);
		request.setAttribute("nextPage", nextPage);
		request.setAttribute("beginPage", beginPage);
		request.setAttribute("endPage", endPage);
		//request.setAttribute("nextPage", nextPage);		
		//request.setAttribute("listcount", listcount);
		request.setAttribute("adminnoticelist", adminnoticelist);
		forward.setRedirect(false);
		forward.setUrl("./administration/admin_notice_board_list.jsp");//
		return forward;
	}
}
package controllor.action.member;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controllor.action.Action;
import controllor.action.ActionForward;
import member.*;

public class MemberListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		List<MemberBean> memberboardlist = new ArrayList();
		
		String tempNo = request.getParameter("page");
		
//		if (request.getParameter("page") != null) {
//			tempNo = Integer.parseInt(request.getParameter("page"));
//		}
		
		
		String type = request.getParameter("selectType");
		String word = request.getParameter("selectWord");
		
		int pageNo = 1;
		try { pageNo = Integer.parseInt(tempNo); }
		catch (Exception e) { /*null 이거나, 문자를 숫자로 바꾸려 해서 에러가 나거나 무조건 pageNo=1*/ }
		final int ROW_PER_PAGE = 7; // 페이지당 레코드 출력 갯수
		int begin = (pageNo - 1) * ROW_PER_PAGE + 1;
		int end = pageNo * ROW_PER_PAGE;

		MemberDAO memberdao = new MemberDAO();
		
		memberboardlist = memberdao.getMemberBoardList(begin, end, type, word);
		
		// 시작 페이지와 끝 페이지를 조건으로 리스트 가져오기
		
		int totalRows = memberdao.getMemberRListCount(type, word); // 전체 게시물 갯수
		
		int totalPages = (int) Math.ceil((double) totalRows / ROW_PER_PAGE);
		// 전체 페이지 갯수
		final int PAGE_PER_PAGE = 5; // 화면당 페이지 출력 갯수
		int totalRanges = (int) Math.ceil((double) totalPages / PAGE_PER_PAGE); // 전체 Range 갯수
		int currentRange = (int) Math.ceil((double) pageNo / PAGE_PER_PAGE);
		//요청된 pageNo의 현재 range

		int beginPage = (currentRange - 1) * PAGE_PER_PAGE + 1; // 시작 페이지 번호
		int endPage = currentRange * PAGE_PER_PAGE; // 마지막 페이지 번호
		if (currentRange == totalRanges) endPage = totalPages; // currentRange가 맨 마지막 range인 경우
		int prevPage = 0;
		if (currentRange != 1) prevPage = (currentRange - 2) * PAGE_PER_PAGE + 1;
		int nextPage = 0;
		if (currentRange != totalRanges) nextPage = currentRange * PAGE_PER_PAGE + 1;

		HttpSession session = request.getSession();
		String str = (String)session.getAttribute("movepage");
		
		if( str == null || str.equals("")){
			forward.setUrl("/showmembre.ro");
		}
		else{
			forward.setUrl("/showmembre.ro?page="+str);
		}
		
		request.setAttribute("pageNo", pageNo);
		request.setAttribute("prevPage", prevPage);
		request.setAttribute("nextPage", nextPage);
		request.setAttribute("beginPage", beginPage);		
		request.setAttribute("endPage", endPage);
		request.setAttribute("memberboardlist", memberboardlist);
		forward.setRedirect(false);
		return forward;
	}
}

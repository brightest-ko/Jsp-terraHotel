package controllor.action.noticeboard;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controllor.action.Action;
import controllor.action.ActionForward;
import noticeboard.*;

public class NoticeBoardListAction implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();		
		//받을 객체 생성
		NoticeDAO noticedao = new NoticeDAO();		
		NoticeBean noticebean = new NoticeBean();
		List noticeboardlist = new ArrayList();
		int page = 1;
		int limit = 10;
		int listcount=0;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		listcount =  noticedao.getListCount();//총 글갯수였나??
		
		//페이징 처리
		int startrow = (page - 1) * 10 + 1;
		int endrow = startrow + limit - 1;
		
		noticeboardlist = noticedao.getBoardList(startrow,endrow);
		
		int maxpage = (int) ((double) listcount / limit + 0.95);
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		int endpage = maxpage;
		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;
		request.setAttribute("page", page);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);		
		request.setAttribute("listcount", listcount);//여기까지 페이징인가??
		request.setAttribute("noticeboardlist", noticeboardlist);
		forward.setRedirect(false);
		forward.setUrl("./consumer/notice_board_list.jsp");
		return forward;
	}
}
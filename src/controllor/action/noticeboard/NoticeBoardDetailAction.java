package controllor.action.noticeboard;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controllor.action.Action;
import controllor.action.ActionForward;
import noticeboard.*;


public class NoticeBoardDetailAction implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		
		HttpSession session = request.getSession();
		
		NoticeDAO noticedao = new NoticeDAO();
		NoticeBean noticebean = new NoticeBean();
		int num = Integer.parseInt(request.getParameter("num"));		
		 noticedao.setListCount(num);//조회수 즈응가
		noticebean=noticedao.info(num);//리뷰 인포
		 
		//조회수 체크용
		//System.out.println("조회수 체크중~~"+x);		
		//boarddao.setReadCountUpdate(num);
		//boarddata = boarddao.getDetail(num);
		if (noticebean == null) {
			return null;
		}
		request.setAttribute("noticebean", noticebean);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setUrl("./consumer/notice_board_detail.jsp");
		return forward;

	}
}
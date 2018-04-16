package controllor.action.noticeboard;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controllor.action.Action;
import controllor.action.ActionForward;
import noticeboard.*;


public class AdminNoticeBoardDetailAction implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		
		HttpSession session = request.getSession();
		
		//객체 생성@@@@@@@@@@@
		NoticeDAO noticedao = new NoticeDAO();
		NoticeBean noticebean = new NoticeBean();
		int num = Integer.parseInt(request.getParameter("num"));		
		 noticedao.setListCount(num);//조회수 즈응가
		noticebean=noticedao.info(num);//리뷰 인포
		 
		if (noticebean == null) {
			return null;
		}
		request.setAttribute("noticebean", noticebean);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setUrl("./administration/admin_notice_board_detail.jsp");
		return forward;

	}
}
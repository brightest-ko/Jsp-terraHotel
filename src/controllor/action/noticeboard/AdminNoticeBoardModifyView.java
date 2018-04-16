package controllor.action.noticeboard;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controllor.*;
import controllor.action.Action;
import controllor.action.ActionForward;
import noticeboard.*;

public class AdminNoticeBoardModifyView implements Action {
	
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//???세션은 계속 추가해야하나??
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		NoticeDAO noticedao = new NoticeDAO();
		NoticeBean noticebean = new NoticeBean();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("user_id");
		int num = Integer.parseInt(request.getParameter("num"));
		
		
		
		noticebean = noticedao.info(num);
		String uid= noticebean.getN_id();
		
		if(!(id.equals(uid))) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('글쓴이가 아닙니다.');");
			out.println(" location.href='./NoticeBoardDetailAction.ro?num=" +num+"' ");
			out.println("</script>");
			out.close();
			return null;
		}
		if (noticebean == null) {
			return null;
		}
		request.setAttribute("noticebean", noticebean);
		forward.setRedirect(false);
		forward.setUrl("./administration/admin_board_modify.jsp");
		return forward;
	}
}
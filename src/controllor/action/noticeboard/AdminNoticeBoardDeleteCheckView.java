package controllor.action.noticeboard;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controllor.action.Action;
import controllor.action.ActionForward;
import noticeboard.*;
public class AdminNoticeBoardDeleteCheckView implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("user_id");
		NoticeDAO noticedao = new NoticeDAO();
		NoticeBean noticebean = new NoticeBean();
		int num = Integer.parseInt(request.getParameter("num"));
		noticebean=noticedao.info(num);//리뷰 인포
		String uid= noticebean.getN_id();
		if(!(id.equals(uid))) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('글쓴이가 아닙니다.');");
			out.println(" location.href='./AdminNoticeBoardDetailAction.ro?num=" +num+"' ");
			out.println("</script>");
			out.close();
			return null;
		}
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
		forward.setUrl("./administration/deletecheck.jsp");
		return forward;

	}
}

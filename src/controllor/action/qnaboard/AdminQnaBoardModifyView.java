package controllor.action.qnaboard;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controllor.action.Action;
import controllor.action.ActionForward;
import qnaboard.QnaBean;
import qnaboard.QnaDAO;

public class AdminQnaBoardModifyView implements Action {
	
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		QnaDAO qnadao = new QnaDAO();
		QnaBean qnabean = new QnaBean();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("user_id");
		int num = Integer.parseInt(request.getParameter("num"));
		
		
		
		qnabean = qnadao.info(num);
		String uid= qnabean.getQ_id();
		
		if(!(id.equals(uid))) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('글쓴이가 아닙니다.');");
			out.println(" location.href='./AdminQnaBoardDetailAction.ro?num=" +num+"' ");
			out.println("</script>");
			out.close();
			return null;
		}
		if (qnabean == null) { return null; }
		request.setAttribute("qnabean", qnabean);
		forward.setRedirect(false);
		forward.setUrl("./administration/admin_qna_board_modify.jsp");
		return forward;
	}
}
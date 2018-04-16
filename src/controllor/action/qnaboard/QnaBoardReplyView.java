package controllor.action.qnaboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controllor.action.Action;
import controllor.action.ActionForward;
import qnaboard.QnaBean;
import qnaboard.QnaDAO;

public class QnaBoardReplyView implements Action {
	
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
		int ref= qnabean.getQ_re_ref();
	
		
		if (qnabean == null) {
			return null;
		}	


			request.setAttribute("qnabean", qnabean);
			forward.setRedirect(false);
			forward.setUrl("./qnaboard/qna_board_reply.jsp");
			return forward;	
	
	}
}
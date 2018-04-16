package controllor.action.qnaboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controllor.action.Action;
import controllor.action.ActionForward;
import qnaboard.QnaBean;
import qnaboard.QnaDAO;

public class QnaBoardAddAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		QnaDAO qnadao = new QnaDAO();
		QnaBean qnabean = new QnaBean();
		ActionForward forward = new ActionForward();
		String realFolder = "";
		String saveFolder = "/qnaupload";
		int fileSize = 5 * 1024 * 1024;
		realFolder = request.getRealPath(saveFolder);

		try {
			
			
			qnabean.setQ_id(request.getParameter("q_id"));
			
			qnabean.setQ_pw(request.getParameter("q_pw"));
			
			qnabean.setQ_subject(request.getParameter("q_subject"));
			
			qnabean.setQ_content(request.getParameter("q_content"));
			
			qnabean.setQ_readcount(Integer.parseInt("0"));
			int x = qnadao.insert(qnabean);
			
			if (x == 0) {
				return null;
			}

			forward.setRedirect(true);
			forward.setUrl("./QnaBoardListAction.ro");
			return forward;

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}

}

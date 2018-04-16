package controllor.action.qnaboard;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controllor.action.Action;
import controllor.action.ActionForward;
import qnaboard.QnaBean;
import qnaboard.QnaDAO;


public class AdminQnaBoardDetailAction implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		
		HttpSession session = request.getSession();
		
		//객체 생성@@@@@@@@@@@
		QnaDAO qnadao = new QnaDAO();
		QnaBean qnabean = new QnaBean();
		int num = Integer.parseInt(request.getParameter("num"));		
		 qnadao.setListCount(num);//조회수 즈응가
		qnabean=qnadao.info(num);//리뷰 인포
		 
		//조회수 체크용
		//System.out.println("조회수 체크중~~"+x);		
		//boarddao.setReadCountUpdate(num);
		//boarddata = boarddao.getDetail(num);
		if (qnabean == null) {
			return null;
		}
		request.setAttribute("qnabean", qnabean);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setUrl("./administration/admin_qna_board_detail.jsp");
		return forward;

	}
}
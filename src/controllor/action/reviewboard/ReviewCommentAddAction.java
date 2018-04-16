package controllor.action.reviewboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controllor.action.Action;
import controllor.action.ActionForward;
import reviewboard.ReviewCommentBean;
import reviewboard.ReviewBean;
import reviewboard.ReviewDAO;

public class ReviewCommentAddAction implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		ReviewDAO reviewdao = new ReviewDAO();
		ReviewBean reviewbean = new ReviewBean();
		ReviewCommentBean reviewcomment = new ReviewCommentBean();//
		
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("user_id");//세션 아이디		
		//아이디 받음
		//아이디 참조, 글번호 참조, 내용 3개를 보내고  		
		try {
			
			reviewcomment.setRc_id(id);//
			reviewcomment.setRc_num(Integer.parseInt(request.getParameter("rc_num")));
			reviewcomment.setRc_content(request.getParameter("rc_content"));			
			int x=reviewdao.commentInsert(reviewcomment);//코멘트 인서트	
			
			int rev=reviewcomment.getRc_num();
			if (x == 0) {
				return null;
			}
			int xx = Integer.parseInt(request.getParameter("pageno"));
			int pageno = Integer.parseInt(request.getParameter("pageno"));//???
			forward.setRedirect(true);			
			forward.setUrl("./ReviewBoardDetailAction.ro?num="+rev+"&pageno="+pageno);
			return forward;
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}		
}

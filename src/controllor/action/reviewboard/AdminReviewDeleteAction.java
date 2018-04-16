package controllor.action.reviewboard;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controllor.action.Action;
import controllor.action.ActionForward;
import reviewboard.ReviewCommentBean;
import reviewboard.ReviewDAO;

public class AdminReviewDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		PrintWriter writer = response.getWriter();
		ReviewCommentBean reviewcomment =new ReviewCommentBean();
		String[] numS = request.getParameterValues("delete");
		int result=-1;
		int num;
		ReviewDAO reviewdao = new ReviewDAO();
		for(int i =0;i<numS.length;i++){
			num = Integer.parseInt(numS[i]);
			         reviewdao.adminCommentDelete(num);//무결성 때문에 딜리트시 부터 삭제
			result = reviewdao.delete(num);
		}
		ActionForward forward = new ActionForward();
		if(result<1){
			writer.println("<script type='text/javascript'>");
			writer.println("alert('삭제에 실패했습니다.');");
			writer.println("</script>");
		}
		int pageno = Integer.parseInt(request.getParameter("pageno"));
		forward.setRedirect(true);
		forward.setUrl("/terra/AdminReviewListAction.ro?pageno="+pageno);	
		return forward;
	}

}

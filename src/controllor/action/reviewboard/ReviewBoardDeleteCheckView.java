package controllor.action.reviewboard;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controllor.action.Action;
import controllor.action.ActionForward;
import reviewboard.ReviewBean;
import reviewboard.ReviewDAO;

public class ReviewBoardDeleteCheckView implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("user_id");
		//객체 생성@@@@@@@@@@@
		ReviewDAO reviewdao = new ReviewDAO();
		ReviewBean reviewbean = new ReviewBean();
		int num = Integer.parseInt(request.getParameter("num"));		
		 //reviewdao.setListCount(num);//조회수 즈응가
		reviewbean=reviewdao.info(num);//리뷰 인포
		String uid= reviewbean.getRev_id();
		
		int pageno = Integer.parseInt(request.getParameter("pageno"));
		
		if(!(id.equals(uid))) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('글쓴이가 아닙니다.');");
			out.println(" location.href='./ReviewBoardDetailAction.ro?num=" +num+"&pageno="+pageno+"' ");
			out.println("</script>");
			out.close();
			return null;
		}
		if (reviewbean == null) { return null; }
		
		request.setAttribute("reviewbean", reviewbean);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setUrl("./consumer/review_deletecheck.jsp?pageno="+pageno);
		return forward;

	}
}

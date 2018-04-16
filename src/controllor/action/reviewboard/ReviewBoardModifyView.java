package controllor.action.reviewboard;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controllor.action.Action;
import controllor.action.ActionForward;
import reviewboard.ReviewBean;
import reviewboard.ReviewDAO;

public class ReviewBoardModifyView implements Action {
	
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		ReviewDAO reviewdao = new ReviewDAO();
		ReviewBean reviewbean = new ReviewBean();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("user_id");
		
		//
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		
		
		reviewbean = reviewdao.info(num);
		String uid= reviewbean.getRev_id();
		
		
		int xx = Integer.parseInt(request.getParameter("pageno"));
		//if(xx==0){///디테일 액션 다시 체크@@@@@@
		int pageno = Integer.parseInt(request.getParameter("pageno"));//???
		
		
		if(!(id.equals(uid))) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('글쓴이가 아닙니다.');");
			// location.href="ReviewBoardDeleteView.ro?num=<%=board.getRev_num()%>";
			out.println(" location.href='./ReviewBoardDetailAction.ro?num=" +num+"&pageno="+pageno+"' ");//+"&pageno="+pageno
			out.println("</script>");
			out.close();
			return null;
		}
		if (reviewbean == null) {
			return null;
		}
		request.setAttribute("reviewbean", reviewbean);
		forward.setRedirect(false);
		forward.setUrl("./consumer/review_board_modify.jsp?pageno="+pageno);
		return forward;
	}
}
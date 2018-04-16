package controllor.action.event;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controllor.action.Action;
import controllor.action.ActionForward;
import eventboard.EventBean;
import eventboard.EventDAO;

public class EventDetailAction implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		//객체 생성@@@@@@@@@@@
		EventDAO eventdao = new EventDAO();
		EventBean eventbean = new EventBean();
		int num = Integer.parseInt(request.getParameter("num"));		
		//eventdao.setListCount(num);//조회수 즈응가
		eventbean=eventdao.info(num);//리뷰 인포		
		//System.out.println("조회수 체크중~~"+x);		
		//boarddao.setReadCountUpdate(num);
		//boarddata = boarddao.getDetail(num);
		if (eventbean == null) {
			return null;
		}
		request.setAttribute("eventbean", eventbean);
		ActionForward forward = new ActionForward();
		int pageno = Integer.parseInt(request.getParameter("pageno"));
		forward.setRedirect(false);
		forward.setUrl("./consumer/eventdetail.jsp?pageno="+pageno);
		return forward;

	}
}
package controllor.action.event;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controllor.action.Action;
import controllor.action.ActionForward;
import eventboard.EventCheckBean;
import eventboard.EventDAO;

public class AdminEventDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		PrintWriter writer = response.getWriter();
		//HttpSession session = request.getSession();
		//String uid=(String)session.getAttribute("user_id");
		
		String[] numS = request.getParameterValues("delete");
		int result=-1;
		int num;
		EventDAO eventdao = new EventDAO();
		EventCheckBean eventcheckbean = new EventCheckBean();
		for(int i =0;i<numS.length;i++){//테이블 수정 해야함@@@
			num = Integer.parseInt(numS[i]);		
			eventdao.eventcheckdelete2(num);//해당 아이디와 게시글 번호로 삭제함@@@		
			result = eventdao.delete(num); //삭제
		}
		ActionForward forward = new ActionForward();
		if(result<1){
			writer.println("<script type='text/javascript'>");
			writer.println("alert('삭제에 실패했습니다.');");
			writer.println("</script>");
		}
		int pageno = Integer.parseInt(request.getParameter("pageno"));
		forward.setRedirect(true);
		forward.setUrl("/terra/AdminEventListAction.ro?pageno="+pageno);	
		return forward;
	}

}

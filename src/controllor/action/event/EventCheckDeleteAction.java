package controllor.action.event;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controllor.action.Action;
import controllor.action.ActionForward;
import eventboard.EventCheckBean;
import eventboard.EventDAO;

public class EventCheckDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		PrintWriter writer = response.getWriter();
		
		String[] numS = request.getParameterValues("delete");
		int result=-1;
		int num;
		//이벤트 지울때 2개 값 보냄
		EventDAO eventdao = new EventDAO();
		EventCheckBean eventcheckbean = new EventCheckBean();
		HttpSession session = request.getSession();
		String uid=(String)session.getAttribute("user_id");
		//이렇게 하면 될듯??
		int x=0;
		for(int i =0;i<numS.length;i++){
			num = Integer.parseInt(numS[i]);
			//eventcheckbean.setEc_id(uid);//아이디 세션 껄로		
			//eventcheckbean.setEc_num(num);			
			result= eventdao.eventcheckdelete2(num);			
			x=eventdao.eventcheckupcount(num);//해당이벤트 카운트수 +1
		}
		//해당 이벤트 upcount
		
		
		ActionForward forward = new ActionForward();
		if(result<1){
			writer.println("<script type='text/javascript'>");
			writer.println("alert('삭제에 실패했습니다.');");
			writer.println("</script>");
		}
		forward.setRedirect(true);
		int pagenoc = Integer.parseInt(request.getParameter("pagenoc"));
		forward.setUrl("/EventCheckInfo.ro?pagenoc="+pagenoc);	
		return forward;
	}

}

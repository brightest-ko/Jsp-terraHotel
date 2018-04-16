package controllor.action.event;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controllor.action.Action;
import controllor.action.ActionForward;
import eventboard.EventBean;
import eventboard.EventCheckBean;
import eventboard.EventDAO;

public class EventAction implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		EventDAO eventdao = new EventDAO();
		EventBean eventbean = new EventBean();
		EventCheckBean eventcheck = new EventCheckBean();
		int num = Integer.parseInt(request.getParameter("ev_num"));//이벤트 글번호
		int count = Integer.parseInt(request.getParameter("ev_count"));//이벤트 카운트
		String id =request.getParameter("ev_id");//접속 아이디
		PrintWriter writer = response.getWriter();
		if(count<1) {
			writer.println("<script type='text/javascript'>");
			writer.println("alert('이벤트가 마감되었습니다.');");
			writer.println("location.href='EventListAction.ro';");
			writer.println("</script>");
			writer.close();
			return null;
		}
		//헤쉬맵으로 글번호랑 아이디  못검색하겠구나 글번호로 아이디 빼오자
		//x에 아이디 빼오기
		String x=null;
		x=eventdao.eventcheck(num);//비교용 아이디 빼옴
		System.out.println("이벤트 액션 응모한 아이디 체크"+x);
	if(id.equals(x)) {
		writer.println("<script type='text/javascript'>");
		writer.println("alert('이미 응모하였습니다.');");
		writer.println("location.href='EventListAction.ro';");
		writer.println("</script>");
		writer.close();
		return null;
	}
	
		int a = eventdao.countupdate(num);//카운트 -1
		eventcheck.setEc_id(request.getParameter("ev_id"));  //접속 아이디
		eventcheck.setEc_num(Integer.parseInt(request.getParameter("ev_num")));
		int b = eventdao.ec_insert(eventcheck);
		forward.setRedirect(true);
		forward.setUrl("./EventListAction.ro");
		return forward;
	}
}

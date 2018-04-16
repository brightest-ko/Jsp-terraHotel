package controllor.action.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controllor.action.Action;
import controllor.action.ActionForward;
import member.MemberBean;
import member.MemberDAO;

public class MemberInfoUpdate implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		MemberBean bean = new MemberBean();
		HttpSession session = request.getSession();
		
		String user_id = (String)session.getAttribute("user_id");
		String pw = request.getParameter("pw");
		
		MemberDAO dao = new MemberDAO();
		String str = dao.login(user_id, pw);
		
		ActionForward forward = new ActionForward();
		PrintWriter writer = response.getWriter();
		
		if(!(str.equals(""))){
			forward.setUrl("consumer/memberinfoupdate.jsp");
			return forward;
		}
		else {
			writer.println("<script type='text/javascript'>");
			writer.println("alert('비밀번호가 다릅니다. 다시 입력해 주십시오.');");
			writer.println("history.back();");
			writer.println("</script>");
			return null;
		}
	}
}

package controllor.action.member;

import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controllor.action.Action;
import controllor.action.ActionForward;
import member.MemberDAO;

public class LoginAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter writer = response.getWriter();

		String user_id = request.getParameter("user_id");
		String pw = request.getParameter("pw");
		String logingrade = "";
		HttpSession session = request.getSession();

		MemberDAO memberdao = new MemberDAO();
		logingrade = memberdao.login(user_id, pw);

		ActionForward forward = new ActionForward();
		if (!(logingrade.equals(""))) {
			session.setAttribute("user_id", user_id);
			session.setAttribute("grade", logingrade);

			// 세션 확인
			Enumeration se = session.getAttributeNames();

			while (se.hasMoreElements()) {
				String getse = se.nextElement() + "";
			}
			String loadpage = (String)session.getAttribute("loadpage");
			//session.setAttribute("loadpage", "consumer/roomdeluxe.jsp");
			writer.println("<script type='text/javascript'>");
			writer.println("alert('로그인에 성공하셨습니다.');");
			if(loadpage == null){
				writer.println("location.href='../index.jsp';");
			}
			else{
				writer.println("location.href='"+loadpage+"';");
			}
			writer.println("</script>");

			// alert창 안띄우고 forward로 보내기
			//forward.setUrl(loadpage);
			// return forward;
			return null;
		}
		writer.println("<script type='text/javascript'>");
		writer.println("alert('로그인에 실패하셨습니다. 다시 로그인해주십시오.');");
		writer.println("history.back();");
		writer.println("</script>");
		// forward.setUrl("adminpage.jsp");
		// return forward;
		return null;
	}
}

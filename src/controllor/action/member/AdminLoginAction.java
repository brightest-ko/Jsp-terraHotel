package controllor.action.member;

import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

import controllor.action.Action;
import controllor.action.ActionForward;
import member.MemberDAO;


public class AdminLoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = response.getWriter();
		String user_id = request.getParameter("user_id");
		String pw = request.getParameter("pw");
		String logingreda = ""; 
		HttpSession session = request.getSession();
		
		MemberDAO memberdao = new MemberDAO(); 
		logingreda = memberdao.adminlogin(user_id, pw);
		ActionForward forward = new ActionForward();
		
		if (!(logingreda.equals(""))) {
			session.setAttribute("user_id", user_id);
			session.setAttribute("grade", logingreda);

			// 세션 확인
			Enumeration se = session.getAttributeNames();

			while (se.hasMoreElements()) {
				String getse = se.nextElement() + "";
			}
			session.setAttribute("adminloadpage", "adminReservListView.jsp");
			writer.println("<script type='text/javascript'>");
			writer.println("alert('로그인에 성공하셨습니다.');");
			writer.println("location.href='adminReservListviews.res';");
			writer.println("</script>");
			 //forward.setUrl("administration/adminMemberListView.jsp");
			 return forward;
		} else {
			writer.println("<script type='text/javascript'>");
			writer.println("alert('로그인에 실패하셨습니다. 다시 로그인해주십시오.');");
			writer.println("history.back();");
			writer.println("</script>");
			// forward.setUrl("adminpage.jsp");
			// return forward;
		}
		writer.close();
		return null;
	}
	
}

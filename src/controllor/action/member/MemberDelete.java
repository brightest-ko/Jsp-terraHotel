package controllor.action.member;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controllor.action.Action;
import controllor.action.ActionForward;
import member.MemberBean;
import member.MemberDAO;
import reserv.ReservDAO;

public class MemberDelete implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		PrintWriter writer = response.getWriter();
		
		String user_id = (String)session.getAttribute("user_id");
		
		String pw = request.getParameter("pw");
		String select = "";
		select = MemberDAO.login(user_id, pw);
		if(!(select.equals(""))){
			List list = ReservDAO.memberreservlist(user_id);
			if(list.size()==0){
				MemberDAO.memberdelete(user_id);
				writer.println("<script type='text/javascript'>");
				writer.println("var r = confirm('정말 탈퇴하시겠습니까?');");
				writer.println("if(r == true){ alert('정상적으로 삭제되었습니다.'); location.href='consumer/userlogout.jsp'; }");
				writer.println("else {history.back()}");
				writer.println("</script>");
				return null;
			}
			else{
				writer.println("<script type='text/javascript'>");
				writer.println("alert('예약이나 응모한이벤트가 있습니다. 지운뒤 다시 시도해주십시오.');");
				writer.println("history.back();");
				writer.println("</script>");
				return null;
			}
		}
		else {
			writer.println("<script type='text/javascript'>");
			writer.println("alert('비밀번호가틀렸습니다.');");
			writer.println("history.back();");
			writer.println("</script>");
			return null;
		}
		
	}
}

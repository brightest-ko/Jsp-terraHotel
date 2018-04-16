package controllor.action.member;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controllor.action.Action;
import controllor.action.ActionForward;
import member.MemberDAO;
import reserv.ReservDAO;
import reserv.ReservDTO;

public class AdminMemberDelete implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		
		ActionForward forward = new ActionForward();
		String user_id = request.getParameter("user_id");
		
		
		List list = ReservDAO.memberreservlist(user_id);
		
		
		PrintWriter writer = response.getWriter();
		
		
		if(list.size()==0){
			MemberDAO.memberdelete(user_id);
			writer.println("<script type='text/javascript'>");
			writer.println("alert('정상적으로 삭제되었습니다.');");
			writer.println("location.href='memberListviews.ro';");
			writer.println("</script>");
			return null;
		}
		else{
			writer.println("<script type='text/javascript'>");
			writer.println("alert('예약이나 응모한이벤트가 있습니다. 지운뒤 다시 시도해주십시오.');");
			writer.println("location.href='memberListviews.ro';");
			writer.println("</script>");
			return null;
		}
	}
}

package controllor.action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controllor.action.Action;
import controllor.action.ActionForward;
import member.MemberBean;
import member.MemberDAO;

public class ConsumerUpdateMember implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		MemberBean bean = new MemberBean();
		HttpSession session = request.getSession();
		
		bean.setUser_id((String)session.getAttribute("user_id"));
		bean.setPw(request.getParameter("pw"));
		bean.setUname(request.getParameter("uname"));
		bean.setEmail(request.getParameter("email"));
		bean.setGender(request.getParameter("gender"));
		bean.setPostnum(request.getParameter("postnum"));
		bean.setAddr(request.getParameter("addr"));
		bean.setDetailaddress(request.getParameter("detailaddress"));
		bean.setAreacode(request.getParameter("areacode"));
		bean.setTel(request.getParameter("tel"));
		bean.setBirth(request.getParameter("birth"));
		bean.setGrade((String)session.getAttribute("grade"));
		
		MemberDAO.memberUpdate(bean);
		
		ActionForward forward = new ActionForward();
		forward.setUrl("userInformation.ro");
		
		return forward;
	}
}

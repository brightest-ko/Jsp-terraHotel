package controllor.action.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controllor.action.Action;
import controllor.action.ActionForward;
import member.MemberBean;
import member.MemberDAO;

public class RegionAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemberBean memb = new MemberBean();
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = response.getWriter();	
		memb.setUser_id(request.getParameter("user_id"));
		memb.setPw(request.getParameter("pw"));
		memb.setUname(request.getParameter("uname"));
		memb.setEmail(request.getParameter("email"));
		memb.setGender(request.getParameter("gender"));
		memb.setPostnum(request.getParameter("postnum"));
		memb.setAddr(request.getParameter("addr"));
		memb.setDetailaddress(request.getParameter("detailaddress"));
		memb.setAreacode(request.getParameter("areacode"));
		memb.setTel(request.getParameter("tel"));
		memb.setBirth(request.getParameter("birth"));
		
		MemberDAO memberdao = new MemberDAO();
		int a=0;
		a=memberdao.region(memb);
		
		if(!(a > 0)){
			writer.println("<script type='text/javascript'>");
			writer.println("alert('회원가입에 성공하셨습니다.');");
			writer.println("location.href='login.jsp';");
			writer.println("</script>");
			
			//alert창 안띄우고 forward로 보내기
//			forward.setUrl("adminListPage.jsp");
//			return forward;
			return null;
		}
		writer.println("<script type='text/javascript'>");
		writer.println("alert('가입이 되지 않으셨습니다. 다시 시도해 주십시오.');");
		writer.println("history.back();");
		writer.println("</script>");
//		forward.setUrl("adminpage.jsp");
//		return forward;
		return null;
	}
}

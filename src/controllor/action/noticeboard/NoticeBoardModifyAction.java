package controllor.action.noticeboard;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controllor.action.*;
import noticeboard.*;



public class NoticeBoardModifyAction implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//수정 들어와서 쿼리문 보내야함
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		NoticeDAO noticedao = new NoticeDAO();
		NoticeBean noticebean = new NoticeBean();	
		
		/*
		 * String pw = request.getParameter("n_pw");
		 */		
		int num = Integer.parseInt(request.getParameter("n_num"));
		String pwd= request.getParameter("n_pw2");//내가 입력한 비밀번호	
		String id=request.getParameter("user_id");
		String pwd2=request.getParameter("n_pw");

		if( !(pwd.equals(pwd2)) ) {		
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호를 다시 확인해주세요.');");
			// location.href="NoticeBoardDeleteAction.ro?num=<%=board.getN_num()%>";
			out.println(" location.href='javascript:history.go(-1)'");
			out.println("</script>");
			out.close();
			return null;
		}		
		try {
			noticebean.setN_num(num);
			noticebean.setN_subject(request.getParameter("n_subject"));			
			noticebean.setN_content(request.getParameter("n_content"));			
			int x= noticedao.update(noticebean);
			if (x == 0) {
				return null;
			}
			forward.setRedirect(true);//트루로 되어 있었슴 false
			forward.setUrl("./NoticeBoardDetailAction.ro?num="
					+ noticebean.getN_num());
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		return forward;
	}
}
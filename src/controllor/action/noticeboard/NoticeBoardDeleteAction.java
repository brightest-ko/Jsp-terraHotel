package controllor.action.noticeboard;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controllor.action.Action;
import controllor.action.ActionForward;
import controllor.action.*;
import noticeboard.*;

public class NoticeBoardDeleteAction implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		NoticeDAO noticedao = new NoticeDAO();
		NoticeBean noticebean = new NoticeBean();
		
		HttpSession session = request.getSession();		
		String pwd2= request.getParameter("n_pw2");	//확인용 비번 ㅎㅎㅎ
		String pwd1= request.getParameter("n_pw");//기존 비번	
		String id=request.getParameter("n_id");//해당 아이디
		String num2=request.getParameter("n_num");//해당 글번호 ㅎㅎ
		
		
		
		int num = Integer.parseInt(request.getParameter("n_num"));//rev_num?? 못받나??
		//boolean result = reviewdao.writerCheck2(num2, pwd); 
		//String pw = request.getParameter("rev_pw");//팝업에 입력현재 비밀번호
		//String pwd = request.getParameter("rev_pwd");//기존에에 입력한 비밀번호
		//boolean result = false;
		//boolean usercheck = false;
		
		
		
		if(!(pwd1.equals(pwd2))){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호를 다시 확인해주세요.');");
			out.println(" location.href='./NoticeBoardDeleteCheckView.ro?num=" +num+"' ");
			out.println("</script>");
			out.close();
			return null;
		}
			int x= noticedao.delete(num);			
			if (x == 0) { return null; }
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();			
		forward.setRedirect(true);
		forward.setUrl("./NoticeBoardListAction.ro");
		return forward;
	}
	} 

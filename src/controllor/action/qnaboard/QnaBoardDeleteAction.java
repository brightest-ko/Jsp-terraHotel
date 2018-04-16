package controllor.action.qnaboard;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controllor.action.Action;
import controllor.action.ActionForward;
import qnaboard.QnaBean;
import qnaboard.QnaDAO;

public class QnaBoardDeleteAction implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		QnaDAO qnadao = new QnaDAO();
		QnaBean qnabean = new QnaBean();
		//유저체크 빼고  id가 null이 아니면
		//
		
		HttpSession session = request.getSession();		
		String pwd2= request.getParameter("q_pw2");	//확인용 비번 ㅎㅎㅎ
		String pwd1= request.getParameter("q_pw");//기존 비번	
		String id=request.getParameter("q_id");//해당 아이디
		String num2=request.getParameter("q_num");//해당 글번호 ㅎㅎ
		
		
		
		int num = Integer.parseInt(request.getParameter("q_num"));//rev_num?? 못받나??
	
		if(!(pwd1.equals(pwd2))){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호를 다시 확인해주세요.');");
			out.println(" location.href='./QnaBoardDeleteCheckView.ro?num=" +num+"' ");
			out.println("</script>");
			out.close();
			return null;
		}
			int x= qnadao.delete(num);			
			
			if (x == 0) { return null; }

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();			
		forward.setRedirect(true);
		forward.setUrl("./QnaBoardListAction.ro");
		return forward;
	}
	} 

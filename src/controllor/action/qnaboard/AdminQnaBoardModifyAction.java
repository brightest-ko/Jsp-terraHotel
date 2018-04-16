package controllor.action.qnaboard;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controllor.action.Action;
import controllor.action.ActionForward;
import qnaboard.QnaBean;
import qnaboard.QnaDAO;



public class AdminQnaBoardModifyAction implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//수정 들어와서 쿼리문 보내야함
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		QnaDAO qnadao = new QnaDAO();
		QnaBean qnabean = new QnaBean();	

		int num = Integer.parseInt(request.getParameter("q_num"));
		String pwd= request.getParameter("q_pw2");//내가 입력한 비밀번호	

		String id=request.getParameter("user_id");
		String pwd2=request.getParameter("q_pw");

		if( !(pwd.equals(pwd2)) ) {		
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호를 다시 확인해주세요.');");
			out.println(" location.href='javascript:history.go(-1)'");
			out.println("</script>");
			out.close();
			return null;
		}		
		try {
			qnabean.setQ_num(num);
			qnabean.setQ_subject(request.getParameter("q_subject"));			
			qnabean.setQ_content(request.getParameter("q_content"));
			int x= qnadao.update(qnabean);		
			if (x == 0) {
				return null;
			}
			forward.setRedirect(true);//트루로 되어 있었슴 false
			forward.setUrl("./AdminQnaBoardDetailAction.ro?num="
					+ qnabean.getQ_num());
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		return forward;
	}
}
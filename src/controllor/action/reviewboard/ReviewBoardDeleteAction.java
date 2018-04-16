package controllor.action.reviewboard;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controllor.action.Action;
import controllor.action.ActionForward;
import reviewboard.ReviewBean;
import reviewboard.ReviewDAO;

public class ReviewBoardDeleteAction implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		ReviewDAO reviewdao = new ReviewDAO();
		ReviewBean reviewbean = new ReviewBean();
		//유저체크 빼고  id가 null이 아니면
		//
		
		HttpSession session = request.getSession();		
		String pwd2= request.getParameter("rev_pw2");	//확인용 비번 ㅎㅎㅎ
		String pwd1= request.getParameter("rev_pw");//기존 비번	
		String id=request.getParameter("rev_id");//해당 아이디
		String num2=request.getParameter("rev_num");//해당 글번호 ㅎㅎ
		
		
		
		int num = Integer.parseInt(request.getParameter("rev_num"));//rev_num?? 못받나??
		
		int xx = Integer.parseInt(request.getParameter("pageno"));
		int pageno = Integer.parseInt(request.getParameter("pageno"));//???
		if(!(pwd1.equals(pwd2))){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호를 다시 확인해주세요.');");
			// location.href="ReviewBoardDeleteView.ro?num=<%=board.getRev_num()%>";
			out.println(" location.href='./ReviewBoardDeleteCheckView.ro?num=" +num+"&pageno"+pageno+"' ");
			out.println("</script>");
			out.close();
			return null;
		}		
			//결과 받은 값으로 if문 비교
		int cc =reviewdao.adminCommentDelete(num);//코멘트 부터 삭제
			int x= reviewdao.delete(num);			
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();			
		forward.setRedirect(true);
		forward.setUrl("./ReviewBoardListAction.ro?pageno="+pageno);
		return forward;
	}
	} 

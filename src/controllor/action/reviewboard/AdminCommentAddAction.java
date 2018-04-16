package controllor.action.reviewboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controllor.action.*;
import reviewboard.*;




public class AdminCommentAddAction implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		ReviewDAO reviewdao = new ReviewDAO();
		ReviewBean reviewbean = new ReviewBean();
		ReviewCommentBean reviewcomment = new ReviewCommentBean();//
		
		
		String stype=null;
		String sword=null;
		 if(request.getParameter("selectType")!=null) {
				 stype = request.getParameter("selectType");
				 sword = (String)request.getParameter("selectWord");
				request.setAttribute("selectType", stype);
				request.setAttribute("selectWord", sword);
			}		
		 String pageno=null;
		 if (request.getParameter("pageno") != null) {
					 pageno = request.getParameter("pageno");
					request.setAttribute("pageno", pageno);
		 }		
		
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("user_id");//세션 아이디		
		//아이디 받음
		//아이디 참조, 글번호 참조, 내용 3개를 보내고  		
		try {			
			reviewcomment.setRc_id(id);//
			reviewcomment.setRc_num(Integer.parseInt(request.getParameter("rc_num")));
			reviewcomment.setRc_content(request.getParameter("rc_content"));			
			int x=reviewdao.commentInsert(reviewcomment);
			if (x == 0) {
				return null;
			}
			//int pageno = Integer.parseInt(request.getParameter("pageno"));
			forward.setRedirect(true);			
			
			 if(request.getParameter("selectType")!=null) {
				 forward.setUrl("./AdminReviewUpdateViewAction.ro?num=" + reviewcomment.getRc_num()+
						 "&pageno="+pageno+"&selectType="+stype+"&selectWord="+sword);
				 return forward;
			 } else {
				 forward.setUrl( "./AdminReviewUpdateViewAction.ro?num=" + reviewcomment.getRc_num()+
						 "&pageno="+pageno);
					return forward;			
			 }			
			//forward.setUrl("./AdminReviewUpdateViewAction.ro?num=" + reviewcomment.getRc_num()+"&pageno="+pageno);//?pageno=<%=pageno %>
			//return forward;			
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}		
}

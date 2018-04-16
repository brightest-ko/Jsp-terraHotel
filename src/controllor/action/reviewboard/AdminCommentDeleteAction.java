package controllor.action.reviewboard;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controllor.action.Action;
import controllor.action.ActionForward;
import reviewboard.ReviewCommentBean;
import reviewboard.ReviewBean;
import reviewboard.ReviewDAO;

public class AdminCommentDeleteAction implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();
		ReviewDAO reviewdao = new ReviewDAO();
		ReviewBean reviewbean = new ReviewBean();
		ReviewCommentBean reviewcomment = new ReviewCommentBean();
		//int num2 = Integer.parseInt(request.getParameter("rev_no"));
		//reviewbean= reviewdao.commentinfo2(num2);//게시글 정보 갖구오기
		String sid = (String)session.getAttribute("user_id");//세션아이디
		String rid= request.getParameter("rev_id2");//게시글 아이디
		String cid= request.getParameter("rc_id11");//코멘트
		
		int num = Integer.parseInt(request.getParameter("rc_no"));//해당 코멘트 시퀀스
		int rev_num2 = Integer.parseInt(request.getParameter("rev_num2"));//해당 게시글 번호
		reviewcomment=reviewdao.commentinfo(num);  //정보 갖구와서 아이디 비교하기
		reviewbean = reviewdao.info(rev_num2);
		String rid_db = reviewbean.getRev_id();
		String cid_db= reviewcomment.getRc_id();
		String c_admin="admin";
		
		//페이징 리턴
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
		 reviewdao.commentdelete(num);	
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();			
		forward.setRedirect(true);
		//./ReviewBoardDetailAction.ro?num="
		//+ reviewbean.getRev_num()
		//int pageno = Integer.parseInt(request.getParameter("pageno"));
		
		if(request.getParameter("selectType")!=null) {
			 forward.setUrl("./AdminReviewWrite.ro?num="+rev_num2+"&pageno="+pageno+
					 "&selectType="+stype+"&selectWord="+sword);
			 return forward;
		 } else {
			 forward.setUrl( "./AdminReviewWrite.ro?num="+rev_num2+"&pageno="+pageno);
				return forward;			
		
		 }
		
		//forward.setUrl("./AdminReviewWrite.ro?num="+rev_num2+"&pageno="+pageno);
		//return forward;		
	
	
	}

}

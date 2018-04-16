package controllor.action.reviewboard;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controllor.action.Action;
import controllor.action.ActionForward;
import reviewboard.ReviewBean;
import reviewboard.ReviewCommentBean;
import reviewboard.ReviewDAO;

public class AdminReviewUpdateViewAction  implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");		
		ActionForward forward = new ActionForward();		
		//받을 객체 생성
				ReviewDAO reviewdao = new ReviewDAO();		
				ReviewBean reviewbean = new ReviewBean();
				ReviewCommentBean reviewcomment = new ReviewCommentBean();		  
		List admincommentlistc = new ArrayList();
		
		//페이지 리턴 용
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
		 //페이지 리턴용
		 
		 
		 
		 int pagenoc = 1;  //pageno
		
		if (request.getParameter("pagenoc") != null) {
			pagenoc = Integer.parseInt(request.getParameter("pagenoc"));
		}	
		
		final int ROW_PER_PAGE = 5; // 페이지당 레코드 출력 갯수
		int begin = (pagenoc - 1) * ROW_PER_PAGE + 1;
		int end = pagenoc * ROW_PER_PAGE;
		int numc=Integer.parseInt(request.getParameter("num"));
		
		//reviewcomment  begin end  
		reviewcomment.setBegin(begin);
		reviewcomment.setEnd(end);
		reviewcomment.setRc_num(numc);
		admincommentlistc= reviewdao.CgetBoardList(reviewcomment); //총글갯수???   
		//페이징 교체
		
		
		
		int rc_num=Integer.parseInt(request.getParameter("num"));
		int totalRows =  reviewdao.getListCommentCount(rc_num);//총 글갯수였나??		
		int totalPages = (int) Math.ceil((double) totalRows / ROW_PER_PAGE);
		//System.out.println("보드리스트넘어옴 메소드 통과@@@@@@"+listcount);
		//페이징 처리
		final int PAGE_PER_PAGE = 5; // 화면당 페이지 출력 갯수
		int totalRanges = (int) Math.ceil((double) totalPages/ PAGE_PER_PAGE); // 전체 Range 갯수
		int currentRange = (int) Math.ceil((double) pagenoc / PAGE_PER_PAGE);
		//요청된 pageNo의 현재 range
		int beginPagec = (currentRange - 1) * PAGE_PER_PAGE + 1; // 시작 페이지 번호
		int endPagec = currentRange * PAGE_PER_PAGE; // 마지막 페이지 번호
		if (currentRange == totalRanges)
			endPagec = totalPages; // currentRange가 맨 마지막 range인 경우
		 
		int prevPagec = 0;
		if (currentRange != 1)
			prevPagec = (currentRange - 2) * PAGE_PER_PAGE + 1;
		int nextPagec = 0;
		if (currentRange != totalRanges)
			nextPagec = currentRange * PAGE_PER_PAGE + 1;
				
		
		int num = Integer.parseInt(request.getParameter("num"));		
		reviewbean=reviewdao.info(num);//리뷰 인포		 
		if (reviewbean == null) {
			return null;
		}
		request.setAttribute("pagenoc", pagenoc);
		request.setAttribute("prevPagec", prevPagec);
		request.setAttribute("nextPagec", nextPagec);
		request.setAttribute("beginPagec", beginPagec);		
		request.setAttribute("endPagec", endPagec);//여기까지 페이징인가??
		request.setAttribute("admincommentlistc", admincommentlistc);
		forward.setRedirect(false);
		
		 if(request.getParameter("selectType")!=null) {
			 forward.setUrl("./administration/admin_reviewupdate.jsp?pageno="+pageno+"&selectType="+stype+"&selectWord="+sword);
			 return forward;
		 } else {
				forward.setUrl("./administration/admin_reviewupdate.jsp?pageno="+pageno);
				return forward;
		 }	
		

	}
}

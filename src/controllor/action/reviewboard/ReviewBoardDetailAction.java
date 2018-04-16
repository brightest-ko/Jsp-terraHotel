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

public class ReviewBoardDetailAction implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();		
		//받을 객체 생성
		ReviewDAO reviewdao = new ReviewDAO();		
		ReviewBean reviewbean = new ReviewBean();
		ReviewCommentBean reviewcomment = new ReviewCommentBean();
		
		
		String type = request.getParameter("selectType");
		String word = (String)request.getParameter("selectWord");//한글깨짐
		
		 if(request.getParameter("selectType")!=null) {
			String stype = request.getParameter("selectType");
			String sword = (String)request.getParameter("selectWord");
			request.setAttribute("selectType", stype);
			request.setAttribute("selectWord", sword);
		}	
		
		List reviewcommentlistc = new ArrayList();
		int pagenoc = 1;  //pageno
		
		if (request.getParameter("pagenoc") != null) {
			pagenoc = Integer.parseInt(request.getParameter("pagenoc"));
		}	
		
		
		final int ROW_PER_PAGE = 4; // 페이지당 레코드 출력 갯수
		int begin = (pagenoc - 1) * ROW_PER_PAGE + 1;
		int end = pagenoc * ROW_PER_PAGE;
		int numc=Integer.parseInt(request.getParameter("num"));
		
		//reviewcomment  begin end  
		reviewcomment.setBegin(begin);
		reviewcomment.setEnd(end);
		reviewcomment.setRc_num(numc);
		reviewcommentlistc= reviewdao.CgetBoardList(reviewcomment); //총글갯수???   
		
		
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
		int beginPage = (currentRange - 1) * PAGE_PER_PAGE + 1; // 시작 페이지 번호
		int endPage = currentRange * PAGE_PER_PAGE; // 마지막 페이지 번호
		if (currentRange == totalRanges)
			endPage = totalPages; // currentRange가 맨 마지막 range인 경우
		 
		int prevPage = 0;
		if (currentRange != 1)
			prevPage = (currentRange - 2) * PAGE_PER_PAGE + 1;
		int nextPage = 0;
		if (currentRange != totalRanges)
			nextPage = currentRange * PAGE_PER_PAGE + 1;
				
		
		int num = Integer.parseInt(request.getParameter("num"));//?????
		
		
		reviewdao.setListCount(num);//조회수 증가
		reviewbean=reviewdao.info(num);//리뷰 인포		
		if (reviewbean == null) {
			return null;
		}
		
		//여기 수정@@@@  페이징 집에가서 마무리하기
		int xx = Integer.parseInt(request.getParameter("pageno"));
		//if(xx==0){///디테일 액션 다시 체크@@@@@@
		int pageno = Integer.parseInt(request.getParameter("pageno"));//???
		//request.setAttribute("pageno", pageno);//여기까지 페이징인가??
		//} 
		/*else {
			int pagere = ((Integer) request.getAttribute("pageno")).intValue();
			request.setAttribute("pageno", pagere);//여기까지 페이징인가??
		}	*/	
		//페이지 이름 바꿔줘야함
		request.setAttribute("pagenoc", pagenoc);
		request.setAttribute("prevPagec", prevPage);
		request.setAttribute("nextPagec", nextPage);
		request.setAttribute("beginPagec", beginPage);		
		request.setAttribute("endPagec", endPage);//여기까지 페이징인가??
		
		//System.out.println("디테일 액션 페이징 체크 pagere: "+pagere);
				request.setAttribute("reviewcommentlistc", reviewcommentlistc);
		
		request.setAttribute("reviewbean", reviewbean);//기존 페이지 파라미터 보내야함
		forward.setRedirect(false);
		forward.setUrl("./consumer/review_board_detail.jsp?pageno="+pageno+"&pagenoc="+pagenoc);//+"&pageno="+pageno
		return forward;

	}
}
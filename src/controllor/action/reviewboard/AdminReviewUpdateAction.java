package controllor.action.reviewboard;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import controllor.action.Action;
import controllor.action.ActionForward;
import reviewboard.ReviewBean;
import reviewboard.ReviewDAO;

public class AdminReviewUpdateAction implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//수정 들어와서 쿼리문 보내야함
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");		
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		ReviewDAO reviewdao = new ReviewDAO();
		ReviewBean reviewbean = new ReviewBean();		
		
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
		
		
	
		
		String realFolder = "";//삭제를 위한 경로
		String saveFolder = "/reviewupload";
		int fileSize = 5 * 1024 * 1024;
		realFolder = request.getRealPath(saveFolder);
		try {
		MultipartRequest multi = null;
		multi = new MultipartRequest(request, realFolder, fileSize,
				"UTF-8", new DefaultFileRenamePolicy());
		//폼으로 액션클래스 받으면 파일을 이걸로 받음
		reviewbean.setRev_num(Integer.parseInt(multi.getParameter("rev_num")));
		//reviewbean.setRev_id(multi.getParameter("rev_id"));
		if(multi.getParameter("rev_pw2")==null){
			reviewbean.setRev_pw(multi.getParameter("rev_pw1"));
		} else {
			
			reviewbean.setRev_pw(multi.getParameter("rev_pw2"));
		}		
		reviewbean.setRev_subject(multi.getParameter("rev_subject"));		
		reviewbean.setRev_content(multi.getParameter("rev_content"));			
						
					//있다면 기존 메소드
			//만약 첨부파일이 있다면  메소드2  없다면 
			String rev_file=multi.getParameter("rev_file");//현재 첨부파일 상태
			int x=0;
			  //업데이트 액션  admin
			if(rev_file==null){
				
				x=reviewdao.reviewupdate(reviewbean);  //업데이트 액션  admin
			} else {
				reviewbean.setRev_file(multi.getFilesystemName((String) multi.getFileNames().nextElement()));
				x= reviewdao.adminReviewupdate(reviewbean);	
			}
		
			if (x == 0) {
				return null;
			}
			//int pageno = Integer.parseInt(request.getParameter("pageno"));
			forward.setRedirect(true);//트루로 되어 있었슴 false
			//./ReviewBoardDetailAction.ro?num="+ reviewbean.getRev_num());
			//System.out.println("어드민 리뷰 업데이트 액션 리턴 체크"+pageno);

			 if(request.getParameter("selectType")!=null) {
				 forward.setUrl("./AdminReviewListAction.ro?pageno="+pageno+"&selectType="+stype+"&selectWord="+sword);
				 return forward;
			 } else {
					forward.setUrl("./AdminReviewListAction.ro?pageno="+pageno);
					return forward;			
			 }			
			// return forward;
		} catch (Exception ex) {
			ex.printStackTrace();
		}		
		return null;
	}
}
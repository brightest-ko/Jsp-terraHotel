package controllor.action.reviewboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import controllor.action.Action;
import controllor.action.ActionForward;
import reviewboard.ReviewBean;
import reviewboard.ReviewDAO;

public class AdminReviewAddAction implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		ReviewDAO reviewdao = new ReviewDAO();
		ReviewBean reviewbean = new ReviewBean();
		ActionForward forward = new ActionForward();
		//BoardDAO boarddao = new BoardDAO();
		//BoardBean boarddata = new BoardBean();		
		//수정 시 파일 업로드 수정은 잠시 후에 @@@@@
		String realFolder = "";
		String saveFolder = "/reviewupload";
		int fileSize = 5 * 1024 * 1024;
		realFolder = request.getRealPath(saveFolder);
		//이걸로 if문 체크 
		
		
		try {
			MultipartRequest multi = null;
			multi = new MultipartRequest(request, realFolder, fileSize,
					"UTF-8", new DefaultFileRenamePolicy());
			//폼으로 액션클래스 받으면 파일을 이걸로 받음
			reviewbean.setRev_id(multi.getParameter("rev_id"));
			reviewbean.setRev_pw(multi.getParameter("rev_pw"));
			reviewbean.setRev_subject(multi.getParameter("rev_subject"));
			reviewbean.setRev_content(multi.getParameter("rev_content"));			
			//if(!(request.getParameter("rev_file")==null||request.getParameter("rev_file").equals(""))) {
			reviewbean.setRev_file(multi.getFilesystemName((String) multi
					.getFileNames().nextElement()));			//}
			reviewbean.setRev_readcount(Integer.parseInt("0"));	
			int x=reviewdao.insert(reviewbean);

			if (x == 0) { return null; }
			forward.setRedirect(true);
			forward.setUrl("./AdminReviewListAction.ro");
			return forward;

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}

		
}

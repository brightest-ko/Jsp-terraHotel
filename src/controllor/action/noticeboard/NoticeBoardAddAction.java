package controllor.action.noticeboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controllor.action.*;
import noticeboard.*;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class NoticeBoardAddAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		NoticeDAO noticedao = new NoticeDAO();
		NoticeBean noticebean = new NoticeBean();
		ActionForward forward = new ActionForward();
		// BoardDAO boarddao = new BoardDAO();
		// BoardBean boarddata = new BoardBean();

		// 수정 시 파일 업로드 수정은 잠시 후에 @@@@@
		String realFolder = "";
		String saveFolder = "/noticeupload";
		int fileSize = 5 * 1024 * 1024;
		realFolder = request.getRealPath(saveFolder);

		// 이걸로 if문 체크

		try {
			
			noticebean.setN_id(request.getParameter("n_id"));
			
			noticebean.setN_pw(request.getParameter("n_pw"));
			
			noticebean.setN_subject(request.getParameter("n_subject"));
			
			noticebean.setN_content(request.getParameter("n_content"));
			
			noticebean.setN_readcount(Integer.parseInt("0"));
			int x = noticedao.insert(noticebean);
			
			if (x == 0) {
				return null;
			}

			forward.setRedirect(true);
			forward.setUrl("./NoticeBoardListAction.ro");
			return forward;

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}

}

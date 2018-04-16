package controllor.action.event;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import controllor.action.Action;
import controllor.action.ActionForward;
import eventboard.EventBean;
import eventboard.EventCheckBean;
import eventboard.EventDAO;
import jdk.nashorn.internal.runtime.Context;

public class AdminEventAddAction implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		EventDAO eventdao = new EventDAO();
		EventBean eventbean = new EventBean();
		EventCheckBean eventcheck = new EventCheckBean();
		ActionForward forward = new ActionForward();
		//ReviewDAO reviewdao = new ReviewDAO();
		//ReviewBean reviewbean = new ReviewBean();
		//BoardDAO boarddao = new BoardDAO();
		//BoardBean boarddata = new BoardBean();		
		//수정 시 파일 업로드 수정은 잠시 후에 @@@@@
		String realFolder = "";	
		String saveFolder = "/eventupload";
		int fileSize = 5 * 1024 * 1024;	
		realFolder = request.getRealPath(saveFolder);
	
		
		
		//이걸로 if문 체크		
		try {
			MultipartRequest multi = null;
			multi = new MultipartRequest(request, realFolder, fileSize,
					"UTF-8", new DefaultFileRenamePolicy());
			//폼으로 액션클래스 받으면 파일을 이걸로 받음			
			
			//eventbean
			eventbean.setEv_id(multi.getParameter("ev_id"));
			eventbean.setEv_subject(multi.getParameter("ev_subject"));
			eventbean.setEv_content(multi.getParameter("ev_content"));	
			eventbean.setEv_count(Integer.parseInt(multi.getParameter("ev_count")));
			
			eventbean.setEv_file(multi.getFilesystemName((String) multi
					.getFileNames().nextElement()));
			
			int x=eventdao.insert(eventbean);//삽입후에  select문으로 글 번호 갖구옴				
			
			
			if (x == 0) {
				return null;
			}
			//int pageno = Integer.parseInt(request.getParameter("pageno"));
			//System.out.println("pageno파라미터 체크"+pageno);
			forward.setRedirect(true);			
			forward.setUrl("./AdminEventListAction.ro");
			return forward;

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}

		
}

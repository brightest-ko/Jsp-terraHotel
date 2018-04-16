package controllor.action.event;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import controllor.action.Action;
import controllor.action.ActionForward;
import eventboard.EventBean;
import eventboard.EventDAO;



public class AdminEventUpdateAction implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//수정 들어와서 쿼리문 보내야함
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		EventDAO eventdao = new EventDAO();
		EventBean eventbean = new EventBean();		
		
		
		String realFolder = "";//삭제를 위한 경로
		String saveFolder = request.getSession().getServletContext().getRealPath("/eventupload");
		//String saveFolder = "/reviewupload";
		int fileSize = 5 * 1024 * 1024;
		//realFolder = request.getRealPath(saveFolder);
		
		try {
			MultipartRequest multi = null;
			multi = new MultipartRequest(request, realFolder, fileSize,
					"UTF-8", new DefaultFileRenamePolicy());
			
			//폼으로 액션클래스 받으면 파일을 이걸로 받음
			eventbean.setEv_num(Integer.parseInt(multi.getParameter("ev_num")));
			//reviewbean.setRev_id(multi.getParameter("rev_id"));
			//reviewbean.setEv_pw(multi.getParameter("rev_pw"));
			eventbean.setEv_subject(multi.getParameter("ev_subject"));		
			eventbean.setEv_content(multi.getParameter("ev_content"));			
			eventbean.setEv_count(Integer.parseInt(multi.getParameter("ev_count")));
			
			
			String ev_file=multi.getParameter("ev_file");//현재 첨부파일 상태
			System.out.println(ev_file);
			
			int x=0;
			  //업데이트 액션  admin
			if(ev_file==null){				
				x=eventdao.eventupdate(eventbean);  //업데이트 액션  admin
			} else {
				eventbean.setEv_file(multi.getFilesystemName((String) multi.getFileNames().nextElement()));
				x= eventdao.adminEventUpdate(eventbean);	
			}			
			System.out.println(x);				
				if (x == 0) {
					return null;
				}
			if (x == 0) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('수정 실패 다시 확인해주세요.');");				
				out.println(" location.href='javascript:history.go(-1)'");
				out.println("</script>");
				out.close();				
				return null;
			}
			int pageno = Integer.parseInt(request.getParameter("pageno"));
			forward.setRedirect(true);//트루로 되어 있었슴 false  //밑에 주소 페이지 추가해야함@@@@
			forward.setUrl("./AdminEventListAction.ro?pageno="+pageno);
					//+ eventbean.getEv_num());
			// return forward;
		} catch (Exception ex) {
			ex.printStackTrace();
		}		
		return forward;
	}
}
package controllor.action.reviewboard;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import controllor.action.Action;
import controllor.action.ActionForward;
import reviewboard.ReviewBean;
import reviewboard.ReviewDAO;

public class ReviewBoardModifyAction implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//수정 들어와서 쿼리문 보내야함
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		ReviewDAO reviewdao = new ReviewDAO();
		ReviewBean reviewbean = new ReviewBean();	
		String realFolder = "";//삭제를 위한 경로
		String saveFolder = "/reviewupload";
		int fileSize = 5 * 1024 * 1024;
		realFolder = request.getRealPath(saveFolder);
		
		MultipartRequest multi = null;
		multi = new MultipartRequest(request, realFolder, fileSize,"UTF-8", new DefaultFileRenamePolicy());		
		int num = Integer.parseInt(multi.getParameter("rev_num"));
		String pwd= multi.getParameter("rev_pw2");//내가 입력한 비밀번호	
		String id=multi.getParameter("rev_id");
		String pwd2=multi.getParameter("rev_pw");
		int pageno = Integer.parseInt(multi.getParameter("pageno"));
		
		if( !(pwd.equals(pwd2)) ) {		
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호를 다시 확인해주세요.');");
			out.println(" location.href='javascript:history.go(-1)'");
			out.println("</script>");
			out.close();
			return null;
		}	
		
		
		try {
			reviewbean.setRev_num(num);
			reviewbean.setRev_subject(request.getParameter("rev_subject"));			
			reviewbean.setRev_content(request.getParameter("rev_content"));
			
			reviewbean.setRev_num(Integer.parseInt(multi.getParameter("rev_num")));
			//reviewbean.setRev_id(multi.getParameter("rev_id"));
			reviewbean.setRev_pw(multi.getParameter("rev_pw2"));
			reviewbean.setRev_subject(multi.getParameter("rev_subject"));		
			reviewbean.setRev_content(multi.getParameter("rev_content"));		
			
			
			
			String rev_file=multi.getParameter("rev_file");//현재 첨부파일 상태
			
			int x=0;
			  //업데이트 액션  admin
			if(rev_file==null){				
				x=reviewdao.reviewuserupdate(reviewbean);  //업데이트 액션  admin
			} else {
				reviewbean.setRev_file(multi.getFilesystemName((String) multi.getFileNames().nextElement()));
				x= reviewdao.reviewuserupdate2(reviewbean);	
			}
			if (x == 0) {
				return null;
			}
			//페이지번호 체크
			
			forward.setRedirect(true);//트루로 되어 있었슴 false
			forward.setUrl("./ReviewBoardDetailAction.ro?num="
					+ reviewbean.getRev_num()+"&pageno="+pageno);
			// return forward;
		} catch (Exception ex) {
			ex.printStackTrace();
		}		
		return forward;
	}
}
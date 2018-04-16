package controllor.action.reserv;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controllor.action.Action;
import controllor.action.ActionForward;
import reserv.ReservDAO;


public class AdminReservRemoveAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		PrintWriter writer = response.getWriter();
		
		String[] numS = request.getParameterValues("delete");
		int result=-1;
		int num;
		ReservDAO memberdao = new ReservDAO();
		for(int i =0;i<numS.length;i++){
			num = Integer.parseInt(numS[i]);
			result = memberdao.delete(num);
		}
		ActionForward forward = new ActionForward();
		if(result<1){
			writer.println("<script type='text/javascript'>");
			writer.println("alert('예약취소에 실패하였습니다.');");
			writer.println("</script>");
		}
		forward.setRedirect(true);
		forward.setUrl("adminReservListviews.res");	
		return forward;
	}

}

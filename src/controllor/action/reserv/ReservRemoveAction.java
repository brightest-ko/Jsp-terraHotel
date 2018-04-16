package controllor.action.reserv;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controllor.action.Action;
import controllor.action.ActionForward;
import reserv.ReservDAO;



public class ReservRemoveAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		PrintWriter writer = response.getWriter();
		System.out.println("왔니?");
		String numS = request.getParameter("delete");
		System.out.println(numS);
		int result=-1;
		int num;
		ReservDAO memberdao = new ReservDAO();
		num = Integer.parseInt(numS);
		result = memberdao.delete(num);
		ActionForward forward = new ActionForward();
		if(result<1){
			writer.println("<script type='text/javascript'>");
			writer.println("alert('예약취소에 실패하였습니다.');");
			writer.println("</script>");
		}
		forward.setRedirect(true);
		forward.setUrl("/terra/consumer/reservInformation.jsp");	
		return forward;
	}

}

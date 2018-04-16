package controllor.action.reserv;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controllor.action.Action;
import controllor.action.ActionForward;
import reserv.ReservDAO;
import reserv.ReservDTO;

public class ReservAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("UTF-8");
		PrintWriter writer = response.getWriter();
		String user_id =request.getParameter("user_id");
		String roomname=request.getParameter("roomname");
		//request.setAttribute("roomname",roomname);
		String fromdate=request.getParameter("fromdate");
		//request.setAttribute("fromdate",fromdate);
		String todate=request.getParameter("todate");
		//request.setAttribute("todate",todate);
		String termS=request.getParameter("term");
		int term=Integer.parseInt(termS);
		//request.setAttribute("term",term);
		String numberOfPeopleS=request.getParameter("numberOfPeople");
		int numberOfPeople=Integer.parseInt(numberOfPeopleS);
		//request.setAttribute("numberOfPeople",numberOfPeople);
		HttpSession session = request.getSession();
		ReservDTO reservdto = new ReservDTO((-1),user_id,roomname,fromdate,todate,term,numberOfPeople,"");
		ReservDAO memberdao = new ReservDAO();
		
		int result = memberdao.insert(reservdto);

		ActionForward forward = new ActionForward();
		if(result<1){
			writer.println("<script type='text/javascript'>");
			writer.println("alert('예약에 실패하였습니다.');");
			writer.println("</script>");
		}
		
		List<ReservDTO> list = ReservDAO.list();
		int resnum = list.get(0).getResnum();
		
		
		forward.setRedirect(true);
		forward.setUrl("consumer/reservView.jsp?resnum="+resnum); // 마이페이지의 예약정보
		return forward;
	}

}

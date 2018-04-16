package controllor.action.reserv;

import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controllor.action.Action;
import controllor.action.ActionForward;
import reserv.ReservDAO;
import reserv.ReservDTO;

public class ReservUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("UTF-8");
		PrintWriter writer = response.getWriter();
		
		String pageS =request.getParameter("pageN");
		int page = Integer.parseInt(pageS);
		String resnumS =request.getParameter("resnum");
		int resnum = Integer.parseInt(resnumS);
		String user_id =request.getParameter("user_id");
		String roomname=request.getParameter("roomname");
		String fromdate=request.getParameter("fromdate");
		String todate=request.getParameter("todate");
		String termS=request.getParameter("term");
		int term=Integer.parseInt(termS);
		String numberOfPeopleS=request.getParameter("numberOfPeople");
		int numberOfPeople=Integer.parseInt(numberOfPeopleS);
		HttpSession session = request.getSession();
		ReservDTO reservdto = new ReservDTO(resnum,user_id,roomname,fromdate,todate,term,numberOfPeople,"");
		ReservDAO memberdao = new ReservDAO();
		
		System.out.println(resnum+user_id+" "+roomname+" "+fromdate+" "+todate+" "+termS+" "+numberOfPeopleS);
		
		
		int result = memberdao.update(reservdto);

		ActionForward forward = new ActionForward();
		if(result<1){
			writer.println("<script type='text/javascript'>");
			writer.println("alert('예약수정에 실패하였습니다.');");
			writer.println("</script>");
		}
		forward.setRedirect(true);
		forward.setUrl("adminReservListviews.res?page="+page);
		return forward;
	}

}

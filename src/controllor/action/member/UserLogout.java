package controllor.action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controllor.action.Action;
import controllor.action.ActionForward;

public class UserLogout implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		forward.setUrl("index.jsp");
		return forward;
	}

}

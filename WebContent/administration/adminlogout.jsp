<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	session.removeAttribute("user_id");
	session.removeAttribute("grade");
	session.removeAttribute("uri");
	session.removeAttribute("adminloadpage");
	
	//세션 확인
	  Enumeration se = session.getAttributeNames();
	  
	  while(se.hasMoreElements()){
	   String getse = se.nextElement()+"";
	   System.out.println("@@@@@@@ session : "+getse+" : "+session.getAttribute(getse));
	  }
	
	if(session.getAttribute("user_id")==null && session.getAttribute("grade")==null){
		out.println("<script>alert('로그아웃 되셨습니다.'); location.replace('../admin.jsp');</script>");
	}
%>

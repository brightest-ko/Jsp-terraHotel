<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	boolean check_id = MemberDAO.idCheck(request.getParameter("check_id"));
	String str = "";
	if(check_id==true){
		str = "<span class='text-success'><strong>사용가능한 ID입니다.</strong></span>";
	}
	else {
		str = "<span class='text-warning'><strong>사용불가능한 ID입니다.</strong></span>";
	}
%>

<%=str%>
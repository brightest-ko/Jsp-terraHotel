package reviewboard;

import java.sql.Date;
//게시글 코멘트 부분@@@@@@@@
public class ReviewCommentBean {
private int rc_no;//댓글시퀀스
private String rc_id; //댓글 아이디  로그인 아이디 받음
private String rc_content; //댓글 내용
private Date rc_date; //댓글 날짜
private int rc_num;  //원 게시글 참조@@@@@@
//페이징 처리용 begin end
private int begin; //
private int end;  //
private int page;

//1주일만에 시작하네....
public ReviewCommentBean() {super(); }

public int getRc_no() {
	return rc_no;
}

public void setRc_no(int rc_no) {
	this.rc_no = rc_no;
}

public String getRc_id() {
	return rc_id;
}

public void setRc_id(String rc_id) {
	this.rc_id = rc_id;
}

public String getRc_content() {
	return rc_content;
}

public void setRc_content(String rc_content) {
	this.rc_content = rc_content;
}

public Date getRc_date() {
	return rc_date;
}

public void setRc_date(Date rc_date) {
	this.rc_date = rc_date;
}

public int getRc_num() {
	return rc_num;
}

public void setRc_num(int rc_num) {
	this.rc_num = rc_num;
}

public int getBegin() {
	return begin;
}

public void setBegin(int begin) {
	this.begin = begin;
}

public int getEnd() {
	return end;
}

public void setEnd(int end) {
	this.end = end;
}

public int getPage() {
	return page;
}

public void setPage(int page) {
	this.page = page;
}



	

	
}

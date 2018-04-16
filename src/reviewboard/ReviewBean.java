package reviewboard;

import java.sql.Date;
//0107  테이블 수정 ㅜㅜ
public class ReviewBean {
private int rev_num;
private String rev_id;
private String rev_pw;
private String rev_subject;
private String rev_content;
private String rev_file;
private int rev_readcount;
private Date rev_date;

public ReviewBean() {super(); }

public int getRev_num() {
	return rev_num;
}

public void setRev_num(int rev_num) {
	this.rev_num = rev_num;
}

public String getRev_id() {
	return rev_id;
}

public void setRev_id(String rev_id) {
	this.rev_id = rev_id;
}

public String getRev_pw() {
	return rev_pw;
}

public void setRev_pw(String rev_pw) {
	this.rev_pw = rev_pw;
}

public String getRev_subject() {
	return rev_subject;
}

public void setRev_subject(String rev_subject) {
	this.rev_subject = rev_subject;
}

public String getRev_content() {
	return rev_content;
}

public void setRev_content(String rev_content) {
	this.rev_content = rev_content;
}

public String getRev_file() {
	return rev_file;
}

public void setRev_file(String rev_file) {
	this.rev_file = rev_file;
}

public int getRev_readcount() {
	return rev_readcount;
}

public void setRev_readcount(int rev_readcount) {
	this.rev_readcount = rev_readcount;
}

public Date getRev_date() {
	return rev_date;
}

public void setRev_date(Date rev_date) {
	this.rev_date = rev_date;
}





}

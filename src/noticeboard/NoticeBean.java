package noticeboard;

import java.sql.Date;
//0107  테이블 수정 ㅜㅜ
public class NoticeBean {
private int n_num;
private String n_id;
private String n_pw;
private String n_subject;
private String n_content;
private String n_uname;
private int n_readcount;
private Date n_date;
public int getN_num() {
	return n_num;
}
public void setN_num(int n_num) {
	this.n_num = n_num;
}
public String getN_id() {
	return n_id;
}
public void setN_id(String n_id) {
	this.n_id = n_id;
}
public String getN_pw() {
	return n_pw;
}
public void setN_pw(String n_pw) {
	this.n_pw = n_pw;
}
public String getN_subject() {
	return n_subject;
}
public void setN_subject(String n_subject) {
	this.n_subject = n_subject;
}
public String getN_content() {
	return n_content;
}
public void setN_content(String n_content) {
	this.n_content = n_content;
}
public String getN_uname() {
	return n_uname;
}
public void setN_uname(String n_uname) {
	this.n_uname = n_uname;
}
public int getN_readcount() {
	return n_readcount;
}
public void setN_readcount(int n_readcount) {
	this.n_readcount = n_readcount;
}
public Date getN_date() {
	return n_date;
}
public void setN_date(Date n_date) {
	this.n_date = n_date;
}
}
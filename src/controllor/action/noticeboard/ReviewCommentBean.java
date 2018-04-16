package controllor.action.noticeboard;

import java.sql.Date;

public class ReviewCommentBean {
private int rc_no;
private String rc_id;
private String rc_content;
private Date rc_date;
private int rc_num;

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

}

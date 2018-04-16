package eventboard;

import java.sql.Date;
/*
ec_num number,
ec_id varchar2(20),  
ec_count number,
ec_date date,
primary key(ec_num)
);
*/
public class EventCheckBean {
private int ec_num;//게시글 번호 참조
private String ec_id;//회원 아이디 받을 용도
private int ec_count;//응모한것 카운트 수 게시글 번호로 카운트수 올리고 내림 @@@@  
private Date ec_date; //참여 날짜
private int begin;
private int end;


public EventCheckBean(){
	super();
}


public int getEc_num() {
	return ec_num;
}


public void setEc_num(int ec_num) {
	this.ec_num = ec_num;
}


public String getEc_id() {
	return ec_id;
}


public void setEc_id(String ec_id) {
	this.ec_id = ec_id;
}


public int getEc_count() {
	return ec_count;
}


public void setEc_count(int ec_count) {
	this.ec_count = ec_count;
}


public Date getEc_date() {
	return ec_date;
}


public void setEc_date(Date ec_date) {
	this.ec_date = ec_date;
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




	
}

package eventboard;

import java.sql.Date;

public class EventBean {
	private int ev_num;// 글 번호 시퀀스로 처리
	private String ev_id;// 로그인 아이디 참조
	private int ev_count; //이벤트 카운트 수 입력해서 참조용 @@@@@
	private String ev_subject;// 게시글 제목  
	private String ev_content;// 게시글 내용 그림이 상단 하단이 글인데 이거 처리해야함 @@@@
	private String ev_file;// 게시글 이미지 첨부@@@@
	private Date ev_date;// 작성날짜@@@@

	public EventBean() { super(); }

	public int getEv_num() {
		return ev_num;
	}

	public void setEv_num(int ev_num) {
		this.ev_num = ev_num;
	}

	public String getEv_id() {
		return ev_id;
	}

	public void setEv_id(String ev_id) {
		this.ev_id = ev_id;
	}

	public int getEv_count() {
		return ev_count;
	}

	public void setEv_count(int ev_count) {
		this.ev_count = ev_count;
	}

	public String getEv_subject() {
		return ev_subject;
	}

	public void setEv_subject(String ev_subject) {
		this.ev_subject = ev_subject;
	}

	public String getEv_content() {
		return ev_content;
	}

	public void setEv_content(String ev_content) {
		this.ev_content = ev_content;
	}

	public String getEv_file() {
		return ev_file;
	}

	public void setEv_file(String ev_file) {
		this.ev_file = ev_file;
	}

	public Date getEv_date() {
		return ev_date;
	}

	public void setEv_date(Date ev_date) {
		this.ev_date = ev_date;
	}
	
}

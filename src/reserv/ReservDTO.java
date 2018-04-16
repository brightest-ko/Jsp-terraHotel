package reserv;

import java.sql.Date;
public class ReservDTO {
	private int resnum;// number primary key,
	private String user_id;// varchar2(20),
	private String roomname;// varchar2(15),
	//private Date fromdate;  //추가 체크인날짜
	private String fromdate;  //추가 체크인날짜
	//private Date todate;  //추가 체크아웃날짜
	private String todate;  //추가 체크아웃날짜
	private int term;  //추가 기간
	private int numberOfPeople;  //추가 인원
	//private Date resdate;
	private String resdate;
	public ReservDTO(){
		
	}
	public ReservDTO(int resnum,String user_id,String roomname,String fromdate,String todate,int term,int numberOfPeople,String resdate){
		this.resnum = resnum;
		this.user_id = user_id;
		this.roomname = roomname;
		this.fromdate = fromdate;
		this.todate = todate;
		this.term = term;
		this.numberOfPeople = numberOfPeople;
		this.resdate = resdate;
	}
	public int getResnum() {
		return resnum;
	}
	public void setResnum(int resnum) {
		this.resnum = resnum;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getRoomname() {
		return roomname;
	}
	public void setRoomname(String roomname) {
		this.roomname = roomname;
	}
	public String getFromdate() {
		return fromdate;
	}
	public void setFromdate(String fromdate) {
		this.fromdate = fromdate;
	}
	public String getTodate() {
		return todate;
	}
	public void setTodate(String todate) {
		this.todate = todate;
	}
	public int getTerm() {
		return term;
	}
	public void setTerm(int term) {
		this.term = term;
	}
	public int getNumberOfPeople() {
		return numberOfPeople;
	}
	public void setNumberOfPeople(int numberOfPeople) {
		this.numberOfPeople = numberOfPeople;
	}
	public String getResdate() {
		return resdate;
	}
	public void setResdate(String resdate) {
		this.resdate = resdate;
	}


	
}

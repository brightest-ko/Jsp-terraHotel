package member;

import java.sql.Date;

public class MemberBean {
	
	private int rownum;
	private String user_id, pw, uname, email, gender, postnum, addr, detailaddress, areacode, tel, birth, grade;
	private Date joinDate;
	
	public int getRownum() { return rownum; }
	public void setRownum(int rownum) { this.rownum = rownum; }
	
	public Date getJoinDate() { return joinDate; }
	public void setJoinDate(Date joinDate) { this.joinDate = joinDate; }
	
	public String getUser_id() { return user_id; }
	public void setUser_id(String user_id) { this.user_id = user_id; }
	
	public String getPw() { return pw; }
	public void setPw(String pw) { this.pw = pw; }
	
	public String getUname() { return uname; }
	public void setUname(String uname) { this.uname = uname; }
	
	public String getEmail() { return email; }
	public void setEmail(String email) { this.email = email; }
	
	public String getGender() { return gender; }
	public void setGender(String gender) { this.gender = gender; }
	
	public String getPostnum() { return postnum; }
	public void setPostnum(String postnum) { this.postnum = postnum; }
	
	public String getAddr() { return addr; }
	public void setAddr(String addr) { this.addr = addr; }
	
	public String getDetailaddress() { return detailaddress; }
	public void setDetailaddress(String detailaddress) { this.detailaddress = detailaddress; }
	
	public String getAreacode() { return areacode; }
	public void setAreacode(String areacode) { this.areacode = areacode; }
	
	public String getTel() { return tel; }
	public void setTel(String tel) { this.tel = tel; }
	
	public String getGrade() { return grade; }
	public void setGrade(String grade) { this.grade = grade; }
	
	public String getBirth() { return birth; }
	public void setBirth(String birth) { this.birth = birth; }
	
}

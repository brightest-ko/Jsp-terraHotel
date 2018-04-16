package noticeboard;



import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;



public class NoticeDAO {
	//접속 읽어옴...
	private static SqlSessionFactory factory;
	static {
		try {
			Reader r = Resources.getResourceAsReader("SqlMapConfig.xml");
			factory = new SqlSessionFactoryBuilder().build(r);
			r.close();
		} catch (Exception e) { e.printStackTrace();}
	}
	public static SqlSessionFactory getFactory() {
		return factory;
	}
	
	
	/*
	 * 코멘트(댓글) 다오 추가해야함 
	 *  readcount  수정 요망@@@@
	 *  페이징을 어떻게 처리할까욤???
	 *  페이지 리턴 처리 @@@@@@@
	 *   입력 폼 비밀번호 추가   
	 *   수정 삭제 시 작성 글 비밀번호 유효성 체크
	 *   
	 */	
	//리스트 갖구옴@@@@@@@@
	public static List<NoticeBean> list() {
		List<NoticeBean> list = null;
		SqlSession session = factory.openSession();
		list = session.selectList("Nlist");

		session.close();
		
		return list;
	}		
	public static NoticeBean info(int n_num) {
		SqlSession session = factory.openSession();
		NoticeBean NoticeBean = null;
		NoticeBean = (NoticeBean) session.selectOne("Ninfo", n_num);

		session.close();
		
		return NoticeBean;
		
	}
	
	/*
	public static int getListCount() {
		SqlSession session = factory.openSession();
		int x = 0;
		//select count(*) from memberboard
			x= session
		return x;
	}
	*/
	
	//getListCount  페이징 처리용입니당@@@??왜 안됨??	
	public static int  getListCount() {
		System.out.println("여기 문제 심각");
		int result=0;
		SqlSession session = factory.openSession();	
		System.out.println("여기 문제 심각");
		result=session.selectOne("Ncount");		
		System.out.println("여기 문제 심각");

		session.close();
		
		return result;
	}
	/*select * from (select rownum rnum, review_num, review_id, review_subject,review_content, review_file, review_readcount, review_date 
			from (select * from review_board order by rev_num desc,rev_date asc)) where rnum>=? and rnum<=?
*/
	
	public static List getBoardList(int page, int limit) {
		List list = null;
		NoticeBean NoticeBean = new NoticeBean();
		SqlSession session = factory.openSession();
		//HashMap<Integer, Integer> map2 = new HashMap<Integer, Integer>();
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("page", page);
		map.put("limit", limit);
		//map2.put(page, page);
		//map2.put(limit, limit);		
		list=session.selectList("Npagelist", map);
		/*
		NoticeBean revbean = new NoticeBean();
		revbean.setRev_num();
		revbean.setRev_id(rs.getString("BOARD_ID"));
		revbean.setRev_pw(rs.getString("BOARD_ID"));
		revbean.setRev_subject(rs.getString("BOARD_SUBJECT"));
		revbean.setRev_content(rs.getString("BOARD_CONTENT"));
		revbean.setRev_file(rs.getString("BOARD_FILE"));	
		revbean.setRev_readcount(rs.getInt("BOARD_READCOUNT"));
		revbean.setRev_date();
		list.add(revbean);
		*/
		//reviewboardlist = reviewdao.getBoardList(startrow,endrow);
		/*
		NoticeBean.setRev_num(rs.getInt("BOARD_NUM"));
		board.setBOARD_ID(rs.getString("BOARD_ID"));
		board.setBOARD_SUBJECT(rs.getString("BOARD_SUBJECT"));
		board.setBOARD_CONTENT(rs.getString("BOARD_CONTENT"));
		board.setBOARD_FILE(rs.getString("BOARD_FILE"));
		board.setBOARD_RE_REF(rs.getInt("BOARD_RE_REF"));
		board.setBOARD_RE_LEV(rs.getInt("BOARD_RE_LEV"));
		board.setBOARD_RE_SEQ(rs.getInt("BOARD_RE_SEQ"));
		board.setBOARD_READCOUNT(rs.getInt("BOARD_READCOUNT"));
		board.setBOARD_DATE(rs.getDate("BOARD_DATE"));
		list.add(board);
		
		list.add(e)
		*/

		session.close();
		
		return list;
	}
	
	public static int delete(int n_num) {
		int result;
		SqlSession session = factory.openSession();		
		result=session.insert("Ndelete", n_num);
		session.commit();

		session.close();
		
		return result;
	}
	
	//update
	public static int update(NoticeBean NoticeBean) {
		int result;		
		SqlSession session = factory.openSession();
		result=session.insert("Nupdate", NoticeBean);
		session.commit();

		session.close();
		
		return result;
	}
	//조회수 카운트 ;;
	//setListCount
	public static int setListCount(int n_readcount) {
		int result;		
		SqlSession session = factory.openSession();
		result=session.insert("Ncountupdate", n_readcount);
		session.commit();

		session.close();
		
		return result;
	}
	
	/*
	List list = session.selectList("mem.login", map);
	String str = "";
	boolean boole=false;
	for(int i = 0; i < list.size(); i++){ str+=list; }
	if(str.equals("[{GRADE=admin}]")){ str = str.substring(8, str.length()-2); }
	else {str = "";}
	return str;
	*/
	//이걸로 쓸꺼야 @@@@@	
	public static boolean deletecheck(NoticeBean NoticeBean) {
		boolean check;
			SqlSession session = factory.openSession();		
			List list = session.selectList("Ncheck2", NoticeBean);

			session.close();
			
			if (list.size()>0) {
			return check=true;
			}
			return check= false;
	       // session.commit();
	    
		}		
	//java.util.HashMap  인서트  시발 dlsxlwjsp
	public static int insert(NoticeBean NoticeBean) {
	int result;  
		SqlSession session = factory.openSession();		
		result=session.insert("Nadd", NoticeBean);
        session.commit();

		session.close();
		
        return result;
	}	
	/*
	SqlSession session = factory.openSession();
	HashMap<String, String> map = new HashMap<String, String>();
	MemberBean bean = new MemberBean();
	map.put("user_id", user_id);
	map.put("pw", pw);

	List list = session.selectList("mem.login", map);
	String str = "";
	boolean boole=false;
	for(int i = 0; i < list.size(); i++){ str+=list; }
	if(str.equals("[{GRADE=admin}]")){ str = str.substring(8, str.length()-2); }
	else {str = "";}
	return str;
}
*/
	
	//update  int check = reviewdao.writerCheck(num, pwd);  num 은 int  pwd는  String
	/*
		public static boolean writerCheck2(String num, String pwd) {	
				SqlSession session = factory.openSession();		
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("rev_num", num);
			map.put("rev_pwd", pwd);
			System.out.println(num+" " +" "+ pwd);
			 List list=session.selectList("check2", map);
			 if(list.size()>0) {
				 return true;
			 }
			return false;
		}
	
	*/
	
	//update  int check = reviewdao.writerCheck(num, pwd);  num 은 int  pwd는  String
	public static boolean writerCheck(String id, String pwd) {	//작성자와 비밀번호 체크		
		SqlSession session = factory.openSession();		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("n_id", id);
		map.put("n_pwd", pwd);
		System.out.println(id+" " +" "+ pwd);
		 List list=session.selectList("Ncheck", map);

			session.close();
			
		 if(list.size()>0) {
			 return true;
		 }
		return false;		
	}
	
	
	
	/*
	public boolean adminlogin(String user_id, String pw) {
		
		SqlSession session = factory.openSession();
		HashMap<String, String> map = new HashMap<String, String>();
		MemberBean member = new MemberBean();
		map.put("user_id", user_id);
		map.put("pw", pw);

		List list = session.selectList("mem.adminlogin", map);
		String str = "";
		boolean boole=false;
		for(int i = 0; i < list.size(); i++){ str+=list; }
		if(str.equals("[{GRADE=admin}]")){ boole = true; }
		
		return boole;
	}
	*/
	
//	public static void insert(Emp emp) {
//		SqlSession session = sqlSessionFactory.openSession();
//		session.insert("insert", emp);
//		session.commit();
//	}
//	
//	public static void update(Emp emp) {
//		SqlSession session = sqlSessionFactory.openSession();
//		session.insert("update", emp);
//		session.commit();
//	}
//	
//	
}

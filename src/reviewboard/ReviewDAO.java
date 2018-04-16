package reviewboard;



import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import eventboard.EventBean;



public class ReviewDAO {
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
	public static List<ReviewBean> list() {
		List<ReviewBean> list = null;
		SqlSession session = factory.openSession();
		list = session.selectList("indexlist");

		session.close();
		
		return list;
	}		
	//네임스페이스 같아서 계속 충돌남@@@
	public static ReviewBean info(int rev_num) {
		SqlSession session = factory.openSession();
		ReviewBean reviewbean = null;
		reviewbean = (ReviewBean) session.selectOne("reviewinfo", rev_num);

		session.close();
		
		return reviewbean;
		
	}
	
	public static ReviewCommentBean commentinfo(int rc_no) {
		SqlSession session = factory.openSession();
		ReviewCommentBean reviewcomment = null;
		reviewcomment = (ReviewCommentBean) session.selectOne("reviewcommentinfo", rc_no);

		session.close();
		
		return reviewcomment;
		
	}
	//페이징+검색 교체
	//검색+페이징용  getEventBoardList
		//페이징  왜 안됨???? 잘됨@@@@		
			public static int getARListCount(String type, String word) {
				System.out.println("getARListCount 시작");
				int result=0;
				SqlSession session = factory.openSession();	
				
				if(word==null||word.equals("")){ result=session.selectOne("ARcount"); }//전체 글 갯수
				else if(type.equals("sl")){ result=session.selectOne("ARcount"); }
				else if(type.equals("user_id")){ result=session.selectOne("countARuser_id", word); }
				else if(type.equals("subject")){ result=session.selectOne("countARsubject", word); }
				else if(type.equals("content")){ result=session.selectOne("countARcontent", word); }
				System.out.println("getARListCount "+result);

				session.close();
				
				return result;
			}
		
			//getEventRListCount 검색 +페이징 용
			public static List<ReviewBean> getARBoardList(int page, int limit, String type, String word) {
				System.out.println("getARBoardList 시작");
				List<ReviewBean> list = null;
				SqlSession session = factory.openSession();
				HashMap<String, String> map = new HashMap<String, String>();
				String strpage = String.valueOf(page); 
				String strlimit = String.valueOf(limit);
				map.put("page", strpage);
				map.put("limit", strlimit);
				map.put("word", word);			
				if(word==null||word.equals("")){ list=session.selectList("pageARlist", map); }			
				else if(type.equals("user_id")){ list=session.selectList("pageARlistuser_id", map); }
				else if(type.equals("subject")){ list=session.selectList("pageARlistsubeject", map); }
				else if(type.equals("content")){ list=session.selectList("pageARlistcontent", map); }
				System.out.println("getARBoardList 끝 리스트 체크 "+list);

				session.close();
				
				return list;
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
	public static int getListCount() {
		System.out.println("여기 문제 심각");
		int result=0;
		SqlSession session = factory.openSession();	
		System.out.println("여기 문제 심각");
		result=session.selectOne("reviewcount");		
		System.out.println("여기 문제 심각"+result);

		session.close();
		
		return result;
	}
	//getListCount  페이징 처리용입니당@@@??왜 안됨??	
	//수정해야함
	public static int  getListCommentCount(int num) {
		//System.out.println("여기 문제 심각");
		int result=0;
		SqlSession session = factory.openSession();	
		//System.out.println("여기 문제 심각");
		result=session.selectOne("reviewcommentcount", num);		
		//System.out.println("여기 문제 심각"+result);

		session.close();
		
		return result;
	}
	
	
	/*select * from (select rownum rnum, review_num, review_id, review_subject,review_content, review_file, review_readcount, review_date 
			from (select * from review_board order by rev_num desc,rev_date asc)) where rnum>=? and rnum<=?
*/
	//코멘트 용
	public static List getCommentList(int page, int limit) {
		List list = null;
		//ReviewBean reviewbean = new ReviewBean();
		ReviewCommentBean reviewcomment = new ReviewCommentBean();
		SqlSession session = factory.openSession();
		//HashMap<Integer, Integer> map2 = new HashMap<Integer, Integer>();
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("page", page);
		map.put("limit", limit);
				
		list=session.selectList("commentpagelist", map);

		session.close();
		
		return list;
	}
	//commentInsert
	public static int commentInsert(ReviewCommentBean reviewcomment) {
		int result;  
			SqlSession session = factory.openSession();		
			result=session.insert("reviewcommentadd", reviewcomment);
	        session.commit();
	        return result;
		}
	
	//테이블 출력시 getBoardList
	public static List getBoardList(int page, int limit) {
		List list = null;
		ReviewBean reviewbean = new ReviewBean();
		SqlSession session = factory.openSession();
		//HashMap<Integer, Integer> map2 = new HashMap<Integer, Integer>();
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("page", page);
		map.put("limit", limit);
				
		list=session.selectList("reviewpagelist", map);
		System.out.println("getboardlist리스트 뿌림"+list);

		session.close();
		
		return list;
	}
	//해당 글번호 페이징
	public static List CgetBoardList(ReviewCommentBean reviewcommentbean) {
		List list = null;
		ReviewBean reviewbean = new ReviewBean();
		ReviewCommentBean reviewcommet = new ReviewCommentBean();
		SqlSession session = factory.openSession();
		
		//HashMap<Integer, Integer> map2 = new HashMap<Integer, Integer>();
		//HashMap<String, Integer> map = new HashMap<String, Integer>();
		//map.put("page", page);코멘트리스트[]
		//map.put("limit", limit);
				
		list=session.selectList("reviewcommentpagelist", reviewcommentbean);
		System.out.println("getboardlist리스트 뿌림"+list);

		session.close();
		
		return list;
	}
	
	
	
	//commentdelete
	public static int commentdelete(int rc_no) {
		int result;
		SqlSession session = factory.openSession();		
		result=session.insert("commentdelete", rc_no);
		session.commit();

		session.close();
		
		return result;
	}
	//adminCommentDelete  관리자 코멘트 삭제
	public static int adminCommentDelete(int rc_num) {
		int result;
		SqlSession session = factory.openSession();		
		result=session.insert("admincommentdelete", rc_num);
		session.commit();

		session.close();
		
		return result;
	}
	//reviewboard
	public static int delete(int rev_num) {
		int result;
		SqlSession session = factory.openSession();		
		result=session.insert("reviewdelete", rev_num);
		session.commit();

		session.close();
		
		return result;
	}
	
	//adminReviewupdate
	public static int adminReviewupdate(ReviewBean reviewbean) {
		int result;		
		SqlSession session = factory.openSession();
		result=session.insert("adminreviewupdate", reviewbean);
		session.commit();

		session.close();
		
		return result;
	}
	//update
	public static int reviewupdate(ReviewBean reviewbean) {
		int result;		
		SqlSession session = factory.openSession();
		result=session.insert("reviewupdate", reviewbean);
		session.commit();

		session.close();
		
		return result;
	}
	//유저용 수정 reviewuserupdate
	public static int reviewuserupdate(ReviewBean reviewbean) {
		int result;		
		SqlSession session = factory.openSession();
		result=session.insert("reviewuserupdate", reviewbean);
		session.commit();

		session.close();
		
		return result;
	}
	//유저용 수정 reviewuserupdate2 이미지 추가
	public static int reviewuserupdate2(ReviewBean reviewbean) {
		int result;		
		SqlSession session = factory.openSession();
		result=session.insert("reviewuserupdate2", reviewbean);
		session.commit();

		session.close();
		
		return result;
	}
	
	
	
	
	//조회수 카운트 ;;
	//setListCount
	public static int setListCount(int rev_readcount) {
		int result;		
		SqlSession session = factory.openSession();
		result=session.insert("reviewcountupdate", rev_readcount);
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
	public static boolean deletecheck(ReviewBean reviewbean) {
		boolean check;
			SqlSession session = factory.openSession();		
			List list = session.selectList("reviewcheck2", reviewbean);

			session.close();
			
			if (list.size()>0) {
			return check=true;
			}
			return check= false;
	       // session.commit();
	    
		}		
	//java.util.HashMap 인서트 공용으로 씀
	public static int insert(ReviewBean reviewbean) {
	int result;  
		SqlSession session = factory.openSession();		
		result=session.insert("reviewadd", reviewbean);
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
		map.put("rev_id", id);
		map.put("rev_pwd", pwd);
		System.out.println(id+" " +" "+ pwd);
		 List list=session.selectList("reviewcheck", map);

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

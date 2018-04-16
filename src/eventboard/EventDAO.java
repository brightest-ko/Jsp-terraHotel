package eventboard;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;



public class EventDAO {
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
	////getEventBoardList
	//getEventEListCount
	
	public static String  eventcheck(int num) {
		System.out.println("여기 문제 심각");
		String result=null;
		SqlSession session = factory.openSession();	
		//System.out.println("여기 문제 심각");
		result=session.selectOne("eventcheck",num);		
		System.out.println("반환값"+result);
		return result;
	}	
	
	//상세보기
	
	public static EventBean info(int ev_num) {
		//System.out.println("이벤트빈 인포1");
		SqlSession session = factory.openSession();
		//System.out.println("이벤트빈 인포2");
		EventBean eventbean = null;
		//System.out.println("이벤트빈 인포3");
		eventbean = (EventBean) session.selectOne("eventinfo", ev_num);
	
		return eventbean;		
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
		//System.out.println("여기 문제 심각");
		result=session.selectOne("eventcount");		
		//System.out.println("여기 문제 심각");
		return result;
	}
	//eventCheckgetListCount이벤트 회원이 응모한 정보 갖구옴@@@@
	public static int  eventCheckgetListCount(String uid) {
		System.out.println("여기 문제 심각");
		int result=0;
		SqlSession session = factory.openSession();	
		//System.out.println("여기 문제 심각");
		result=session.selectOne("eventcheckcount",uid);		
		System.out.println("이벤트 체크 리스트 카운트 숫자"+result);
		return result;
	}
	
	
	//이벤트 체크 겟보드 리스트 추가
			//eventboardlist = eventdao.eventCheckgetBoardList(startrow,endrow);
	public static List eventCheckgetBoardList(int page, int limit) {
		List list = null;
		//EventCheckBean eventcheckbean = new EventCheckBean();
		SqlSession session = factory.openSession();
		//HashMap<Integer, Integer> map2 = new HashMap<Integer, Integer>();
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("page", page);
		map.put("limit", limit);
		//map2.put(page, page);
		//map2.put(limit, limit);		
		list=session.selectList("eventcheckpagelist", map);	
		return list;
	}
	//이벤트 체크 겟보드 CgetBoardList  해당 회원 응모한 정보로 페이징 하기

	public static List CgetBoardList(EventCheckBean eventcheck ) {
		List list = null;
		EventBean reviewbean = new EventBean();
		EventCheckBean eventcheckbean = new EventCheckBean();
		SqlSession session = factory.openSession();
			
		list=session.selectList("eventcheckpagelist", eventcheck);
		System.out.println("이벤트 체크중"+list);
		return list;
	}	
	//검색+페이징용  getEventBoardList
	//페이징  왜 안됨???? 잘됨@@@@
	
	
		public static int getEventEListCount(String type, String word) {
			System.out.println("getEventEListCount 시작");
			int result=0;
			SqlSession session = factory.openSession();	
			
			if(word==null||word.equals("")){ result=session.selectOne("evcount"); }//전체 글 갯수
			else if(type.equals("sl")){ result=session.selectOne("evcount"); }
			else if(type.equals("user_id")){ result=session.selectOne("countEuser_id", word); }
			else if(type.equals("subject")){ result=session.selectOne("countEsubject", word); }
			else if(type.equals("content")){ result=session.selectOne("countEcontent", word); }
			System.out.println("getEventEListCount "+result);
			return result;
		}
		
		//getEventRListCount 검색 +페이징 용
		public static List<EventBean> getEventBoardList(int page, int limit, String type, String word) {
			System.out.println("getEventBoardList 시작");
			List<EventBean> list = null;
			SqlSession session = factory.openSession();
			HashMap<String, String> map = new HashMap<String, String>();
			String strpage = String.valueOf(page); 
			String strlimit = String.valueOf(limit);
			map.put("page", strpage);
			map.put("limit", strlimit);
			map.put("word", word);			
			if(word==null||word.equals("")){ list=session.selectList("pageElist", map); }			
			else if(type.equals("user_id")){ list=session.selectList("pageElistuser_id", map); }
			else if(type.equals("subject")){ list=session.selectList("pageElistsubeject", map); }
			else if(type.equals("content")){ list=session.selectList("pageElistcontent", map); }
			System.out.println("getEventBoardList 끝 리스트 체크 "+list);
			return list;
		}
	
	//여기까지@@
	public static List getBoardList(int page, int limit) {
		List list = null;
		EventBean reviewbean = new EventBean();
		SqlSession session = factory.openSession();
		//HashMap<Integer, Integer> map2 = new HashMap<Integer, Integer>();
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("page", page);
		map.put("limit", limit);
		//map2.put(page, page);
		//map2.put(limit, limit);		
		list=session.selectList("eventpagelist", map);	
		return list;
	}	
	
	public static int delete(int ev_num) {
		int result;
		SqlSession session = factory.openSession();		
		result=session.insert("eventdelete", ev_num);
		session.commit();
		return result;
	}
	//eventcheckdelete 해당 아이디와 해당 넘버로테이블에서 삭제
	public static int eventcheckdelete(EventCheckBean eventcheckbean) {
		int result;
		SqlSession session = factory.openSession();		
		result=session.delete("eventcheckdelete", eventcheckbean);
		session.commit();
		return result;
	}
	//eventcheckdelete2 게시글 삭제시 삭제용
	public static int eventcheckdelete2(int num) {
		int result;
		SqlSession session = factory.openSession();		
		result=session.delete("eventcheckdelete2", num);
		session.commit();
		return result;
	}
	//이벤트 인서트
	
	public static int ec_insert(EventCheckBean eventcheckbean) {
		int result;		
		SqlSession session = factory.openSession();
		result=session.insert("ecupdate", eventcheckbean);
		session.commit();
		return result;
	}
	
	
	//이벤트 카운트 -1
	public static int countupdate(int num) {
		int result;		
		SqlSession session = factory.openSession();
		result=session.update("eventcountcheck",num);
		session.commit();
		return result;
	}
	//이벤트 카운트 +1
	public static int eventcheckupcount(int ev_num) {
		int result;		
		SqlSession session = factory.openSession();
		result=session.update("eventcheckupcount",ev_num);
		session.commit();
		return result;
	}
	
	
	
	//update
	public static int eventupdate(EventBean eventbean) {
		int result;		
		SqlSession session = factory.openSession();
		result=session.insert("eventupdate", eventbean);
		session.commit();
		return result;
	}
	//adminEventUpdate
	public static int adminEventUpdate(EventBean eventbean) {
		int result;		
		SqlSession session = factory.openSession();
		result=session.insert("admineventupdate", eventbean);
		session.commit();
		return result;
	}
	
	
	
	
	//java.util.HashMap  인서트  insert
	public static int insert(EventBean eventbean) {
	int result;  
		SqlSession session = factory.openSession();		
		result=session.insert("evadd", eventbean);
        session.commit();
        return result;
	}	
		
	
}

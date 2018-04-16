package reserv;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


public class ReservDAO{
	private static SqlSessionFactory sqlSessionFactory;
	static {
		try {
			Reader r = Resources.getResourceAsReader("SqlMapConfig.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(r);
			r.close();
		} catch (Exception e) { e.printStackTrace(); }
	}
	public static SqlSessionFactory getFactory() {
		return sqlSessionFactory;
	}

	
	public static List<ReservDTO> list(){
		List<ReservDTO> list = null;
		SqlSession session = sqlSessionFactory.openSession();
		list = session.selectList("Rlist");
		return list;
	}
	
	public static ReservDTO info(int Reservno){
		ReservDTO Reserv = null;
		SqlSession session = sqlSessionFactory.openSession();
		Reserv = (ReservDTO)session.selectOne("reservinfo",Reservno);

		session.close();
		
		return Reserv;
	}
	
	public static List<ReservDTO> userinfo1(String user_id){
		List<ReservDTO> list = null;
		SqlSession session = sqlSessionFactory.openSession();
		list = session.selectList("userinfo1",user_id);

		session.close();
		
		return list;
	}
	public static List<ReservDTO> userinfo2(String user_id){
		List<ReservDTO> list = null;
		SqlSession session = sqlSessionFactory.openSession();
		list = session.selectList("userinfo2",user_id);

		session.close();
		
		return list;
	}
	
	//페이징
	public static int getReservRListCount(String type, String word) {
		int result=0;
		SqlSession session = sqlSessionFactory.openSession();
		
		if(word==null||word.equals("")){ result=session.selectOne("countR"); }
		else if(type.equals("sl")){ result=session.selectOne("countR"); }
		else if(type.equals("user_id")){ result=session.selectOne("countRuser_id", word); }
		else if(type.equals("roomname")){ result=session.selectOne("countRroomname", word); }

		session.close();
		
		return result;
	}
	public static List<ReservDTO> getReservBoardList(int page, int limit, String type, String word) {
		List<ReservDTO> list = null;
		SqlSession session = sqlSessionFactory.openSession();
		HashMap<String, String> map = new HashMap<String, String>();
		String strpage = String.valueOf(page); 
		String strlimit = String.valueOf(limit);
		map.put("page", strpage);
		map.put("limit", strlimit);
		map.put("word", word);
		
		if(word==null||word.equals("")){ list=session.selectList("pageRlist", map); }
		else if(type.equals("sl")){ list=session.selectList("pageRlist", map); }
		else if(type.equals("user_id")){ list=session.selectList("pageRlistuser_id", map); }
		else if(type.equals("roomname")){ list=session.selectList("pageRlistroomname", map); }

		session.close();
		
		return list;
	}
	
	
	
	public static int insert(ReservDTO Reserv){
		SqlSession session = sqlSessionFactory.openSession();
		int result = session.insert("Rinsert",Reserv);
		session.commit();

		session.close();
		
		return result;
	}
	public static int update(ReservDTO Reserv){
		SqlSession session = sqlSessionFactory.openSession();
		int result = session.update("Rupdate",Reserv);
		session.commit();

		session.close();
		
		return result;
	}
	public static int delete(int Reservno){
		SqlSession session = sqlSessionFactory.openSession();
		int result = session.delete("Rdelete",Reservno);
		session.commit();

		session.close();
		
		return result;
	}

	//회원의 예약유무 검사
	public static List memberreservlist(String user_id){
		SqlSession session = sqlSessionFactory.openSession();
		List list = session.selectList("reservlist", user_id);

		session.close();
		
		return list;
	}
}

package member;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import reserv.ReservDTO;


public class MemberDAO {
	
	private static SqlSessionFactory factory;
	static {
		try {
			Reader r = Resources.getResourceAsReader("SqlMapConfig.xml");
			factory = new SqlSessionFactoryBuilder().build(r);
			r.close();
		} catch (Exception e) { e.printStackTrace(); }
	}
	public static SqlSessionFactory getFactory() {
		return factory;
	}
	
	public String adminlogin(String user_id, String pw) {
		SqlSession session = factory.openSession();
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("user_id", user_id);
		map.put("pw", pw);
		
		List list = session.selectList("login", map);
		String str = "";
		
		for(int i = 0; i < list.size(); i++){ str+=list; }
		if(str.equals("[{GRADE=admin}]")){ str = str.substring(8, str.length()-2); }
		else {str = "";}
		return str;
	}

	public static String login(String user_id, String pw) {
		String str = "";
		
		SqlSession session = factory.openSession();
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("user_id", user_id);
		map.put("pw", pw);
		System.out.println(map.get(0));
		System.out.println(map.get(1));
		List list = session.selectList("login", map);
		for(int i = 0; i < list.size(); i++){ str+=list; }
		if(!str.equals("")){ str = str.substring(8, str.length()-2); }
		else {str = "";}
		
		session.close();
		
		return str;
	}

	public int region(MemberBean bean) {
		SqlSession session = factory.openSession();
		int a = session.insert("region", bean);
		session.commit();

		session.close();
		
		return 0;
	}
	
	public static boolean memberUpdate(MemberBean bean){
		SqlSession session = factory.openSession();
		
		int a = session.update("memberupdate", bean);
		session.commit();

		session.close();
		
		if(a != 0) { return true; }
		else{ return false; }
	}
	
	public static boolean idCheck(String check_id){
		SqlSession session = factory.openSession();
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("check_id", check_id);
		
		String str="";
		List list = session.selectList("idcheck", map);
		for(int i=0; i < list.size(); i++){ str+=list; }

		session.close();
		
		if(str==null || !(str.equals(""))){ return false; }
		else { return true; }
	}
	public static List<MemberBean> list(){
		List<MemberBean> list = null;
		SqlSession session = factory.openSession();
		list = session.selectList("memberlist");

		session.close();
		
		return list;
	}
	public static MemberBean memberInformation(String user_id) {
		SqlSession session = factory.openSession();
		MemberBean bean = (MemberBean)session.selectOne("memberinfo", user_id);

		session.close();
		
		return bean;
	}
	public static void memberdelete(String user_id){
		SqlSession session = factory.openSession();
		
		System.out.println(user_id);
		
		session.delete("ndelete", user_id);
		session.delete("qdelete", user_id);
		session.delete("ecdelete", user_id);
		session.delete("evdelete", user_id);
		session.delete("rcdelete", user_id);
		session.delete("revdelete", user_id);
		
		session.delete("memberdelete", user_id);
		
		session.commit();

		session.close();
		
	}
	public static int getMemberRListCount(String type, String word) {
		int result=0;
		SqlSession session = factory.openSession();
		
		if(word==null||word.equals("")){ result=session.selectOne("memberCountR"); }
		else if(type.equals("user_id")){ result=session.selectOne("memberCountRuser_id", word); }
		else if(type.equals("uname")){ result=session.selectOne("memberCountRuname", word); }
		else if(type.equals("email")){ result=session.selectOne("memberCountRemail", word); }
		else if(type.equals("grade")){ result=session.selectOne("memberCountRgrade", word); }

		session.close();
		
		return result;
	}
	public static List<MemberBean> getMemberBoardList(int page, int limit, String type, String word) {
		List<MemberBean> list = null;
		SqlSession session = factory.openSession();
		HashMap<String, String> map = new HashMap<String, String>();
		String strpage = String.valueOf(page); 
		String strlimit = String.valueOf(limit);
		map.put("page", strpage);
		map.put("limit", strlimit);
		map.put("word", word);
		
		if(word==null||word.equals("")){ list=session.selectList("memberPageRlist", map); }
		else if(type.equals("user_id")){ list=session.selectList("memberPageRlistuser_id", map); }
		else if(type.equals("uname")){ list=session.selectList("memberPageRlistuname", map); }
		else if(type.equals("email")){ list=session.selectList("memberPageRlistemail", map); }
		else if(type.equals("grade")){ list=session.selectList("memberPageRlistgrade", map); }
		

		session.close();
		
		
		return list;
	}
}

package qnaboard;



import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;



public class QnaDAO {
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
	
	
	public static List<QnaBean> list() {
		List<QnaBean> list = null;
		SqlSession session = factory.openSession();
		list = session.selectList("list"); 		
		return list;
	}		
	public static QnaBean info(int q_num) {
		SqlSession session = factory.openSession();
		QnaBean QnaBean = null;
		QnaBean = (QnaBean) session.selectOne("info", q_num);

		session.close();
		
		return QnaBean;
		
	}

	public static int  getListCount() {
		System.out.println("여기 문제 심각");
		int result=0;
		SqlSession session = factory.openSession();	
		System.out.println("여기 문제 심각");
		result=session.selectOne("qcount");		
		System.out.println("여기 문제 심각");

		session.close();
		
		return result;
	}
	
	
	public static List getBoardList(int page, int limit) {
		List list = null;
		QnaBean QnaBean = new QnaBean();
		SqlSession session = factory.openSession();
		//HashMap<Integer, Integer> map2 = new HashMap<Integer, Integer>();
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("page", page);
		map.put("limit", limit);
		//map2.put(page, page);
		//map2.put(limit, limit);		
		list=session.selectList("pagelist", map);
		
		System.out.println("list"+list);

		session.close();
		
		return list;
	}
	
	public static int delete(int q_num) {
		int result;
		SqlSession session = factory.openSession();		
		result=session.insert("delete", q_num);
		session.commit();

		session.close();
		
		return result;
	}
	
	//update
	public static int update(QnaBean QnaBean) {
		int result;		
		SqlSession session = factory.openSession();
		result=session.insert("update", QnaBean);
		session.commit();

		session.close();
		
		return result;
	}
	//조회수 카운트 ;;
	//setListCount
	public static int setListCount(int q_readcount) {
		int result;		
		SqlSession session = factory.openSession();
		result=session.insert("countupdate", q_readcount);
		session.commit();

		session.close();
		
		return result;
	}
	
	public static boolean deletecheck(QnaBean QnaBean) {
		boolean check;
			SqlSession session = factory.openSession();		
			List list = session.selectList("check2", QnaBean);

			session.close();
			
			if (list.size()>0) {
			return check=true;
			}
			return check= false;
	       // session.commit();
	    
		}		
	//java.util.HashMap  인서트  시발 dlsxlwjsp
	public static int insert(QnaBean QnaBean) {
	int result;  
		SqlSession session = factory.openSession();		
		result=session.insert("qadd", QnaBean);
        session.commit();

		session.close();
		
        return result;
	}	
	
	public static int reply(QnaBean QnaBean) {
	int result;  
		SqlSession session = factory.openSession();		
		result=session.insert("reply", QnaBean);
        session.commit();

		session.close();
		
        return result;
	}	
	
	public static boolean writerCheck(String id, String pwd) {	//작성자와 비밀번호 체크		
		SqlSession session = factory.openSession();		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("q_id", id);
		map.put("q_pwd", pwd);
		System.out.println(id+" " +" "+ pwd);
		 List list=session.selectList("check", map);

			session.close();
			
		 if(list.size()>0) {
			 return true;
		 }
		return false;		
	}
	
	
	
}

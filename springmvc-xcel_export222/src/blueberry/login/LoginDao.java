package blueberry.login;

import java.util.HashMap;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import blueberry.common.CaseInsensitiveMap;

@SuppressWarnings({"rawtypes","unused"})
@Repository
public class LoginDao {

	//data source 1 
	@Autowired
	@Resource(name="sqlSessionTpl1")
	private SqlSession sqlsessiontpl1;
	
	
	//data source 2
	@Autowired
	@Resource(name="sqlSessionTpl2")
	private SqlSession sqlSessionTpl2;
	
	
	public HashMap getLoginedUser(HashMap map) {
		
	    HashMap resultMap = sqlsessiontpl1.selectOne("blueberry.user.getLoginedUser", map);
		
		return resultMap;
		
	}
	
	//getLoginedId
	public String getLoginedId(HashMap map) {
		
	    String str = sqlsessiontpl1.selectOne("blueberry.user.getLoginedId", map);
		
		return str;
		
	}
	
	
}










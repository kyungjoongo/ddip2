package blueberry.user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@SuppressWarnings("rawtypes")
@Repository
public class UserDao {

	// data source 1 ses tmpl
	@Autowired
	@Resource(name = "sqlSessionTpl1")
	private SqlSession sqlSessionTpl1;

	// hao datasource sqlsession tmpl instance
	@Autowired
	@Resource(name = "sqlSessionTpl2")
	private SqlSession sqlSessionTpl2;

	public List getAllUser(HashMap pagemap) {
		List arrList = sqlSessionTpl1.selectList("blueberry.user.getAllUser", pagemap);
		return arrList;
	}
	
	public List getCommentList(HashMap pagemap) {
		List arrList = sqlSessionTpl1.selectList("blueberry.user.getCommentList", pagemap);
		return arrList;
	}
	
	//getUserCount
	public int getUserCount() {
		int totCnt = sqlSessionTpl1.selectOne("blueberry.user.getUserTotCount");
		return totCnt;
	}
	
	public List getAllUser2() {
		List<UserVO> arrList = sqlSessionTpl1.selectList("blueberry.user.getAllUser2");
		return arrList;
	}

	public List getRcReply(Map<String, String> map) {

		List arrList = new ArrayList();
		// namespace.sql_id
		try {
			arrList = sqlSessionTpl1.selectList("HaoMapper.getRcReply");
		} catch (Exception e) {
			// TODO: handle exception
		}

		return arrList;

	}

	// addUser
	public int addUser(UserVO user) {
		int result = sqlSessionTpl1.insert("blueberry.user.addUser", user);
		return result;

	}


	public HashMap getUser(HashMap map) {
		
		HashMap resultMap = sqlSessionTpl1.selectOne("blueberry.user.getUser", map);
		return resultMap;

	}
	
	//updateUser
	public int updateUser(UserVO uservo) {

		int result=  sqlSessionTpl1.update("blueberry.user.updateUser", uservo);
		return result;
	}
	
	//deleteUser
	public int deleteUser(String id) {

		int result=  sqlSessionTpl1.delete("blueberry.user.deleteUser", id);
		return result;
	}
}

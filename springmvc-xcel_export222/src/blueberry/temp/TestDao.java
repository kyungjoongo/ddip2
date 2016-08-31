package blueberry.temp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TestDao {

	//data source 1 ses tmpl
	@Autowired
	@Resource(name="sqlSessionTpl1")
	private SqlSession sqlsessiontpl1;
	
	
	// hao datasource sqlsession tmpl instance
	@Autowired
	@Resource(name="sqlSessionTpl2")
	private SqlSession sqlSessionTpl2;// mysql localhost
	
	
	public List selectAdminUser(Map<String, String> map) {
		
		List arrList = sqlSessionTpl2.selectList("mysql.selectAdminUser");
		
		return arrList;
		
	}
	//selectAdminUserPaging
	public List selectAdminUserPaging(HashMap pagemap) {
		
		List arrList = sqlSessionTpl2.selectList("mysql.selectAdminUserPaging", pagemap);
		
		return arrList;
		
	}
	
	//selectAdminUserTotCnt
	public int selectAdminUserTotCnt() {
		
		int totcnt = sqlSessionTpl2.selectOne("mysql.selectAdminUserTotCnt");
		
		return totcnt;
		
	}
	
	public List getColList(String tableNm){
		
		HashMap vmap=new HashMap();
		vmap.put("tableNm", tableNm);
		List arrList = sqlSessionTpl2.selectList("mysql.getColList", vmap);
		
		return arrList;
	}
	
	//add
	public int add(TestVO vo) {
		int rslt = sqlSessionTpl2.insert("mysql.add",vo );
		return rslt;
		
	}
	
	//delete
	public int delete(String  id) {
		
		int rslt = sqlSessionTpl2.delete("mysql.delete",id );
		
		return rslt;
		
	}
	
	//selectOne
	public HashMap selectOne(String  id) {
		
		HashMap map = sqlSessionTpl2.selectOne("mysql.selectOne",id );
		
		return map;
		
	}
	
	//update
	public int update(TestVO vo) {
		int rslt = sqlSessionTpl2.update("mysql.update",vo );
		return rslt;
		
	}
	//updateCell
	public int updateCell(HashMap map) {
		int rslt = sqlSessionTpl2.update("mysql.updateCell",map );
		return rslt;
		
	}
}










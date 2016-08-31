package blueberry.temp;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class TestService {
	
	
	@Autowired
	private TestDao dao;

	public List selectAdminUser()  {
		Map<String, String> map = null;
		List arrList = dao.selectAdminUser(map);
		return arrList;
	}
	
	public List selectAdminUserPaging(HashMap pagemap)  {
		Map<String, String> map = null;
		List arrList = dao.selectAdminUserPaging(pagemap);
		return arrList;
	}
	
	//selectAdminUserTotCnt
	public int selectAdminUserTotCnt()  {
		
		int totCnt = dao.selectAdminUserTotCnt();
		return totCnt;
	}
	
	public List getColList(String tableNm)  {
		
		List arrList = dao.getColList(tableNm);
		return arrList;
	}
	
	
	
	public int add(TestVO vo)  {
		int result = dao.add(vo);
		return result;
	}
	
	//update
	public int update(TestVO vo)  {
		
		int result = dao.update(vo);
		return result;
	}
	
	public int updateCell(HashMap map)  {
		
		int result = dao.updateCell(map);
		return result;
	}
	
	
	public int delete(String id)  {
		
		int result = dao.delete(id);
		return result;
	}
	
	
	public HashMap selectOne(String id)  {
		
		HashMap map = dao.selectOne(id);
		return map;
	}
	
	

	
}
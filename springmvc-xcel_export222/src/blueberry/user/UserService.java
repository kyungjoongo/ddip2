package blueberry.user;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@SuppressWarnings({"rawtypes","unused"})
@Service
public class UserService {
	
	
	@Autowired
	private UserDao dao;

	public List<?> getAllUser(HashMap pagemap){
		Map<String, String> map = null;
		List arrList = dao.getAllUser(pagemap);
		return arrList;
	}
	
	//getCommentList
	public List<?> getCommentList(HashMap pagemap){
		
		List<HashMap> arrList = dao.getCommentList(pagemap);
		
		List<HashMap> arrList2=new ArrayList();
		
		/*for ( HashMap oneMap : arrList){
		    
		    int parent_seq = (int) oneMap.get("id");
		    
		    HashMap valueMap= new HashMap<>();
		    
		    valueMap.put("parent_seq", parent_seq);
		    
		    
		    //자식 리스트 가져오기
		    arrList2 = dao.getCommentList(valueMap);
		    
		    oneMap.put("child", arrList2);
		    
		    arrList2.add(oneMap);
		    
		    
		}*/
		
		
		
		return arrList;
	}
	
	
	//getUserCount
	public int getUserCount(){
		
		int totCnt = dao.getUserCount();
		return totCnt;
	}
	
	public List<UserVO> getAllUser2(){
		Map<String, String> map = null;
		List arrList = dao.getAllUser2();
		return arrList;
	}
	
	public HashMap getUser(HashMap map){
		
		HashMap resultMap = dao.getUser(map);
		return resultMap;
	}
	
	//addUser
	public void addUser(UserVO user){
		Map<String, String> map = null;
		dao.addUser(user);
		
	}
	//updateUser
	public void updateUser(UserVO user){
		
		Map<String, String> map = null;
		dao.updateUser(user);
		
	}
	
	//	deleteUser
	public void deleteUser(String  id){
		
		dao.deleteUser(id);
		
	}
	
	
}
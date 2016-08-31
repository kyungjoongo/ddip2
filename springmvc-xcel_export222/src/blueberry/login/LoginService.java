package blueberry.login;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import blueberry.common.CaseInsensitiveMap;



@SuppressWarnings({"rawtypes","unused"})
@Service
public class LoginService {
	
	
	@Autowired
	private LoginDao dao;
	
	public HashMap getLoginedUser(HashMap map)  {
		
		
	    HashMap resultMap = dao.getLoginedUser(map);
		return resultMap;
	}
	
	
	public String getLoginedId(HashMap map)  {
		
		
	    String strId = dao.getLoginedId(map);
		return strId;
	}
	
	
}
package blueberry.common;

import java.util.HashMap;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;





@SuppressWarnings({"rawtypes","unchecked"})
@Controller
@RequestMapping("/common")
public class CommonController {



	@RequestMapping("/paging.do")
	public String admin_main() {
		return "/common/paging";
	}
	
	

}

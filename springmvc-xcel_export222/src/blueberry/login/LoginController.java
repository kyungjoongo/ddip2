package blueberry.login;

import java.io.IOException;
import java.util.HashMap;






import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;



@SuppressWarnings({"rawtypes","unchecked"})
@Controller
public class LoginController {

	
    
    
	@Autowired
	private LoginService loginService = null;


	
	@RequestMapping("/login.do")
	public String login(HttpServletRequest request, HttpServletResponse response,HttpSession session
			, @RequestParam(value = "id",required = false, defaultValue = "") String id
			, @RequestParam(value = "password",	required = false, defaultValue = "") String password

	) throws IOException {
		String returnURL = "";
		String ctx=request.getContextPath();

		//디비로 부터 유저 정보를 끌어와 비교 체크후 유저정보가 일치하는 경우에만 유저 세션을 생성.
		// 디비와 user_id를 비교하는 로짓ㄱ
		HashMap formUserMap = new HashMap();

		formUserMap.put("id", id);
		formUserMap.put("password", password);

		HashMap dbUserMap = loginService.getLoginedUser(formUserMap);
		
		String dbId = loginService.getLoginedId(formUserMap);
	        //로그인 아이디만 일치하는 경우..		
		if (dbUserMap== null && dbId !=null ){
		    
		    returnURL = "redirect:/loginForm.do?msg="+ "password incorrect!";
		}
		//패스워스 유저 id가 모드 일치하는 경우.
		else if (dbUserMap != null) {

			String db_user_id = (String) dbUserMap.get("USER_ID");
			String db_user_password = (String) dbUserMap.get("USER_PASSWORD");
			String db_user_name = (String) dbUserMap.get("NAME");
			
			

			// db login value와 LOginform value가  일치하는지를 확인
			if (id.equals(db_user_id) && password.equals(db_user_password)) {
				/*HashMap < String, Object > usermap = new HashMap < String, Object > ();
				usermap.put("user_id", db_user_id);
				usermap.put("user_name", db_user_name);*/

				//#########################
				//일치하는 경우 login세션생성
				// Logined USER 세션 생셩
				//#########################
				//@todo
				session.setAttribute("loginSession", dbUserMap);
				returnURL = "redirect:/test/jqgridsssideExam.do";

			} else {
				returnURL = "redirect:/loginForm.do";
			}
		}
		//일치하는 id,pwd가 없으면 로그인 페이지로 돌려보낸다.
		//폼id,pasword와 db_id, pasword가 일치 하는 경우 체크.하여 일치하는 경우 user세션을 생성한다.
		else {

		    System.out.println("aslfksdlfksdlkflsdkf");
			returnURL = "redirect:/loginForm.do";
		}

		return returnURL;
		
		

	}

	@RequestMapping("/admin_main")
	public String admin_main() {
		return "admin_main";
	}
	
	/*@RequestMapping(value="/loginForm.do", method=RequestMethod.POST)
	public String loginFormPost(HttpServletRequest request, HttpSession session) {
		
		String msg = (String) request.getAttribute("msg");
	    
		if ( msg != null)
			request.setAttribute("message", msg);
		else
			request.setAttribute("message", "id,패스워드를 확인하세요");
		return "/user/loginForm";
	}
	*/
	@RequestMapping(value="/loginForm.do", method=RequestMethod.GET)
	public String loginFormGet(HttpServletRequest request, HttpSession session) {
		
		String msg = (String) request.getParameter("msg");
	    
		if ( msg != null)
			request.setAttribute("message", msg);
		else
			request.setAttribute("message", "id,패스워드를 확인하세요");
		return "/user/loginForm";
	}
	
	
	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest request, HttpSession session) {
	    
	    request.setAttribute("message", "로그아웃 되었습니다 다시로그인하세요");
	    
	    request.getSession(false).invalidate();
	    
		return "/user/loginForm";
	}

}

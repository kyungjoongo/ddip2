package blueberry.interceptor;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;


public class LoginInterceptor implements HandlerInterceptor {

	

    
    @Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object object) throws Exception {
		System.out.println("preHandle=============>");
    		String ctx=request.getContextPath();

		
		String reqUrl = request.getRequestURL().toString();
		
		String[] arrReqUrl2 = reqUrl.split("/");

		//Intercetor exclude-uri 패턴 정의 부분.
		if(arrReqUrl2[4].equals("login.do") || arrReqUrl2[4].equals("loginForm.do") ){

		    //인터셉트하지 않고 그대로 진행
			return true;
			
		}//세션이 없는 경우 로그인 페이지로 re다이렉트 한다.
		else{
		//############################################################
		//login.do를 loginForm.do 제외한 엑션은 여기서 intercept하여 일단 처리한다.
   	        //###########################################################
			try {
				if (request.getSession().getAttribute("loginSession") == null) {
				    
					
					response.sendRedirect(ctx+ "/loginForm.do?msg="+ "wrong access!" );
					
					return false;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			return true;
			
		}

	}

	

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object object,
			ModelAndView modelAndView) throws Exception {

	    
	    System.out.println("post Handler");
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object object, Exception exception)
			throws Exception {
	    
	    
	   System.out.println("intercept afterCompletion----------->^_^");

	}

	
	
}
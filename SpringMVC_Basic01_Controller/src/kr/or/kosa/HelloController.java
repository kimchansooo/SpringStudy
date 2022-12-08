package kr.or.kosa;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;



public class HelloController implements Controller{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("HelloController 요청 실행 : handleRequest 함수 실행");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("name" , "kosauser");
		mav.setViewName("Hello");
		//InternalResourceViewResolver에 의해서 주소가 조합된다.
		//    /WEB-INF/views/ + Hello + .jsp
	    //    /WEB-INF/views/Hello.jsp
		return mav;
	}

}

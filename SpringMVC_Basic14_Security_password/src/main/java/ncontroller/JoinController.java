package ncontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import service.JoinService;
import vo.Member;

@Controller
@RequestMapping("/joinus/")
public class JoinController {

	//joinservice  의존
	@Autowired
	private JoinService joinservice;
	
	

	
	//GET 요청 
	//join.jsp 화면처리
	@GetMapping("join.htm")
	public String join() {
		//return "join.jsp";
		return "joinus/join";
		//  /WEB-INF/views/joinus/join.jsp
				
	}
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	
	//POST 요청
	@PostMapping("join.htm")
	public String join(Member member) {
		System.out.println(member.toString());
		member.setPwd(this.bCryptPasswordEncoder.encode(member.getPwd()));
		joinservice.insertMember(member);
		try {
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/index.htm";
		//http://localhost:8090/SpringMVC/joinus/join.htm
		//return "redirect:/index.htm"; 처리하면
		//http://localhost:8090/SpringMVC/index.htm
    }
	
	//로그인 요청
	@GetMapping(value="login.htm")
	public String login() {
		return "joinus/login";
	}
}
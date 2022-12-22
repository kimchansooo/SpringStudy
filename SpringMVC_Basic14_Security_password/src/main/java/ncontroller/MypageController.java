package ncontroller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import service.MemberService;
import vo.Member;

@Controller
@RequestMapping("/customer/")
public class MypageController {
	
	
	private MemberService memberservice;
	
	@Autowired
	public void setMemberService(MemberService memberservice) {
		this.memberservice=memberservice;
	}
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@GetMapping("memberConfirm.htm")
	public String Mypage() {
		return "customer/memberConfirm";
	}
	
	@RequestMapping(value="memberConfirm.htm",method=RequestMethod.POST)
	public String memberConfirm(@RequestParam("password") String password,	Principal principal){
		String viewpage="";
		
		//회원정보
		System.out.println(1);
		Member member = memberservice.getMember(principal.getName());
		System.out.println(2);
		System.out.println(member);
		
		//DB에서 가져온 암호화된 문자열
		String encodedPassword = member.getPwd();
		
		System.out.println("rowPassword : "+password );
		System.out.println("encodepassword : " + encodedPassword);
		
		boolean result = bCryptPasswordEncoder.matches(password, encodedPassword);
		
		if(result){
			viewpage="redirect:memberUpdate.htm";
		}else{
			viewpage="redirect:memberConfirm.htm";
		}
		
		return viewpage;
	}
	
	@RequestMapping(value="memberUpdate.htm", method=RequestMethod.GET)
	public String memberUpdate(Model model, Principal principal){
		Member member = memberservice.getMember(principal.getName());
		model.addAttribute("member", member);
		return "customer/memberUpdate";
	}
	
	@RequestMapping(value="memberUpdate.htm", method=RequestMethod.POST)
	public String memberUpdate(Model model, Member member, Principal principal){
		
		Member updatemember = memberservice.getMember(principal.getName());
		
		updatemember.setName(member.getName());
		updatemember.setCphone(member.getCphone());
		updatemember.setEmail(member.getEmail());
		updatemember.setPwd(bCryptPasswordEncoder.encode(member.getPwd()));
		memberservice.updateMember(updatemember);
		return "redirect:/index.htm";
	}
	
}

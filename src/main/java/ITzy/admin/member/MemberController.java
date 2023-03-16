package ITzy.admin.member;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import ITzy.admin.dto.BbsDto;
import ITzy.admin.dto.MemberDto;
import ITzy.admin.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	MemberService service;
	
	@RequestMapping(value = "login.do", method = RequestMethod.GET)
	public String login() {
//		System.out.println("MemberController login " + new Date());
		return "login/login";
	}
	
	@RequestMapping(value = "regi.do", method = RequestMethod.GET)
	public String regi() {
//		System.out.println("MemberController regi " + new Date());
		return "login/regi";
	}
	@RequestMapping(value = "main.do", method = RequestMethod.GET)
	public String main() {
//		System.out.println("MemberController main " + new Date());
		return "main";
	}
	@RequestMapping(value = "members.do", method = RequestMethod.GET)
	public String members(Model model) {
//		System.out.println("MemberController members " + new Date());
		List<MemberDto> list = service.allMember();
		model.addAttribute("allmem", list);
		return "members";
	}
	
	@RequestMapping(value = "bulletins.do", method = RequestMethod.GET)
	public String bulletins() {
//		System.out.println("MemberController bulletins " + new Date());
		return "bulletins";
	}
	
	@RequestMapping(value = "recruits.do", method = RequestMethod.GET)
	public String recruits() {
//		System.out.println("MemberController recruits " + new Date());
		return "recruits";
	}
	
	@ResponseBody
	@RequestMapping(value = "idcheck.do", method = RequestMethod.POST)
	public String idcheck(String id) {
//		System.out.println("MemberController idcheck " + new Date());
		
		boolean isS = service.idCheck(id);
		if(isS) {
			return "NO";		// id가 있음
		}
		return "YES";			// id가 없음
	}	
	
	
	@RequestMapping(value = "regiAf.do", method = RequestMethod.POST)
	public String regiAf(Model model, MemberDto dto) {
//		System.out.println("MemberController regiAf " + new Date());
		boolean isS = service.addMember(dto);
		String message = "";
		if (isS) {
			message = "MEMBER_ADD_YES";
		}else {
			message = "MEMBER_ADD_NO";
		}
		model.addAttribute("message", message);
		return "message";
	}
	
	@RequestMapping(value = "loginAf.do", method = RequestMethod.POST)
	public String loginAf(HttpServletRequest req, Model model,MemberDto dto) {
//		System.out.println("MemberController login " + new Date());
		
		MemberDto mem = service.login(dto);
		String msg ="";
		if (mem != null) {
			req.getSession().setAttribute("login", mem);
			req.getSession().setMaxInactiveInterval(1800);//세션 기본 30분
			msg = "LOGIN_OK"; 
			System.out.println();
		}else {
			msg = "LOGIN_FAIL"; 
			System.out.println();
		}
		model.addAttribute("login",msg);
		return "message";
	}

	
	// session check
	@RequestMapping(value = "sessionOut.do", method = RequestMethod.GET)
	public String sessionOut(Model model) {
		String sessionOut = "logout";
		model.addAttribute("sessionOut", sessionOut);
		return "message";
	}
	
	
	@RequestMapping(value = "modifyName.do", method = RequestMethod.POST)
	public String modifyName(MemberDto dto,Model model) {
//		System.out.println("MemberController modifyName " + new Date());
		String msg ="";
		boolean isS = service.modifyName(dto);
		if(isS) {
			msg = "YES";		// 변경성공
		}else {
			msg = "NO"; 		// 변경실패
		}
		model.addAttribute("nameUpdate",msg);
		return "message";		
	}	
	
	@RequestMapping(value = "modifyEmail.do", method = RequestMethod.POST)
	public String modifyEmail(MemberDto dto,Model model) {
//		System.out.println("MemberController modifyEmail " + new Date());
		String msg ="";
		boolean isS = service.modifyEmail(dto);
		if(isS) {
			msg = "YES";		// 변경성공
		}else {
			msg = "NO"; 		// 변경실패
		}
		model.addAttribute("modifyEmail",msg);
		return "message";		
	}	
	
	@RequestMapping(value = "modifyContact.do", method = RequestMethod.POST)
	public String modifyContact(MemberDto dto,Model model) {
//		System.out.println("MemberController modifyContact " + new Date());
		String msg ="";
		boolean isS = service.modifyContact(dto);
		if(isS) {
			msg = "YES";		// 변경성공
		}else {
			msg = "NO"; 		// 변경실패
		}
		model.addAttribute("modifyContact",msg);
		return "message";		
	}	
	
	
	@RequestMapping(value = "modifyAuth.do", method = RequestMethod.POST)
	public String modifyAuth(MemberDto dto,Model model) {
//		System.out.println("MemberController modifyContact " + new Date());
		String msg ="";
		boolean isS = service.modifyAuth(dto);
		if(isS) {
			msg = "YES";		// 변경성공
		}else {
			msg = "NO"; 		// 변경실패
		}
		model.addAttribute("modifyAuth",msg);
		return "message";		
	}	
	
	
}

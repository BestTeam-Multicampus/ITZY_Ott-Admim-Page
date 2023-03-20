package ITzy.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ITzy.admin.dto.MemoDto;
import ITzy.admin.service.MemoService;

@Controller
public class MemoController {
	
	@Autowired
	MemoService service;
	
	@RequestMapping(value = "memo.do",method = RequestMethod.GET)
	public String qnalist(Model model,HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		MemoDto login = (MemoDto)session.getAttribute("login");
		String id=login.getId();
		
		List<MemoDto> memo = service.myMemo(id);
		model.addAttribute("memo", memo);
		
		return "memo";
	}

	
	
}

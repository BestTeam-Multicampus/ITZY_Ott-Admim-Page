package ITzy.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import ITzy.admin.service.MemoService;

@Controller
public class MemoController {
	
	@Autowired
	MemoService service;
	
	

}

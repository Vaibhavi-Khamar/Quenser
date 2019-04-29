package edu.neu.project.web;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.neu.project.service.QuestionService;
import edu.neu.project.service.UsrService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private UsrService usrService;
	
	@Autowired
	private QuestionService questService;
	
	@RequestMapping(value = "/viewUsers")
	public String viewUsers(Model model,Principal principal) {
		model.addAttribute("userList",usrService.listUsr());
		model.addAttribute("usr",usrService.getUserbyEmail(principal.getName()));
		return "viewUsers";
	}
		
}

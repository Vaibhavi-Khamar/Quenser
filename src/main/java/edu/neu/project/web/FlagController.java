package edu.neu.project.web;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.neu.project.domain.Question;
import edu.neu.project.domain.Usr;
import edu.neu.project.service.QuestionService;
import edu.neu.project.service.UsrService;

@Controller
@RequestMapping("/flag")
public class FlagController {
     @Autowired
     QuestionService questService;
     @Autowired
     UsrService usrService;
	
     @RequestMapping()
     public String getFlaggedQuest(Model model, Principal principal) {
 		Usr user = usrService.getUserbyEmail(principal.getName());
 		List<Question> flagList = questService.getFlaggedQuestion();
 		model.addAttribute("usr", user);
 		model.addAttribute("ques", flagList);
 		return "flagedQues";
 	 }
     
     @RequestMapping("/unflag/{id}")
 	 public String unFlagQuest(Model model, Principal principal,@PathVariable long id) {
 		Question quest = questService.getQuestionbyID(id);
 		quest.setFlag(false);
 		questService.saveOrUpdate(quest);
 		return "redirect:/flag";
 	}
}

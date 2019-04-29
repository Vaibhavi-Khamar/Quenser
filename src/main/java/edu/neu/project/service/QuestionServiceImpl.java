package edu.neu.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.neu.project.dao.QuestionDAO;
import edu.neu.project.domain.Answer;
import edu.neu.project.domain.Question;
import edu.neu.project.domain.Usr;

@Service
public class QuestionServiceImpl implements QuestionService {
	
	@Autowired
	QuestionDAO quesDAO;
	
	@Autowired
	UsrService usrService;
	
	@Autowired
	AnswerService ansService;

	@Override	
	public List<Question> getAllQuestions() {
		return quesDAO.getAllQuestions();
	}

	@Override
	@Transactional
	public Question getQuestionbyID(Long id) {
		return quesDAO.getQuestionbyID(id);
	}

	@Override
	@Transactional
	public void saveOrUpdate(Question question) {
		quesDAO.saveOrUpdate(question);
		
	}

	@Override
	@Transactional
	public void deleteQuestion(Long id) {
		quesDAO.deleteQuestion(id);
		
	}
	
	@Override
	@Transactional
	public void removeQuestion(Long id) { 
		Question quest = getQuestionbyID(id);  		
		List<Answer> ansList = ansService.getAnswerbyQues(id); 
		List<Usr> allUsrs = (List<Usr>) usrService.listUsr();
		for(Usr us: allUsrs) {
			us.getAnswer().removeAll(ansList);
		}
		Usr user = quest.getUser();
		quest.getAnswers().clear();
		user.getQuestion().remove(quest);
		deleteQuestion(id);
		usrService.saveorUpdate(user);
			
	}

	@Override
	@Transactional
	public boolean flagQuestion(long id) {
		Question quest = quesDAO.getQuestionbyID(id);
		quest.setFlag(true);
		quesDAO.saveOrUpdate(quest);
		return true;
	}

	@Override
	@Transactional
	public List<Question> getFlaggedQuestion() {
		List<Question> flagedList = quesDAO.getFlaggedQuestion();
		return flagedList;
	}
	

}

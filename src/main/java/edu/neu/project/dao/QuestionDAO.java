package edu.neu.project.dao;

import java.util.List;

import edu.neu.project.domain.Question;

public interface QuestionDAO {
	public List<Question> getAllQuestions();
	public Question getQuestionbyID(Long id);
	public void saveOrUpdate(Question question);
	public void deleteQuestion(Long id);
	public List<Question> getFlaggedQuestion();
	
}

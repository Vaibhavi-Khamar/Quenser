package edu.neu.project.service;

import java.util.List;

import edu.neu.project.domain.Question;

public interface QuestionService {
	public List<Question> getAllQuestions();
	public Question getQuestionbyID(Long id);
	public void saveOrUpdate(Question question);
	public void deleteQuestion(Long id);
	public void removeQuestion(Long id);
	public boolean flagQuestion(long id);
	public List<Question> getFlaggedQuestion();

}

package edu.neu.project.service;

import java.util.List;

import edu.neu.project.domain.Answer;

public interface AnswerService {
	public Answer getAnswer(long id);
	public List<Answer> getAnswerbyUser(long id);
	public List<Answer> getAnswerbyQues(long id);
}

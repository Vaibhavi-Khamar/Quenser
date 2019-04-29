package edu.neu.project.dao;

import java.util.List;

import edu.neu.project.domain.Answer;

public interface AnswerDAO {
	public Answer getAnswer(long id);
	public List<Answer> getAnswerbyUser(long id);
	public List<Answer> getAnswerbyQues(long id);

}

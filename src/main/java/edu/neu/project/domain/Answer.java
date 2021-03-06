package edu.neu.project.domain;

import java.util.concurrent.atomic.AtomicLong;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
//@Table(name = "Answer")
public class Answer {
	
	@Id
	@GeneratedValue
	private Long answerId;
	
	private String answerText;
	private static AtomicLong idSequence = new AtomicLong();
	
	@ManyToOne
	@JoinColumn(name = "questionID")
	private Question question;
	
	@ManyToOne
	@JoinColumn(name = "userID")
	private Usr user;
		
	public Long getAnswerId() {
		return answerId;
	}
	public void setAnswerId(Long answerId) {
		this.answerId = answerId;
	}
	public String getAnswerText() {
		return answerText;
	}
	public void setAnswerText(String answerText) {
		this.answerText = answerText;
	}
	public Question getQuestion() {
		return question;
	}
	public void setQuestion(Question question) {
		this.question = question;
	}
	public Usr getUser() {
		return user;
	}
	public void setUser(Usr usr) {
		this.user = usr;
	}
		
}

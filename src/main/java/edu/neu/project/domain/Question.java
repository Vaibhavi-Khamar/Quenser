package edu.neu.project.domain;

import java.util.ArrayList;
import java.util.List;

import java.util.concurrent.atomic.AtomicLong;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
//@Table(name = "Question")
public class Question {
	
	@Id
	@GeneratedValue
	private Long questionId;
	private static AtomicLong idSequence = new AtomicLong();
	
	@NotEmpty
	private String questionTitle;
	private String questionDesc;
	private String comments; 
	
	@ManyToOne
	@JoinColumn(name = "userId")
	private Usr user;
	
	private boolean flag = false;
	
	@OneToMany(cascade = {CascadeType.ALL},mappedBy = "question",fetch = FetchType.EAGER,orphanRemoval=true)
	private List<Answer> answers= new ArrayList<Answer>();
		
	public Long getQuestionId() {
		return questionId;
	}
	public void setQuestionId(Long questionId) {
		this.questionId = questionId;
	}
	public String getQuestionTitle() {
		return questionTitle;
	}
	public void setQuestionTitle(String questionTitle) {
		this.questionTitle = questionTitle;
	}
	public String getQuestionDesc() {
		return questionDesc;
	}
	public void setQuestionDesc(String questionDesc) {
		this.questionDesc = questionDesc;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public List<Answer> getAnswers() {
		return answers;
	}
	public void setAnswers(List<Answer> answers) {
		this.answers = answers;
	}
	public Usr getUser() {
		return user;
	}
	public void setUser(Usr user) {
		this.user = user;
	}	
	public boolean getFlag() {
		return flag;
	}
	public void setFlag(boolean flag) {
		this.flag = flag;
	}
	@Override
	public String toString() {
		return "Question [questionId=" + questionId + ", questionTitle=" + questionTitle + ", questionDesc="
				+ questionDesc + ", comments=" + comments + ",  user=" + user + ", flag=" + flag + "]";
	}
		
}

package edu.neu.project.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.neu.project.domain.Answer;

@Repository
public class AnswerDAOImpl implements AnswerDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	

	@Override
	public Answer getAnswer(long id) {
		return (Answer) sessionFactory.getCurrentSession().get(Answer.class, id);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Answer> getAnswerbyUser(long id) {
		List<Answer> ansList = new ArrayList<Answer>();
		String query = "from Answer where userID=?";
		ansList = sessionFactory.getCurrentSession().createQuery(query).setParameter(0, id).list();
//		System.out.println("-------------");
//		System.out.println(ansList.size());
//		System.out.println("-------------");
		return ansList;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Answer> getAnswerbyQues(long id) {
		List<Answer> ansList = new ArrayList<Answer>();
		String query = "from Answer where questionID=?";
		ansList = sessionFactory.getCurrentSession().createQuery(query).setParameter(0, id).list();
		System.out.println("-------------");
		System.out.println(ansList.size());
		System.out.println("-------------");
		return ansList;
	}

}

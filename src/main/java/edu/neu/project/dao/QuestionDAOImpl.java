package edu.neu.project.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.neu.project.domain.Question;

@Repository
public class QuestionDAOImpl implements QuestionDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Question> getAllQuestions() {
		return sessionFactory.getCurrentSession().createQuery("from Question").list();
		
	}

	@Override
	public Question getQuestionbyID(Long id) {
		
		List<Question> quesList = new ArrayList<Question>();
		String querry = "from Question where questionId=?";	
		quesList = sessionFactory.getCurrentSession().createQuery(querry).setParameter(0, id).list();	
		if(quesList.size() >0) {
			return quesList.get(0);
		}
		else {
			return null;
		}
	}

	@Override
	public void saveOrUpdate(Question question) {
		sessionFactory.getCurrentSession().saveOrUpdate(question);
		sessionFactory.getCurrentSession().flush();
	}

	@Override
	public void deleteQuestion(Long id) {
		sessionFactory.getCurrentSession().delete(getQuestionbyID(id));
		sessionFactory.getCurrentSession().flush();
	}

	@Override
	public List<Question> getFlaggedQuestion() {
		List<Question> quesList = new ArrayList<Question>();
		String query = "from Question where flag=?";		
		quesList = sessionFactory.getCurrentSession().createQuery(query).setParameter(0, true).list();		
		return quesList;
	}

}

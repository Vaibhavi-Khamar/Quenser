package edu.neu.project.dao;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import edu.neu.project.domain.Usr;

import org.hibernate.SessionFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UsrDAOImpl implements UsrDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	
	@Override
	public void addUsr(Usr usr) {
		System.out.println("--------");
		sessionFactory.getCurrentSession().save(usr);
		System.out.println("--------");
	}

	@Override
	public Collection<Usr> listUsr() {
		return sessionFactory.getCurrentSession().createQuery("from Usr").list();
	}

	@Override
	public Usr getUser(Long id) {
	
		List<Usr> userList = new ArrayList<Usr>();
		String querry = "from Usr where userId=?";		
		userList = sessionFactory.getCurrentSession().createQuery(querry).setParameter(0, id).list();	
		if(userList.size() >0) {			
			return userList.get(0);
		}
		else {
			return null;
		}
	}
	
	@Override
	public void saveorUpdate(Usr usr) {
		
		sessionFactory.getCurrentSession().saveOrUpdate(usr);
		sessionFactory.getCurrentSession().flush();
	}

	@SuppressWarnings("unchecked")
	@Override
	public Usr getUserbyEmail(String email) {
		
		List<Usr> userList = new ArrayList<Usr>();
		String query = "from Usr where email=?";		
		userList = sessionFactory.getCurrentSession().createQuery(query).setParameter(0, email).list();		
		if(userList.size() >0) {
			return userList.get(0);
		}
		else {
			return null;
		}		
	}
	
	@Override
	public void deleteUser(Long id) {
		sessionFactory.getCurrentSession().delete(getUser(id));		
	}
	
}

package com.web.beacon.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.transaction.annotation.Transactional;

public class UserDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	public UserDAO(){
		super();
	}
	
	public UserDAO(SessionFactory sessionFactory) {
		super();
		this.sessionFactory = sessionFactory;
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional
	public User getUser(User user){
		String hql = "from User where uname='"+user.getUname()+
				"' AND password ='"+user.getPassword()+"' AND role='"+user.getRole()+"'";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		List<User> listUser = (List<User>)query.list();
		
		if(listUser!=null&&!listUser.isEmpty()){
			return listUser.get(0);
		}
		return null;
	}
	
	@Transactional
	public User getUserById(String un){
		String hql = "from User where uname='"+un+"'";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		List<User> listUser = (List<User>)query.list();
		
		if(listUser!=null&&!listUser.isEmpty()){
			return listUser.get(0);
		}
		return null;
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<User> getAllUsers(){
		List<User> listUser = (List<User>)sessionFactory.getCurrentSession()
				.createCriteria(User.class)
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		return listUser;
	}
	
	@Transactional
	public void saveUser(User e){
		sessionFactory.getCurrentSession().saveOrUpdate(e);
	}

	@Transactional
	public void updateUser(User e){
		sessionFactory.getCurrentSession().saveOrUpdate(e);
	}
	
	@Transactional
	public void deleteUser(User userToDelete){
		sessionFactory.getCurrentSession().delete(userToDelete);
	}
}

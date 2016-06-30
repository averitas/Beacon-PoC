package com.web.beacon.model;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;


public class PatientDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public PatientDAO(){
		super();
	}
	
	public PatientDAO(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public Patient getPat(String id){
		String hql = "from Patient where uname='"+id+"'";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		List<Patient> listUser = (List<Patient>)query.list();
		
		if(listUser!=null&&!listUser.isEmpty()){
			return listUser.get(0);
		}
		return null;
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Patient> getAllPats(){
		List<Patient> listUser = (List<Patient>)sessionFactory.getCurrentSession()
				.createCriteria(Patient.class)
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		return listUser;
	}
	
	@Transactional
	public void savePatient(Patient e){
		sessionFactory.getCurrentSession().saveOrUpdate(e);
	}

	@Transactional
	public void updatePatient(Patient e){
		sessionFactory.getCurrentSession().saveOrUpdate(e);
	}
	
	@Transactional
	public void deletePatient(Patient userToDelete){
		sessionFactory.getCurrentSession().delete(userToDelete);
	}
}

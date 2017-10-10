package xyb.dao.impl;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import xyb.dao.UserDao;
import xyb.entity.User;

@Repository
@Transactional
public class UserDaoImpl implements UserDao{

	@Autowired
	private SessionFactory sessionFactory; 
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	
	public User getUser(String username,int type) {
		String hql="from User user where user.username="+username+"and user.type="+type;
		User user=(User)sessionFactory.getCurrentSession().createQuery(hql).uniqueResult();
		return user;
	}

}

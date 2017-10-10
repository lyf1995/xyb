package xyb.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import xyb.dao.CompanyDao;
import xyb.dao.UserDao;
import xyb.entity.CompanyInfo;
import xyb.entity.User;
import xyb.service.UserService;

@Service
@Repository
@Transactional
public class UserServiceImpl implements UserService{
	@Autowired 
	private UserDao userDao;
	public UserDao getUserDao() {
		return userDao;
	}
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	public User getUser(String username,int type) {
		User user=this.userDao.getUser(username,type);
		return user;
	}
}

package xyb.dao;

import xyb.entity.User;

public interface UserDao {

	User getUser(String username, int type);

}

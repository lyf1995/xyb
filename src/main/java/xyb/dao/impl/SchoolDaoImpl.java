package xyb.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import xyb.dao.SchoolDao;
import xyb.entity.CompanyInfo;
import xyb.entity.Contact;
import xyb.entity.HasRecruit;
import xyb.entity.Post;
import xyb.entity.RecPost;
import xyb.entity.Recruit;
import xyb.entity.SchoolInfo;
import xyb.entity.User;

@Repository
@Transactional
public class SchoolDaoImpl implements SchoolDao{
	@Autowired
	private SessionFactory sessionFactory; 
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	public SchoolInfo login(String username,String password){
		String hql="from SchoolInfo schoolInfo where schoolInfo.username=:username and schoolInfo.password=:password";
		SchoolInfo schoolInfo=(SchoolInfo)sessionFactory.getCurrentSession().createQuery(hql).setString("username", username).setString("password", password).uniqueResult();
		return schoolInfo;
	}
	public SchoolInfo schoolInfoById(int id) {
		String hql="from SchoolInfo schoolInfo where schoolInfo.id="+id;
		SchoolInfo schoolInfo=(SchoolInfo)sessionFactory.getCurrentSession().createQuery(hql).uniqueResult();
		return schoolInfo;
	}
	public void editSchoolInfo(SchoolInfo schoolInfo, int id) {
		String hql="update SchoolInfo schoolInfo set schoolInfo.schName='"+schoolInfo.getSchName()+"'," + "schoolInfo.schContacts='"
				  + schoolInfo.getSchContacts() + "'," + "schoolInfo.contactsSex='"
				  + schoolInfo.getContactsSex() + "'," + "schoolInfo.schEmail='"
				  + schoolInfo.getSchEmail() + "'," + "schoolInfo.schAddress='"
				  + schoolInfo.getSchAddress() + "'," + "schoolInfo.schProfile='"
				  + schoolInfo.getSchProfile()+ "'," + "schoolInfo.schLogo='"
				  + schoolInfo.getSchLogo()+ "'where schoolInfo.id="+id;
		sessionFactory.getCurrentSession().createQuery(hql).executeUpdate();
	}
	public List<Recruit> schoolRecruit(int id) {
		String hql="from Recruit recruit where recruit.schoolInfo.id="+id+"order by recruit.releaseTime desc";
		@SuppressWarnings("unchecked")
		List<Recruit> recruits=sessionFactory.getCurrentSession().createQuery(hql).list();
		return recruits;
	}
	public void addRecruit(Recruit recruit) {
		sessionFactory.getCurrentSession().save(recruit);
	}
	public void editRecruit(Recruit recruit, Integer recruitId) {
		String hql="update Recruit recruit set recruit.recruitName='"+recruit.getRecruitName()+"'," + "recruit.startTime='"
				  + recruit.getStartTime() + "'," + "recruit.endTime='"
				  + recruit.getEndTime() + "'," + "recruit.address='"
				  + recruit.getAddress() + "'," + "recruit.recruitDetail='"
				  + recruit.getRecruitDetail() + "'where recruit.id="+recruitId;
		sessionFactory.getCurrentSession().createQuery(hql).executeUpdate();
		
	}
	public Recruit getRecruitById(Integer recruitId) {
		String hql="from Recruit recruit where recruit.id="+recruitId;
		Recruit recruit=(Recruit)sessionFactory.getCurrentSession().createQuery(hql).uniqueResult();
		return recruit;
	}
	public void deleteRecruit(Integer recruitId) {
		String hql ="delete Recruit recruit where recruit.id="+recruitId;    
		sessionFactory.getCurrentSession().createQuery(hql).executeUpdate();
	}
	public List<Post> searchPost() {
		String hql="from Post post order by post.postTime desc";
		@SuppressWarnings("unchecked")
		List<Post> posts=(List<Post>)sessionFactory.getCurrentSession().createQuery(hql).list();
		return posts;
	}
	public List<HasRecruit> getHasRecruitById(Integer recruitId) {
		String hql="from HasRecruit hasRecruit where hasRecruit.recruit.id="+recruitId+"order by hasRecruit.sendTime desc";
		@SuppressWarnings("unchecked")
		List<HasRecruit> hasRecruits=(List<HasRecruit>)sessionFactory.getCurrentSession().createQuery(hql).list();
		return hasRecruits;
	}
	public CompanyInfo getCompanyInfoById(Integer companyInfoId) {
		String hql="from CompanyInfo companyInfo where companyInfo.id="+companyInfoId;
		CompanyInfo companyInfo=(CompanyInfo)sessionFactory.getCurrentSession().createQuery(hql).uniqueResult();
		return companyInfo;
	}
	public HasRecruit getHasRecruitByDoubleId(Integer companyInfoId, Integer recruitId) {
		String hql="from HasRecruit hasRecruit where hasRecruit.companyInfo.id="+companyInfoId+"and hasRecruit.recruit.id="+recruitId;
		HasRecruit hasRecruit=(HasRecruit)sessionFactory.getCurrentSession().createQuery(hql).uniqueResult();
		return hasRecruit;
	}
	public void recruitStatus(Integer companyInfoId, Integer recruitId, String status) {
		String hql="update HasRecruit hasRecruit set hasRecruit.status='"+status+"'where hasRecruit.companyInfo.id="+companyInfoId+"and hasRecruit.recruit.id="+recruitId;
		sessionFactory.getCurrentSession().createQuery(hql).executeUpdate();
	}
	public Post searchPostsDetailed(Integer postId) {
		String hql="from Post post where post.id="+postId;
		Post post=(Post)sessionFactory.getCurrentSession().createQuery(hql).uniqueResult();
		return post;
	}
	public RecPost hasRecommendPost(Integer postId, Integer schoolId) {
		String hql="from RecPost recPost where recPost.post.id="+postId+"and recPost.schoolInfo.id="+schoolId;
		RecPost recPost=(RecPost)sessionFactory.getCurrentSession().createQuery(hql).uniqueResult();
		return recPost;
	}
	public void recommendPost(RecPost recPost) {
		sessionFactory.getCurrentSession().save(recPost);
	}
	public User getUser(String username, int type) {
		String hql="from User user where user.username="+username+"and user.type="+type;
		User user=(User)sessionFactory.getCurrentSession().createQuery(hql).uniqueResult();
		return user;
	}
	public List<Contact> getContacts(User sendUser, User receiveUser) {
		String hql="from Contact contact where contact.sendUser.id="+sendUser.getId()+" and contact.receiveUser.id="+receiveUser.getId()+"or contact.sendUser.id="+receiveUser.getId()+"and contact.receiveUser.id="+sendUser.getId()+" order by contact.time asc";
		@SuppressWarnings("unchecked")
		List<Contact> contacts=(List<Contact>)sessionFactory.getCurrentSession().createQuery(hql).list();
		return contacts;
	}
	public void sendContacts(Contact contact) {
		sessionFactory.getCurrentSession().save(contact);
	}
	
}

package xyb.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import xyb.dao.CompanyDao;
import xyb.entity.CompanyInfo;
import xyb.entity.Contact;
import xyb.entity.HasPost;
import xyb.entity.HasRecruit;
import xyb.entity.Post;
import xyb.entity.Recruit;
import xyb.entity.SchoolInfo;
import xyb.entity.StudentInfo;
import xyb.entity.User;

@Repository
@Transactional
public class CompanyDaoImpl implements CompanyDao{
	@Autowired
	private SessionFactory sessionFactory; 
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public CompanyInfo login(String username,String password){
		String hql="from CompanyInfo companyInfo where companyInfo.username=:username and companyInfo.password=:password";
		CompanyInfo companyInfo=(CompanyInfo)sessionFactory.getCurrentSession().createQuery(hql).setString("username", username).setString("password", password).uniqueResult();
		return companyInfo;
	}
	public CompanyInfo companyInfoById(int id) {
		String hql="from CompanyInfo companyInfo where companyInfo.id="+id;
		CompanyInfo companyInfo=(CompanyInfo) sessionFactory.getCurrentSession().createQuery(hql).uniqueResult();
		return companyInfo;
	}
	public void editCompanyInfo(CompanyInfo companyInfo, int id) {
		String hql="update CompanyInfo companyInfo set companyInfo.comName='"+companyInfo.getComName()+"'," + "companyInfo.comContacts='"
				  + companyInfo.getComContacts() + "'," + "companyInfo.contactsSex='"
				  + companyInfo.getContactsSex() + "'," + "companyInfo.comIndustry='"
				  + companyInfo.getComIndustry() + "'," + "companyInfo.comEmail='"
				  + companyInfo.getComEmail() + "'," + "companyInfo.comAddress='"
				  + companyInfo.getComAddress()+ "'," + "companyInfo.comProfile='"
				  + companyInfo.getComProfile()+ "'," + "companyInfo.comLogo='"
				  + companyInfo.getComLogo()+ "'where companyInfo.id="+id;
		sessionFactory.getCurrentSession().createQuery(hql).executeUpdate();
	}
	public List<Post> jobManager(int id) {
		String hql="from Post post where post.companyInfo.id="+id+"order by post.postTime desc";
		@SuppressWarnings("unchecked")
		List<Post> posts=sessionFactory.getCurrentSession().createQuery(hql).list();
		return posts;
	}
	public void addPost(Post post) {
		sessionFactory.getCurrentSession().save(post);
	}
	public Post getPostById(Integer postId) {
		String hql="from Post post where post.id="+postId;
		Post post=(Post) sessionFactory.getCurrentSession().createQuery(hql).uniqueResult();
		return post;
	}
	public void editPost(Post post,Integer postId) {
		String hql="update Post post set post.postName='"+post.getPostName()+"'," + "post.jobNature='"
				  + post.getJobNature() + "'," + "post.postSalary='"
				  + post.getPostSalary() + "'," + "post.jobExp='"
				  + post.getJobExp() + "'," + "post.postNumber='"
				  + post.getPostNumber() + "'," + "post.education='"
				  + post.getEducation()+ "'," + "post.postMajor='"
				  + post.getPostMajor()+ "'," + "post.gwfl='"
				  + post.getGwfl()+ "'," + "post.gwzz='"
				  + post.getGwzz()+ "'," + "post.gwyq='"
				  + post.getGwyq()+ "'where post.id="+postId;
		sessionFactory.getCurrentSession().createQuery(hql).executeUpdate();
	}
	public void deletePost(Integer postId) {
		String hql ="delete Post post where post.id="+postId;    
		sessionFactory.getCurrentSession().createQuery(hql).executeUpdate();
	}
	public List<Recruit> companyRecruit() {
		String hql="from Recruit recruit order by recruit.releaseTime desc";
		@SuppressWarnings("unchecked")
		List<Recruit> recruits=(List<Recruit>)sessionFactory.getCurrentSession().createQuery(hql).list();
		return recruits;
	}
	public List<HasPost> getHasPostById(Integer postId) {
		String hql="from HasPost hasPost where hasPost.post.id="+postId+"order by hasPost.sendTime desc";
		@SuppressWarnings("unchecked")
		List<HasPost> hasPosts=(List<HasPost>)sessionFactory.getCurrentSession().createQuery(hql).list();
		return hasPosts;
	}
	public StudentInfo getStudentInfoById(Integer studentId) {
		String hql="from StudentInfo studentInfo where studentInfo.id="+studentId;
		StudentInfo studentInfo=(StudentInfo)sessionFactory.getCurrentSession().createQuery(hql).uniqueResult();
		return studentInfo;
	}
	public void postStatus(Integer studentId, Integer postId, String postStatus) {
		String hql="update HasPost hasPost set hasPost.status='"+postStatus+"'where hasPost.post.id="+postId+"and hasPost.studentInfo.id="+studentId;
		sessionFactory.getCurrentSession().createQuery(hql).executeUpdate();
	}
	public HasPost getHasPostByDoubleId(Integer studentId, Integer postId) {
		String hql="from HasPost hasPost where hasPost.studentInfo.id="+studentId+" and hasPost.post.id="+postId;
		HasPost hasPost=(HasPost)sessionFactory.getCurrentSession().createQuery(hql).uniqueResult();
		return hasPost;
	}
	public Recruit companyRecruitDetailed(Integer recruitId) {
		String hql="from Recruit recruit where recruit.id="+recruitId;
		Recruit recruit=(Recruit)sessionFactory.getCurrentSession().createQuery(hql).uniqueResult();
		return recruit;
	}
	public HasRecruit getHasRecruit(Integer recruitId, int companyInfoId) {
		String hql="from HasRecruit hasRecruit where hasRecruit.companyInfo.id="+companyInfoId+"and hasRecruit.recruit.id="+recruitId;
		HasRecruit hasRecruit=(HasRecruit)sessionFactory.getCurrentSession().createQuery(hql).uniqueResult();
		return hasRecruit;
	}
	public void applyRecruit(HasRecruit hasRecruit) {
		sessionFactory.getCurrentSession().save(hasRecruit);
	}
	@SuppressWarnings("unchecked")
	public List<HasRecruit> hasRecruit(CompanyInfo companyInfo) {
		String hql="from HasRecruit hasRecruit where hasRecruit.companyInfo.id="+companyInfo.getId();
		List<HasRecruit> hasRecruits=(List<HasRecruit>)sessionFactory.getCurrentSession().createQuery(hql).list();
		return hasRecruits;
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
	public SchoolInfo getSchoolInfoById(Integer schoolId) {
		String hql="from SchoolInfo schoolInfo where schoolInfo.id="+schoolId;
		SchoolInfo schoolInfo=(SchoolInfo)sessionFactory.getCurrentSession().createQuery(hql).uniqueResult();
		return schoolInfo;
	}

}

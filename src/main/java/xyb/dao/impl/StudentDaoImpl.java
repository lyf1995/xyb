package xyb.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import xyb.dao.StudentDao;
import xyb.entity.CompanyInfo;
import xyb.entity.Contact;
import xyb.entity.HasPost;
import xyb.entity.Post;
import xyb.entity.RecPost;
import xyb.entity.StGrjj;
import xyb.entity.StQzyx;
import xyb.entity.StSchoolInfo;
import xyb.entity.StXmjy;
import xyb.entity.StXnzw;
import xyb.entity.StYynl;
import xyb.entity.StudentInfo;
import xyb.entity.User;

@Repository
@Transactional
public class StudentDaoImpl implements StudentDao{
	@Autowired
	private SessionFactory sessionFactory; 
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public StudentInfo login(String username,String password){
		String hql="from StudentInfo studentInfo where studentInfo.username=:username and studentInfo.password=:password";
		StudentInfo studentInfo=(StudentInfo)sessionFactory.getCurrentSession().createQuery(hql).setString("username", username).setString("password", password).uniqueResult();
		return studentInfo;
	}
	
	public StudentInfo studentInfoById(int id) {
		String hql="from StudentInfo studentInfo where studentInfo.id=:id";
		StudentInfo studentInfo=(StudentInfo)sessionFactory.getCurrentSession().createQuery(hql).setInteger("id", id).uniqueResult();
		return studentInfo;
	}
	
	public int editStudentInfo(StudentInfo studentInfo,int id) {
		String hql="update StudentInfo studentInfo set studentInfo.relName='"+studentInfo.getRelName()+"'," + "studentInfo.sex='"
				  + studentInfo.getSex() + "'," + "studentInfo.birth='"
				  + studentInfo.getBirth() + "'," + "studentInfo.tel='"
				  + studentInfo.getTel() + "'," + "studentInfo.email='"
				  + studentInfo.getEmail() + "'," + "studentInfo.address='"
				  + studentInfo.getAddress()+ "'," + "studentInfo.picture='"
				  + studentInfo.getPicture()+ "'where studentInfo.id="+id;
		return sessionFactory.getCurrentSession().createQuery(hql).executeUpdate();
	}
	
	public StSchoolInfo schoolInfo(int id) {
		String hql="from StSchoolInfo stSchoolInfo where stSchoolInfo.studentInfo.id=:id";
		StSchoolInfo stSchoolInfo=(StSchoolInfo)sessionFactory.getCurrentSession().createQuery(hql).setInteger("id", id).uniqueResult();
		return stSchoolInfo;
	}
	
	public int editSchoolInfo(StSchoolInfo stSchoolInfo, int id) {
		String hql="update StSchoolInfo stSchoolInfo set stSchoolInfo.school='"+stSchoolInfo.getSchool()+"'," + "stSchoolInfo.depart='"
				  + stSchoolInfo.getDepart() + "'," + "stSchoolInfo.major='"
				  + stSchoolInfo.getMajor() + "'," + "stSchoolInfo.classes='"
				  + stSchoolInfo.getClasses() + "'," + "stSchoolInfo.no='"
				  + stSchoolInfo.getNo() + "'where stSchoolInfo.studentInfo.id="+id;
		return sessionFactory.getCurrentSession().createQuery(hql).executeUpdate();
	}
	public void addSchoolInfo(StSchoolInfo stSchoolInfo) {	
		sessionFactory.getCurrentSession().save(stSchoolInfo);
	}
	
	public StGrjj stGrjj(int id) {
		String hql="from StGrjj stGrjj where stGrjj.studentInfo.id=:id";
		StGrjj stGrjj=(StGrjj)sessionFactory.getCurrentSession().createQuery(hql).setInteger("id", id).uniqueResult();
		return stGrjj;
	}
	
	public StQzyx stQzyx(int id) {
		String hql="from StQzyx stQzyx where stQzyx.studentInfo.id=:id";
		StQzyx stQzyx=(StQzyx)sessionFactory.getCurrentSession().createQuery(hql).setInteger("id", id).uniqueResult();
		return stQzyx;
	}
	
	public List<StXmjy> stXmjy(int id) {
		String hql="from StXmjy stXmjy where stXmjy.studentInfo.id=:id";
		@SuppressWarnings("unchecked")
		List<StXmjy> stXmjys=(List<StXmjy>)sessionFactory.getCurrentSession().createQuery(hql).setInteger("id", id).list();
		return stXmjys;
	}
	
	public List<StXnzw> stXnzw(int id) {
		String hql="from StXnzw stXnzw where stXnzw.studentInfo.id=:id";
		@SuppressWarnings("unchecked")
		List<StXnzw> stXnzws=(List<StXnzw>)sessionFactory.getCurrentSession().createQuery(hql).setInteger("id", id).list();
		return stXnzws;
	}
	
	public List<StYynl> stYynl(int id) {
		String hql="from StYynl stYynl where stYynl.studentInfo.id=:id";
		@SuppressWarnings("unchecked")
		List<StYynl> stYynls=(List<StYynl>)sessionFactory.getCurrentSession().createQuery(hql).setInteger("id", id).list();
		return stYynls;
	}
	
	public void editJbxx(StudentInfo studentInfo, StSchoolInfo stSchoolInfo, int id) {
		String hql1="update StudentInfo studentInfo set studentInfo.relName='"+studentInfo.getRelName()+"'," + "studentInfo.sex='"
				  + studentInfo.getSex() + "'," + "studentInfo.birth='"
				  + studentInfo.getBirth() + "'," + "studentInfo.tel='"
				  + studentInfo.getTel() + "'," + "studentInfo.email='"
				  + studentInfo.getEmail() + "'," + "studentInfo.address='"
				  + studentInfo.getAddress()+ "'," + "studentInfo.picture='"
				  + studentInfo.getPicture()+ "'where studentInfo.id="+id;
		sessionFactory.getCurrentSession().createQuery(hql1).executeUpdate();
		String hql2="update StSchoolInfo stSchoolInfo set stSchoolInfo.school='"+stSchoolInfo.getSchool()+"'," + "stSchoolInfo.major='"
				  + stSchoolInfo.getMajor() + "'where stSchoolInfo.studentInfo.id="+id;
		sessionFactory.getCurrentSession().createQuery(hql2).executeUpdate();
	}
	
	public void editGrjj(StGrjj stGrjj, int id) {
		String hql="update StGrjj stGrjj set stGrjj.grjj='"+stGrjj.getGrjj()+"'where stGrjj.studentInfo.id="+id;
		sessionFactory.getCurrentSession().createQuery(hql).executeUpdate();	
	}
	public void addGrjj(StGrjj stGrjj) {	
		sessionFactory.getCurrentSession().save(stGrjj);
	}
	public void editQzyx(StQzyx stQzyx,int id){
		String hql="update StQzyx stQzyx set stQzyx.type='"+stQzyx.getType()+"',"+"stQzyx.targetAddress='"
				 + stQzyx.getTargetAddress()+"',"+"stQzyx.post='"
				 + stQzyx.getPost()+"',"+"stQzyx.salary='"
				 + stQzyx.getSalary()+"'where stQzyx.studentInfo.id="+id;
		sessionFactory.getCurrentSession().createQuery(hql).executeUpdate();
	}
	public void addQzyx(StQzyx stQzyx) {
		sessionFactory.getCurrentSession().save(stQzyx);
		
	}
	public int addXmjy(StXmjy stXmjy){
		int id=(Integer) sessionFactory.getCurrentSession().save(stXmjy);
		return id;	
	}
	public void editXmjy(StXmjy stXmjy) {
		String hql="update StXmjy stXmjy set stXmjy.itemName='"+stXmjy.getItemName()+"',"+"stXmjy.itemStartYear='"
				 + stXmjy.getItemStartYear()+"',"+"stXmjy.itemStartMonth='"
				 + stXmjy.getItemStartMonth()+"',"+"stXmjy.itemEndYear='"
				 + stXmjy.getItemEndYear()+"',"+"stXmjy.itemEndMonth='"
				 + stXmjy.getItemEndMonth()+"',"+"stXmjy.itemDuty='"
				 + stXmjy.getItemDuty()+"',"+"stXmjy.itemDescribe='"
				 + stXmjy.getItemDescribe()+"'where stXmjy.id="+stXmjy.getId();
		sessionFactory.getCurrentSession().createQuery(hql).executeUpdate();
	}
	public void deleteXmjy(int id) {
		 String hql ="delete StXmjy stXmjy where stXmjy.id="+id;    
		 sessionFactory.getCurrentSession().createQuery(hql).executeUpdate();
	}
	public int addXnzw(StXnzw stXnzw) {
		int id=(Integer) sessionFactory.getCurrentSession().save(stXnzw);
		return id;	
	}
	public void editXnzw(StXnzw stXnzw) {
		String hql="update StXnzw stXnzw set stXnzw.dutyName='"+stXnzw.getDutyName()+"',"+"stXnzw.dutyStartYear='"
				 + stXnzw.getDutyStartYear()+"',"+"stXnzw.dutyStartMonth='"
				 + stXnzw.getDutyStartMonth()+"',"+"stXnzw.dutyEndYear='"
				 + stXnzw.getDutyEndYear()+"',"+"stXnzw.dutyEndMonth='"
				 + stXnzw.getDutyEndMonth()+"',"+"stXnzw.dutyDescribe='"
				 + stXnzw.getDutyDescribe()+"'where stXnzw.id="+stXnzw.getId();
		sessionFactory.getCurrentSession().createQuery(hql).executeUpdate();
	}
	
	public void deleteXnzw(int id) {
		 String hql ="delete StXnzw stXnzw where stXnzw.id="+id;    
		 sessionFactory.getCurrentSession().createQuery(hql).executeUpdate();
	}
	public int addYynl(StYynl stYynl) {
		int id=(Integer) sessionFactory.getCurrentSession().save(stYynl);
		return id;	
	}
	public void editYynl(StYynl stYynl) {
		String hql="update StYynl stYynl set stYynl.lgName='"+stYynl.getLgName()+"',"+"stYynl.lgTS='"
				 + stYynl.getLgTS()+"',"+"stYynl.lgDX='"
				 + stYynl.getLgDX()+"'where stYynl.id="+stYynl.getId();
		sessionFactory.getCurrentSession().createQuery(hql).executeUpdate();
	}
	public void deleteYynl(int id) {
		 String hql ="delete StYynl stYynl where stYynl.id="+id;    
		 sessionFactory.getCurrentSession().createQuery(hql).executeUpdate();
	}
	public List<Post> searchPosts() {
		String hql="from Post post order by post.postTime desc";
		@SuppressWarnings("unchecked")
		List<Post> posts=(List<Post>)sessionFactory.getCurrentSession().createQuery(hql).list();
		return posts;
	}
	public Post searchPostsDetailed(Integer postId) {
		String hql="from Post post where post.id="+postId;
		Post post=(Post)sessionFactory.getCurrentSession().createQuery(hql).uniqueResult();
		return post;
	}
	public void postRecume(HasPost hasPost) {
		sessionFactory.getCurrentSession().save(hasPost);
	}
	public HasPost getHasPost(Integer postId, Integer studentId) {
		String hql="from HasPost hasPost where hasPost.studentInfo.id="+studentId+"and hasPost.post.id="+postId;
		HasPost hasPost=(HasPost)sessionFactory.getCurrentSession().createQuery(hql).uniqueResult();
		return hasPost;
	}
	public List<HasPost> hasPost(StudentInfo studentInfo) {
		String hql="from HasPost hasPost where hasPost.studentInfo.id="+studentInfo.getId()+"order by hasPost.sendTime desc";
		@SuppressWarnings("unchecked")
		List<HasPost> hasPosts=(List<HasPost>)sessionFactory.getCurrentSession().createQuery(hql).list();
		return hasPosts;
	}
	public List<RecPost> teacherRecommend(StudentInfo studentInfo) {
		String hql="from RecPost recPost where recPost.schoolInfo.schName='"+studentInfo.getStSchoolInfo().getSchool()+"'order by recPost.recTime desc";
		@SuppressWarnings("unchecked")
		List<RecPost>recPosts =(List<RecPost>)sessionFactory.getCurrentSession().createQuery(hql).list();
		
		return recPosts;
	}
	public void addfujian(StudentInfo studentInfo, int studentId) {
		String hql="update StudentInfo studentInfo set studentInfo.fujian='"+studentInfo.getFujian()+"',"+"studentInfo.fujianName='"
				 + studentInfo.getFujianName()+"'where studentInfo.id="+studentId;
		sessionFactory.getCurrentSession().createQuery(hql).executeUpdate();
	}
	public void deleteFujian(StudentInfo studentInfo) {
		String hql="update StudentInfo studentInfo set studentInfo.fujian='"+""+"',"+"studentInfo.fujianName='"
				 + ""+"'where studentInfo.id="+studentInfo.getId();
		sessionFactory.getCurrentSession().createQuery(hql).executeUpdate();
	}
	public CompanyInfo getCompanyInfoById(Integer receiveId) {
		String hql="from CompanyInfo companyInfo where companyInfo.id="+receiveId;
		CompanyInfo companyInfo=(CompanyInfo)sessionFactory.getCurrentSession().createQuery(hql).uniqueResult();
		return companyInfo;
	}
	public User getUser(String username,int type) {
		String hql="from User user where user.username="+username+"and user.type="+type;
		User user=(User)sessionFactory.getCurrentSession().createQuery(hql).uniqueResult();
		return user;
	}
	public void sendContacts(Contact contact) {
		sessionFactory.getCurrentSession().save(contact);
	}
	public List<Contact> getContacts(User sendUser, User receiveUser) {
		String hql="from Contact contact where contact.sendUser.id="+sendUser.getId()+" and contact.receiveUser.id="+receiveUser.getId()+"or contact.sendUser.id="+receiveUser.getId()+"and contact.receiveUser.id="+sendUser.getId()+" order by contact.time asc";
		@SuppressWarnings("unchecked")
		List<Contact> contacts=(List<Contact>)sessionFactory.getCurrentSession().createQuery(hql).list();
		return contacts;
	}

	
}

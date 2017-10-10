package xyb.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import xyb.dao.StudentDao;
import xyb.entity.CompanyInfo;
import xyb.entity.Contact;
import xyb.entity.HasPost;
import xyb.entity.Post;
import xyb.entity.PostPojo;
import xyb.entity.RecPost;
import xyb.entity.StGrjj;
import xyb.entity.StQzyx;
import xyb.entity.StSchoolInfo;
import xyb.entity.StXmjy;
import xyb.entity.StXnzw;
import xyb.entity.StYynl;
import xyb.entity.StudentInfo;
import xyb.entity.User;
import xyb.service.StudentService;

@Service
@Repository
@Transactional
public class StudentServiceImpl implements StudentService{
	@Autowired 
	private StudentDao studentDao;
	public StudentDao getStudentDao() {
		return studentDao;
	}
	public void setStudentDao(StudentDao studentDao) {
		this.studentDao = studentDao;
	}
	public StudentInfo login(String username, String password) {
		StudentInfo studentInfo=studentDao.login(username,password);
		return studentInfo;
	}
	
	public StudentInfo studentInfoById(int id){
		StudentInfo studentInfo=studentDao.studentInfoById(id);
		return studentInfo;
		
	}
	public int editStudentInfo(StudentInfo studentInfo,int id) {
		return this.studentDao.editStudentInfo(studentInfo,id);
	}
	public StSchoolInfo schoolInfo(int id) {
		StSchoolInfo stSchoolInfo=studentDao.schoolInfo(id);
		return stSchoolInfo;
	}
	public void editSchoolInfo(StSchoolInfo stSchoolInfo, int id) {
		StSchoolInfo stSchoolInfoHas=studentDao.schoolInfo(id);
		if(stSchoolInfoHas!=null){
			this.studentDao.editSchoolInfo(stSchoolInfo,id);
		}
		else{
			StudentInfo studentInfo=studentInfoById(id);
			stSchoolInfo.setStudentInfo(studentInfo);
			this.studentDao.addSchoolInfo(stSchoolInfo);
		}
	}
	public StGrjj stGrjj(int id) {
		StGrjj stGrjj=studentDao.stGrjj(id);
		return stGrjj;
	}
	public StQzyx stQzyx(int id) {
		StQzyx stQzyx=studentDao.stQzyx(id);
		return stQzyx;
	}
	
	public List<StXmjy> stXmjy(int id) {
		List<StXmjy> stXmjys=studentDao.stXmjy(id);
		return stXmjys;
	}
	public List<StXnzw> stXnzw(int id) {
		List<StXnzw> stXnzws=studentDao.stXnzw(id);
		return stXnzws;
	}
	public List<StYynl> stYynl(int id) {
		List<StYynl> stYynls=studentDao.stYynl(id);
		return stYynls;
	}
	public void editJbxx(StudentInfo studentInfo, StSchoolInfo stSchoolInfo, int id) {
		StSchoolInfo stSchoolInfoHas=studentDao.schoolInfo(id);
		if(stSchoolInfoHas!=null){
			this.studentDao.editJbxx(studentInfo,stSchoolInfo,id);
		}
		else{
			StudentInfo studentInfo1=studentInfoById(id);
			stSchoolInfo.setStudentInfo(studentInfo1);
			this.studentDao.addSchoolInfo(stSchoolInfo);
			this.studentDao.editJbxx(studentInfo,stSchoolInfo,id);
		}
			
	}
	public void editGrjj(StGrjj stGrjj, int id) {
		StGrjj stGrjjHas=studentDao.stGrjj(id);
		if(stGrjjHas!=null){
			this.studentDao.editGrjj(stGrjj,id);
		}
		else{
			StudentInfo studentInfo=studentInfoById(id);
			stGrjj.setStudentInfo(studentInfo);
			this.studentDao.addGrjj(stGrjj);
		}
		
		
	}
	public void editQzyx(StQzyx stQzyx, int id) {
		StQzyx stQzyxHas=studentDao.stQzyx(id);
		if(stQzyxHas!=null){
			this.studentDao.editQzyx(stQzyx,id);
		}
		else{
			StudentInfo studentInfo=studentInfoById(id);
			stQzyx.setStudentInfo(studentInfo);
			this.studentDao.addQzyx(stQzyx);
		}
	
	}
	public int addXmjy(StXmjy stXmjy) {
		return this.studentDao.addXmjy(stXmjy);
	}
	public void editXmjy(StXmjy stXmjy) {
		this.studentDao.editXmjy(stXmjy);
	}
	public void deleteXmjy(int id) {
		this.studentDao.deleteXmjy(id);
	}
	public int addXnzw(StXnzw stXnzw) {
		return this.studentDao.addXnzw(stXnzw);
	}
	public void editXnzw(StXnzw stXnzw) {
		this.studentDao.editXnzw(stXnzw);
	}
	public void deleteXnzw(int id) {
		this.studentDao.deleteXnzw(id);
	}
	public int addYynl(StYynl stYynl) {
		return this.studentDao.addYynl(stYynl);
	}
	public void editYynl(StYynl stYynl) {
		this.studentDao.editYynl(stYynl);
	}
	public void deleteYynl(int id) {
		this.studentDao.deleteYynl(id);
	}
	public List<PostPojo> searchPosts() {
		List<Post> posts=this.studentDao.searchPosts();
		List<PostPojo> postPojos=new ArrayList<PostPojo>();
		for(int i = 0;i<posts.size();i++){
			PostPojo postPojo=new PostPojo();
        	BeanUtils.copyProperties(posts.get(i),postPojo);
        	postPojos.add(postPojo);		
		}
		for(int i = 0;i<postPojos.size();i++)
		{
			postPojos.get(i).setComName(posts.get(i).getCompanyInfo().getComName());
			postPojos.get(i).setComAddress(posts.get(i).getCompanyInfo().getComAddress());
			postPojos.get(i).setComLogo(posts.get(i).getCompanyInfo().getComLogo());
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			int postTime=postPojos.get(i).getPostTime();
			Date date = new Date(postTime* 1000L);
			String postTimeStr = simpleDateFormat.format(date);
			postPojos.get(i).setPostTimeStr(postTimeStr);
		}
		return postPojos;
	}
	public PostPojo searchPostsDetailed(Integer postId) {
		Post post=this.studentDao.searchPostsDetailed(postId);
		PostPojo postPojo=new PostPojo();
		BeanUtils.copyProperties(post,postPojo);
		postPojo.setComId(post.getCompanyInfo().getId());
		postPojo.setComAddress(post.getCompanyInfo().getComAddress());
		postPojo.setComContacts(post.getCompanyInfo().getComContacts());
		postPojo.setComName(post.getCompanyInfo().getComName());
		postPojo.setComEmail(post.getCompanyInfo().getComEmail());
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		int postTime=postPojo.getPostTime();
		Date date = new Date(postTime* 1000L);
		String postTimeStr = simpleDateFormat.format(date);
		postPojo.setPostTimeStr(postTimeStr);
		return postPojo;
	}
	public String postRecume(Integer postId, StudentInfo studentInfo) {
		String status=null;
		HasPost hasPost1=this.studentDao.getHasPost(postId,studentInfo.getId());
		if(hasPost1==null){
			HasPost hasPost=new HasPost();
			Post post=studentDao.searchPostsDetailed(postId);
			hasPost.setPost(post);
			hasPost.setStudentInfo(studentInfo);
			
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			String sendTimeStr=simpleDateFormat.format(new Date());
			hasPost.setSendTimeStr(sendTimeStr);
			Date date = null;
			try {
				date = simpleDateFormat.parse(sendTimeStr);
			} catch (ParseException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
			int sendTime = (int) (date.getTime()/1000);
			hasPost.setSendTime(sendTime);
			
			hasPost.setStatus("未被查看");
			this.studentDao.postRecume(hasPost);
			status="投递成功";
		}
		else{
			status="您已经投递过该岗位，请不要重复投递";
		}
		return status;
	}
	public List<HasPost> hasPost(StudentInfo studentInfo) {
		List<HasPost> hasPosts=this.studentDao.hasPost(studentInfo);
		for(int i=0;i<hasPosts.size();i++){
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			int sendTime=hasPosts.get(i).getSendTime();	
			Date date = new Date(sendTime* 1000L);
			String sendTimeStr = simpleDateFormat.format(date);
			hasPosts.get(i).setSendTimeStr(sendTimeStr);
			
			Post post=this.studentDao.searchPostsDetailed(hasPosts.get(i).getPost().getId());
			int postTime=post.getPostTime();	
			Date date1 = new Date(postTime* 1000L);
			String postTimeStr = simpleDateFormat.format(date1);
			hasPosts.get(i).setPostTimeStr(postTimeStr);
			
		}
		return hasPosts;
	}
	public List<Post> teacherRecommend(StudentInfo studentInfo) {
		List<RecPost> recPosts=this.studentDao.teacherRecommend(studentInfo);
		List<Post> posts=new ArrayList<Post>();
		for(int i=0;i<recPosts.size();i++){
			Post post=this.studentDao.searchPostsDetailed(recPosts.get(i).getPost().getId());
			
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			if(post!=null){
				int postTime=post.getPostTime();
				Date date1 = new Date(postTime* 1000L);
				String postTimeStr = simpleDateFormat.format(date1);
				post.setPostTimeStr(postTimeStr);
				posts.add(post);
			}
			
		}
		return posts;
	}
	public void addfujian(StudentInfo studentInfo, int studentId) {
		this.studentDao.addfujian(studentInfo,studentId);
	}
	public void deleteFujian(StudentInfo studentInfo) {
		this.studentDao.deleteFujian(studentInfo);
	}
	
	public CompanyInfo getCompanyInfoById(Integer receiveId) {
		CompanyInfo companyInfo=this.studentDao.getCompanyInfoById(receiveId);
		return companyInfo;
	}
	public User getUser(String username,int type) {
		User user=this.studentDao.getUser(username,type);
		return user;
	}
	public void sendContacts(Contact contact) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String timeStr=simpleDateFormat.format(new Date());
		contact.setTimeStr(timeStr);
		Date date = null;
		try {
			date = simpleDateFormat.parse(timeStr);
		} catch (ParseException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		int time = (int) (date.getTime()/1000);
		contact.setTime(time);
		
		this.studentDao.sendContacts(contact);
	}

	public List<Contact> getContacts(User sendUser, User receiveUser) {
		List<Contact> contacts=this.studentDao.getContacts(sendUser,receiveUser);
		for(int i=0;i<contacts.size();i++){
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			int time=contacts.get(i).getTime();	
			Date date = new Date(time* 1000L);
			String timeStr = simpleDateFormat.format(date);
			contacts.get(i).setTimeStr(timeStr);
			contacts.get(i).setSendUserId(contacts.get(i).getSendUser().getId());
			contacts.get(i).setReceiveUserId(contacts.get(i).getReceiveUser().getId());
		}
		return contacts;
	}
}

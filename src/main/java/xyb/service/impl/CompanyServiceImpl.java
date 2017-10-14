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

import xyb.dao.CompanyDao;
import xyb.entity.CompanyInfo;
import xyb.entity.Contact;
import xyb.entity.HasPost;
import xyb.entity.HasRecruit;
import xyb.entity.Post;
import xyb.entity.PostPojo;
import xyb.entity.Recruit;
import xyb.entity.RecruitPojo;
import xyb.entity.SchoolInfo;
import xyb.entity.StudentInfo;
import xyb.entity.User;
import xyb.service.CompanyService;

@Service
@Repository
@Transactional
public class CompanyServiceImpl implements CompanyService{

	@Autowired 
	private CompanyDao companyDao;
	public CompanyDao getCompanyDao() {
		return companyDao;
	}
	public void setCompanyDao(CompanyDao companyDao) {
		this.companyDao = companyDao;
	}
	
	public CompanyInfo login(String username, String password) {
		CompanyInfo companyInfo=companyDao.login(username,password);
		return companyInfo;
	}
	public CompanyInfo companyInfoById(int id) {
		CompanyInfo companyInfo=companyDao.companyInfoById(id);
		return companyInfo;
	}
	public void editCompanyInfo(CompanyInfo companyInfo, int id) {
		this.companyDao.editCompanyInfo(companyInfo,id);
		
	}
	public List<PostPojo> jobManager(int id) {
		List<Post> posts=companyDao.jobManager(id);
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
			int postTime=postPojos.get(i).getPostTime();
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date(postTime* 1000L);
			String postTimeStr = simpleDateFormat.format(date);
			postPojos.get(i).setPostTimeStr(postTimeStr);
		}
		return postPojos;
	}
	public void addPost(Post post) {
		this.companyDao.addPost(post);
	}
	public Post getPostById(Integer postId) {
		Post post=companyDao.getPostById(postId);
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		int postTime=post.getPostTime();	
		Date date = new Date(postTime* 1000L);
		String postTimeStr = simpleDateFormat.format(date);
		post.setPostTimeStr(postTimeStr);
		return post;
	}
	public void editPost(Post post,Integer postId) {
		this.companyDao.editPost(post,postId);
	}
	public void deletePost(Integer postId) {
		this.companyDao.deletePost(postId);
	}
	public List<RecruitPojo> companyRecruit() {
		List<Recruit> recruits=this.companyDao.companyRecruit();
		List<RecruitPojo> recruitPojos=new ArrayList<RecruitPojo>();
		for(int i = 0;i<recruits.size();i++){
			RecruitPojo recruitPojo=new RecruitPojo();
        	BeanUtils.copyProperties(recruits.get(i),recruitPojo);
        	recruitPojos.add(recruitPojo);		
		}
		for(int i = 0;i<recruitPojos.size();i++)
		{
			recruitPojos.get(i).setSchName(recruits.get(i).getSchoolInfo().getSchName());
			recruitPojos.get(i).setSchLogo(recruits.get(i).getSchoolInfo().getSchLogo());
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			//发布时间
			int releaseTime=recruitPojos.get(i).getReleaseTime();
			Date date1 = new Date(releaseTime* 1000L);
			String releaseTimeStr = simpleDateFormat.format(date1);
			recruitPojos.get(i).setReleaseTimeStr(releaseTimeStr);
			
			//开始时间
			int startTime=recruitPojos.get(i).getStartTime();
			Date date2 = new Date(startTime* 1000L);
			String startTimeStr = simpleDateFormat.format(date2);
			recruitPojos.get(i).setStartTimeStr(startTimeStr);
			//结束时间
			int endTime=recruitPojos.get(i).getEndTime();
			Date date3 = new Date(endTime* 1000L);
			String endTimeStr = simpleDateFormat.format(date3);
			recruitPojos.get(i).setEndTimeStr(endTimeStr);
		}
		return recruitPojos;
	}
	public List<HasPost> getHasPostById(Integer postId) {
		List<HasPost> hasPosts=this.companyDao.getHasPostById(postId);
		for(int i=0;i<hasPosts.size();i++){
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			
			int sendTime=hasPosts.get(i).getSendTime();	
			Date date = new Date(sendTime* 1000L);
			String sendTimeStr = simpleDateFormat.format(date);
			hasPosts.get(i).setSendTimeStr(sendTimeStr);
			
		}
		return hasPosts;
	}
	public StudentInfo getStudentInfoById(Integer studentId) {
		StudentInfo studentInfo=this.companyDao.getStudentInfoById(studentId);
		return studentInfo;
	}
	public void postStatus(Integer studentId, Integer postId, String postStatus) {
		this.companyDao.postStatus(studentId,postId,postStatus);
	}
	public HasPost getHasPostByDoubleId(Integer studentId, Integer postId) {
		HasPost hasPost=this.companyDao.getHasPostByDoubleId(studentId,postId);
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		int sendTime=hasPost.getSendTime();
		Date date = new Date(sendTime* 1000L);
		String sendTimeStr = simpleDateFormat.format(date);
		hasPost.setSendTimeStr(sendTimeStr);
		return hasPost;
	}
	public Recruit companyRecruitDetailed(Integer recruitId) {
		Recruit recruit=this.companyDao.companyRecruitDetailed(recruitId);
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		//校招开始时间
		int startTime=recruit.getStartTime();
		Date date1 = new Date(startTime* 1000L);
		String startTimeStr = simpleDateFormat.format(date1);
		recruit.setStartTimeStr(startTimeStr);
		//校招结束时间
		int endTime=recruit.getEndTime();
		Date date2 = new Date(endTime* 1000L);
		String endTimeStr = simpleDateFormat.format(date2);
		recruit.setEndTimeStr(endTimeStr);
		//校招发布时间
		int releaseTime=recruit.getEndTime();
		Date date3 = new Date(releaseTime* 1000L);
		String releaseTimeStr = simpleDateFormat.format(date3);
		recruit.setReleaseTimeStr(releaseTimeStr);
		
		return recruit;
	}
	public String applyRecruit(Integer recruitId, CompanyInfo companyInfo) {
		String status=null;
		HasRecruit hasRecruit1=this.companyDao.getHasRecruit(recruitId,companyInfo.getId());
		if(hasRecruit1==null){
			HasRecruit hasRecruit=new HasRecruit();
			Recruit recruit=companyDao.companyRecruitDetailed(recruitId);
			hasRecruit.setRecruit(recruit);
			hasRecruit.setCompanyInfo(companyInfo);
			
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			String sendTimeStr=simpleDateFormat.format(new Date());
			hasRecruit.setSendTimeStr(sendTimeStr);
			Date date = null;
			try {
				date = simpleDateFormat.parse(sendTimeStr);
			} catch (ParseException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}	
			int sendTime = (int) (date.getTime()/1000);
			hasRecruit.setSendTime(sendTime);
			
			hasRecruit.setStatus("未被查看");
			this.companyDao.applyRecruit(hasRecruit);
			status="申请成功";
		}
		else{
			status="您已经申请过该校招，请不要重复申请";
		}
		return status;
	}
	public List<HasRecruit> hasApply(CompanyInfo companyInfo) {
		List<HasRecruit> hasRecruits=this.companyDao.hasRecruit(companyInfo);
		for(int i=0;i<hasRecruits.size();i++){
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			int sendTime=hasRecruits.get(i).getSendTime();	
			Date date = new Date(sendTime* 1000L);
			String sendTimeStr = simpleDateFormat.format(date);
			hasRecruits.get(i).setSendTimeStr(sendTimeStr);
			
			Recruit recruit=this.companyDao.companyRecruitDetailed(hasRecruits.get(i).getRecruit().getId());
			//校招开始时间
			int startTime=recruit.getStartTime();	
			Date date1 = new Date(startTime* 1000L);
			String startTimeStr = simpleDateFormat.format(date1);
			hasRecruits.get(i).setStartTimeStr(startTimeStr);
			//校招结束时间
			int endTime=recruit.getEndTime();	
			Date date2 = new Date(endTime* 1000L);
			String endTimeStr = simpleDateFormat.format(date2);
			hasRecruits.get(i).setEndTimeStr(endTimeStr);
			//校招发布时间
			int releaseTime=recruit.getReleaseTime();	
			Date date3 = new Date(releaseTime* 1000L);
			String releaseTimeStr = simpleDateFormat.format(date3);
			hasRecruits.get(i).setReleaseTimeStr(releaseTimeStr);
		}
		return hasRecruits;
	}
	public User getUser(String username, int type) {
		User user=this.companyDao.getUser(username,type);
		return user;
	}
	public List<Contact> getContacts(User sendUser, User receiveUser) {
		List<Contact> contacts=this.companyDao.getContacts(sendUser,receiveUser);
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
		
		this.companyDao.sendContacts(contact);
	}
	public SchoolInfo getSchoolInfoById(Integer schoolId) {
		SchoolInfo schoolInfo=this.companyDao.getSchoolInfoById(schoolId);
		return schoolInfo;
	}
	
	
	

}

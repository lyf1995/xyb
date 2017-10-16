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

import xyb.dao.SchoolDao;
import xyb.entity.CompanyInfo;
import xyb.entity.Contact;
import xyb.entity.HasRecruit;
import xyb.entity.Post;
import xyb.entity.PostPojo;
import xyb.entity.RecPost;
import xyb.entity.Recruit;
import xyb.entity.RecruitPojo;
import xyb.entity.SchoolInfo;
import xyb.entity.User;
import xyb.service.SchoolService;

@Service
@Repository
@Transactional
public class SchoolServiceImpl implements SchoolService{
	@Autowired 
	private SchoolDao schoolDao;
	public SchoolDao getSchoolDao() {
		return schoolDao;
	}
	public void setSchoolDao(SchoolDao schoolDao) {
		this.schoolDao = schoolDao;
	}
	
	public SchoolInfo login(String username, String password) {
		SchoolInfo schoolInfo=schoolDao.login(username,password);
		return schoolInfo;
	}
	public SchoolInfo schoolInfoById(int id) {
		SchoolInfo schoolInfo=this.schoolDao.schoolInfoById(id);
		return schoolInfo;
	}
	public void editSchoolInfo(SchoolInfo schoolInfo, int id) {
		this.schoolDao.editSchoolInfo(schoolInfo,id);
		
	}
	public List<RecruitPojo> schoolRecruit(int id) {
		List<Recruit> recruits=this.schoolDao.schoolRecruit(id);
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
			Date date = new Date(releaseTime* 1000L);
			String releaseTimeStr = simpleDateFormat.format(date);
			recruitPojos.get(i).setReleaseTimeStr(releaseTimeStr);		
			//校招开始时间
			int startTime=recruitPojos.get(i).getStartTime();
			Date date1 = new Date(startTime* 1000L);
			String startTimeStr = simpleDateFormat.format(date1);
			recruitPojos.get(i).setStartTimeStr(startTimeStr);
			//校招结束时间
			int endTime=recruitPojos.get(i).getEndTime();
			Date date2 = new Date(endTime* 1000L);
			String endTimeStr = simpleDateFormat.format(date2);
			recruitPojos.get(i).setEndTimeStr(endTimeStr);
		}
		return recruitPojos;
	}
	public void addRecruit(Recruit recruit) {
		this.schoolDao.addRecruit(recruit);
	}
	public void editRecruit(RecruitPojo recruitPojo, Integer recruitId) throws ParseException {
		Recruit recruit=new Recruit();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		//校招开始时间
		String startTimeStr=recruitPojo.getStartTimeStr();
		Date date1 = simpleDateFormat.parse(startTimeStr);
		int startTime = (int) (date1.getTime()/1000);
		recruitPojo.setStartTime(startTime);
		//校招结束时间
		String endTimeStr=recruitPojo.getEndTimeStr();
		Date date2 = simpleDateFormat.parse(endTimeStr);
		int endTime = (int) (date2.getTime()/1000);
		recruitPojo.setEndTime(endTime);	
		BeanUtils.copyProperties(recruitPojo,recruit);
		
		this.schoolDao.editRecruit(recruit,recruitId);
	}
	public RecruitPojo getRecruitById(Integer recruitId) {
		Recruit recruit=this.schoolDao.getRecruitById(recruitId);
		RecruitPojo recruitPojo=new RecruitPojo();
		BeanUtils.copyProperties(recruit,recruitPojo);
		recruitPojo.setSchName(recruit.getSchoolInfo().getSchName());
		//校招开始时间
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		int startTime=recruit.getStartTime();
        String startTimeStr =new String();
    	Date date1 = new Date(startTime* 1000L);
    	startTimeStr = simpleDateFormat.format(date1);
    	recruitPojo.setStartTimeStr(startTimeStr);
		
		//校招结束时间
		int endTime=recruit.getEndTime();
		String endTimeStr =new String();
    	Date date2 = new Date(endTime* 1000L);
    	endTimeStr = simpleDateFormat.format(date2);
    	recruitPojo.setEndTimeStr(endTimeStr);
    	
    	//发布时间
		int releaseTime=recruit.getReleaseTime();
		Date date3 = new Date(releaseTime* 1000L);
		String releaseTimeStr = simpleDateFormat.format(date3);
		recruitPojo.setReleaseTimeStr(releaseTimeStr);	
    	
		return recruitPojo;
	}
	public void deleteRecruit(Integer recruitId) {
		this.schoolDao.deleteRecruit(recruitId);
		
	}
	public List<PostPojo> searchPost() {
		List<Post> posts=this.schoolDao.searchPost();
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
	public List<HasRecruit> getHasRecruitById(Integer recruitId) {
		List<HasRecruit> hasRecruits=this.schoolDao.getHasRecruitById(recruitId);
		for(int i=0;i<hasRecruits.size();i++){
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			
			int sendTime=hasRecruits.get(i).getSendTime();	
			Date date = new Date(sendTime* 1000L);
			String sendTimeStr = simpleDateFormat.format(date);
			hasRecruits.get(i).setSendTimeStr(sendTimeStr);
			
		}
		return hasRecruits;
	}
	public CompanyInfo getCompanyInfoById(Integer companyInfoId) {
		CompanyInfo companyInfo=this.schoolDao.getCompanyInfoById(companyInfoId);
		return companyInfo;
	}
	public HasRecruit getHasRecruitByDoubleId(Integer companyInfoId, Integer recruitId) {
		HasRecruit hasRecruit=this.schoolDao.getHasRecruitByDoubleId(companyInfoId,recruitId);
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		int sendTime=hasRecruit.getSendTime();
		Date date = new Date(sendTime* 1000L);
		String sendTimeStr = simpleDateFormat.format(date);
		hasRecruit.setSendTimeStr(sendTimeStr);
		return hasRecruit;
	}
	public void recruitStatus(Integer companyInfoId, Integer recruitId, String status) {
		this.schoolDao.recruitStatus(companyInfoId,recruitId,status);
	}
	public PostPojo searchPostsDetailed(Integer postId) {
		Post post=this.schoolDao.searchPostsDetailed(postId);
		PostPojo postPojo=new PostPojo();
		BeanUtils.copyProperties(post,postPojo);
		postPojo.setComAddress(post.getCompanyInfo().getComAddress());
		postPojo.setComContacts(post.getCompanyInfo().getComContacts());
		postPojo.setComName(post.getCompanyInfo().getComName());
		postPojo.setComEmail(post.getCompanyInfo().getComEmail());
		postPojo.setComId(post.getCompanyInfo().getId());
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		int postTime=postPojo.getPostTime();
		Date date = new Date(postTime* 1000L);
		String postTimeStr = simpleDateFormat.format(date);
		postPojo.setPostTimeStr(postTimeStr);
		return postPojo;
	}
	public String recommendPost(Integer postId, SchoolInfo schoolInfo) {
		String status=null;
		RecPost recPost1=this.schoolDao.hasRecommendPost(postId,schoolInfo.getId());
		if(recPost1==null){
			RecPost recPost=new RecPost();
			Post post=this.schoolDao.searchPostsDetailed(postId);
			recPost.setPost(post);
			recPost.setSchoolInfo(schoolInfo);
			
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			String recTimeStr=simpleDateFormat.format(new Date());
			Date date = null;
			try {
				date = simpleDateFormat.parse(recTimeStr);
			} catch (ParseException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
			int recTime = (int) (date.getTime()/1000);
			recPost.setRecTime(recTime);
			
			this.schoolDao.recommendPost(recPost);
			status="推荐成功";
		}
		else{
			status="您已经推荐过该岗位，请不要重复推荐";
		}
		return status;
	}
	public User getUser(String username, int type) {
		User user=this.schoolDao.getUser(username,type);
		return user;
	}
	public List<Contact> getContacts(User sendUser, User receiveUser) {
		List<Contact> contacts=this.schoolDao.getContacts(sendUser,receiveUser);
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
		
		this.schoolDao.sendContacts(contact);
	}
	public List<RecPost> hasRecommend(SchoolInfo schoolInfo) {
		List<RecPost> recPosts=this.schoolDao.hasRecommend(schoolInfo);
		return recPosts;
	}
	
}

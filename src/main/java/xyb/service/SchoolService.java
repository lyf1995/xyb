package xyb.service;

import java.text.ParseException;
import java.util.List;

import xyb.entity.CompanyInfo;
import xyb.entity.Contact;
import xyb.entity.HasRecruit;
import xyb.entity.PostPojo;
import xyb.entity.Recruit;
import xyb.entity.RecruitPojo;
import xyb.entity.SchoolInfo;
import xyb.entity.User;

public interface SchoolService {
	public SchoolInfo login(String username, String password);

	public SchoolInfo schoolInfoById(int id);

	public void editSchoolInfo(SchoolInfo schoolInfo, int id);

	public List<RecruitPojo> schoolRecruit(int id);

	public void addRecruit(Recruit recruit);

	public void editRecruit(RecruitPojo recruitPojo, Integer recruitId) throws ParseException;

	public RecruitPojo getRecruitById(Integer recruitId);

	public void deleteRecruit(Integer recruitId);

	public List<PostPojo> searchPost();

	public List<HasRecruit> getHasRecruitById(Integer recruitId);

	public CompanyInfo getCompanyInfoById(Integer companyInfoId);

	public HasRecruit getHasRecruitByDoubleId(Integer companyInfoId, Integer recruitId);

	public void recruitStatus(Integer companyInfoId, Integer recruitId, String string);

	public PostPojo searchPostsDetailed(Integer postId);

	public String recommendPost(Integer postId, SchoolInfo schoolInfo);

	public User getUser(String username, int type);

	public List<Contact> getContacts(User sendUser, User receiveUser);

	public void sendContacts(Contact contact);

	
}

package xyb.dao;

import java.util.List;

import xyb.entity.CompanyInfo;
import xyb.entity.Contact;
import xyb.entity.HasRecruit;
import xyb.entity.Post;
import xyb.entity.RecPost;
import xyb.entity.Recruit;
import xyb.entity.SchoolInfo;
import xyb.entity.User;

public interface SchoolDao {
	public SchoolInfo login(String username,String password);

	public SchoolInfo schoolInfoById(int id);

	public void editSchoolInfo(SchoolInfo schoolInfo, int id);

	public List<Recruit> schoolRecruit(int id);

	public void addRecruit(Recruit recruit);

	public void editRecruit(Recruit recruit, Integer recruitId);

	public Recruit getRecruitById(Integer recruitId);

	public void deleteRecruit(Integer recruitId);

	public List<Post> searchPost();

	public List<HasRecruit> getHasRecruitById(Integer recruitId);

	public CompanyInfo getCompanyInfoById(Integer companyInfoId);

	public HasRecruit getHasRecruitByDoubleId(Integer companyInfoId, Integer recruitId);

	public void recruitStatus(Integer companyInfoId, Integer recruitId, String status);

	public Post searchPostsDetailed(Integer postId);

	public RecPost hasRecommendPost(Integer postId, Integer schoolId);

	public void recommendPost(RecPost recPost);

	public User getUser(String username, int type);

	public List<Contact> getContacts(User sendUser, User receiveUser);

	public void sendContacts(Contact contact);

	public List<RecPost> hasRecommend(SchoolInfo schoolInfo);

}		

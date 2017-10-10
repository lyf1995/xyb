package xyb.service;

import java.util.List;

import xyb.entity.CompanyInfo;
import xyb.entity.Contact;
import xyb.entity.HasPost;
import xyb.entity.HasRecruit;
import xyb.entity.Post;
import xyb.entity.PostPojo;
import xyb.entity.Recruit;
import xyb.entity.RecruitPojo;
import xyb.entity.StudentInfo;
import xyb.entity.User;

public interface CompanyService {
	public CompanyInfo login(String username, String password);

	public CompanyInfo companyInfoById(int id);

	public void editCompanyInfo(CompanyInfo companyInfo, int id);

	public List<PostPojo> jobManager(int id);

	public void addPost(Post post);

	public Post getPostById(Integer postId);

	public void editPost(Post post,Integer postId);

	public void deletePost(Integer postId);

	public List<RecruitPojo> companyRecruit();

	public List<HasPost> getHasPostById(Integer postId);

	public StudentInfo getStudentInfoById(Integer studentId);

	public void postStatus(Integer studentId, Integer postId, String postStatus);

	public HasPost getHasPostByDoubleId(Integer studentId, Integer postId);

	public Recruit companyRecruitDetailed(Integer recruitId);

	public String applyRecruit(Integer recruitId, CompanyInfo companyInfo);

	public List<HasRecruit> hasApply(CompanyInfo companyInfo);

	public User getUser(String username, int type);

	public List<Contact> getContacts(User sendUser, User receiveUser);

	public void sendContacts(Contact contact);
}

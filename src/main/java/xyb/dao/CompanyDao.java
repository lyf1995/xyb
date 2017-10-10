package xyb.dao;

import java.util.List;

import xyb.entity.CompanyInfo;
import xyb.entity.Contact;
import xyb.entity.HasPost;
import xyb.entity.HasRecruit;
import xyb.entity.Post;
import xyb.entity.Recruit;
import xyb.entity.StudentInfo;
import xyb.entity.User;

public interface CompanyDao {
	public CompanyInfo login(String username,String password);

	public CompanyInfo companyInfoById(int id);

	public void editCompanyInfo(CompanyInfo companyInfo, int id);

	public List<Post> jobManager(int id);

	public void addPost(Post post);

	public Post getPostById(Integer postId);

	public void editPost(Post post,Integer postId);

	public void deletePost(Integer postId);

	public List<Recruit> companyRecruit();

	public List<HasPost> getHasPostById(Integer postId);

	public StudentInfo getStudentInfoById(Integer studentId);

	public void postStatus(Integer studentId, Integer postId, String postStatus);

	public HasPost getHasPostByDoubleId(Integer studentId, Integer postId);

	public Recruit companyRecruitDetailed(Integer recruitId);

	public HasRecruit getHasRecruit(Integer recruitId, int companyInfoId);

	public void applyRecruit(HasRecruit hasRecruit);

	public List<HasRecruit> hasRecruit(CompanyInfo companyInfo);

	public User getUser(String username, int type);

	public List<Contact> getContacts(User sendUser, User receiveUser);

	public void sendContacts(Contact contact);
}

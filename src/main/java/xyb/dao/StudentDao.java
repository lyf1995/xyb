package xyb.dao;

import java.util.List;

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

public interface StudentDao {
	public StudentInfo login(String username,String password);

	public StudentInfo studentInfoById(int id);

	public int editStudentInfo(StudentInfo studentInfo,int id);

	public StSchoolInfo schoolInfo(int id);

	public int editSchoolInfo(StSchoolInfo stSchoolInfo, int id);

	public StGrjj stGrjj(int id);

	public StQzyx stQzyx(int id);

	public List<StXmjy> stXmjy(int id);

	public List<StXnzw> stXnzw(int id);

	public List<StYynl> stYynl(int id);

	public void editJbxx(StudentInfo studentInfo, StSchoolInfo stSchoolInfo, int id);

	public void editGrjj(StGrjj stGrjj, int id);

	public void editQzyx(StQzyx stQzyx, int id);

	public int addXmjy(StXmjy stXmjy);

	public void editXmjy(StXmjy stXmjy);

	public void deleteXmjy(int id);

	public int addXnzw(StXnzw stXnzw);

	public void editXnzw(StXnzw stXnzw);

	public void deleteXnzw(int id);

	public int addYynl(StYynl stYynl);

	public void editYynl(StYynl stYynl);

	public void deleteYynl(int id);

	public void addSchoolInfo(StSchoolInfo stSchoolInfo);

	public void addGrjj(StGrjj stGrjj);

	public void addQzyx(StQzyx stQzyx);

	public List<Post> searchPosts();

	public Post searchPostsDetailed(Integer postId);

	public void postRecume(HasPost hasPost);

	public HasPost getHasPost(Integer postId, Integer studentId);

	public List<HasPost> hasPost(StudentInfo studentInfo);

	public List<RecPost> teacherRecommend(StudentInfo studentInfo);

	public void addfujian(StudentInfo studentInfo, int studentId);

	public void deleteFujian(StudentInfo studentInfo);

	public List<Contact> getContacts(User sendUser, User receiveUser);

	public CompanyInfo getCompanyInfoById(Integer receiveId);

	public User getUser(String username, int type);

	public void sendContacts(Contact contact);

}

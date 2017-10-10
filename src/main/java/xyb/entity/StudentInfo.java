package xyb.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "studentinfo")
public class StudentInfo {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	@Column
	private String username;
	@Column
	private String password;
	@Column
	private String relName;
	@Column
	private String sex;
	@Column
	private Integer birth;
	@Column
	private String tel;
	@Column
	private String email;
	@Column
	private String address;
	@Column
	private String picture;
	@Column
	private String fujian;
	@Column
	private String fujianName;
	
	//一个人拥有多个语言能力
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "studentInfo")
	private Set<StYynl> stYynl = new HashSet<StYynl>(0);
	
	//一个人拥有多个校内职务
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "studentInfo")
	private Set<StXnzw> stXnzw = new HashSet<StXnzw>(0);
	
	//一个人拥有多个项目经验
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "studentInfo")
	private Set<StXmjy> stXmjy = new HashSet<StXmjy>(0);
	
	//一个人拥有一个学籍信息
	@OneToOne(mappedBy="studentInfo")
	private StSchoolInfo stSchoolInfo;
	
	//一个人拥有一个求职意向
	@OneToOne(mappedBy="studentInfo")
	private StQzyx stQzyx;
	
	//一个人拥有一个个人简介
	@OneToOne(mappedBy="studentInfo")
	private StGrjj stGrjj;
	
	//一个人可以投递多个岗位
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "studentInfo")
	private Set<HasPost> hasPosts = new HashSet<HasPost>(0);
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRelName() {
		return relName;
	}
	public void setRelName(String relName) {
		this.relName = relName;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Integer getBirth() {
		return birth;
	}
	public void setBirth(Integer birth) {
		this.birth = birth;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Set<StYynl> getStYynl() {
		return stYynl;
	}
	public void setStYynl(Set<StYynl> stYynl) {
		this.stYynl = stYynl;
	}
	public Set<StXnzw> getStXnzw() {
		return stXnzw;
	}
	public void setStXnzw(Set<StXnzw> stXnzw) {
		this.stXnzw = stXnzw;
	}
	public Set<StXmjy> getStXmjy() {
		return stXmjy;
	}
	public void setStXmjy(Set<StXmjy> stXmjy) {
		this.stXmjy = stXmjy;
	}
	public StSchoolInfo getStSchoolInfo() {
		return stSchoolInfo;
	}
	public void setStSchoolInfo(StSchoolInfo stSchoolInfo) {
		this.stSchoolInfo = stSchoolInfo;
	}
	public StQzyx getStQzyx() {
		return stQzyx;
	}
	public void setStQzyx(StQzyx stQzyx) {
		this.stQzyx = stQzyx;
	}
	public StGrjj getStGrjj() {
		return stGrjj;
	}
	public void setStGrjj(StGrjj stGrjj) {
		this.stGrjj = stGrjj;
	}
	public Set<HasPost> getHasPosts() {
		return hasPosts;
	}
	public void setHasPosts(Set<HasPost> hasPosts) {
		this.hasPosts = hasPosts;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getFujian() {
		return fujian;
	}
	public void setFujian(String fujian) {
		this.fujian = fujian;
	}
	public String getFujianName() {
		return fujianName;
	}
	public void setFujianName(String fujianName) {
		this.fujianName = fujianName;
	}
	
}

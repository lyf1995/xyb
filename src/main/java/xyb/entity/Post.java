package xyb.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;


@Entity
@Table(name = "post")
public class Post {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	@Column
	private String postName;
	@Column
	private String jobNature;
	@Column
	private int postSalary;
	@Column
	private String jobExp;
	@Column
	private int postNumber;
	@Column
	private String education;
	@Column
	private String postMajor;
	@Column
	private String gwfl;
	@Column
	private String gwzz;
	@Column
	private String gwyq;
	@Column
	private Integer postTime;
	@Transient
	private String postTimeStr;
	//多个岗位被一个公司发布
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "company_id", referencedColumnName = "id")
	private CompanyInfo companyInfo;
	
	//一个岗位可以被多个人申请
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "post")
	private Set<HasPost> hasPosts = new HashSet<HasPost>(0);

	//一个岗位可以被多个学校推荐
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "post")
	private Set<RecPost> recPosts = new HashSet<RecPost>(0);
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPostName() {
		return postName;
	}

	public void setPostName(String postName) {
		this.postName = postName;
	}

	public String getJobNature() {
		return jobNature;
	}

	public void setJobNature(String jobNature) {
		this.jobNature = jobNature;
	}

	public int getPostSalary() {
		return postSalary;
	}

	public void setPostSalary(int postSalary) {
		this.postSalary = postSalary;
	}

	public String getJobExp() {
		return jobExp;
	}

	public void setJobExp(String jobExp) {
		this.jobExp = jobExp;
	}

	public int getPostNumber() {
		return postNumber;
	}

	public void setPostNumber(int postNumber) {
		this.postNumber = postNumber;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getPostMajor() {
		return postMajor;
	}

	public void setPostMajor(String postMajor) {
		this.postMajor = postMajor;
	}

	public String getGwfl() {
		return gwfl;
	}

	public void setGwfl(String gwfl) {
		this.gwfl = gwfl;
	}

	public String getGwzz() {
		return gwzz;
	}

	public void setGwzz(String gwzz) {
		this.gwzz = gwzz;
	}

	public String getGwyq() {
		return gwyq;
	}

	public void setGwyq(String gwyq) {
		this.gwyq = gwyq;
	}

	public CompanyInfo getCompanyInfo() {
		return companyInfo;
	}

	public void setCompanyInfo(CompanyInfo companyInfo) {
		this.companyInfo = companyInfo;
	}

	public Integer getPostTime() {
		return postTime;
	}

	public void setPostTime(Integer postTime) {
		this.postTime = postTime;
	}

	public String getPostTimeStr() {
		return postTimeStr;
	}

	public void setPostTimeStr(String postTimeStr) {
		this.postTimeStr = postTimeStr;
	}

	public Set<HasPost> getHasPosts() {
		return hasPosts;
	}

	public void setHasPosts(Set<HasPost> hasPosts) {
		this.hasPosts = hasPosts;
	}

	public Set<RecPost> getRecPosts() {
		return recPosts;
	}

	public void setRecPosts(Set<RecPost> recPosts) {
		this.recPosts = recPosts;
	}


}

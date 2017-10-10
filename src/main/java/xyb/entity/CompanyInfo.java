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
import javax.persistence.Table;

@Entity
@Table(name = "companyinfo")
public class CompanyInfo {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	@Column
	private String username;
	@Column
	private String password;
	@Column
	private String comLogo;
	@Column
	private String comName;
	@Column
	private String comContacts;
	@Column
	private String contactsSex;
	@Column
	private String comIndustry;
	@Column
	private String comEmail;
	@Column
	private String comAddress;
	@Column
	private String comProfile;
	
	//一个公司发布多个岗位
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "companyInfo")
	private Set<Post> post = new HashSet<Post>(0);
	
	//一个人可以投递多个岗位
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "companyInfo")
	private Set<HasRecruit> hasRecruits = new HashSet<HasRecruit>(0);
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getComLogo() {
		return comLogo;
	}
	public void setComLogo(String comLogo) {
		this.comLogo = comLogo;
	}
	public String getComName() {
		return comName;
	}
	public void setComName(String comName) {
		this.comName = comName;
	}
	public String getComContacts() {
		return comContacts;
	}
	public void setComContacts(String comContacts) {
		this.comContacts = comContacts;
	}
	public String getContactsSex() {
		return contactsSex;
	}
	public void setContactsSex(String contactsSex) {
		this.contactsSex = contactsSex;
	}
	public String getComIndustry() {
		return comIndustry;
	}
	public void setComIndustry(String comIndustry) {
		this.comIndustry = comIndustry;
	}
	public String getComEmail() {
		return comEmail;
	}
	public void setComEmail(String comEmail) {
		this.comEmail = comEmail;
	}
	public String getComAddress() {
		return comAddress;
	}
	public void setComAddress(String comAddress) {
		this.comAddress = comAddress;
	}
	public String getComProfile() {
		return comProfile;
	}
	public void setComProfile(String comProfile) {
		this.comProfile = comProfile;
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
	public Set<Post> getPost() {
		return post;
	}
	public void setPost(Set<Post> post) {
		this.post = post;
	}
	public Set<HasRecruit> getHasRecruits() {
		return hasRecruits;
	}
	public void setHasRecruits(Set<HasRecruit> hasRecruits) {
		this.hasRecruits = hasRecruits;
	}
}

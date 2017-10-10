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
@Table(name = "schoolinfo")
public class SchoolInfo {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	@Column
	private String username;
	@Column
	private String password;
	@Column
	private String schLogo;
	@Column
	private String schName;
	@Column
	private String schContacts;
	@Column
	private String contactsSex;
	@Column
	private String schEmail;
	@Column
	private String schAddress;
	@Column
	private String schProfile;
	
	//一个学校拥有多个校招
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "schoolInfo")
	private Set<Recruit> recruit = new HashSet<Recruit>(0);
	
	//一个学校可以推荐多个岗位
	@OneToMany( fetch = FetchType.EAGER, mappedBy = "schoolInfo")
	private Set<RecPost> recPosts = new HashSet<RecPost>(0);
	
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
	public String getSchLogo() {
		return schLogo;
	}
	public void setSchLogo(String schLogo) {
		this.schLogo = schLogo;
	}
	public String getSchName() {
		return schName;
	}
	public void setSchName(String schName) {
		this.schName = schName;
	}
	public String getSchContacts() {
		return schContacts;
	}
	public void setSchContacts(String schContacts) {
		this.schContacts = schContacts;
	}
	public String getContactsSex() {
		return contactsSex;
	}
	public void setContactsSex(String contactsSex) {
		this.contactsSex = contactsSex;
	}
	public String getSchEmail() {
		return schEmail;
	}
	public void setSchEmail(String schEmail) {
		this.schEmail = schEmail;
	}
	public String getSchAddress() {
		return schAddress;
	}
	public void setSchAddress(String schAddress) {
		this.schAddress = schAddress;
	}
	public String getSchProfile() {
		return schProfile;
	}
	public void setSchProfile(String schProfile) {
		this.schProfile = schProfile;
	}
	public Set<Recruit> getRecruit() {
		return recruit;
	}
	public void setRecruit(Set<Recruit> recruit) {
		this.recruit = recruit;
	}
	public Set<RecPost> getRecPosts() {
		return recPosts;
	}
	public void setRecPosts(Set<RecPost> recPosts) {
		this.recPosts = recPosts;
	}
}

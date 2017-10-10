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
@Table(name = "user")
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	@Column
	private String username;
	@Column
	private String password;
	@Column
	private Integer type;
	//一个人可以发送多个消息
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "sendUser")
	private Set<Contact> sendContacts = new HashSet<Contact>(0);
	
	//一个人可以发送多个消息
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "receiveUser")
	private Set<Contact> receiveContacts = new HashSet<Contact>(0);
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
	public Set<Contact> getSendContacts() {
		return sendContacts;
	}
	public void setSendContacts(Set<Contact> sendContacts) {
		this.sendContacts = sendContacts;
	}
	public Set<Contact> getReceiveContacts() {
		return receiveContacts;
	}
	public void setReceiveContacts(Set<Contact> receiveContacts) {
		this.receiveContacts = receiveContacts;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}

	
}

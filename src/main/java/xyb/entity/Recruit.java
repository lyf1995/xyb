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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "recruit")
public class Recruit {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	@Column
	private String recruitName;
	@Column
	private int startTime;
	@Transient
	private String startTimeStr;
	@Column
	private int endTime;
	@Transient
	private String endTimeStr;
	@Column
	private String address;
	@Column
	private String recruitDetail;
	@Column
	private Integer releaseTime;
	@Transient
	private String releaseTimeStr;
	//多个校招被一个学校拥有
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "school_id", referencedColumnName = "id")
	private SchoolInfo schoolInfo;
	
	//一个校招可以被多个公司申请
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "recruit")
	private Set<HasRecruit> hasRecruits = new HashSet<HasRecruit>(0);
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getStartTime() {
		return startTime;
	}
	public void setStartTime(int startTime) {
		this.startTime = startTime;
	}
	public int getEndTime() {
		return endTime;
	}
	public void setEndTime(int endTime) {
		this.endTime = endTime;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getRecruitDetail() {
		return recruitDetail;
	}
	public void setRecruitDetail(String recruitDetail) {
		this.recruitDetail = recruitDetail;
	}
	public SchoolInfo getSchoolInfo() {
		return schoolInfo;
	}
	public void setSchoolInfo(SchoolInfo schoolInfo) {
		this.schoolInfo = schoolInfo;
	}
	public String getRecruitName() {
		return recruitName;
	}
	public void setRecruitName(String recruitName) {
		this.recruitName = recruitName;
	}
	public Integer getReleaseTime() {
		return releaseTime;
	}
	public void setReleaseTime(Integer releaseTime) {
		this.releaseTime = releaseTime;
	}
	public Set<HasRecruit> getHasRecruits() {
		return hasRecruits;
	}
	public void setHasRecruits(Set<HasRecruit> hasRecruits) {
		this.hasRecruits = hasRecruits;
	}
	public String getStartTimeStr() {
		return startTimeStr;
	}
	public void setStartTimeStr(String startTimeStr) {
		this.startTimeStr = startTimeStr;
	}
	public String getEndTimeStr() {
		return endTimeStr;
	}
	public void setEndTimeStr(String endTimeStr) {
		this.endTimeStr = endTimeStr;
	}
	public String getReleaseTimeStr() {
		return releaseTimeStr;
	}
	public void setReleaseTimeStr(String releaseTimeStr) {
		this.releaseTimeStr = releaseTimeStr;
	}
}

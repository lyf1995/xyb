package xyb.entity;

public class RecruitPojo {
	private int id;
	private String recruitName;
	private String startTimeStr;
	private Integer startTime;
	private String endTimeStr;
	private Integer endTime;
	private String address;
	private String recruitDetail;
	private String releaseTimeStr;
	private Integer releaseTime;
	private String schName;
	private String schLogo;
	private String has;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRecruitName() {
		return recruitName;
	}
	public void setRecruitName(String recruitName) {
		this.recruitName = recruitName;
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
	
	public String getSchName() {
		return schName;
	}
	public void setSchName(String schName) {
		this.schName = schName;
	}
	public String getReleaseTimeStr() {
		return releaseTimeStr;
	}
	public void setReleaseTimeStr(String releaseTimeStr) {
		this.releaseTimeStr = releaseTimeStr;
	}
	public Integer getReleaseTime() {
		return releaseTime;
	}
	public void setReleaseTime(Integer releaseTime) {
		this.releaseTime = releaseTime;
	}
	public String getStartTimeStr() {
		return startTimeStr;
	}
	public void setStartTimeStr(String startTimeStr) {
		this.startTimeStr = startTimeStr;
	}
	public Integer getStartTime() {
		return startTime;
	}
	public void setStartTime(Integer startTime) {
		this.startTime = startTime;
	}
	public String getEndTimeStr() {
		return endTimeStr;
	}
	public void setEndTimeStr(String endTimeStr) {
		this.endTimeStr = endTimeStr;
	}
	public Integer getEndTime() {
		return endTime;
	}
	public void setEndTime(Integer endTime) {
		this.endTime = endTime;
	}
	public String getSchLogo() {
		return schLogo;
	}
	public void setSchLogo(String schLogo) {
		this.schLogo = schLogo;
	}
	public String getHas() {
		return has;
	}
	public void setHas(String has) {
		this.has = has;
	}
	
}
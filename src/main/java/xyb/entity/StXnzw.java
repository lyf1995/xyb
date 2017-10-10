package xyb.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "stxnzw")
public class StXnzw {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	@Column
	private int dutyStartYear;
	@Column
	private int dutyStartMonth;
	@Column
	private int dutyEndYear;
	@Column
	private int dutyEndMonth;
	@Column
	private String dutyName;
	@Column
	private String dutyDescribe;
	//多个校内职务被一个人拥有
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "student_id", referencedColumnName = "id")
	private StudentInfo studentInfo;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getDutyStartYear() {
		return dutyStartYear;
	}
	public void setDutyStartYear(int dutyStartYear) {
		this.dutyStartYear = dutyStartYear;
	}
	public int getDutyStartMonth() {
		return dutyStartMonth;
	}
	public void setDutyStartMonth(int dutyStartMonth) {
		this.dutyStartMonth = dutyStartMonth;
	}
	public int getDutyEndYear() {
		return dutyEndYear;
	}
	public void setDutyEndYear(int dutyEndYear) {
		this.dutyEndYear = dutyEndYear;
	}
	public int getDutyEndMonth() {
		return dutyEndMonth;
	}
	public void setDutyEndMonth(int dutyEndMonth) {
		this.dutyEndMonth = dutyEndMonth;
	}
	public String getDutyName() {
		return dutyName;
	}
	public void setDutyName(String dutyName) {
		this.dutyName = dutyName;
	}
	public String getDutyDescribe() {
		return dutyDescribe;
	}
	public void setDutyDescribe(String dutyDescribe) {
		this.dutyDescribe = dutyDescribe;
	}
	public StudentInfo getStudentInfo() {
		return studentInfo;
	}
	public void setStudentInfo(StudentInfo studentInfo) {
		this.studentInfo = studentInfo;
	}
}

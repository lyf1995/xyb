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
@Table(name = "styynl")
public class StYynl {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	@Column
	private String lgName;
	@Column
	private String lgTS;
	@Column
	private String lgDX;
	//多个语言能力被一个人拥有
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "student_id", referencedColumnName = "id")
	private StudentInfo studentInfo;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getLgName() {
		return lgName;
	}
	public void setLgName(String lgName) {
		this.lgName = lgName;
	}
	public String getLgTS() {
		return lgTS;
	}
	public void setLgTS(String lgTS) {
		this.lgTS = lgTS;
	}
	public String getLgDX() {
		return lgDX;
	}
	public void setLgDX(String lgDX) {
		this.lgDX = lgDX;
	}
	public StudentInfo getStudentInfo() {
		return studentInfo;
	}
	public void setStudentInfo(StudentInfo studentInfo) {
		this.studentInfo = studentInfo;
	}
}

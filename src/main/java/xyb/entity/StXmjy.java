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
@Table(name = "stxmjy")
public class StXmjy {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	@Column
	private int itemStartYear;
	@Column
	private int itemStartMonth;
	@Column
	private int itemEndYear;
	@Column
	private int itemEndMonth;
	@Column
	private String itemName;
	@Column
	private String itemDuty;
	@Column
	private String itemDescribe;
	//多个项目经验被一个人拥有
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "student_id", referencedColumnName = "id")
	private StudentInfo studentInfo;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getItemStartYear() {
		return itemStartYear;
	}
	public void setItemStartYear(int itemStartYear) {
		this.itemStartYear = itemStartYear;
	}
	
	public int getItemEndYear() {
		return itemEndYear;
	}
	public void setItemEndYear(int itemEndYear) {
		this.itemEndYear = itemEndYear;
	}
	public int getItemEndMonth() {
		return itemEndMonth;
	}
	public void setItemEndMonth(int itemEndMonth) {
		this.itemEndMonth = itemEndMonth;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getItemDuty() {
		return itemDuty;
	}
	public void setItemDuty(String itemDuty) {
		this.itemDuty = itemDuty;
	}
	public String getItemDescribe() {
		return itemDescribe;
	}
	public void setItemDescribe(String itemDescribe) {
		this.itemDescribe = itemDescribe;
	}
	public StudentInfo getStudentInfo() {
		return studentInfo;
	}
	public void setStudentInfo(StudentInfo studentInfo) {
		this.studentInfo = studentInfo;
	}
	public int getItemStartMonth() {
		return itemStartMonth;
	}
	public void setItemStartMonth(int itemStartMonth) {
		this.itemStartMonth = itemStartMonth;
	}

}

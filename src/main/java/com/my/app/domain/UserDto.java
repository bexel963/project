package com.my.app.domain;

import java.util.Date;
import java.util.Objects;

import org.springframework.format.annotation.DateTimeFormat;

public class UserDto {
	
	private String id;
	private String pwd;
	private String name;
	private String address;
	private String phone;
	private String email;
	private Date birth;
	private Date reg_date;
	private Integer grade;
	
	public UserDto(String id, String pwd, String name, String address, String phone, String email, Date birth) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.email = email;
		this.birth = birth;
	}
	public Integer getGrade() {
		return grade;
	}
	public void setGrade(Integer grade) {
		this.grade = grade;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	@Override
	public int hashCode() {
		return Objects.hash(address, birth, email, id, name, phone, pwd, reg_date);
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		UserDto other = (UserDto) obj;
		return Objects.equals(address, other.address) && Objects.equals(birth, other.birth)
				&& Objects.equals(email, other.email) && Objects.equals(id, other.id)
				&& Objects.equals(name, other.name) && Objects.equals(phone, other.phone)
				&& Objects.equals(pwd, other.pwd) && Objects.equals(reg_date, other.reg_date);
	}
	@Override
	public String toString() {
		return "UserDto [id=" + id + ", pwd=" + pwd + ", name=" + name + ", address=" + address
				+ ", phone=" + phone + ", email=" + email + ", birth=" + birth + ", reg_date=" + reg_date + "]";
	}
	
	
}

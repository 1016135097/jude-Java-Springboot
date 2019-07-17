package com.jude.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.validator.constraints.NotEmpty;

/**
 * 用户实体
 * @author jude
 *
 */
@Entity
@Table(name="t_user")
public class User {

	@Id
	@GeneratedValue
	private Integer id; // 编号
	
	@NotEmpty(message="请输入用户名！")
	@Column(length=50)
	private String userName; // 用户名
	
	@NotEmpty(message="请输入密码！")
	@Column(length=50)
	private String password; // 密码
	
	@Column(length=50)
	private String trueName; // 真实姓名
	
	@Column(length=1000)
	private String remarks; // 备注
	
	@Transient
	private String roles; 
	

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getTrueName() {
		return trueName;
	}

	public void setTrueName(String trueName) {
		this.trueName = trueName;
	}


	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getRoles() {
		return roles;
	}

	public void setRoles(String roles) {
		this.roles = roles;
	}

	@Override
	public String toString() {
		return "[id=" + id + ", userName=" + userName + ", password=" + password + ", trueName=" + trueName
				+ ", remarks=" + remarks + ", roles=" + roles + "]";
	}

	
	
}

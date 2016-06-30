package com.web.beacon.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Table;

@Entity
@Table(name="BEACON_USER")
@Inheritance(strategy=InheritanceType.JOINED)
public class User {

	private String uname;
	private String password;
	private String role;
	
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	
	@Id
	@Column(name="USER_NAME")
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	
	@Column(name="PASSWD")
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public User(String uname, String password) {
		super();
		this.uname = uname;
		this.password = password;
		this.role="ROLE_USER";
	}
	public User(){
		super();
	}
	
	public boolean equals(Object u){
		if(u==null||!(u instanceof User)) return false;
		User u1 = (User)u;
		return uname.equals(u1.uname)&&password.equals(u1.password)&&role.equals(u1.role);
	}
}

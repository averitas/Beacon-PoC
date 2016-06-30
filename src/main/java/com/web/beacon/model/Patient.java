package com.web.beacon.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name="BEACON_PATIENT")
@PrimaryKeyJoinColumn(name="USER_NAME")
public class Patient extends User{

	private String fname;
	private String lname;
	private String email;
	private String address;

	public Patient(){
		super();
	}
	public Patient(String uname, String password, String fname, String lname, String email, String address) {
		super(uname, password);
		this.fname = fname;
		this.lname = lname;
		this.email = email;
		this.address = address;
	}
	
	@Column(name="FIRST_NAME")
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	
	@Column(name="LAST_NAME")
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	
	@Column(name="EMAIL")
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Column(name="ADDRESS")
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	public boolean equals(Object patient){
		if(patient==null||!(patient instanceof Patient)) return false;
		Patient p = (Patient)patient;
		return super.equals(p)&&fname.equals(p.fname)&&lname.equals(p.lname)
				&&email.equals(p.email)&&address.equals(p.address);
	}
	
}

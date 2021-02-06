package com.example.demo;


import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="user")
public class UserData {
	@Id
    private int id;
	
private String name;
private double mobile;
private String email;
private String password;
public UserData() {
	super();
	// TODO Auto-generated constructor stub
}
public UserData(int id,String name, double mobile, String email, String password) {
	super();
	this.id =id;
	this.name = name;
	this.mobile = mobile;
	this.email = email;
	this.password = password;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public double getMobile() {
	return mobile;
}
public void setMobile(double mobile) {
	this.mobile = mobile;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}

}

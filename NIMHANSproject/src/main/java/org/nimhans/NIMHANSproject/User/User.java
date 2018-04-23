package org.nimhans.NIMHANSproject.User;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class User {
	String uid;
	String uname;
	String password;
	String role;
	String secQues;
	String secAns;
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getSecQues() {
		return secQues;
	}
	public void setSecQues(String secQues) {
		this.secQues = secQues;
	}
	public String getSecAns() {
		return secAns;
	}
	public void setSecAns(String secAns) {
		this.secAns = secAns;
	}
	public User(String uid, String uname, String password, String role, String secQues, String secAns) {
		super();
		this.uid = uid;
		this.uname = uname;
		this.password = password;
		this.role = role;
		this.secQues = secQues;
		this.secAns = secAns;
	}
	public User() {
		
	}

	
}

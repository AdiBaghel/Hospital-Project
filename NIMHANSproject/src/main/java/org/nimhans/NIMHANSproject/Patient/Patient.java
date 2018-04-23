package org.nimhans.NIMHANSproject.Patient;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Patient {
	String pid;
	String pname;
	String pcontact;
	String pemail;
	String paddress;
	int age;
	String gender;
	String PhotoURL;
	
	public Patient() {
		
	}
	
	
	public Patient(String photoURL) {
		super();
		PhotoURL = photoURL;
	}
	public String getPhotoURL() {
		return PhotoURL;
	}
	public void setPhotoURL(String photoURL) {
		PhotoURL = photoURL;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPcontact() {
		return pcontact;
	}
	public void setPcontact(String pcontact) {
		this.pcontact = pcontact;
	}
	public String getPemail() {
		return pemail;
	}
	public void setPemail(String pemail) {
		this.pemail = pemail;
	}
	public String getPaddress() {
		return paddress;
	}
	public void setPaddress(String paddress) {
		this.paddress = paddress;
	}
	
	
}

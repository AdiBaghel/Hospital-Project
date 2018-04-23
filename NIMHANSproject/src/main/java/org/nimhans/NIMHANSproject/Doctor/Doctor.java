package org.nimhans.NIMHANSproject.Doctor;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Doctor {

	String did;
	String dname;
	String dcontact;
	String demail;
	String daddress;
	String ddept;
	
	public String getDid() {
		return did;
	}
	
	public void setDid(String did) {
		this.did = did;
	}
	
	public String getDname() {
		return dname;
	}
	
	public void setDname(String dname) {
		this.dname = dname;
	}
	
	public String getDcontact() {
		return dcontact;
	}
	
	public void setDcontact(String dcontact) {
		this.dcontact = dcontact;
	}
	
	public String getDemail() {
		return demail;
	}
	
	public void setDemail(String demail) {
		this.demail = demail;
	}
	
	public String getDaddress() {
		return daddress;
	}
	
	public void setDaddress(String daddress) {
		this.daddress = daddress;
	}
	
	public String getDdept() {
		return ddept;
	}
	
	public void setDdept(String ddept) {
		this.ddept = ddept;
	}
	
}

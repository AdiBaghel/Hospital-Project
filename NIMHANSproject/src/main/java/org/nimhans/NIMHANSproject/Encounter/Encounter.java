package org.nimhans.NIMHANSproject.Encounter;


import java.sql.Date;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Encounter {
	
	String eid;
	String pid;
	String did;
	Date startDate;
	Date closeDate;
	Boolean closedFlag;
	public String getEid() {
		return eid;
	}
	public void setEid(String eid) {
		this.eid = eid;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getDid() {
		return did;
	}
	public void setDid(String did) {
		this.did = did;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getCloseDate() {
		return closeDate;
	}
	public void setCloseDate(Date closeDate) {
		this.closeDate = closeDate;
	}
	public Boolean getClosedFlag() {
		return closedFlag;
	}
	public void setClosedFlag(Boolean closedFlag) {
		this.closedFlag = closedFlag;
	}
	public Encounter(String eid, String pid, String did, Date startDate, Date closeDate, Boolean closedFlag) {
		super();
		this.eid = eid;
		this.pid = pid;
		this.did = did;
		this.startDate = startDate;
		this.closeDate = closeDate;
		this.closedFlag = closedFlag;
	}
	public Encounter() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
		
}

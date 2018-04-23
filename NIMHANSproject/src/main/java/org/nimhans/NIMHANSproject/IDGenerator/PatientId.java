package org.nimhans.NIMHANSproject.IDGenerator;

public class PatientId {
   String pid;

   
   public PatientId()
   {
	   
   }
public String getPid() {
	return pid;
}

public void setPid(String pid) {
	this.pid = pid;
}

public PatientId(String pid) {
	super();
	this.pid = pid;
}
   
}

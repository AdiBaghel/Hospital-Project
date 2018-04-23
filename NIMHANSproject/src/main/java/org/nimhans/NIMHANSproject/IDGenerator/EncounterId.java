package org.nimhans.NIMHANSproject.IDGenerator;

public class EncounterId {
	String encounterId;
	String phyEncounterId;
	String patEncounterId;
	String neuEncounterId;
	String cliEncounterId;
	public EncounterId()
	{
		
	}
	public EncounterId(String encounterId, String phyEncounterId, String patEncounterId, String neuEncounterId,
			String cliEncounterId) {
		super();
		this.encounterId = encounterId;
		this.phyEncounterId = phyEncounterId;
		this.patEncounterId = patEncounterId;
		this.neuEncounterId = neuEncounterId;
		this.cliEncounterId = cliEncounterId;
	}
	public String getEncounterId() {
		return encounterId;
	}
	public void setEncounterId(String encounterId) {
		this.encounterId = encounterId;
	}
	public String getPhyEncounterId() {
		return phyEncounterId;
	}
	public void setPhyEncounterId(String phyEncounterId) {
		this.phyEncounterId = phyEncounterId;
	}
	public String getPatEncounterId() {
		return patEncounterId;
	}
	public void setPatEncounterId(String patEncounterId) {
		this.patEncounterId = patEncounterId;
	}
	public String getNeuEncounterId() {
		return neuEncounterId;
	}
	public void setNeuEncounterId(String neuEncounterId) {
		this.neuEncounterId = neuEncounterId;
	}
	public String getCliEncounterId() {
		return cliEncounterId;
	}
	public void setCliEncounterId(String cliEncounterId) {
		this.cliEncounterId = cliEncounterId;
	}

}

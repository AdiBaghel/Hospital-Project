package org.nimhans.NIMHANSproject.Encounter;


import java.sql.Date;
import java.sql.Time;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class EncounterPatientDetails extends Encounter{

	private String epdid;
	private String eid;
	private String pid;
	private String did;
	private Date dateOfExamination;
	private String timeOfExamination;
	private String informantName;
	private String informantType;
	private Date dateOfInjury;
	private String timeOfInjury;
	private String placeOfInjury;
	private String incidentScenario;
	private boolean vehicle_type;
	private boolean rta_two_helmet;
	private boolean rta_two_alcohol;
	private boolean rta_four_alcohol;
	private String rta_four_victimtype;
	private boolean fall_alcohol;
	private boolean assault_person_type;
	private String fall_siteoffall;
	private String otherInfo;
	private String commonText;
	private boolean fall_siteoffall_flag;
	private boolean otherInfo_flag;
	private boolean commonText_flag;
	private boolean closedFlag;

	public boolean isClosedFlag() {
		return closedFlag;
	}
	public void setClosedFlag(boolean closedFlag) {
		this.closedFlag = closedFlag;
	}
	public String getEpdid() {
		return epdid;
	}
	public void setEpdid(String epdid) {
		this.epdid = epdid;
	}
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
	public Date getDateOfExamination() {
		return dateOfExamination;
	}
	public String getFall_siteoffall() {
		return fall_siteoffall;
	}
	public void setFall_siteoffall(String fall_siteoffall) {
		this.fall_siteoffall = fall_siteoffall;
	}
	public String getOtherInfo() {
		return otherInfo;
	}
	public void setOtherInfo(String otherInfo) {
		this.otherInfo = otherInfo;
	}
	public String getCommonText() {
		return commonText;
	}
	public void setCommonText(String commonText) {
		this.commonText = commonText;
	}
	public boolean isFall_siteoffall_flag() {
		return fall_siteoffall_flag;
	}
	public void setFall_siteoffall_flag(boolean fall_siteoffall_flag) {
		this.fall_siteoffall_flag = fall_siteoffall_flag;
	}
	public boolean isOtherInfo_flag() {
		return otherInfo_flag;
	}
	public void setOtherInfo_flag(boolean otherInfo_flag) {
		this.otherInfo_flag = otherInfo_flag;
	}
	public boolean isCommonText_flag() {
		return commonText_flag;
	}
	public void setCommonText_flag(boolean commonText_flag) {
		this.commonText_flag = commonText_flag;
	}
	public boolean isVehicle_type() {
		return vehicle_type;
	}
	public void setVehicle_type(boolean vehicle_type) {
		this.vehicle_type = vehicle_type;
	}
	public boolean isRta_two_helmet() {
		return rta_two_helmet;
	}
	public void setRta_two_helmet(boolean rta_two_helmet) {
		this.rta_two_helmet = rta_two_helmet;
	}
	public boolean isRta_two_alcohol() {
		return rta_two_alcohol;
	}
	public void setRta_two_alcohol(boolean rta_two_alcohol) {
		this.rta_two_alcohol = rta_two_alcohol;
	}
	public boolean isRta_four_alcohol() {
		return rta_four_alcohol;
	}
	public void setRta_four_alcohol(boolean rta_four_alcohol) {
		this.rta_four_alcohol = rta_four_alcohol;
	}
	public String getRta_four_victimtype() {
		return rta_four_victimtype;
	}
	public void setRta_four_victimtype(String rta_four_victimtype) {
		this.rta_four_victimtype = rta_four_victimtype;
	}
	public boolean isFall_alcohol() {
		return fall_alcohol;
	}
	public void setFall_alcohol(boolean fall_alcohol) {
		this.fall_alcohol = fall_alcohol;
	}
	public boolean isAssault_person_type() {
		return assault_person_type;
	}
	public void setAssault_person_type(boolean assault_person_type) {
		this.assault_person_type = assault_person_type;
	}
	public void setDateOfExamination(Date dateOfExamination) {
		this.dateOfExamination = dateOfExamination;
	}
	public String getTimeOfExamination() {
		System.out.println("I am in java file 1"+timeOfExamination);
		return timeOfExamination;
	}
	public void setTimeOfExamination(String timeOfExamination) {
		System.out.println("I am in java file 2 "+timeOfExamination);
		this.timeOfExamination = timeOfExamination;
	}
	public String getInformantName() {
		return informantName;
	}
	public void setInformantName(String informantName) {
		this.informantName = informantName;
	}
	public String getInformantType() {
		return informantType;
	}
	public void setInformantType(String informantType) {
		this.informantType = informantType;
	}
	public Date getDateOfInjury() {
		return dateOfInjury;
	}
	public void setDateOfInjury(Date dateOfInjury) {
		this.dateOfInjury = dateOfInjury;
	}
	public String getTimeOfInjury() {
		System.out.println("I am in java file"+timeOfInjury);
		return timeOfInjury;
	}
	public void setTimeOfInjury(String timeOfInjury) {
		System.out.println("I am in java file"+timeOfInjury);
		this.timeOfInjury = timeOfInjury;
	}
	public String getPlaceOfInjury() {
		return placeOfInjury;
	}
	public void setPlaceOfInjury(String placeOfInjury) {
		this.placeOfInjury = placeOfInjury;
	}
	public String getIncidentScenario() {
		return incidentScenario;
	}
	public void setIncidentScenario(String incidentScenario) {
		this.incidentScenario = incidentScenario;
	}

	public EncounterPatientDetails() {}

	public EncounterPatientDetails(String epdid, String eid, String pid, String did,Date dateOfExamination, String timeOfExamination, 
			String informantName, String informantType,Date dateOfInjury, String timeOfInjury, String placeOfInjury, String incidentScenario, 
			boolean vehicle_type,boolean rta_two_helmet,boolean rta_two_alcohol,boolean rta_four_alcohol,String rta_four_victimtype,
			boolean fall_alcohol,boolean assault_person_type,String fall_siteoffall,boolean fall_siteoffall_flag,boolean otherInfo_flag,
			String otherInfo,String commonText,boolean commonText_flag,boolean closedFlag) {
		super();
		this.epdid = epdid;
		this.eid = eid;
		this.pid = pid;
		this.did = did;
		this.dateOfExamination = dateOfExamination;
		this.timeOfExamination = timeOfExamination;
		this.informantName = informantName;
		this.informantType = informantType;
		this.dateOfInjury = dateOfInjury;
		this.timeOfInjury = timeOfInjury;
		this.placeOfInjury = placeOfInjury;
		this.incidentScenario = incidentScenario;
		this.vehicle_type = vehicle_type;
		this.rta_two_helmet =rta_two_helmet;
		this.rta_two_alcohol = rta_two_alcohol;
		this.rta_four_alcohol = rta_four_alcohol;
		this.rta_four_victimtype = rta_four_victimtype;
		this.fall_alcohol = fall_alcohol;
		this.assault_person_type = assault_person_type;
		this.fall_siteoffall = fall_siteoffall;
		this.fall_siteoffall_flag = fall_siteoffall_flag;
		this.otherInfo = otherInfo;
		this.otherInfo_flag = otherInfo_flag;
		this.commonText = commonText;
		this.commonText_flag = commonText_flag;
		this.closedFlag = closedFlag;
	}



}
package org.nimhans.NIMHANSproject.Encounter;


public class EncounterClinicalImpression extends Encounter{

	private String ecid;
	private String eid;
	private String did;
	private boolean anyChangeNeurological;
	private String ctScanHead;
	private boolean ctScanHeadSketchPad;
	private String xrayDetails;
	private boolean xrayDetailsSketchPad;
	private String managementPlan;
	private boolean managementPlanSketchPad;
	private String courseInHospital;
	private boolean courseInHospitalSketchPad;
	private String conditionAtDischarge;
	private boolean conditionAtDischargeSketchPad;
	private boolean closedFlag;
	
	public EncounterClinicalImpression() {
		
	}

	public EncounterClinicalImpression(String ecid, String eid, String did, boolean anyChangeNeurological,
			String ctScanHead, boolean ctScanHeadSketchPad, String xrayDetails, boolean xrayDetailsSketchPad,
			String managementPlan, boolean managementPlanSketchPad, String courseInHospital,
			boolean courseInHospitalSketchPad, String conditionAtDischarge, boolean conditionAtDischargeSketchPad,boolean closedFlag) {
		super();
		this.ecid = ecid;
		this.eid = eid;
		this.did = did;
		this.anyChangeNeurological = anyChangeNeurological;
		this.ctScanHead = ctScanHead;
		this.ctScanHeadSketchPad = ctScanHeadSketchPad;
		this.xrayDetails = xrayDetails;
		this.xrayDetailsSketchPad = xrayDetailsSketchPad;
		this.managementPlan = managementPlan;
		this.managementPlanSketchPad = managementPlanSketchPad;
		this.courseInHospital = courseInHospital;
		this.courseInHospitalSketchPad = courseInHospitalSketchPad;
		this.conditionAtDischarge = conditionAtDischarge;
		this.conditionAtDischargeSketchPad = conditionAtDischargeSketchPad;
		this.closedFlag = closedFlag;
	}

	public String getEcid() {
		return ecid;
	}

	public void setEcid(String ecid) {
		this.ecid = ecid;
	}

	public String getEid() {
		return eid;
	}

	public void setEid(String eid) {
		this.eid = eid;
	}

	public String getDid() {
		return did;
	}

	public void setDid(String did) {
		this.did = did;
	}

	public boolean isAnyChangeNeurological() {
		return anyChangeNeurological;
	}

	public void setAnyChangeNeurological(boolean anyChangeNeurological) {
		this.anyChangeNeurological = anyChangeNeurological;
	}

	public String getCtScanHead() {
		return ctScanHead;
	}

	public void setCtScanHead(String ctScanHead) {
		this.ctScanHead = ctScanHead;
	}

	public boolean isCtScanHeadSketchPad() {
		return ctScanHeadSketchPad;
	}

	public void setCtScanHeadSketchPad(boolean ctScanHeadSketchPad) {
		this.ctScanHeadSketchPad = ctScanHeadSketchPad;
	}

	public String getXrayDetails() {
		return xrayDetails;
	}

	public void setXrayDetails(String xrayDetails) {
		this.xrayDetails = xrayDetails;
	}

	public boolean isXrayDetailsSketchPad() {
		return xrayDetailsSketchPad;
	}

	public void setXrayDetailsSketchPad(boolean xrayDetailsSketchPad) {
		this.xrayDetailsSketchPad = xrayDetailsSketchPad;
	}

	public String getManagementPlan() {
		return managementPlan;
	}

	public void setManagementPlan(String managementPlan) {
		this.managementPlan = managementPlan;
	}

	public boolean isManagementPlanSketchPad() {
		return managementPlanSketchPad;
	}

	public void setManagementPlanSketchPad(boolean managementPlanSketchPad) {
		this.managementPlanSketchPad = managementPlanSketchPad;
	}

	public String getCourseInHospital() {
		return courseInHospital;
	}

	public void setCourseInHospital(String courseInHospital) {
		this.courseInHospital = courseInHospital;
	}

	public boolean isCourseInHospitalSketchPad() {
		return courseInHospitalSketchPad;
	}

	public void setCourseInHospitalSketchPad(boolean courseInHospitalSketchPad) {
		this.courseInHospitalSketchPad = courseInHospitalSketchPad;
	}

	public String getConditionAtDischarge() {
		return conditionAtDischarge;
	}

	public void setConditionAtDischarge(String conditionAtDischarge) {
		this.conditionAtDischarge = conditionAtDischarge;
	}

	public boolean isConditionAtDischargeSketchPad() {
		return conditionAtDischargeSketchPad;
	}

	public void setConditionAtDischargeSketchPad(boolean conditionAtDischargeSketchPad) {
		this.conditionAtDischargeSketchPad = conditionAtDischargeSketchPad;
	}

	public boolean isClosedFlag() {
		return closedFlag;
	}

	public void setClosedFlag(boolean closedFlag) {
		this.closedFlag = closedFlag;
	}
	
		
}

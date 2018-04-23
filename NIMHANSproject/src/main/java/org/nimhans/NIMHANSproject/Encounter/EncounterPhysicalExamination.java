package org.nimhans.NIMHANSproject.Encounter;

public class EncounterPhysicalExamination {
	
	private String epeid;
	private String eid;
	private String did;
	private boolean lossOfConsciousness  ;
	private boolean lucidInterval;
	private boolean seizures;
	private boolean vomiting;
	private boolean amnesia ;
	private boolean bleedingFromEar;
	private boolean bleedingFromNose;
	private String historyOfInjuryCommon;
	private boolean historyOfInjuryCommonFlag;
	private String airwayOnArrival ;
	private String spontaneousRespiration;
	private boolean carotidPulsationLeft;
	private boolean carotidPulsationRight;
	private String pulseRrate;
	private String bpOnArrivalSystolic;
	private String bpOnArrivalDystolic;
	private String bpAfterHalfHourSystolic;
	private String bpAfterHalfHourDystolic;
	private String csf;
	private boolean activePeripheralBleeding;
	private boolean fractures;
	private boolean peripheralPulses;
	private boolean chestInjury;
	private boolean abdominalInjury;
	private boolean wounds;
	private boolean spinalTenderness;
	private boolean spinalDeformity;
	private boolean systemicExaminationCommonFlag;
	private String systemicExaminationCommon;
	private boolean closedFlag;
	
	public EncounterPhysicalExamination()
	{
		
	}
	public String getEpeid() {
		return epeid;
	}
	public void setEpeid(String epeid) {
		this.epeid = epeid;
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
	public boolean isLossOfConsciousness() {
		return lossOfConsciousness;
	}
	public void setLossOfConsciousness(boolean lossOfConsciousness) {
		this.lossOfConsciousness = lossOfConsciousness;
	}
	public boolean isLucidInterval() {
		return lucidInterval;
	}
	public void setLucidInterval(boolean lucidInterval) {
		this.lucidInterval = lucidInterval;
	}
	public boolean isSeizures() {
		return seizures;
	}
	public void setSeizures(boolean seizures) {
		this.seizures = seizures;
	}
	public boolean isVomiting() {
		return vomiting;
	}
	public void setVomiting(boolean vomiting) {
		this.vomiting = vomiting;
	}
	public boolean isAmnesia() {
		return amnesia;
	}
	public void setAmnesia(boolean amnesia) {
		this.amnesia = amnesia;
	}
	public boolean isBleedingFromEar() {
		return bleedingFromEar;
	}
	public void setBleedingFromEar(boolean bleedingFromEar) {
		this.bleedingFromEar = bleedingFromEar;
	}
	public boolean isBleedingFromNose() {
		return bleedingFromNose;
	}
	public void setBleedingFromNose(boolean bleedingFromNose) {
		this.bleedingFromNose = bleedingFromNose;
	}
	public String getHistoryOfInjuryCommon() {
		return historyOfInjuryCommon;
	}
	public void setHistoryOfInjuryCommon(String historyOfInjuryCommon) {
		this.historyOfInjuryCommon = historyOfInjuryCommon;
	}
	public boolean isHistoryOfInjuryCommonFlag() {
		return historyOfInjuryCommonFlag;
	}
	public void setHistoryOfInjuryCommonFlag(boolean historyOfInjuryCommonFlag) {
		this.historyOfInjuryCommonFlag = historyOfInjuryCommonFlag;
	}
	public String getAirwayOnArrival() {
		return airwayOnArrival;
	}
	public void setAirwayOnArrival(String airwayOnArrival) {
		this.airwayOnArrival = airwayOnArrival;
	}
	public String getSpontaneousRespiration() {
		return spontaneousRespiration;
	}
	public void setSpontaneousRespiration(String spontaneousRespiration) {
		this.spontaneousRespiration = spontaneousRespiration;
	}
	public boolean isCarotidPulsationLeft() {
		return carotidPulsationLeft;
	}
	public void setCarotidPulsationLeft(boolean carotidPulsationLeft) {
		this.carotidPulsationLeft = carotidPulsationLeft;
	}
	public boolean isCarotidPulsationRight() {
		return carotidPulsationRight;
	}
	public void setCarotidPulsationRight(boolean carotidPulsationRight) {
		this.carotidPulsationRight = carotidPulsationRight;
	}
	public String getPulseRrate() {
		return pulseRrate;
	}
	public void setPulseRrate(String pulseRrate) {
		this.pulseRrate = pulseRrate;
	}
	public String getBpOnArrivalSystolic() {
		return bpOnArrivalSystolic;
	}
	public void setBpOnArrivalSystolic(String bpOnArrivalSystolic) {
		this.bpOnArrivalSystolic = bpOnArrivalSystolic;
	}
	public String getBpOnArrivalDystolic() {
		return bpOnArrivalDystolic;
	}
	public void setBpOnArrivalDystolic(String bpOnArrivalDystolic) {
		this.bpOnArrivalDystolic = bpOnArrivalDystolic;
	}
	public String getBpAfterHalfHourSystolic() {
		return bpAfterHalfHourSystolic;
	}
	public void setBpAfterHalfHourSystolic(String bpAfterHalfHourSystolic) {
		this.bpAfterHalfHourSystolic = bpAfterHalfHourSystolic;
	}
	public String getBpAfterHalfHourDystolic() {
		return bpAfterHalfHourDystolic;
	}
	public void setBpAfterHalfHourDystolic(String bpAfterHalfHourDystolic) {
		this.bpAfterHalfHourDystolic = bpAfterHalfHourDystolic;
	}
	public String getCsf() {
		return csf;
	}
	public void setCsf(String csf) {
		this.csf = csf;
	}
	public boolean isActivePeripheralBleeding() {
		return activePeripheralBleeding;
	}
	public void setActivePeripheralBleeding(boolean activePeripheralBleeding) {
		this.activePeripheralBleeding = activePeripheralBleeding;
	}
	public boolean isFractures() {
		return fractures;
	}
	public void setFractures(boolean fractures) {
		this.fractures = fractures;
	}
	public boolean isPeripheralPulses() {
		return peripheralPulses;
	}
	public void setPeripheralPulses(boolean peripheralPulses) {
		this.peripheralPulses = peripheralPulses;
	}
	public boolean isChestInjury() {
		return chestInjury;
	}
	public void setChestInjury(boolean chestInjury) {
		this.chestInjury = chestInjury;
	}
	public boolean isAbdominalInjury() {
		return abdominalInjury;
	}
	public void setAbdominalInjury(boolean abdominalInjury) {
		this.abdominalInjury = abdominalInjury;
	}
	public boolean isWounds() {
		return wounds;
	}
	public void setWounds(boolean wounds) {
		this.wounds = wounds;
	}
	public boolean isSpinalTenderness() {
		return spinalTenderness;
	}
	public void setSpinalTenderness(boolean spinalTenderness) {
		this.spinalTenderness = spinalTenderness;
	}
	public boolean isSpinalDeformity() {
		return spinalDeformity;
	}
	public void setSpinalDeformity(boolean spinalDeformity) {
		this.spinalDeformity = spinalDeformity;
	}
	public boolean isSystemicExaminationCommonFlag() {
		return systemicExaminationCommonFlag;
	}
	public void setSystemicExaminationCommonFlag(boolean systemicExaminationCommonFlag) {
		this.systemicExaminationCommonFlag = systemicExaminationCommonFlag;
	}
	public String getSystemicExaminationCommon() {
		return systemicExaminationCommon;
	}
	public void setSystemicExaminationCommon(String systemicExaminationCommon) {
		this.systemicExaminationCommon = systemicExaminationCommon;
	}
	public boolean isClosedFlag() {
		return closedFlag;
	}
	public void setClosedFlag(boolean closedFlag) {
		this.closedFlag = closedFlag;
	}



	public EncounterPhysicalExamination(String epeid, String eid, String did, boolean lossOfConsciousness,
			boolean lucidInterval, boolean seizures, boolean vomiting, boolean amnesia, boolean bleedingFromEar,
			 boolean bleedingFromNose,String historyOfInjuryCommon, boolean historyOfInjuryCommonFlag,
			String airwayOnArrival, String spontaneousRespiration,boolean carotidPulsationLeft,boolean carotidPulsationRight,String pulseRrate,
			String bpOnArrivalSystolic,String bpOnArrivalDystolic,String bpAfterHalfHourSystolic,String bpAfterHalfHourDystolic,
			String csf, boolean activePeripheralBleeding, boolean fractures,
			boolean peripheralPulses, boolean chestInjury, boolean abdominalInjury, boolean wounds,boolean spinalTenderness,
			boolean spinalDeformity, boolean systemicExaminationCommonFlag,
			 String systemicExaminationCommon, boolean closedFlag) {
		super();
		System.out.println("inside constructor"+eid);
		this.epeid = epeid;
		this.eid = eid;
		this.did = did;
		this.lossOfConsciousness = lossOfConsciousness;
		this.lucidInterval = lucidInterval;
		this.seizures = seizures;
		this.vomiting = vomiting;
		this.amnesia = amnesia;
		this.bleedingFromEar = bleedingFromEar;
		this.bleedingFromNose = bleedingFromNose;
		this.historyOfInjuryCommon = historyOfInjuryCommon;
		this.historyOfInjuryCommonFlag = historyOfInjuryCommonFlag;
		this.airwayOnArrival = airwayOnArrival;
		this.spontaneousRespiration = spontaneousRespiration;
		this.carotidPulsationLeft = carotidPulsationLeft;
		this.carotidPulsationRight = carotidPulsationRight;
		this.pulseRrate = pulseRrate;
		this.bpOnArrivalSystolic = bpOnArrivalSystolic;
		this.bpOnArrivalDystolic = bpOnArrivalDystolic;
		this.bpAfterHalfHourSystolic = bpAfterHalfHourSystolic;
		this.bpAfterHalfHourDystolic = bpAfterHalfHourDystolic;
		this.csf = csf;
		this.activePeripheralBleeding = activePeripheralBleeding;
		this.fractures = fractures;
		this.peripheralPulses = peripheralPulses;
		this.chestInjury = chestInjury;
		this.abdominalInjury = abdominalInjury;
		this.wounds = wounds;
		this.spinalTenderness = spinalTenderness;
		this.spinalDeformity = spinalDeformity;		
		this.systemicExaminationCommonFlag = systemicExaminationCommonFlag;		
		this.systemicExaminationCommon = systemicExaminationCommon;
		this.closedFlag = closedFlag;
	}
}
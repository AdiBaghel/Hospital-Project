package org.nimhans.NIMHANSproject.Database;


import java.util.List;

import org.nimhans.NIMHANSproject.Encounter.EncounterPatientDetails;


public abstract class EncounterAbstractDatabaseAccess {

	public abstract List<EncounterPatientDetails> getEncounterPatientDetailsById(String pid);

	public abstract List<EncounterPatientDetails> getEncounterPatientDetails();
	
	public abstract List<EncounterPatientDetails> addEncounterPatientDetails(EncounterPatientDetails ePatient);
	
	
	
	
}

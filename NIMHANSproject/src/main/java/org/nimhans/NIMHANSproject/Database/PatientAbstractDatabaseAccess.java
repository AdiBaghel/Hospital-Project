package org.nimhans.NIMHANSproject.Database;


import java.util.ArrayList;
import org.nimhans.NIMHANSproject.Patient.Patient;

public abstract class PatientAbstractDatabaseAccess {

	
	abstract public ArrayList<Patient> getAllPatient();
	/* returns the list of patients */
	
	abstract public ArrayList<Patient> getAllPatientByDid(String Did);
	/* returns the list of patients for a given doctor */
	
	abstract public ArrayList<Patient> searchPatientById(String pid);
	/* returns a patient by its ID */
	
}

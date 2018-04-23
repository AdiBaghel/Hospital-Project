package org.nimhans.NIMHANSproject.IDGenerator;

public interface IdGeneration {

    EncounterId getNewId();
    PatientId getNewPatientId();
    DoctorId getNewDoctorId();
    String getCurrentId();
	
	
}

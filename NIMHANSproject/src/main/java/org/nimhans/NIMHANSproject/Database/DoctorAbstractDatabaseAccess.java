package org.nimhans.NIMHANSproject.Database;

import java.sql.Connection;
import java.util.ArrayList;

import org.nimhans.NIMHANSproject.Doctor.Doctor;

public abstract class DoctorAbstractDatabaseAccess {
	
	abstract public ArrayList<Doctor> getDoctorList();
	
}

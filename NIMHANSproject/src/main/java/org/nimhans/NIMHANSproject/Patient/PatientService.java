package org.nimhans.NIMHANSproject.Patient;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.nimhans.NIMHANSproject.Database.PatientDatabaseAccess;
import org.nimhans.NIMHANSproject.Encounter.EncounterPatientDetails;
import org.nimhans.NIMHANSproject.IDGenerator.PatientId;

@Path("patientAction")
public class PatientService {

	@Path("/searchPatient/{pid}")
	@GET
	@Produces(MediaType.APPLICATION_JSON) /*
											 * Allows searching when pid partially
											 * specified
											 */
	public ArrayList<Patient> searchPatient(@PathParam("pid") String pid) throws Exception {

		ArrayList<Patient> patientList;

		PatientDatabaseAccess pda = new PatientDatabaseAccess();
		patientList = pda.searchPatientById(pid);
		return patientList;
	}

	@Path("/getPatientbyId/{pid}")
	@GET
	@Produces(MediaType.APPLICATION_JSON) /*
											 * gets the patient object with
											 * specific id
											 */
	public Patient getPatientbyId(@PathParam("pid") String pid) throws Exception {

		Patient p;
		PatientDatabaseAccess pda = new PatientDatabaseAccess();
		p = pda.getPatientById(pid);
		return p;
	}

	@Path("/getpatients")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public ArrayList<Patient> getAllPatient() {
		ArrayList<Patient> patientList = new ArrayList<Patient>();
		try {
			patientList = new PatientDatabaseAccess().getAllPatient();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return patientList;
	}

	@Path("/getPatientByEncounterId/{eid}")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Patient getPatientByEncounterId(@PathParam("eid") String eid) {
		Patient patient = new Patient();
		PatientDatabaseAccess pda = new PatientDatabaseAccess();
		try {
			patient = pda.getPatientByEncounterId(eid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return patient;
	}

	@Path("/getpatient/{Did}")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public ArrayList<Patient> getAllPatientByDid(@PathParam("Did") String Did) {

		ArrayList<Patient> patientListbydid = new ArrayList<Patient>();
		try {
			patientListbydid = new PatientDatabaseAccess().getAllPatientByDid(Did);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return patientListbydid;
	}

	@Path("/getPendingPatient")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public ArrayList<Patient> getPendingPatient() {

		ArrayList<Patient> pendingPatientList = new ArrayList<Patient>();
		try {
			pendingPatientList = new PatientDatabaseAccess().getPendingPatient();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pendingPatientList;
	}

	@Path("/getPatientId")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public PatientId getPatientId() {

		PatientId pid = new PatientId();
		PatientDatabaseAccess pda = new PatientDatabaseAccess();
		pid = pda.generateNewPatientId();
		return pid;
	}

	@Path("/addPatient")
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public List<Patient> addPatient(Patient p) throws Exception {
		PatientDatabaseAccess pda = new PatientDatabaseAccess();
		List<Patient> pList = new ArrayList<Patient>();
		pList = pda.addPatient(p);
		return pList;
	}

}

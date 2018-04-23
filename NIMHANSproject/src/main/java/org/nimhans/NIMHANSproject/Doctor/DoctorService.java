package org.nimhans.NIMHANSproject.Doctor;


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

import org.nimhans.NIMHANSproject.Database.DatabaseConnection;
import org.nimhans.NIMHANSproject.Database.DoctorDatabaseAccess;
import org.nimhans.NIMHANSproject.Database.PatientDatabaseAccess;
import org.nimhans.NIMHANSproject.IDGenerator.DoctorId;
import org.nimhans.NIMHANSproject.Patient.Patient;


@Path("docAction")
public class DoctorService {	
	
	@Path("/getAllDoctors")
	@GET
    @Produces(MediaType.APPLICATION_JSON)
	public ArrayList<Doctor> getDoctorList() throws Exception {
		ArrayList<Doctor> docList;
		DoctorDatabaseAccess dda = new DoctorDatabaseAccess();
		docList = dda.getDoctorList();
		return docList;
	}
	
	@Path("/getDoctorbyId/{did}")
	@GET
	@Produces(MediaType.APPLICATION_JSON) /*
											 * gets the patient object with
											 * specific id
											 */
	public Doctor getDoctorbyId(@PathParam("did") String did) throws Exception {

		Doctor d;
		DoctorDatabaseAccess dda = new DoctorDatabaseAccess();
		d = dda.getDoctorById(did);
		return d;
	}
	
	@Path("/getDoctorId")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public DoctorId getDoctorId() {

		DoctorId did = new DoctorId();
		DoctorDatabaseAccess dda = new DoctorDatabaseAccess();
		did = dda.generateNewDoctorId();
		return did;
	}

	@Path("/addDoctor")
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public List<Doctor> addDoctor(Doctor d) throws Exception {
		DoctorDatabaseAccess dda = new DoctorDatabaseAccess();
		List<Doctor> dList = new ArrayList<Doctor>();
		dList = dda.addDoctor(d);
		return dList;
	}

}

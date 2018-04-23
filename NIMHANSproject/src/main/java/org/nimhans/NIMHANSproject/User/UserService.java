package org.nimhans.NIMHANSproject.User;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.nimhans.NIMHANSproject.Database.DoctorDatabaseAccess;
import org.nimhans.NIMHANSproject.Database.PatientDatabaseAccess;
import org.nimhans.NIMHANSproject.Doctor.Doctor;
import org.nimhans.NIMHANSproject.Encounter.Encounter;
import org.nimhans.NIMHANSproject.Patient.Patient;


@Path("userAction")
public class UserService {

	@Path("/getUserbyUname/{uname}")
	@GET
	@Produces(MediaType.APPLICATION_JSON) 
	public User getUserbyUname(@PathParam("uname") String uname) throws Exception {

		User u;
		UserDatabaseAccess uda = new UserDatabaseAccess();
		u = uda.getUserByUname(uname);
		return u;
	}

	@Path("/updatePassword")
	@PUT
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public List<User> updatePassword(User u) throws Exception {
		List<User> uList = new ArrayList<User>();
		UserDatabaseAccess uda = new UserDatabaseAccess();
		
		uList = uda.updatePassword(u);
		
		return uList;
	}
	
	@Path("/addUser")
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public List<User> addDoctor(User u) throws Exception {
		UserDatabaseAccess uda = new UserDatabaseAccess();
		List<User> uList = new ArrayList<User>();
		uList = uda.addUser(u);
		return uList;
	}

	
}

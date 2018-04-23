package org.nimhans.NIMHANSproject.Database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.nimhans.NIMHANSproject.Doctor.Doctor;
import org.nimhans.NIMHANSproject.IDGenerator.DoctorId;
import org.nimhans.NIMHANSproject.IDGenerator.IdFactoryUse;
import org.nimhans.NIMHANSproject.IDGenerator.IdGeneration;
import org.nimhans.NIMHANSproject.IDGenerator.PatientId;
import org.nimhans.NIMHANSproject.Patient.Patient;

public class DoctorDatabaseAccess extends DoctorAbstractDatabaseAccess {
	
	public ArrayList<Doctor> getDoctorList()  {
		
		ArrayList<Doctor> docList = new ArrayList<Doctor>();
		
		try{
		DatabaseConnection dc = new DatabaseConnection();
		Connection con = dc.getConnection();
		PreparedStatement stmt = con.prepareStatement("SELECT * FROM doctor");
		ResultSet rs = stmt.executeQuery();
		
			while(rs.next()) {
				Doctor d = new Doctor();
				d.setDid(rs.getString("did"));
				d.setDname(rs.getString("dname"));
				d.setDaddress(rs.getString("daddress"));
				d.setDcontact(rs.getString("dcontact"));
				d.setDemail(rs.getString("demail"));
				d.setDdept(rs.getString("ddept"));
				docList.add(d);

			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return docList;
	}


	public ArrayList<Doctor> getDoctorListByDept(String deptName) {
		ArrayList<Doctor> docList = new ArrayList<Doctor>();
		
		try {
			
			DatabaseConnection dc = new DatabaseConnection();
			Connection con = dc.getConnection();
			PreparedStatement stmt = con.prepareStatement("SELECT * FROM doctor where ddept = '"+deptName+"'");
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				Doctor d = new Doctor();
				d.setDid(rs.getString("did"));
				d.setDname(rs.getString("dname"));
				d.setDaddress(rs.getString("daddress"));
				d.setDcontact(rs.getString("dcontact"));
				d.setDemail(rs.getString("demail"));
				d.setDdept(rs.getString("ddept"));
				docList.add(d);

			}
		}  catch (Exception e) {
			e.printStackTrace();
		}
		
		return docList;
	}

	public Doctor getDoctorById(String did) {
		Doctor d = new Doctor();
		try {
			DatabaseConnection dc = new DatabaseConnection();
			Connection con = dc.getConnection();
			PreparedStatement stmt = con.prepareStatement("SELECT * FROM doctor where did = '" + did + "'");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				d.setDid(rs.getString("did"));
				d.setDname(rs.getString("dname"));
				d.setDaddress(rs.getString("daddress"));
				d.setDcontact(rs.getString("dcontact"));
				d.setDemail(rs.getString("demail"));
				d.setDdept(rs.getString("ddept"));
					}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return d;
	}
	
	public DoctorId generateNewDoctorId() {

		DoctorId did = new DoctorId();
		IdFactoryUse idFactoryUse = new IdFactoryUse();

		// get an object of IdGeneration
		IdGeneration idgen = idFactoryUse.getIdObj("NIMHANS");

		// call getNewId() method on IdGeneration
		System.out.println("doctor id generation in idFactoryDemo" + did);
		did = idgen.getNewDoctorId(); // constructor called

		return did;
	}

	public List<Doctor> addDoctor(Doctor d) {

		List<Doctor> dlist = new ArrayList<Doctor>();

		try {
			DatabaseConnection db = new DatabaseConnection();
			Connection con = db.getConnection();
			String sqlQuery = "insert into doctor values(?,?,?,?,?,?)";
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			pstmt = con.prepareStatement(sqlQuery);
			pstmt.setString(1, d.getDid());
			pstmt.setString(2, d.getDname());
			pstmt.setString(3, d.getDcontact());
			pstmt.setString(4, d.getDemail());
			pstmt.setString(5, d.getDaddress());
			pstmt.setString(6, d.getDdept());
			
			int i = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return dlist;
	}
	
}

package org.nimhans.NIMHANSproject.Database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.ws.rs.PathParam;

import org.nimhans.NIMHANSproject.Doctor.Doctor;
import org.nimhans.NIMHANSproject.IDGenerator.IdFactoryUse;
import org.nimhans.NIMHANSproject.IDGenerator.IdGeneration;
import org.nimhans.NIMHANSproject.IDGenerator.PatientId;
import org.nimhans.NIMHANSproject.Patient.Patient;

public class PatientDatabaseAccess extends PatientAbstractDatabaseAccess {

	public ArrayList<Patient> getAllPatient() {

		ArrayList<Patient> patientList = new ArrayList<Patient>();
		try {
			DatabaseConnection db = new DatabaseConnection();
			Connection con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement("SELECT * FROM patient");
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Patient patientObj = new Patient();
				patientObj.setPid(rs.getString("pid"));
				patientObj.setPname(rs.getString("pname"));
				patientObj.setPcontact(rs.getString("pcontact"));
				patientObj.setPemail(rs.getString("pemail"));
				patientObj.setPaddress(rs.getString("paddress"));
				patientObj.setAge(rs.getInt("age"));
				patientObj.setGender(rs.getString("gender"));
				patientList.add(patientObj);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return patientList;
	}

	public ArrayList<Patient> getAllPatientByDid(String Did) {
		ArrayList<Patient> patientList = new ArrayList<Patient>();
		try {
			DatabaseConnection db = new DatabaseConnection();
			Connection con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(
					"SELECT distinct p.pname FROM patient p,encounter_patient_details e where  p.pid=e.pid and did="
							+ Did);
			System.out.println("SELECT distinct p.pname FROM patient p,encounter_patient_details e where  p.pid=e.pid and did="
							+ Did);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Patient patientObj = new Patient();
				patientObj.setPname(rs.getString("pname"));
				patientList.add(patientObj);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return patientList;
	}

	public Patient getPatientById(String pid) {
		Patient p = new Patient();
		try {
			DatabaseConnection dc = new DatabaseConnection();
			Connection con = dc.getConnection();
			PreparedStatement stmt = con.prepareStatement("SELECT * FROM patient where pid = '" + pid + "'");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				p.setPid(rs.getString("pid"));
				p.setPname(rs.getString("pname"));
				p.setPaddress(rs.getString("paddress"));
				p.setPcontact(rs.getString("pcontact"));
				p.setPemail(rs.getString("pemail"));
				p.setAge(rs.getInt("age"));
				p.setGender(rs.getString("gender"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return p;
	}

	public ArrayList<Patient> getPendingPatient() {
		ArrayList<Patient> pendingPatientList = new ArrayList<Patient>();
		try {
			DatabaseConnection db = new DatabaseConnection();
			Connection con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(
					"select p.pid, p.pname from patient p, pending_patient_list ppl where p.pid=ppl.pid and ppl.pending_flag=1 order by ppl.request_generated_time");
			ResultSet rs = stmt.executeQuery();
			PreparedStatement stmt2, stmt3;
			ResultSet rs2, rs3;
			while (rs.next()) {
				Patient p = new Patient();
				String pending_status = "", pending_encounter = null;
				String pid_temp = rs.getString("pid");
				p.setPid(pid_temp);
				p.setPname(rs.getString("pname"));

				String sql2 = "select e.eid from encounter e, pending_patient_list p where p.pid = e.pid and e.closed_flag = 0 and p.pid = '"
						+ pid_temp + "'";
				stmt2 = con.prepareStatement(sql2);
				rs2 = stmt2.executeQuery();
				if (!rs2.next()) {
					System.out.println("Okay");
					pending_status = "";
				} // no dept is pending for this data
				else {
					pending_encounter = rs2.getString("eid");
					// System.out.println("id of pending enc =
					// "+pending_encounter);
					stmt3 = con.prepareStatement("select closed_flag from encounter_patient_details where eid = '"
							+ pending_encounter + "'");
					rs3 = stmt3.executeQuery();
					if (!rs3.next()) {
						pending_status = pending_status + " ID";
					} else {
						if (rs3.getInt("closed_flag") == 1) {
						} else
							pending_status = pending_status + " ID";
					}

					stmt3 = con.prepareStatement("select closed_flag from encounter_physical_examination where eid = '"
							+ pending_encounter + "'");
					rs3 = stmt3.executeQuery();
					if (!rs3.next()) {
						pending_status = pending_status + " PE";
					} else {
						if (rs3.getInt("closed_flag") == 1) {
						} else
							pending_status = pending_status + " PE";
					}

					stmt3 = con
							.prepareStatement("select closed_flag from encounter_neurological_examination where eid = '"
									+ pending_encounter + "'");
					rs3 = stmt3.executeQuery();
					if (!rs3.next()) {
						pending_status = pending_status + " NE";
					} else {
						if (rs3.getInt("closed_flag") == 1) {
						} else
							pending_status = pending_status + " NE";
					}

					stmt3 = con.prepareStatement("select closed_flag from encounter_clinical_impression where eid = '"
							+ pending_encounter + "'");
					rs3 = stmt3.executeQuery();
					if (!rs3.next()) {
						pending_status = pending_status + " CI";
					} else {
						if (rs3.getInt("closed_flag") == 1) {
						} else
							pending_status = pending_status + " CI";
					}
					System.out.println("status till now  = " + pending_status);

				}

				p.setPaddress(pending_status);
				pendingPatientList.add(p);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return pendingPatientList;
	}

	public ArrayList<Patient> searchPatientById(String pid) {
		ArrayList<Patient> patientList = new ArrayList<Patient>();

		try {

			DatabaseConnection dc = new DatabaseConnection();
			Connection con = dc.getConnection();
			PreparedStatement stmt = con.prepareStatement("SELECT * FROM patient where pid like '" + pid + "%'");
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Patient p = new Patient();
				p.setPid(rs.getString("pid"));
				p.setPname(rs.getString("pname"));
				p.setPaddress(rs.getString("paddress"));
				p.setPcontact(rs.getString("pcontact"));
				p.setPemail(rs.getString("pemail"));
				p.setPhotoURL(rs.getString("photo_url"));
				patientList.add(p);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return patientList;
	}

	public List<Patient> getPatientPhotoById(String pid) {
		DatabaseConnection db = new DatabaseConnection();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Patient> pList = null;
		try {

			con = db.getConnection();
			String sqlQuery = "SELECT photo_url FROM patient where pid=?";
			pList = new ArrayList<Patient>();
			pstmt = con.prepareStatement(sqlQuery);
			pstmt.setString(1, pid);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Patient pObj = new Patient(rs.getString("photo_url"));
				pList.add(pObj);
				System.out.println(pObj.getPhotoURL());
			}
			return pList;
		} catch (Exception e) {
			// TODO Auto-generated catch block
		} finally {
			try {
				rs.close();
			} catch (Exception e) {
				/* ignored */ }
			try {
				pstmt.close();
			} catch (Exception e) {
				/* ignored */ }
			try {
				con.close();
			} catch (Exception e) {
				/* ignored */ }
		}
		return pList;

	}

	public Patient getPatientByEncounterId(String eid) {
		Patient p = new Patient();
		try {
			DatabaseConnection dc = new DatabaseConnection();
			Connection con = dc.getConnection();
			String sql = "SELECT e.pid, pname, age, gender FROM patient p, encounter e where p.pid = e.pid and e.eid = '"
					+ eid + "'";
			PreparedStatement stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				p.setPid(rs.getString("pid"));
				p.setPname(rs.getString("pname"));
				p.setAge(rs.getInt("age"));
				p.setGender(rs.getString("gender"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return p;
	}

	public PatientId generateNewPatientId() {

		PatientId pid = new PatientId();
		IdFactoryUse idFactoryUse = new IdFactoryUse();

		// get an object of IdGeneration
		IdGeneration idgen = idFactoryUse.getIdObj("NIMHANS");

		// call getNewId() method on IdGeneration
		System.out.println("patient id generation in idFactoryDemo" + pid);
		pid = idgen.getNewPatientId(); // constructor called

		return pid;
	}

	public List<Patient> addPatientPhotoURL(String photoURL, String pid) {

		DatabaseConnection db = new DatabaseConnection();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Patient> pList = null;
		try {
			con = db.getConnection();
			String sqlQuery = "update patient set photo_url=? where pid=?";
			pList = new ArrayList<Patient>();
			pstmt = con.prepareStatement(sqlQuery);
			pstmt.setString(1, photoURL);
			pstmt.setString(2, pid);
			int i = pstmt.executeUpdate();
			return pList;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("In catch - " + e.getMessage());
		} finally {

			try {
				pstmt.close();
			} catch (Exception e) {
				// ignored
			}
			try {
				con.close();
			} catch (Exception e) {
				// ignored
			}
		}
		return pList;
	}

	public List<Patient> addPatient(Patient p) {

		List<Patient> plist = new ArrayList<Patient>();

		try {
			DatabaseConnection db = new DatabaseConnection();
			Connection con = db.getConnection();
			String sqlQuery = "insert into patient values(?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			pstmt = con.prepareStatement(sqlQuery);
			pstmt.setString(1, p.getPid());
			pstmt.setString(2, p.getPname());
			pstmt.setString(3, p.getPcontact());
			pstmt.setString(4, p.getPemail());
			pstmt.setString(5, p.getPaddress());
			pstmt.setInt(6, p.getAge());
			pstmt.setString(7, p.getGender());
			pstmt.setString(8, p.getPhotoURL());

			int i = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return plist;
	}

}
package org.nimhans.NIMHANSproject.Database;


import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.nimhans.NIMHANSproject.Encounter.Encounter;
import org.nimhans.NIMHANSproject.Encounter.EncounterClinicalImpression;
import org.nimhans.NIMHANSproject.Encounter.EncounterNeurologicalExamination;
import org.nimhans.NIMHANSproject.Encounter.EncounterPatientDetails;
import org.nimhans.NIMHANSproject.Encounter.EncounterPhysicalExamination;
import org.nimhans.NIMHANSproject.IDGenerator.EncounterId;
import org.nimhans.NIMHANSproject.IDGenerator.IdFactoryUse;
import org.nimhans.NIMHANSproject.IDGenerator.IdGeneration;



public class EncounterDatabaseAccess extends EncounterAbstractDatabaseAccess{
	
	DatabaseConnection db=new DatabaseConnection();
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	ArrayList<EncounterPatientDetails> epList;
	ArrayList<EncounterPhysicalExamination> epeList;
	ArrayList<EncounterNeurologicalExamination> eneList;
	ArrayList<EncounterClinicalImpression> eciList;
	ArrayList<Encounter> eList;
	

	public EncounterId generateNewId(String pid) {
		String eid = "";
		try {
			System.out.println(pid);
			con = db.getConnection();
			String sqlQuery = "Select eid from encounter where closed_flag = ? and pid=?";
			pstmt = con.prepareStatement(sqlQuery);
			pstmt.setBoolean(1,false);
			pstmt.setString(2, pid);		
			rs = pstmt.executeQuery();
			if(rs.next()) {
				eid = rs.getString("eid");
				eid = eid.substring(1,eid.length());
				System.out.println(eid);
				String encounterId;
				String phyEncounterId;
				String patEncounterId;
				String neuEncounterId;
				String cliEncounterId;
				encounterId="E"+eid;
				phyEncounterId="Ep"+eid;
				patEncounterId="Epd"+eid;
				neuEncounterId="Ene"+eid;
				cliEncounterId="Ec"+eid;
				EncounterId eold = new EncounterId(encounterId,phyEncounterId ,patEncounterId ,neuEncounterId ,cliEncounterId );
				return eold;
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
			EncounterId ei = new EncounterId();
				IdFactoryUse idFactoryUse = new IdFactoryUse();
				// get an object of IdGeneration
				IdGeneration idgen = idFactoryUse.getIdObj("NIMHANS");
				// call getNewId() method on IdGeneration
				//System.out.println("id generation in idFactoryDemo" + idgen.getNewId());
				ei = idgen.getNewId(); // constructor called
				return ei;
		}
	
	public List<EncounterPatientDetails> getEncounterPatientDetailsById(String eid) {
		try {
			con = db.getConnection();
			String sqlQuery = "SELECT * FROM encounter_patient_details where eid=?";
			epList = new ArrayList<EncounterPatientDetails>();

			pstmt = con.prepareStatement(sqlQuery);
			pstmt.setString(1, eid);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				EncounterPatientDetails epObj = new EncounterPatientDetails(rs.getString("epdid"), rs.getString("eid"),
						rs.getString("pid"), rs.getString("did"),rs.getDate("date_of_examination"), rs.getString("time_of_examination"),
						rs.getString("informants_name"), rs.getString("informants_type"), rs.getDate("date_of_injury"),
						rs.getString("time_of_injury"), rs.getString("place_of_injury"),
						rs.getString("incident_scenario"),rs.getBoolean("vehicle_type"),rs.getBoolean ("rta_two_helmet"),rs.getBoolean("rta_two_alcohol"),rs.getBoolean("rta_four_alcohol"),rs.getString("rta_four_victimtype"),
						rs.getBoolean("fall_alcohol"),rs.getBoolean("assault_person_type"),rs.getString("fall_siteoffall"),rs.getBoolean("fall_siteoffall_flag"),rs.getBoolean("otherInfo_flag"),
						rs.getString("otherInfo"),rs.getString("commonText"),rs.getBoolean("commonText_flag"),  rs.getBoolean("closed_flag"));
				epList.add(epObj);
				System.out.println(epObj.getEid());

			}
			return epList;
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
		return epList;

	}

	
	
	public List<EncounterPatientDetails> getEncounterPatientDetails() {
		try {
			con = db.getConnection();
			String sqlQuery = "SELECT * FROM encounter_patient_details";
			epList = new ArrayList<EncounterPatientDetails>();

			pstmt = con.prepareStatement(sqlQuery);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				EncounterPatientDetails epObj = new EncounterPatientDetails(rs.getString("epdid"), rs.getString("eid"),
						rs.getString("pid"), rs.getString("did"),rs.getDate("date_of_examination"), rs.getString("time_of_examination"),
						rs.getString("informants_name"), rs.getString("informants_type"), rs.getDate("date_of_injury"),
						rs.getString("time_of_injury"), rs.getString("place_of_injury"),
						rs.getString("incident_scenario"),rs.getBoolean("vehicle_type"),rs.getBoolean ("rta_two_helmet"),rs.getBoolean("rta_two_alcohol"),rs.getBoolean("rta_four_alcohol"),rs.getString("rta_four_victimtype"),
						rs.getBoolean("fall_alcohol"),rs.getBoolean("assault_person_type"),rs.getString("fall_siteoffall"),rs.getBoolean("fall_siteoffall_flag"),rs.getBoolean("otherInfo_flag"),
						rs.getString("otherInfo"),rs.getString("commonText"),rs.getBoolean("commonText_flag"),  rs.getBoolean("closed_flag"));
				epList.add(epObj);
				System.out.println(epObj.getPid());

			}
			return epList;
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
		return epList;

	}
	
	public List<Encounter> addEncounterParentDetails(Encounter eParent){
		System.out.println("out of try");
		try{
			con = db.getConnection();
			System.out.println(con);
			String sqlQuery="insert into encounter() values(?,?,?,?,?,?)";
			eList= new ArrayList<Encounter>();
				System.out.println("In add Parent");
			pstmt = con.prepareStatement(sqlQuery);
			pstmt.setString(1, eParent.getEid());
			pstmt.setString(2, eParent.getPid());
			pstmt.setString(3, eParent.getDid());
			pstmt.setDate(4, eParent.getStartDate());
			pstmt.setDate(5, eParent.getCloseDate());
			pstmt.setBoolean(6, eParent.getClosedFlag());

			
			int i = pstmt.executeUpdate();
			System.out.println(epList.get(0));
			return eList;
		}
		 catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("In catch - "+e.getMessage());
		}
		finally {
		    
		    try { pstmt.close(); } catch (Exception e) { /* ignored */ }
		    try { con.close(); } catch (Exception e) { /* ignored */ }
		}
		return eList;
		}
	
	
	
	public List<Encounter> updateEncounterParentDetails(Encounter eParent) {
		System.out.println("out of try");
		ArrayList<Encounter> eList = null;

		try {
			con = db.getConnection();
			System.out.println(con);
			String sqlQuery1 = "select closed_flag from encounter_clinical_impression where eid=?";
			String sqlQuery2 = "select closed_flag from encounter_neurological_examination where eid=?";
			String sqlQuery3 = "select closed_flag from encounter_patient_details where eid=?";
			String sqlQuery4 = "select closed_flag from encounter_physical_examination where eid=?";
			boolean v1 = false;
			boolean v2 = false;
			boolean v3 = false;
			boolean v4 = false;
			
			pstmt  = con.prepareStatement(sqlQuery1);
			pstmt.setString(1, eParent.getEid());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				 v1 = rs.getBoolean("closed_flag");
			}
			
			pstmt  = con.prepareStatement(sqlQuery2);
			pstmt.setString(1, eParent.getEid());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				 v2 = rs.getBoolean("closed_flag");
			}
			
			pstmt  = con.prepareStatement(sqlQuery3);
			pstmt.setString(1, eParent.getEid());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				 v3 = rs.getBoolean("closed_flag");
			}
			pstmt  = con.prepareStatement(sqlQuery4);
			pstmt.setString(1, eParent.getEid());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				 v4 = rs.getBoolean("closed_flag");
			}
			
			System.out.println(v1+" "+v2+" "+v3+" "+v4+" ");
			if(v1 && v2 && v3 && v4) {
				String sqlQuery = "update encounter set close_date=?, closed_flag=? where eid=?";
				eList = new ArrayList<Encounter>();
				System.out.println("In update Parent");
				pstmt = con.prepareStatement(sqlQuery);
				pstmt.setDate(1, eParent.getCloseDate());
				pstmt.setBoolean(2, eParent.getClosedFlag());
				pstmt.setString(3, eParent.getEid());

				System.out.println("closeDate " + eParent.getCloseDate());
				int i = pstmt.executeUpdate();
				System.out.println(epList.get(0));
				return eList;
			}
			else {
				String sqlQuery = "update encounter set close_date=?, closed_flag=? where eid=?";
				eList = new ArrayList<Encounter>();
				System.out.println("In update Parent");
				pstmt = con.prepareStatement(sqlQuery);
				pstmt.setDate(1,null);
				pstmt.setBoolean(2,false);
				pstmt.setString(3, eParent.getEid());
				System.out.println("closeDate " + eParent.getCloseDate());
				int i = pstmt.executeUpdate();
				System.out.println(epList.get(0));
				return eList;
			}
						
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("In catch - " + e.getMessage());
		} finally {

			try {
				pstmt.close();
			} catch (Exception e) {
				/* ignored */ }
			try {
				con.close();
			} catch (Exception e) {
				/* ignored */ }
		}
		return eList;
	}	
	
	
	public List<EncounterPatientDetails> addEncounterPatientDetails(EncounterPatientDetails ePatient) {

		try {
			con = db.getConnection();
			String sqlQuery = "insert into encounter_patient_details() values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			epList = new ArrayList<EncounterPatientDetails>();
			System.out.println("I am near to DB "+ePatient.getInformantType()); 
			pstmt = con.prepareStatement(sqlQuery);
			pstmt.setString(1, ePatient.getEpdid());
			pstmt.setString(2, ePatient.getEid());
			pstmt.setString(3, ePatient.getDid());
			pstmt.setString(4, ePatient.getPid());
			pstmt.setDate(5, ePatient.getDateOfExamination());
			pstmt.setString(6, ePatient.getTimeOfExamination());
			pstmt.setString(7, ePatient.getInformantName());
			pstmt.setString(8, ePatient.getInformantType());
			pstmt.setDate(9, ePatient.getDateOfInjury());
			pstmt.setString(10, ePatient.getTimeOfInjury());
			pstmt.setString(11, ePatient.getPlaceOfInjury());
			pstmt.setString(12, ePatient.getIncidentScenario());
			pstmt.setBoolean(13, ePatient.isVehicle_type());
			pstmt.setBoolean(14, ePatient.isRta_two_helmet());
			pstmt.setBoolean(15, ePatient.isRta_two_alcohol());
			pstmt.setBoolean(16, ePatient.isRta_four_alcohol());
			pstmt.setString(17, ePatient.getRta_four_victimtype());
			pstmt.setBoolean(18, ePatient.isFall_alcohol());
			pstmt.setBoolean(19, ePatient.isAssault_person_type());
			pstmt.setString(20, ePatient.getFall_siteoffall());
			pstmt.setBoolean(21, ePatient.isFall_siteoffall_flag());
			pstmt.setBoolean(22, ePatient.isOtherInfo_flag());
			pstmt.setString(23, ePatient.getOtherInfo());
			pstmt.setString(24, ePatient.getCommonText());
			pstmt.setBoolean(25, ePatient.isCommonText_flag());
	        pstmt.setBoolean(26, ePatient.isClosedFlag());
			int i = pstmt.executeUpdate();
			return epList;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("In catch - " + e.getMessage());
		} finally {

			try {
				pstmt.close();
			} catch (Exception e) {
				/* ignored */ }
			try {
				con.close();
			} catch (Exception e) {
				/* ignored */ }
		}
		return epList;
	}
	
	public List<EncounterNeurologicalExamination> addEncounterNeurologicalExamination(EncounterNeurologicalExamination enePatient){
		
		try{
			con = db.getConnection();
			String sqlQuery="insert into encounter_neurological_examination values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			eneList= new ArrayList<EncounterNeurologicalExamination>();
				
			pstmt = con.prepareStatement(sqlQuery);
			pstmt.setString(1, enePatient.getEneid());
			pstmt.setString(2, enePatient.getEid());
			pstmt.setString(3, enePatient.getDid());
			pstmt.setString(4, enePatient.getEyeOpeneingScoreInitial());
			pstmt.setString(5, enePatient.getEyeOpeningScoreAfterRes());
			pstmt.setString(6, enePatient.getMotorResponseScoreInitial());
			pstmt.setString(7, enePatient.getMotorResponseScoreAfterRes());
			pstmt.setString(8, enePatient.getVerbalResponseScoreInitial());
			pstmt.setString(9, enePatient.getVerbalResponseScoreAfterRes());
			pstmt.setString(10, enePatient.getHorizontalOculocephalicReflexRight());
			pstmt.setString(11, enePatient.getHorizontalOculocephalicReflexLeft());
			pstmt.setString(12, enePatient.getPupiliaryLightReflexRight());
			pstmt.setString(13, enePatient.getPupiliaryLightReflexLeft());
			pstmt.setString(14,enePatient.getPupiliaryLightSizeOfPupil());
			pstmt.setString(15, enePatient.getMotorSystemExaminationUpperRightTone());
			pstmt.setString(16, enePatient.getMotorSystemExaminationUpperRightPower());
			pstmt.setString(17, enePatient.getMotorSystemExaminationUpperLeftTone());
			pstmt.setString(18, enePatient.getMotorSystemExaminationUpperLeftPower());
			pstmt.setString(19, enePatient.getMotorSystemExaminationLowerRightTone());
			pstmt.setString(20, enePatient.getMotorSystemExaminationLowerRightPower());
			pstmt.setString(21, enePatient.getMotorSystemExaminationLowerLeftTone());
			pstmt.setString(22, enePatient.getMotorSystemExaminationLowerLeftPower());
			pstmt.setString(23, enePatient.getAnyOtherNeurologicalDeficits());
			pstmt.setBoolean(24, enePatient.isAnyOtherNeurologicalDeficitsSketchpad());
			pstmt.setBoolean(25, enePatient.isClosedFlag());

			int i = pstmt.executeUpdate();
			
			return eneList;
		}
		 catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("In catch - "+e.getMessage());
		}
		finally {
		    
		    try { pstmt.close(); } catch (Exception e) { /* ignored */ }
		    try { con.close(); } catch (Exception e) { /* ignored */ }
		}
		return eneList;
		}
	
	
	
	
	public ArrayList<Encounter> getEncounterByPatientId(String pid) {
		ArrayList<Encounter> encList = new ArrayList<Encounter>();

		try {
			DatabaseConnection dc = new DatabaseConnection();
			Connection con = dc.getConnection();

			PreparedStatement stmt = con
					.prepareStatement("SELECT * FROM encounter where pid = '" + pid + "' order by start_date desc");
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				Encounter e = new Encounter();
				e.setEid(rs.getString("eid"));
				e.setPid(rs.getString("pid"));
				e.setDid(rs.getString("did"));
				e.setStartDate(rs.getDate("start_date"));
				encList.add(e);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return encList;
	}
	
	
	public List<EncounterPhysicalExamination> getEncounterPhysicalExaminationById(String eid) {
		try {
			con = db.getConnection();
			if (con != null) {
				System.out.println("connection established");
			}
			String sqlQuery = "SELECT * FROM encounter_physical_examination where eid=?";
			epeList = new ArrayList<EncounterPhysicalExamination>();
			pstmt = con.prepareStatement(sqlQuery);
			pstmt.setString(1, eid);
			rs = pstmt.executeQuery();
			rs.last();
			System.out.println("number of rows" + rs.getRow());
			rs.beforeFirst();
			while (rs.next()) {
					EncounterPhysicalExamination epeObj = new EncounterPhysicalExamination(rs.getString("epeid"),
						rs.getString("eid"), rs.getString("did"), rs.getBoolean("loss_of_consciousness"),rs.getBoolean("lucid_interval"), 
						rs.getBoolean("seizures"), rs.getBoolean("vomiting"),rs.getBoolean("amnesia"), rs.getBoolean("bleeding_from_ear"),
						rs.getBoolean("bleeding_from_nose"), rs.getString("historyOfInjuryCommon"),rs.getBoolean("historyOfInjuryCommonFlag"),
						rs.getString("airway_on_arrival"),rs.getString("spontaneous_resp"),rs.getBoolean("carotidPulsationLeft"),
						rs.getBoolean("carotidPulsationRight"),rs.getString("pulseRrate"),rs.getString("bpOnArrivalSystolic"),
						rs.getString("bpOnArrivalDystolic"),rs.getString("bpAfterHalfHourSystolic"),rs.getString("bpAfterHalfHourDystolic"),
						rs.getString("csf"),rs.getBoolean("active_peripheral_bleeding"), rs.getBoolean("fractures"),
						rs.getBoolean("peripheralPulses"),rs.getBoolean("chestInjury"),rs.getBoolean("abdominalInjury"),rs.getBoolean("wounds"),
						rs.getBoolean("spinalTenderness"),rs.getBoolean("spinalDeformity"),rs.getBoolean("systemicExaminationCommonFlag"),
						rs.getString("systemicExaminationCommon"),rs.getBoolean("closed_flag"));
				epeList.add(epeObj);

			}
			return epeList;
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
		return epeList;

	}
	
	
	public List<EncounterNeurologicalExamination> getEncounterNeurologicalExaminationById(String eid) {	
	  try{
		con = db.getConnection();
		pstmt = con.prepareStatement("SELECT * FROM encounter_neurological_examination where eid='"+eid+"'");
		eneList= new ArrayList<EncounterNeurologicalExamination>();
		rs = pstmt.executeQuery();
	
		while(rs.next()) {	
			EncounterNeurologicalExamination eneObj = new EncounterNeurologicalExamination();
			eneObj.setEneid(rs.getString("eneid"));
			eneObj.setEid(rs.getString("eid"));
			eneObj.setDid(rs.getString("did"));
			eneObj.setEyeOpeneingScoreInitial(rs.getString("eye_openeing_score_initial"));
			eneObj.setEyeOpeningScoreAfterRes(rs.getString("eye_opening_score_after_res"));
			eneObj.setMotorResponseScoreInitial(rs.getString("motor_response_score_initial"));
			eneObj.setMotorResponseScoreAfterRes(rs.getString("motor_response_score_after_res"));
			eneObj.setVerbalResponseScoreInitial(rs.getString("verbal_response_score_initial"));
			eneObj.setVerbalResponseScoreAfterRes(rs.getString("verbal_response_score_after_res"));
			eneObj.setHorizontalOculocephalicReflexRight(rs.getString("horizontal_oculocephalic_reflex_right"));
			eneObj.setHorizontalOculocephalicReflexLeft(rs.getString("horizontal_oculocephalic_reflex_left"));
			eneObj.setPupiliaryLightReflexRight(rs.getString("pupilliary_light_reflex_right"));
			eneObj.setPupiliaryLightReflexLeft(rs.getString("pupilliary_light_reflex_left"));
			eneObj.setPupiliaryLightSizeOfPupil(rs.getString("pupiliaryLightSizeOfPupil"));
			eneObj.setMotorSystemExaminationUpperRightTone(rs.getString("motor_system_examination_upper_right_tone"));
			eneObj.setMotorSystemExaminationUpperRightPower(rs.getString("motor_system_examination_upper_right_power"));
			eneObj.setMotorSystemExaminationUpperLeftTone(rs.getString("motor_system_examination_upper_left_tone"));
			eneObj.setMotorSystemExaminationUpperLeftPower(rs.getString("motor_system_examination_upper_left_power"));
			eneObj.setMotorSystemExaminationLowerRightTone(rs.getString("motor_system_examination_lower_right_tone"));
			eneObj.setMotorSystemExaminationLowerRightPower(rs.getString("motor_system_examination_lower_right_power"));
			eneObj.setMotorSystemExaminationLowerLeftTone(rs.getString("motor_system_examination_lower_left_tone"));
			eneObj.setMotorSystemExaminationLowerLeftPower(rs.getString("motor_system_examination_lower_left_power"));
			eneObj.setAnyOtherNeurologicalDeficits(rs.getString("any_other_neurological_deficits"));
			eneObj.setAnyOtherNeurologicalDeficitsSketchpad(rs.getBoolean("any_other_neurological_deficits_sketchpad"));
			eneObj.setClosedFlag(rs.getBoolean("closed_flag"));
			
			eneList.add(eneObj);
		}
	  }catch (Exception e) {
		e.printStackTrace();
	  }
	
	  return eneList; 
	}

	public List<EncounterClinicalImpression> getEncounterClinicalImpressionById(String eid) {
		try {
			con = db.getConnection();
			String sqlQuery = "SELECT * FROM encounter_clinical_impression where eid=?";
			eciList = new ArrayList<EncounterClinicalImpression>();

			pstmt = con.prepareStatement(sqlQuery);
			pstmt.setString(1, eid);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				EncounterClinicalImpression eciObj = new EncounterClinicalImpression(rs.getString("ecid"),
						rs.getString("eid"), rs.getString("did"), rs.getBoolean("any_change_neurological"),
						rs.getString("ct_scan_head"), rs.getBoolean("ct_scan_head_sketchpad"),
						rs.getString("xray_details"), rs.getBoolean("xray_details_sketchpad"),
						rs.getString("mngmt_plan"), rs.getBoolean("mngmt_plan_sketchpad"),
						rs.getString("course_in_hospital"), rs.getBoolean("course_in_hospital_sketchpad"),
						rs.getString("condition_at_discharge"), rs.getBoolean("condition_at_discharge_sketchpad"),
						rs.getBoolean("closed_flag"));
				eciList.add(eciObj);
				// System.out.println(eciObj.getEid());

			}
			return eciList;
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
		return eciList;

	}

	public List<Encounter> addNewEncounter() {
		ArrayList<Encounter> eList = null;
		Encounter encounter;

		try {
			con = db.getConnection();
			String sqlQuery = "insert into encounter (eid) values(?)";
			eList = new ArrayList<Encounter>();
			encounter = new Encounter();

			String initials = "EHID";
			int laters = 0;

			String sql1 = "select * from encounter order by eid asc";

			pstmt = con.prepareStatement(sqlQuery);
			rs = pstmt.executeQuery(sql1);
			rs.last();
			laters = Integer.parseInt(rs.getString(1).substring(4));
			rs.beforeFirst();
			laters = laters + 1;
			String generatedId = initials + "" + laters;

			pstmt.setString(1, generatedId);
			int i = pstmt.executeUpdate();

			return eList;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("In catch - " + e.getMessage());
		} finally {

			try {
				pstmt.close();
			} catch (Exception e) {
				/* ignored */ }
			try {
				con.close();
			} catch (Exception e) {
				/* ignored */ }
		}
		return eList;
	}
	//*********************
	public List<EncounterPatientDetails> addIncidentEncounterScribbleURL(String photoURL, String epdid,
			String tableDecider) {

		try {
			con = db.getConnection();
			String sqlQuery = "update encounter_patient_details set" + tableDecider + "=? where epdid=?";
			epList = new ArrayList<EncounterPatientDetails>();
			pstmt = con.prepareStatement(sqlQuery);
			// pstmt.setString(1, tableDecider);
			pstmt.setString(1, photoURL);
			pstmt.setString(2, epdid);

			System.out.println("sql : " + sqlQuery);
			int i = pstmt.executeUpdate();
			System.out.println(photoURL + "	:	" + tableDecider + "  : " + i);
			return epList;
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
		return epList;
	}
	
	public List<EncounterPhysicalExamination> addPhysicalEncounterScribbleURL(String photoURL, String epeid,
			String tableDecider) {

		try {
			con = db.getConnection();
			String sqlQuery = "update encounter_physical_examination set " + tableDecider + "=? where epeid=?";
			epeList = new ArrayList<EncounterPhysicalExamination>();
			pstmt = con.prepareStatement(sqlQuery);
			// pstmt.setString(1, tableDecider);
			pstmt.setString(1, photoURL);
			pstmt.setString(2, epeid);

			System.out.println("sql : " + sqlQuery);
			int i = pstmt.executeUpdate();
			System.out.println(photoURL + "	:	" + tableDecider + "  : " + i);
			return epeList;
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
		return epeList;
	}
	
	public List<EncounterPhysicalExamination> addEncounterScribbleURL(String photoURL,String eid){
		
		try{
			con = db.getConnection();
			String sqlQuery="update encounter_physical_examination set loc_description=? where eid=?";
			epeList= new ArrayList<EncounterPhysicalExamination>();		
			pstmt = con.prepareStatement(sqlQuery);
			pstmt.setString(1, photoURL);
			pstmt.setString(2, eid);
			int i = pstmt.executeUpdate();
			
			return epeList;
		}
		 catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("In catch - "+e.getMessage());
		}
		finally {
		    
		    try { pstmt.close(); } catch (Exception e) {  
		    	//ignored  
		    	}
		    try { con.close(); } catch (Exception e) {  
		    	//ignored  
		    	}
		    }		
		return epeList;
		}	

	//*********************
	public List<EncounterClinicalImpression> addEncounterClinicalImpression(EncounterClinicalImpression ePatient){
		
		try{
			con = db.getConnection();
			String sqlQuery="insert into encounter_clinical_impression values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			eciList= new ArrayList<EncounterClinicalImpression>();
				
			pstmt = con.prepareStatement(sqlQuery);
			pstmt.setString(1, ePatient.getEcid());
			pstmt.setString(2, ePatient.getEid());
			pstmt.setString(3, ePatient.getDid());
			pstmt.setBoolean(4, ePatient.isAnyChangeNeurological());
			pstmt.setString(5, ePatient.getCtScanHead());
			pstmt.setBoolean(6, ePatient.isCtScanHeadSketchPad());
			pstmt.setString(7, ePatient.getXrayDetails());
			pstmt.setBoolean(8, ePatient.isXrayDetailsSketchPad());
			pstmt.setString(9, ePatient.getManagementPlan());
			pstmt.setBoolean(10, ePatient.isManagementPlanSketchPad());
			pstmt.setString(11, ePatient.getCourseInHospital());
			pstmt.setBoolean(12, ePatient.isCourseInHospitalSketchPad());
			pstmt.setString(13, ePatient.getConditionAtDischarge());
			pstmt.setBoolean(14, ePatient.isConditionAtDischargeSketchPad());
			pstmt.setBoolean(15, ePatient.isClosedFlag());
			
			int i = pstmt.executeUpdate();
			System.out.println("Hi from Aditi!!!!!"+ePatient.isAnyChangeNeurological());
			return eciList;
		}
		 catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("In catch - "+e.getMessage());
		}
		finally {
		    
		    try { pstmt.close(); } catch (Exception e) { /* ignored */ }
		    try { con.close(); } catch (Exception e) { /* ignored */ }
		}
		return eciList;
		}
	
	
	//*********************
	public List<EncounterNeurologicalExamination> addNeurologicalEncounterScribbleURL(String photoURL, String eneid,
			String tableDecider) {

		try {
			con = db.getConnection();
			String sqlQuery = "update encounter_neurological_examination set " + tableDecider + "=? where eneid=?";
			eneList = new ArrayList<EncounterNeurologicalExamination>();
			pstmt = con.prepareStatement(sqlQuery);
			// pstmt.setString(1, tableDecider);
			pstmt.setString(1, photoURL);
			pstmt.setString(2, eneid);

			int i = pstmt.executeUpdate();
			return eneList;
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
		return eneList;
	}
	
	//*********************
	public List<EncounterClinicalImpression> addClinicalEncounterScribbleURL(String photoURL, String ecid,
			String tableDecider) {

		try {
			con = db.getConnection();
			String sqlQuery = "update encounter_clinical_impression set " + tableDecider + "=? where ecid=?";
			eciList = new ArrayList<EncounterClinicalImpression>();
			pstmt = con.prepareStatement(sqlQuery);
			// pstmt.setString(1, tableDecider);
			pstmt.setString(1, photoURL);
			pstmt.setString(2, ecid);

			int i = pstmt.executeUpdate();

			return eciList;
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
		return eciList;
	}

	public List<EncounterPhysicalExamination> addEncounterPhysicalExamination(EncounterPhysicalExamination ePhyObj) {

		try {
			con = db.getConnection();
			String sqlQuery = "insert into encounter_physical_examination values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

			epeList = new ArrayList<EncounterPhysicalExamination>();

			pstmt = con.prepareStatement(sqlQuery);
			pstmt.setString(1, ePhyObj.getEpeid());
			pstmt.setString(2, ePhyObj.getEid());
			pstmt.setString(3, ePhyObj.getDid());
			pstmt.setBoolean(4, ePhyObj.isLossOfConsciousness());
			pstmt.setBoolean(5, ePhyObj.isLucidInterval());
			pstmt.setBoolean(6, ePhyObj.isSeizures());
			pstmt.setBoolean(7, ePhyObj.isVomiting());
			pstmt.setBoolean(8, ePhyObj.isAmnesia());
			pstmt.setBoolean(9, ePhyObj.isBleedingFromEar());
			pstmt.setBoolean(10, ePhyObj.isBleedingFromNose());
			pstmt.setString(11, ePhyObj.getHistoryOfInjuryCommon());
			pstmt.setBoolean(12, ePhyObj.isHistoryOfInjuryCommonFlag());
			pstmt.setString(13, ePhyObj.getAirwayOnArrival());
			pstmt.setString(14, ePhyObj.getSpontaneousRespiration());
			pstmt.setBoolean(15, ePhyObj.isCarotidPulsationLeft());
			pstmt.setBoolean(16, ePhyObj.isCarotidPulsationRight());
			pstmt.setString(17, ePhyObj.getPulseRrate());
			pstmt.setString(18, ePhyObj.getBpOnArrivalSystolic());
			pstmt.setString(19, ePhyObj.getBpOnArrivalDystolic());
			pstmt.setString(20, ePhyObj.getBpAfterHalfHourSystolic());
			pstmt.setString(21, ePhyObj.getBpAfterHalfHourDystolic());
			pstmt.setString(22, ePhyObj.getCsf());
			pstmt.setBoolean(23, ePhyObj.isActivePeripheralBleeding());
			pstmt.setBoolean(24, ePhyObj.isFractures());
			pstmt.setBoolean(25, ePhyObj.isPeripheralPulses());
			pstmt.setBoolean(26, ePhyObj.isChestInjury());
			pstmt.setBoolean(27, ePhyObj.isAbdominalInjury());
			pstmt.setBoolean(28, ePhyObj.isWounds());
			pstmt.setBoolean(29, ePhyObj.isSpinalTenderness());
			pstmt.setBoolean(30, ePhyObj.isSpinalDeformity());
			pstmt.setBoolean(31, ePhyObj.isSystemicExaminationCommonFlag());
			pstmt.setString(32, ePhyObj.getSystemicExaminationCommon());
			pstmt.setBoolean(33, ePhyObj.isClosedFlag());
			int i = pstmt.executeUpdate();
			return epeList;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("In catch - " + e.getMessage());
		} finally {

			try {
				pstmt.close();
			} catch (Exception e) {
				/* ignored */ }
			try {
				con.close();
			} catch (Exception e) {
				/* ignored */ }
		}
		return epeList;
	}
}

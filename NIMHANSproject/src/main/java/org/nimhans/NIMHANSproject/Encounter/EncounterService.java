package org.nimhans.NIMHANSproject.Encounter;

import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.imageio.ImageIO;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.ResponseBuilder;

import org.codehaus.jackson.map.ObjectMapper;
import org.glassfish.jersey.media.multipart.FormDataContentDisposition;
import org.glassfish.jersey.media.multipart.FormDataParam;
import org.nimhans.NIMHANSproject.Database.EncounterDatabaseAccess;
import org.nimhans.NIMHANSproject.Database.PatientDatabaseAccess;
import org.nimhans.NIMHANSproject.IDGenerator.EncounterId;
import org.nimhans.NIMHANSproject.Patient.Patient;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;

@Path("/encounterAction")
public class EncounterService {

	EncounterDatabaseAccess eda = new EncounterDatabaseAccess();

	@Path("/getPatientEncounterDetails")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<EncounterPatientDetails> getPatientEncounterDetails() {
		List<EncounterPatientDetails> epList = new ArrayList<EncounterPatientDetails>();
		epList = eda.getEncounterPatientDetails();
		return epList;
	}

	@Path("/addParentEncounterDetails")
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public List<Encounter> addParentEncounterDetails(Encounter eParent) throws Exception {
		List<Encounter> eList = new ArrayList<Encounter>();
		System.out.println("in encounter service");
		eList = eda.addEncounterParentDetails(eParent);
		System.out.println(eList);
		return eList;
	}

	@Path("/updateParentEncounterDetails")
	@PUT
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public List<Encounter> updateParentEncounterDetails(Encounter eParent) throws Exception {
		List<Encounter> eList = new ArrayList<Encounter>();
		System.out.println("in encounter parent update " + eParent.eid);
		eList = eda.updateEncounterParentDetails(eParent);
		System.out.println(eList);

		return eList;
	}

	@Path("/addPatientEncounterDetails")
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public List<EncounterPatientDetails> addPatientEncounterDetails(EncounterPatientDetails ePatient) throws Exception {
		List<EncounterPatientDetails> epList = new ArrayList<EncounterPatientDetails>();
		System.out.println("I am in service");
		System.out.println(ePatient.getTimeOfInjury());
		epList = eda.addEncounterPatientDetails(ePatient);
		return epList;
	}

	@Path("/addPhysicalEncounter")
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public List<EncounterPhysicalExamination> addPhysicalEncounterExamination(EncounterPhysicalExamination epePatient)
			throws Exception {
		System.out.println("here");
		List<EncounterPhysicalExamination> epeList = new ArrayList<EncounterPhysicalExamination>();
		epeList = eda.addEncounterPhysicalExamination(epePatient);

		return epeList;
	}

	@Path("/addEncounterNeurologicalExamination")
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public List<EncounterNeurologicalExamination> addEncounterNeurologicalExamination(
			EncounterNeurologicalExamination enePatient) throws Exception {
		System.out.println("here");
		List<EncounterNeurologicalExamination> eneList = new ArrayList<EncounterNeurologicalExamination>();
		eneList = eda.addEncounterNeurologicalExamination(enePatient);
		return eneList;
	}

	@Path("/addClinicalEncounter")
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public List<EncounterClinicalImpression> addClinicalImpressionEncounter(EncounterClinicalImpression eClinical)
			throws Exception {
		List<EncounterClinicalImpression> eciList = new ArrayList<EncounterClinicalImpression>();
		eciList = eda.addEncounterClinicalImpression(eClinical);
		return eciList;
	}

	@Path("/getEncounterByPatientId/{pid}")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public ArrayList<Encounter> getEncounterByPatientId(@PathParam("pid") String pid) {

		ArrayList<Encounter> encList;
		EncounterDatabaseAccess eda = new EncounterDatabaseAccess();
		encList = eda.getEncounterByPatientId(pid);
		return encList;
	}

	@GET
	@Path("/getPatientEncounterDetailsById/{eid}")
	@Produces(MediaType.APPLICATION_JSON)
	public List<EncounterPatientDetails> getPatientEncounterDetailsById(@PathParam("eid") String eid) {
		List<EncounterPatientDetails> epList = new ArrayList<EncounterPatientDetails>();
		epList = eda.getEncounterPatientDetailsById(eid);
		return epList;
	}

	@GET
	@Path("/getPhysicalEncounterById/{eid}")
	@Produces(MediaType.APPLICATION_JSON)
	public List<EncounterPhysicalExamination> getPhysicalExaminationEncounterById(@PathParam("eid") String eid) {
		List<EncounterPhysicalExamination> epeList = new ArrayList<EncounterPhysicalExamination>();
		epeList = eda.getEncounterPhysicalExaminationById(eid);
		return epeList;
	}

	@GET
	@Path("/getNeurologicalEncounterById/{eid}")
	@Produces(MediaType.APPLICATION_JSON)
	public List<EncounterNeurologicalExamination> getNeurologicalExaminationEncounterById(
			@PathParam("eid") String eid) {
		List<EncounterNeurologicalExamination> eneList = new ArrayList<EncounterNeurologicalExamination>();
		eneList = eda.getEncounterNeurologicalExaminationById(eid);
		return eneList;

	}

	@GET
	@Path("/getClinicalEncounterById/{eid}")
	@Produces(MediaType.APPLICATION_JSON)
	public List<EncounterClinicalImpression> getClinicalImpressionEncounterById(@PathParam("eid") String eid) {
		List<EncounterClinicalImpression> eciList = new ArrayList<EncounterClinicalImpression>();
		eciList = eda.getEncounterClinicalImpressionById(eid);
		return eciList;

	}

	@Path("/getNewId/{pid}")
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public EncounterId getNewId(@PathParam("pid") String pid) {
		System.out.println("in encounter service"+pid);
		EncounterId ei = new EncounterId();
		ei = eda.generateNewId(pid);
		System.out.println("New Id is"+ei);
		return ei;
	}

	@POST
	@Path("/upload/{pid}")
	@Consumes(MediaType.MULTIPART_FORM_DATA)
	public Response uploadFile(@FormDataParam("file") InputStream uploadedInputStream,
			@FormDataParam("file") FormDataContentDisposition fileDetail, @PathParam("pid") String pid) {
		PatientDatabaseAccess pda = new PatientDatabaseAccess();

		List<Patient> pList = new ArrayList<Patient>();
		String fileName = "" + pid + "img.jpg";
		String fileLocation = "D:\\PE\\uploadedImages\\" + fileName;
		// saving file
		pList = pda.addPatientPhotoURL(fileLocation, pid);
		try {
			FileOutputStream out = new FileOutputStream(new File(fileLocation));
			int read = 0;
			byte[] bytes = new byte[1024];
			out = new FileOutputStream(new File(fileLocation));
			while ((read = uploadedInputStream.read(bytes)) != -1) {
				out.write(bytes, 0, read);
			}
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		String output = "File successfully uploaded to : " + fileLocation;
		return Response.status(200).entity(output).build();
	}
	
	@POST
	@Path("/uploadIncidentScribble/{tableDecider}/{eid}")
	@Consumes(MediaType.MULTIPART_FORM_DATA)
	public Response uploadIncidentScribble(@FormDataParam("file") InputStream uploadedInputStream,
			@FormDataParam("file") FormDataContentDisposition fileDetail,
			@PathParam("tableDecider") String tableDecider, @PathParam("eid") String eid) {
		List<EncounterPatientDetails> epList = new ArrayList<EncounterPatientDetails>();

		String fileName = eid + "_" + tableDecider + "_" + "scribble.jpg";
		String fileLocation = "D:\\PE\\uploadedImages\\" + fileName;
		// saving file

		epList = eda.addIncidentEncounterScribbleURL(fileLocation, eid, tableDecider);

		try {
			FileOutputStream out = new FileOutputStream(new File(fileLocation));
			int read = 0;
			byte[] bytes = new byte[1024];
			out = new FileOutputStream(new File(fileLocation));
			while ((read = uploadedInputStream.read(bytes)) != -1) {
				out.write(bytes, 0, read);
			}
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		String output = "File successfully uploaded to : " + fileLocation;
		return Response.status(200).entity(output).build();
	}

	@POST
	@Path("/uploadScribble/{tableDecider}/{eid}")
	@Consumes(MediaType.MULTIPART_FORM_DATA)
	public Response uploadScribble(@FormDataParam("file") InputStream uploadedInputStream,
			@FormDataParam("file") FormDataContentDisposition fileDetail,
			@PathParam("tableDecider") String tableDecider, @PathParam("eid") String eid) {

		List<EncounterNeurologicalExamination> eneList = new ArrayList<EncounterNeurologicalExamination>();
		List<EncounterClinicalImpression> eciList = new ArrayList<EncounterClinicalImpression>();

		String fileName = eid + "_" + tableDecider + "_" + "scribble.jpg";
		String fileLocation = "D:\\PE\\uploadedImages\\" + fileName;
		// saving file

		if (tableDecider.equals("any_other_neurological_deficits")) {
			eneList = eda.addNeurologicalEncounterScribbleURL(fileLocation, eid, tableDecider);
		} else {
			eciList = eda.addClinicalEncounterScribbleURL(fileLocation, eid, tableDecider);
		}
		try {
			FileOutputStream out = new FileOutputStream(new File(fileLocation));
			int read = 0;
			byte[] bytes = new byte[1024];
			out = new FileOutputStream(new File(fileLocation));
			while ((read = uploadedInputStream.read(bytes)) != -1) {
				out.write(bytes, 0, read);
			}
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		String output = "File successfully uploaded to : " + fileLocation;
		return Response.status(200).entity(output).build();
	}

	@POST
	@Path("/uploadPhysicalScribble/{tableDecider}/{eid}")
	@Consumes(MediaType.MULTIPART_FORM_DATA)
	public Response uploadPhysicalScribble(@FormDataParam("file") InputStream uploadedInputStream,
			@FormDataParam("file") FormDataContentDisposition fileDetail,
			@PathParam("tableDecider") String tableDecider, @PathParam("eid") String eid) {
		List<EncounterPhysicalExamination> epeList = new ArrayList<EncounterPhysicalExamination>();

		String fileName = eid + "_" + tableDecider + "_" + "scribble.jpg";
		String fileLocation = "D:\\PE\\uploadedImages\\" + fileName;
		// saving file

		epeList = eda.addPhysicalEncounterScribbleURL(fileLocation, eid, tableDecider);

		try {
			FileOutputStream out = new FileOutputStream(new File(fileLocation));
			int read = 0;
			byte[] bytes = new byte[1024];
			out = new FileOutputStream(new File(fileLocation));
			while ((read = uploadedInputStream.read(bytes)) != -1) {
				out.write(bytes, 0, read);
			}
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		String output = "File successfully uploaded to : " + fileLocation;
		return Response.status(200).entity(output).build();
	}

	// private static final String FILE_PATH = "e:\\Picture1.jpg";
	@GET
	@Path("/image/{pid}")
	@Produces("image/jpg")
	public String getFile(@PathParam("pid") String pid) throws Exception {
		PatientDatabaseAccess pda = new PatientDatabaseAccess();
		List<Patient> pList = new ArrayList<Patient>();
		pList = pda.getPatientPhotoById(pid);
		File file = new File(pList.get(0).getPhotoURL());
		FileInputStream fis = new FileInputStream(file);
		BufferedInputStream inputStream = new BufferedInputStream(fis);
		byte[] fileBytes = new byte[(int) file.length()];
		inputStream.read(fileBytes);
		inputStream.close();

		String base64 = Base64.encode(fileBytes);

		System.out.println("here: " + base64);
		return base64;

	}
	
	//Get Scribble for Incident Details
	@GET
	@Path("/getScribbleFrmIncident/{eid}")
	@Produces(MediaType.APPLICATION_JSON)
	public String getIncidentScribbleFile(@PathParam("eid") String eid) throws Exception {
		EncounterDatabaseAccess eda = new EncounterDatabaseAccess();
		List<EncounterPatientDetails> epeList = new ArrayList<EncounterPatientDetails>();
		epeList = eda.getEncounterPatientDetailsById(eid);
		HashMap<String, String> hm = new HashMap<String, String>();
		// All flags are set if touch pad image is saved in database
		if (epeList.get(0).isFall_siteoffall_flag()) {
			if(epeList.get(0).getFall_siteoffall()!=null)
				hm.put("fall_siteoffall", urlToBase64(epeList.get(0).getFall_siteoffall()));
		}
		
		if (epeList.get(0).isOtherInfo_flag()) {
			if(epeList.get(0).getOtherInfo()!=null)
				hm.put("otherInfo", urlToBase64(epeList.get(0).getOtherInfo()));
		}
		
		if (epeList.get(0).isCommonText_flag()) {
			if(epeList.get(0).getCommonText()!=null)
				hm.put("commonText", urlToBase64(epeList.get(0).getCommonText()));
		}
		// Converting hashmap into jsonObject
		ObjectMapper mapperObj = new ObjectMapper();
		String jsonResp = mapperObj.writeValueAsString(hm);

		System.out.println(jsonResp);

		return jsonResp;

	}
	
	//Get Scribble for Clinical and Neurological
	@GET
	@Path("/getScribble/{eid}")
	@Produces(MediaType.APPLICATION_JSON)
	public String getScribbleFile(@PathParam("eid") String eid) throws Exception {
		EncounterDatabaseAccess eda = new EncounterDatabaseAccess();
		List<EncounterClinicalImpression> eciList = new ArrayList<EncounterClinicalImpression>();
		eciList = eda.getEncounterClinicalImpressionById(eid);
		
		List<EncounterNeurologicalExamination> eneList = new ArrayList<EncounterNeurologicalExamination>();
		eneList = eda.getEncounterNeurologicalExaminationById(eid);
		

		System.out.println("in getScribble");
		System.out.println("eciList "+eciList.get(0));

		System.out.println("eneList "+eneList.get(0));
		HashMap<String, String> base64List = new HashMap<String, String>();

		if(eneList.get(0).isAnyOtherNeurologicalDeficitsSketchpad()){
			if(eneList.get(0).getAnyOtherNeurologicalDeficits()!=null)
				base64List.put("anyOtherNeurologicalDeficits", urlToBase64(eneList.get(0).getAnyOtherNeurologicalDeficits()));

		}
		if (eciList.get(0).isCtScanHeadSketchPad()) {
			if (eciList.get(0).getCtScanHead()!=null)
				base64List.put("ctScanHead", urlToBase64(eciList.get(0).getCtScanHead()));

		}
		if (eciList.get(0).isXrayDetailsSketchPad()) {
			if (eciList.get(0).getXrayDetails()!=null)
				base64List.put("xrayDet0ails", urlToBase64(eciList.get(0).getXrayDetails()));
		}
		if (eciList.get(0).isManagementPlanSketchPad()) {
			if(eciList.get(0).getManagementPlan()!=null)
				base64List.put("managementPlan", urlToBase64(eciList.get(0).getManagementPlan()));
			
		}
		if (eciList.get(0).isCourseInHospitalSketchPad()) {
			if(eciList.get(0).getCourseInHospital()!=null)
				base64List.put("courseInHospital", urlToBase64(eciList.get(0).getCourseInHospital()));
		}
		if (eciList.get(0).isConditionAtDischargeSketchPad()) {
			if(eciList.get(0).getConditionAtDischarge()!=null)
				base64List.put("conditionAtDischarge", urlToBase64(eciList.get(0).getConditionAtDischarge()));
		}

		System.out.println("here: " + base64List.keySet());

		ObjectMapper mapperObj = new ObjectMapper();
		String jsonResp = mapperObj.writeValueAsString(base64List);

		System.out.println(jsonResp);

		return jsonResp;

	}
	
	//Get Scribble for Physical
	@GET
	@Path("/getScribbleFrmPhysical/{eid}")
	@Produces(MediaType.APPLICATION_JSON)
	public String getPhysicalScribbleFile(@PathParam("eid") String eid) throws Exception {
		EncounterDatabaseAccess eda = new EncounterDatabaseAccess();
		List<EncounterPhysicalExamination> epeList = new ArrayList<EncounterPhysicalExamination>();
		epeList = eda.getEncounterPhysicalExaminationById(eid);
		HashMap<String, String> hm = new HashMap<String, String>();

		// All flags are set if touch pad image is saved in database
		if (epeList.get(0).isHistoryOfInjuryCommonFlag()) {
			if(epeList.get(0).getHistoryOfInjuryCommon()!=null)
				hm.put("historyOfInjuryCommon", urlToBase64(epeList.get(0).getHistoryOfInjuryCommon()));
		}
		
		if (epeList.get(0).isSystemicExaminationCommonFlag()) {
			if(epeList.get(0).getSystemicExaminationCommon()!=null)
				hm.put("systemicExaminationCommon", urlToBase64(epeList.get(0).getSystemicExaminationCommon()));
		}
		// Converting hashmap into jsonObject
		ObjectMapper mapperObj = new ObjectMapper();
		String jsonResp = mapperObj.writeValueAsString(hm);

		System.out.println(jsonResp);

		return jsonResp;

	}

	public String urlToBase64(String pathUrl) throws Exception {

		File file = new File(pathUrl);
		FileInputStream fis = new FileInputStream(file);
		BufferedInputStream inputStream = new BufferedInputStream(fis);
		byte[] fileBytes = new byte[(int) file.length()];
		inputStream.read(fileBytes);
		inputStream.close();

		String base64 = Base64.encode(fileBytes);

		return base64;
	}

}

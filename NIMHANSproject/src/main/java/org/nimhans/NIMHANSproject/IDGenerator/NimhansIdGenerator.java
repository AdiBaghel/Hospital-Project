package org.nimhans.NIMHANSproject.IDGenerator;
import org.nimhans.NIMHANSproject.Database.*;
import org.nimhans.NIMHANSproject.Encounter.Encounter;
import org.nimhans.NIMHANSproject.Encounter.EncounterClinicalImpression;
import org.nimhans.NIMHANSproject.Encounter.EncounterNeurologicalExamination;
import org.nimhans.NIMHANSproject.Encounter.EncounterPatientDetails;
import org.nimhans.NIMHANSproject.Encounter.EncounterPhysicalExamination;
import org.nimhans.NIMHANSproject.Patient.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class NimhansIdGenerator implements IdGeneration  {
	 //create an object of SingleObject
	   private static NimhansIdGenerator instance = new NimhansIdGenerator();
	   DatabaseConnection db=new DatabaseConnection();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<Encounter> eid;
		ArrayList<EncounterPatientDetails> epList;
		ArrayList<EncounterPhysicalExamination> epeList;
		ArrayList<EncounterNeurologicalExamination> eneList;
		ArrayList<EncounterClinicalImpression> eciList;
	   //make the constructor private so that this class cannot be
	   //instantiated
	   private NimhansIdGenerator()
	   {
		   
	   }

	   //Get the only object available
	   public static NimhansIdGenerator getInstance(){
	      return instance;
	   }

	   public void showMessage(){
	      System.out.println("Nimhans id generated!");
	   }
	
	
	public EncounterId getNewId()
	{
		
		String encounterId=null,phyEncounterId=null,patEncounterId=null, neuEncounterId=null,cliEncounterId=null;
       
		try{
			con = db.getConnection();
			if(con!=null)
			{
				System.out.println("connection established");
			}
			Statement stmt = con.createStatement();
			int laters=0;
			String sql="select * from encounter order by eid asc";
			rs = stmt.executeQuery(sql);
			rs.last();
			laters=Integer.parseInt(rs.getString(1).substring(1));
			rs.beforeFirst();
			System.out.println(laters);
			laters=laters+1;
			encounterId="E"+laters;
			phyEncounterId="Ep"+laters;
			patEncounterId="Epd"+laters;
			neuEncounterId="Ene"+laters;
			cliEncounterId="Ec"+laters;
			
		}
		 catch (Exception e) {
			 e.printStackTrace();
			// TODO Auto-generated catch block
			//System.out.println("In catch - "+e.getMessage());
		}
		finally {
		    
		    try { pstmt.close(); } catch (Exception e) { /* ignored */ }
		    try { con.close(); } catch (Exception e) { /* ignored */ }
		}
		 EncounterId eid=new EncounterId(encounterId,phyEncounterId,patEncounterId, neuEncounterId,cliEncounterId);
		System.out.println("generated id's in nimhans id generator"+encounterId+" "+phyEncounterId+" "+patEncounterId+" "+neuEncounterId+" "+cliEncounterId);
		return eid;
	}
	
	

	public PatientId getNewPatientId()
	{
		
		String pid=null;
       
		try{
			con = db.getConnection();
			if(con!=null)
			{
				System.out.println("connection established");
			}
			Statement stmt = con.createStatement();
			int laters=0;
			String sql="select * from patient order by pid asc";
			rs = stmt.executeQuery(sql);
			rs.last();
			laters=Integer.parseInt(rs.getString(1).substring(1));
			rs.beforeFirst();
			laters=laters+1;
			pid="P"+laters;
			
			
		}
		 catch (Exception e) {
			 e.printStackTrace();
			// TODO Auto-generated catch block
			//System.out.println("In catch - "+e.getMessage());
		}
		finally {
		    
		    try { pstmt.close(); } catch (Exception e) { /* ignored */ }
		    try { con.close(); } catch (Exception e) { /* ignored */ }
		}
		PatientId pobj=new PatientId(pid);
		System.out.println("generated patient id in nimhans id generator"+ " "+pid);
		return pobj;
	}
	
	public DoctorId getNewDoctorId()
	{
		
		String did=null;
       
		try{
			con = db.getConnection();
			if(con!=null)
			{
				System.out.println("connection established");
			}
			Statement stmt = con.createStatement();
			int laters=0;
			String sql="select * from doctor order by did asc";
			rs = stmt.executeQuery(sql);
			rs.last();
			laters=Integer.parseInt(rs.getString(1).substring(1));
			rs.beforeFirst();
			laters=laters+1;
			did="D"+laters;
			
			
		}
		 catch (Exception e) {
			 e.printStackTrace();
			// TODO Auto-generated catch block
			//System.out.println("In catch - "+e.getMessage());
		}
		finally {
		    
		    try { pstmt.close(); } catch (Exception e) { /* ignored */ }
		    try { con.close(); } catch (Exception e) { /* ignored */ }
		}
		DoctorId dobj=new DoctorId(did);
		System.out.println("generated doctor id in nimhans id generator"+ " "+did);
		return dobj;
	}
	
  public String getCurrentId()
	{
		
		
	return "P1002";
	}

}

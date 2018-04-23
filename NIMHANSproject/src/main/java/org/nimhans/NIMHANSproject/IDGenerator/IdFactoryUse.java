package org.nimhans.NIMHANSproject.IDGenerator;

public class IdFactoryUse {
	
	//use getShape method to get object of type shape 
	   public IdGeneration getIdObj(String hospitalName){
	      if(hospitalName == null){
	         return null;
	      }		
	      if(hospitalName.equalsIgnoreCase("NIMHANS")){
	    	  return NimhansIdGenerator.getInstance();
	       
	      } 
	      return null;
	   }	

}

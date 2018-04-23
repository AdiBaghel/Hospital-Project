var app = angular.module("createPatient", ['GlobalURL']);
app.controller("createPatientCtrl", createPatientFun);

function createPatientFun($scope,$http, serverURL) {
	var self=this;
	
	this.createUser = function() {
		var pData1 = angular.toJson(self.pData);
		$http.post("http://"+serverURL+"/NIMHANSproject/Services/patientAction/addPatient",pData1)
		.then(function(){
			self.successMessage="Data successfully added";
			alert('Patient Information Successfully Submitted');
			console.log(self.successMessage);
			console.log(pData1);
		});

	}
   	
	this.generatePatientID=function(){
		
		var pid = self.patientID.pid;
		
		this.pData={
				"pid":pid
		}
		console.log(pid);
	}
	
	
	self.getPatientId=function()
	{    
	
		var promise1 =$http.get("http://"+serverURL+"/NIMHANSproject/Services/patientAction/getPatientId");
	     var promise2=promise1.then(function(response){
	     console.log(response.data);
	     return response.data;
	     });
	     return promise2;
	       
	}
	
	this.confirmSubmit = function() { 
		
		if (confirm("Confirm Submit?"))
	           {
				this.createUser();
				
	           }
	}
	
	self.getPatientId().then(function(data){
		self.patientID=data;
		console.log(self.patientID);
	});
	
	
}


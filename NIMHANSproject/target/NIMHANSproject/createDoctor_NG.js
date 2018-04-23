var app = angular.module("createDoctor", ['GlobalURL']);
app.controller("createDoctorCtrl", createDoctorFun);

function createDoctorFun($scope,$http, serverURL) {
	var self=this;
	
	this.createUser = function() {
		var dData1 = angular.toJson(self.dData);
		$http.post("http://"+serverURL+"/NIMHANSproject/Services/docAction/addDoctor",dData1)
		.then(function(){
			self.successMessage="Data successfully added";
			alert('Doctor Information Successfully Submitted');
			console.log(self.successMessage);
			console.log(dData1);
			
			setUser();
		});
		
	}
   	
	this.generateDoctorID=function(){
		
		var did = self.doctorID.did;
		
		this.dData={
				"did":did
		};
		console.log(did);
	}
	
	
	self.getDoctorId=function()
	{    
	
		var promise1 =$http.get("http://"+serverURL+"/NIMHANSproject/Services/docAction/getDoctorId");
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
	
	self.getDoctorId().then(function(data){
		self.doctorID=data;
		console.log(self.doctorID);
		
	
	});
	
	function setUser(){
		var did = self.doctorID.did;
		self.uData={
			"uid":did,
			"uname":self.dData.dname,
			"role":"Doctor",
		};
		
		addUser();
	}

	
	function addUser() {
		var uData1 = angular.toJson(self.uData);
		$http.post("http://"+serverURL+"/NIMHANSproject/Services/userAction/addUser",uData1)
		.then(function(){
			self.successMessage="Data successfully added";
			alert('User Information Successfully Submitted');
			console.log(self.successMessage);
			console.log(uData1);
		});

	}
	
}


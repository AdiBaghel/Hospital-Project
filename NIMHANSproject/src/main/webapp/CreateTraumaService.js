(function() {
	var app = angular.module("traumaPost");
	app.service("dbDataPostSvc",
					function($http, serverURL) {
						var self = this;
					     console.log("link "+"http://"+serverURL+"/NIMHANSproject/Services/encounterAction/getNewId");

						/*self.getEncounterPatientDetail = function() {
							console.log("URL"+serverURL);
							var promise1 = $http.get("http://"+serverURL+"/NIMHANSproject/Services/encounterAction/getPatientEncounterDetailsById/E100002");
							var promise2 = promise1.then(function(response) {
								console.log(response.data);
								return response.data;
							});
							return promise2;
						}

						self.getEncounterPhysicalExamination = function() {
							var promise1 = $http.get("http://"+serverURL+"/NIMHANSproject/Services/encounterAction/getPhysicalEncounterById/E100001");
							var promise2 = promise1.then(function(response) {
								console.log(response.data);
								return response.data;
							});
							return promise2;
						}

						self.getEncounterNeuologicalExamination = function() {
							var promise1 = $http.get("http://"+serverURL+"/NIMHANSproject/Services/encounterAction/getNeurologicalEncounterById/E100001");
							var promise2 = promise1.then(function(response) {
								console.log(response.data);
								return response.data;
							});
							return promise2;
						}
*/
						
						self.getEncounterId=function(pid){
							 var p0 = pid;
							 console.log("in create trauma service"+p0);
						     var promise1=$http.get("http://"+serverURL+"/NIMHANSproject/Services/encounterAction/getNewId/"+p0);
						     var promise2=promise1.then(function(response){
						     console.log(response.data);
						     return response.data;
						     });
						     return promise2;
						       
						}
						
						self.getPatientbyId = function(pid) {
							var p1 = pid;
							var promise1 = $http.get("http://"+serverURL+"/NIMHANSproject/Services/patientAction/getPatientbyId/"+p1);
							var promise2 = promise1.then(function(response) {
							console.log(response.data);
							return response.data;
							});
							return promise2;
						}
						
						
						self.createNewParentEncounter=function(parentData){
							
					      	return $http.post("http://"+serverURL+"/NIMHANSproject/Services/encounterAction/addParentEncounterDetails",parentData)
					      	.then(function(response){
					      		console.log(parentData);
					          })
					       }
						
						self.updateNewParentEncounter=function(parentData){
							
					      	return $http.put("http://"+serverURL+"/NIMHANSproject/Services/encounterAction/updateParentEncounterDetails",parentData)
					      	.then(function(response){
					      		console.log("updateParent "+parentData);
					          })
					       }
						 
						self.createUser=function(patientData){
							console.log("I am here!!!");
					      	return $http.post("http://"+serverURL+"/NIMHANSproject/Services/encounterAction/addPatientEncounterDetails",patientData)
					      	.then(function(response){
					      		console.log(patientData);
					          })
					       }
						 
						 self.createPhysical=function(physicalData){
						  
						  return $http.post("http://"+serverURL+"/NIMHANSproject/Services/encounterAction/addPhysicalEncounter",physicalData)
						  .then(function(response){
							  console.log(physicalData);
						     })
						  }
						 
						 self.createClinical=function(clinicalData){
							
						 	return $http.post("http://"+serverURL+"/NIMHANSproject/Services/encounterAction/addClinicalEncounter",clinicalData)
						 	.then(function(response){
						 		console.log(clinicalData);
						     })
						  }

						self.createNeurological = function(neurologicalData) {
							
							return $http.post(
											"http://"+serverURL+"/NIMHANSproject/Services/encounterAction/addEncounterNeurologicalExamination",neurologicalData)
											.then(function(response) {
												console.log(neurologicalData);
											})
						}

						self.createEncounterNeurologicalExamination = function(patientData) {
							return $http
									.post(
											"http://"+serverURL+"/HospitalProject/webapi/encounter/",
											patientData).then(
											function(response) {
												console.log(patientData);
											})
						}
						
  					}); // dbDataPostSvc function call end here
})(); // traumaservice - anonymous function call end here

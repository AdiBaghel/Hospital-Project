(function() {
	var app = angular.module("traumaGet");
	app.service("dbDataGetSvc",
					function($http, serverURL) {
						var self = this;

						self.getEncounterPatientDetail = function(eid) {
							var e1 = eid;
							var promise1 = $http.get("http://"+serverURL+"/NIMHANSproject/Services/encounterAction/getPatientEncounterDetailsById/"+e1);
							var promise2 = promise1.then(function(response) {
								console.log(response.data);
								return response.data;
							});
							return promise2;
						}

						self.getEncounterPhysicalExamination=function(eid){
							var e2 = eid;
							var promise1=$http.get("http://"+serverURL+"/NIMHANSproject/Services/encounterAction/getPhysicalEncounterById/"+e2);
							var promise2=promise1.then(function(response){
							console.log(response.data);
							return response.data;
							});
							return promise2;
						}

						self.getEncounterNeuologicalExamination = function(eid) {
							var e3 = eid;
							var promise1 = $http.get("http://"+serverURL+"/NIMHANSproject/Services/encounterAction/getNeurologicalEncounterById/"+e3);
							var promise2 = promise1.then(function(response) {
								console.log(response.data);
								return response.data;
							});
							return promise2;
						}
						self.getEncounterClinicalImpression=function(eid){
							var e4 = eid;
							var promise1=$http.get("http://"+serverURL+"/NIMHANSproject/Services/encounterAction/getClinicalEncounterById/"+e4);
							var promise2=promise1.then(function(response){
								console.log(response.data);
								return response.data;
							});
							return promise2;
						    }
						self.getPatientPhoto=function(){
							var promise1=$http.get("http://"+serverURL+"/NIMHANSproject/Services/encounterAction/image/P100001");
							var promise2=promise1.then(function(response){
								return response.data;
							});
							return promise2;
						    }
						
						self.getEncounterScribble=function(eid){
							var e6 = eid;
							var promise1=$http.get("http://"+serverURL+"/NIMHANSproject/Services/encounterAction/getScribble/"+e6);
							var promise2=promise1.then(function(response){
								console.log(response.data);
								console.log(response);
								return response.data;
							});
							return promise2;
						    }
						
						self.getEncounterScribbleFromPhysical=function(eid){
							var e7 = eid;
							var promise1=$http.get("http://"+serverURL+"/NIMHANSproject/Services/encounterAction/getScribbleFrmPhysical/"+e7);
							var promise2=promise1.then(function(response){
							return response.data;
							});
							return promise2;
						}
						
						self.getPatientDetailsByEncounterID = function(eid) {
							var e8 = eid;
							var promise1 = $http.get("http://"+serverURL+"/NIMHANSproject/Services/patientAction/getPatientByEncounterId/"+e8);
							var promise2 = promise1.then(function(response) {
							console.log(response.data);
							return response.data;
							});
							return promise2;
							}
												
  					}); // dbDataGetSvc function call end here
})(); // traumaservice - anonymous function call end here

(function() {
	var app = angular.module("traumaApp");
	app.service("dbDataSvc",
					function($http) {
						var self = this;

						self.getEncounterPatientDetail = function() {
							var promise1 = $http.get("http://localhost:8080/NIMHANSproject/Services/encounterAction/getPatientEncounterDetailsById/E100002");
							var promise2 = promise1.then(function(response) {
								console.log(response.data);
								return response.data;
							});
							return promise2;
						}

						self.getEncounterPhysicalExamination = function() {
							var promise1 = $http.get("http://localhost:8080/NIMHANSproject/Services/encounterAction/getPhysicalEncounterById/E100001");
							var promise2 = promise1.then(function(response) {
								console.log(response.data);
								return response.data;
							});
							return promise2;
						}

						self.getEncounterNeuologicalExamination = function() {
							var promise1 = $http.get("http://localhost:8080/NIMHANSproject/Services/encounterAction/getNeurologicalEncounterById/E100001");
							var promise2 = promise1.then(function(response) {
								console.log(response.data);
								return response.data;
							});
							return promise2;
						}

						self.createUser = function(patientData) {
							return $http.post("http://localhost:8080/HospitalProject/webapi/encounter/",patientData).then(
											function(response) {
												console.log(patientData);
											})
						}

						self.createNeurological = function(neurologicalData) {
							return $http.post(
											"http://localhost:8080/NIMHANSproject/Services/encounterAction/addEncounterNeurologicalExamination",neurologicalData)
											.then(function(response) {
												console.log(neurologicalData);
											})
						}

						self.createEncounterNeurologicalExamination = function(patientData) {
							return $http
									.post(
											"http://localhost:8080/HospitalProject/webapi/encounter/",
											patientData).then(
											function(response) {
												console.log(patientData);
											})
						}
						
  					}); // dbDataSvc function call end here
})(); // traumaservice - anonymous function call end here

(function() {
	var app = angular.module('traumaApp', []);
	app.controller('dbDataCtrl', DBDataCtrl);

	function DBDataCtrl(dbDataSvc, $scope) {

		var self = this;
		self.editMode = false;
		self.addMode = false;
		self.operation = "";
		self.textArea = false;

		dbDataSvc.getEncounterPatientDetail().then(function(data) {
			self.myData1 = data;
		});
		dbDataSvc.getEncounterPhysicalExamination().then(function(data) {
			self.myData2 = data;
		});
		dbDataSvc.getEncounterNeuologicalExamination().then(function(data) {
			self.myData3 = data;
		});
		processParam();

		this.selectContact = function(index) {
			this.selectedContact = this.myData1[index];
			console.log("a" + this.selectedContact);
			self.successMessage = undefined;
			self.errorMessage = undefined;
		}

		this.toggleEditMode = function() {
			this.editMode = !this.editMode;
		}

		this.toggleTextMode = function() {
			this.textArea = !this.textArea;
		}

		this.showTextarea = function() {
			this.toggleEditMode();
		}

		this.saveUser = function(id) {
			this.toggleEditMode();
			var patientData = angular.toJson(self.myData1);
			var encounterNeurologicalExaminationData = angular.toJson(self.myData3);
			console.log(self.myData1);
			console.log(self.myData3)
			var formID = id;
			console.log(patientData);
			console.log(encounterNeurologicalExaminationData);
			console.log(formID);

			if (self.addMode && formID == 'form1') {
				dbDataSvc.createUser(patientData).then(function() {
					self.successMessage = "Data successfully added";
					console.log(self.successMessage);
				}, function() {
					self.errorMessage = "There was an error.Please try again";
					console.log(self.errorMessage);
				});

				self.addMode = false;
			}

			else if (self.addMode && formID == 'form3') {
				dbDataSvc.createNeurological(encounterNeurologicalExaminationData).then(function() {
					self.successMessage = "Data successfully added";
					console.log(self.successMessage);
				}, function() {
					self.errorMessage = "There was an error.Please try again";
					console.log(self.errorMessage);
				});
				self.addMode = false;
			}

			else {
				dbDataSvc.saveUser(patientData).then(function() {
					self.successMessage = "Data successfully updated";
				}, function() {
					self.errorMessage = "There was an error.Please try again";
				});
			}

		}

		this.addContact = function() {

			this.myData1 = {
				"epdid" : "Epd100010",
				"eid" : "E100008",
				"did" : "D100003",
				"pid" : "P100003"
			};

			this.myData3 = {
				"eneid" : "Epd100019",
				"eid" : "E100004",
				"did" : "D100002"
			};

			self.operation = "create";
			self.addMode = true;
			this.editMode = true;

		}
		
		function processParam()  {
			var parameters = location.search.substring(1).split("&");
			var temp = parameters[0].split("=");
			l = unescape(temp[1]);
			console.log("val of l = "+l);
		}

		$scope.newVal22 = function(value) {
			console.log(value);
		}
	}
})();

(function() {
	var app = angular.module('traumaGet', []);
	app.controller('dbDataGetCtrl', DBDataGetCtrl);

	function DBDataGetCtrl(dbDataGetSvc, serverURL, $scope) {

		var self = this;
		self.textArea = false;
		
		function processParam()  {
			var parameters = location.search.substring(1).split("&");
			var temp = parameters[0].split("=");
			l = unescape(temp[1]);
			console.log("val of l = "+l);
			
		}
		
		processParam();
		
		dbDataGetSvc.getEncounterPatientDetail(l).then(function(data) {
			self.myData1 = data;
		});
		
		dbDataGetSvc.getEncounterPhysicalExamination(l).then(function(data) {
			self.myData2 = data;
		});
		
		dbDataGetSvc.getEncounterNeuologicalExamination(l).then(function(data) {
			self.myData3 = data;
			console.log(self.myData3);
		});
		
		dbDataGetSvc.getEncounterClinicalImpression(l).then(function(data){
			self.myData4=data;
		});

		dbDataGetSvc.getPatientPhoto().then(function(data){
			self.myData5=data;
		});
		
		dbDataGetSvc.getEncounterScribble(l).then(function(data){
			self.myData6=data;
		});
		
		
		dbDataGetSvc.getEncounterScribbleFromPhysical(l).then(function(data){
			self.myData7=data;
		});
		
		dbDataGetSvc.getPatientDetailsByEncounterID(l).then(function(data) {
			self.myData8=data;
		});
		
		dbDataGetSvc.getEncounterScribbleFromIncident(l).then(function(data){
			self.myData9=data;
		});
		
	}
})();

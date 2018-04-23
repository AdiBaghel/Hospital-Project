(function() {
	var app = angular.module('traumaPost',['ngFileUpload','signature']);
	app.controller('dbDataPostCtrl', DBDataPostCtrl);

	function DBDataPostCtrl(dbDataPostSvc, $scope, Upload, $timeout, serverURL) {
		var self = this;
		startUpFuctions();
		function startUpFuctions(){
			getIds();
			processParam();
			self.pid = l;
			dbDataPostSvc.getPatientbyId(l).then(function(data) {
				self.pData1=data;
				console.log(self.pData1);
			});
		}

		function getIds(){ 
			dbDataPostSvc.getEncounterId().then(function(data){
				self.myData=data;
				console.log(self.myData)
				addContact();
			}); 
		}

		function processParam()  {
			var parameters = location.search.substring(1).split("&");
			var temp = parameters[0].split("=");
			l = unescape(temp[1]);
			console.log("val of l = "+l);

			if(parameters[1]!=null){
				var temp=parameters[1].split("=");
				dname = unescape(temp[1]);
				console.log("val of dname = "+dname);
				self.dname = dname;
			}
		}

		function addContact()
		{
			var eid =self.myData.encounterId;
			var ecid=self.myData.cliEncounterId;
			var epeid=self.myData.phyEncounterId;
			var epdid=self.myData.patEncounterId ;
			var eneid=self.myData.neuEncounterId;
			console.log(eid);
			console.log(ecid);
			console.log(epeid);
			console.log(epdid);
			console.log(eneid);

			var pid=l;

			self.myData1 = {
					"epdid" : epdid,
					"eid" : eid,
					"did" : "D100002",
					"pid" : pid,
					"fall_siteoffall_flag":"1",
					"otherInfo_flag":"1",
					"commonText_flag":"1",
					"closedFlag" : "0"
			};

			var date=new Date();
			self.myData1.dateOfExamination=date;
			self.myData1.timeOfExamination=date;

			self.myData2={
					"epeid":epeid,
					"eid":eid,
					"did":"D100003",
					"historyOfInjuryCommonFlag":"1",
					"systemicExaminationCommonFlag":"1",
					"closedFlag" : "0"

			}; 


			self.myData3 = {
					"eneid" : eneid,
					"eid" : eid,
					"did" : "D100003",
					"anyOtherNeurologicalDeficitsSketchpad" : "1",
					"closedFlag" : "0"
			};

			self.myData4={
					"ecid":ecid,
					"eid":eid,
					"did":"D100002",
					"ctScanHeadSketchPad":"1",
					"xrayDetailsSketchPad":"1",
					"managementPlanSketchPad":"1",
					"courseInHospitalSketchPad":"1",
					"conditionAtDischargeSketchPad":"1",
					"closedFlag":"0"
			}; 
			this.myData6=null;
			console.log(this.myData6);

			self.myData= {
					"eid" : eid,
					"pid" : pid,
					"did"	: "D100002",
					"startDate" :  date,
					"closeDate" :  null,
					"closedFlag" : "0"
			}

		}

		self.itouch1="";
		self.itouch2="";
		self.itouch3="";
		self.ntouch1="";
		self.ctouch1="";
		self.ctouch2="";
		self.ctouch3="";
		self.ctouch4="";
		self.ctouch5="";
		self.ptouch1="";
		self.ptouch2="";
		//show text area for physical
		this.showTextAreaPhysical=function(btnId) {
			console.log(btnId)
			if(btnId=='pt1'){
				console.log("in text area");
				self.myData2.historyOfInjuryCommonFlag=0;
			}
			if(btnId=='pt2'){
				self.myData2.systemicExaminationCommonFlag=0;
			}
		}

		// show touch pad for physical
		this.showTouchPadPhysical=function(btnId) {
			console.log(btnId)
			if(btnId=='pt1'){
				self.myData2.historyOfInjuryCommonFlag=1;
			}
			if(btnId=='pt2'){
				self.myData2.systemicExaminationCommonFlag=1;
			}
			
		}

		//show text area for incident,neuro and clinical
		this.showTextarea=function(btnId) {
			console.log(btnId)
			if(btnId=='it1'){
				self.myData1.fall_siteoffall_flag=0;
			}
			if(btnId=='it2'){
				self.myData1.otherInfo_flag=0;
			}
			if(btnId=='it3'){
				self.myData1.commonText_flag=0;
			}
			if(btnId=='nt1'){
				self.myData3.anyOtherNeurologicalDeficitsSketchpad=0;
				console.log("NT1"+btnId);
			}
			if(btnId=='ct1'){
				self.myData4.ctScanHeadSketchPad=0;
			}
			if(btnId=='ct2'){
				self.myData4.xrayDetailsSketchPad=0;
			}
			if(btnId=='ct3'){
				self.myData4.managementPlanSketchPad=0;
			}
			if(btnId=='ct4'){
				self.myData4.courseInHospitalSketchPad=0;
			}
			if(btnId=='ct5'){
				self.myData4.conditionAtDischargeSketchPad=0;
			}

		}

		//show touch pad for incident,neuro and clinical
		this.showTouchpad=function(btnId) {
			console.log("tp"+btnId);
			if(btnId=='it1'){
				self.myData1.fall_siteoffall_flag=1;
			}
			if(btnId=='it2'){
				self.myData1.otherInfo_flag=1;
			}
			if(btnId=='it3'){
				self.myData1.commonText_flag=1;
			}

			if(btnId=='nt1'){
				self.myData3.anyOtherNeurologicalDeficitsSketchpad=1;
			}
			if(btnId=='ct1'){
				self.myData4.ctScanHeadSketchPad=1;
			}
			if(btnId=='ct2'){
				self.myData4.xrayDetailsSketchPad=1;
			}
			if(btnId=='ct3'){
				self.myData4.managementPlanSketchPad=1;
			}
			if(btnId=='ct4'){
				self.myData4.courseInHospitalSketchPad=1;
			}
			if(btnId=='ct5'){
				self.myData4.conditionAtDischargeSketchPad=1;
			}
		}


		this.confirmSubmit = function(id) { 

			if (confirm("Confirm Submit?"))
			{
				this.saveUser(id);

			}
		}


		this.saveUser = function(id) {

			//	self.myData1.closedFlag=1;
			//	self.myData2.closedFlag=1;
			//	self.myData3.closedFlag=1;
			//	self.myData4.closedFlag=1;
			//	var patientData = angular.toJson(self.myData1);
			//	var physicalData= angular.toJson(self.myData2);
			//	var encounterNeurologicalExaminationData = angular.toJson(self.myData3);
			//	var clinicalData = angular.toJson(self.myData4);

			var formID = id;

			console.log(formID);

			if(formID == 'form1') {
				dbDataPostSvc.createNewParentEncounter(self.myData).then(function() {

					self.successMessage = "Data successfully added";
					console.log(self.successMessage);
				}, function() {
					self.errorMessage = "There was an error.Please try again";
					console.log(self.errorMessage);
				});

				self.myData1.closedFlag=1;
				console.log(self.myData1.informantType);
				var patientData = angular.toJson(self.myData1);

				dbDataPostSvc.createUser(patientData).then(function() {
					self.successMessage = "Data successfully added";
					self.functionCallerIncident();
					console.log(self.successMessage);
					alert('Incident Information Successfully Submitted');
				}, function() {
					self.errorMessage = "There was an error.Please try again";
					console.log(self.errorMessage);
					alert('There was an error. Please try again');
				});
			} 
			else if(formID=='form2'){
				self.myData2.closedFlag=1;
				var physicalData= angular.toJson(self.myData2);

				dbDataPostSvc.createPhysical(physicalData)
				.then(function(){
					self.successMessage="Data successfully added";
					self.functionCallerPhysical();
					console.log(self.successMessage);
					alert('Physical Information Successfully Submitted');
				},function(){
					self.errorMessage="There was an error.Please try again";
					console.log(self.errorMessage);
					alert('There was an error. Please try again');
				});  
			}
			else if (formID == 'form3') {
				self.myData3.closedFlag=1;
				encounterNeurologicalExaminationData = angular.toJson(self.myData3);

				dbDataPostSvc.createNeurological(encounterNeurologicalExaminationData).then(function() {
					self.successMessage = "Data successfully added";
					self.functionCallerNeuro();
					console.log(self.successMessage);
					alert('Neurological Information Successfully Submitted');
				}, function() {
					self.errorMessage = "There was an error.Please try again";
					console.log(self.errorMessage);
					alert('There was an error. Please try again');
				});

			}

			else if(formID=='form4')
			{
				self.myData4.closedFlag=1;
				var clinicalData = angular.toJson(self.myData4);

				dbDataPostSvc.createClinical(clinicalData).then(function(){
					self.successMessage="Data successfully added";
					self.functionCaller();
					console.log(self.successMessage);
					alert('Clinical Information Successfully Submitted');
				}, function(){
					self.errorMessage="There was an error.Please try again";
					console.log(self.errorMessage);
					alert('There was an error. Please try again');
				});  

			}
			else {
				dbDataPostSvc.saveUser(patientData).then(function() {
					self.successMessage = "Data successfully updated";
				}, function() {
					self.errorMessage = "There was an error.Please try again";
				});
			}

			if(self.myData1.closedFlag==1 && self.myData2.closedFlag==1 && self.myData3.closedFlag==1 && self.myData4.closedFlag==1)
			{
				self.myData.closedFlag=1;
				self.myData.closeDate = new Date();
				var parentData = angular.toJson(self.myData);

				dbDataPostSvc.updateNewParentEncounter(parentData).then(function(){
					self.successMessage="Data successfully added";
					self.functionCaller();
					console.log(self.successMessage);
				}, function(){
					self.errorMessage="There was an error.Please try again";
					console.log(self.errorMessage);
				});  

			}


		}

		//function caller Physical
		self.functionCallerPhysical=function(){
			if(self.myData2.historyOfInjuryCommonFlag==1 && self.ptouch1!=null){
				console.log(self.ptouch1);
				$scope.callingblob(self.ptouch1,'historyOfInjuryCommon');
				console.log(self.ptouch1);
			}
			if(self.myData2.systemicExaminationCommonFlag==1 && self.ptouch2!=null){
				console.log(self.ptouch2);
				$scope.callingblob(self.ptouch2,'systemicExaminationCommon');
				console.log(self.ptouch2);
			}		
		}

		//function caller Incident
		self.functionCallerIncident=function(){

			if(self.myData1.fall_siteoffall_flag==1 && self.itouch1!=null){
				$scope.callingblob(self.itouch1,'siteoffall');
				console.log(self.itouch1);
			}
			if(self.myData1.otherInfo_flag==1 && self.itouch2!=null){
				$scope.callingblob(self.itouch2,'otherInfo');
				console.log(self.itouch2);
			}
			if(self.myData1.commonText_flag==1 && self.itouch3!=null){
					$scope.callingblob(self.itouch3,'commonText');
					console.log(self.itouch3);
			}
		}
		
		//function caller Neurological
		self.functionCallerNeuro=function(){
			if(self.myData3.anyOtherNeurologicalDeficitsSketchpad==1 && self.ntouch1!=null){
				$scope.callingblob(self.ntouch1,'any_other_neurological_deficits');
				console.log(self.ntouch1)
			}
		}

		//function caller Clinical
		self.functionCaller=function(){
			if(self.myData4.ctScanHeadSketchPad==1 && self.ctouch1!=null){
				$scope.callingblob(self.ctouch1,'ct_scan_head');
				console.log(self.ctouch1)
			}
			if(self.myData4.xrayDetailsSketchPad==1 && self.ctouch2!=null){
				$scope.callingblob(self.ctouch2,'xray_details');
				console.log(self.ctouch2)
			}
			if(self.myData4.managementPlanSketchPad==1 && self.ctouch3!=null){

				$scope.callingblob(self.ctouch3,'mngmt_plan');
				console.log(self.ctouch3)
			}
			if(self.myData4.courseInHospitalSketchPad==1 && self.ctouch4!=null){

				$scope.callingblob(self.ctouch4,'course_in_hospital');
				console.log(self.ctouch4)
			}
			if(self.myData4.conditionAtDischargeSketchPad==1 && self.ctouch5!=null){

				$scope.callingblob(self.ctouch5,'condition_at_discharge');
				console.log(self.ctouch5)
			}

		}

		$scope.callingblob=function(dataURL,btnId){

			console.log(btnId);
			//var dataURL = .toDataURL('image/jpeg', 0.5);
			var blob = $scope.dataURItoBlob(dataURL);
			blob.name="img1.jpg";
			var fd = new FormData(document.forms[0]);
			fd.append("canvasImage", blob);
			console.log(blob);
			//console.log(fd);
			$scope.uploadPic(blob,btnId);
			//  window.location.href="file:///D:/ANGULAR-SERVICES-INDEPTH/TraumaProject/test.html";
		}

		$scope.dataURItoBlob=function(dataURI) {
			// convert base64/URLEncoded data component to raw binary data held in a string
			var byteString;
			console.log(dataURI)
			if (dataURI.split(',')[0].indexOf('base64') >= 0)
				byteString = atob(dataURI.split(',')[1]);
			else
				byteString = unescape(dataURI.split(',')[1]);

			// separate out the mime component
			var mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0];

			// write the bytes of the string to a typed array
			var ia = new Uint8Array(byteString.length);
			for (var i = 0; i < byteString.length; i++) {
				ia[i] = byteString.charCodeAt(i);
			}

			return new Blob([ia], {type:mimeString});
		}

		$scope.uploadPic = function(file,btnId) {
			var epdid=self.myData1.epdid;
			var epeid=self.myData2.epeid;
			var eneid=self.myData3.eneid ;
			var ecid=self.myData4.ecid;

			console.log("u "+ecid);
			console.log("u "+epeid);
			console.log("u "+epdid);
			console.log("u "+eneid);
			console.log(btnId);

			if(btnId=='fall_siteoffall')  {
				file.upload = Upload.upload({
					url: 'http://'+serverURL+'/NIMHANSproject/Services/encounterAction/uploadIncidentScribble/fall_siteoffall/'+epdid,
					data: {username: $scope.username, file: file},

				});
			}

			else if(btnId=='otherInfo')  {
				file.upload = Upload.upload({
					url: 'http://'+serverURL+'/NIMHANSproject/Services/encounterAction/uploadIncidentScribble/otherInfo/'+epdid,
					data: {username: $scope.username, file: file},

				});
			}

			else if(btnId=='commonText')  {
				file.upload = Upload.upload({
					url: 'http://'+serverURL+'/NIMHANSproject/Services/encounterAction/uploadIncidentScribble/commonText/'+epdid,
					data: {username: $scope.username, file: file},

				});
			}

			else if(btnId=='historyOfInjuryCommon')  {
				file.upload = Upload.upload({
					url: 'http://'+serverURL+'/NIMHANSproject/Services/encounterAction/uploadPhysicalScribble/historyOfInjuryCommon/'+epeid,
					data: {username: $scope.username, file: file},

				});
			}
			else if(btnId=='systemicExaminationCommon')  {
				file.upload = Upload.upload({
					url: 'http://'+serverURL+'/NIMHANSproject/Services/encounterAction/uploadPhysicalScribble/systemicExaminationCommon/'+epeid,
					data: {username: $scope.username, file: file},

				});
			}
			
			else if(btnId=='any_other_neurological_deficits')  {
				file.upload = Upload.upload({
					url: 'http://'+serverURL+'/NIMHANSproject/Services/encounterAction/uploadScribble/any_other_neurological_deficits/'+eneid,
					data: {username: $scope.username, file: file},

				});
			}
			else if(btnId=='ct_scan_head')  {
				file.upload = Upload.upload({
					url: 'http://'+serverURL+'/NIMHANSproject/Services/encounterAction/uploadScribble/ct_scan_head/'+ecid,
					data: {username: $scope.username, file: file},

				});
			}
			else if(btnId=='xray_details')  {
				file.upload = Upload.upload({
					url: 'http://'+serverURL+'/NIMHANSproject/Services/encounterAction/uploadScribble/xray_details/'+ecid,
					data: {username: $scope.username, file: file},

				});
			}
			else if(btnId=='mngmt_plan')  {
				file.upload = Upload.upload({
					url: 'http://'+serverURL+'/NIMHANSproject/Services/encounterAction/uploadScribble/mngmt_plan/'+ecid,
					data: {username: $scope.username, file: file},

				});
			}
			else if(btnId=='course_in_hospital')  {
				file.upload = Upload.upload({
					url: 'http://'+serverURL+'/NIMHANSproject/Services/encounterAction/uploadScribble/course_in_hospital/'+ecid,
					data: {username: $scope.username, file: file},

				});
			}
			else if(btnId=='condition_at_discharge')  {
				file.upload = Upload.upload({
					url: 'http://'+serverURL+'/NIMHANSproject/Services/encounterAction/uploadScribble/condition_at_discharge/'+ecid,
					data: {username: $scope.username, file: file},

				});
			}
			else{
				file.upload = Upload.upload({
					url: 'http://'+serverURL+'/NIMHANSproject/Services/encounterAction/upload/'+pid,
					data: {username: $scope.username, file: file},

				});
			}
			// console.log(data);
			console.log(file);
			file.upload.then(function (response) {
				$timeout(function () {
					file.result = response.data;
				});
			}, function (response) {
				if (response.status > 0)
					$scope.errorMsg = response.status + ': ' + response.data;
			}, function (evt) {
				// Math.min is to fix IE which reports 200% sometimes
				file.progress = Math.min(100, parseInt(100.0 * evt.loaded / evt.total));
			});
		}
	}
})();

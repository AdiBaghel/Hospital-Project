var app = angular.module("viewPatient", ['GlobalURL']);
app.controller("viewPatientCtrl", viewPatientFun);

function viewPatientFun($scope,$http, serverURL) {
	

	function processParam()  {
		var parameters = location.search.substring(1).split("&");
		var temp = parameters[0].split("=");
		l = unescape(temp[1]);
		console.log("val of l = "+l);

	}
	
	processParam();
	
	var self=this;

	self.getPatientbyId = function(pid) {
		var p1 = pid;
		var promise1 = $http.get("http://"+serverURL+"/NIMHANSproject/Services/patientAction/getPatientbyId/"+p1);
		var promise2 = promise1.then(function(response) {
		console.log(response.data);
		return response.data;
		});
		return promise2;
	}
   	
	self.getPatientbyId(l).then(function(data) {
		self.pData=data;
		console.log(self.pData);
	});
	
	
	
}


var app = angular.module("AllPatientList", ['GlobalURL']);
app.controller("AllPatientListCtrl", AllPatientListCtrlFun);

function AllPatientListCtrlFun($scope,$http, serverURL) {
	var self = this;
	this.getPatientList = function() {
		console.log('yyy');
		$http.get('http://'+serverURL+'/NIMHANSproject/Services/patientAction/getpatients')
		.then(function(response) {
			$scope.names = response.data;
		});
	} 
	
	this.getPatientList();
	
	$scope.invokeFun = function(pid) {
		console.log('xxx'+pid);
		window.location.href = "ViewPatient.jsp?pid="+pid;
	} 	
}


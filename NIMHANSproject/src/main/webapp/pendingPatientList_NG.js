var app = angular.module("pendingPatientList",['GlobalURL']);
app.controller("pendingPatientListCtrl",pendingPatientListFun);

function pendingPatientListFun($scope,$http, serverURL) {
	
	this.getPendingPatientList = function() {
		$http.get('http://'+serverURL+'/NIMHANSproject/Services/patientAction/getPendingPatient')
		.then(function(response) {
		$scope.pendingPatientInfo = response.data;
								console.log("x is "+$scope.pendingPatientInfo[0].pid);

		});
	}
	
	this.getPendingPatientList();
	
	$scope.getTraumaForm = function(pid) {
		window.location.href = "incidentDetails.jsp?pid="+pid;
	}
	
}


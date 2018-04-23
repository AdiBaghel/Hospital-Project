<%
	HttpSession session2 = request.getSession();
	String uname = (String) session2.getAttribute("uname");
%>
<!-- Clinical Examination Form -->

<!DOCTYPE html>
<html ng-app="createTrauma">
<head>
<script src="angular.js"></script>
<script src="signature_pad.min.js"></script>
<script src="signature.js"></script>
<script src="upload.js"></script>
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<script src="bootstrap/js/jquery-3.1.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="ng-file-upload-bower-12.2.13/ng-file-upload-shim.min.js"></script>
<!-- for no html5 browsers support -->
<script src="ng-file-upload-bower-12.2.13/ng-file-upload.min.js"></script>
<script src="CreateTraumaApp.js"></script>
<script src="CreateTraumaController.js"></script>
<script src="CreateTraumaService.js"></script>
<script src="GlobalURL.js"></script>
<link rel="stylesheet" href="upload.css">
<!-- Custom Fonts -->
<link href="bootstrap/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<style>
.color {
	background-color: #e7e7e7;
	color: black;
}
</style>
</head>

<body>
	<div class="header">
		<div class="row">
			<div class="col-sm-1">
				<img src="images/nms.jpg" height="10%">
			</div>
			<div class="col-sm-9" id="Heading">
				<h1>National Institute Of Mental Health And Neurosciences</h1>
			</div>
		</div>
	</div>

	<div class="collapse navbar-collapse" id="navbar"
		ng-controller="dbDataPostCtrl as ctrl">
		<a class="col-xs-1 col-sm-1" href="doctorHome.jsp" id="Home">Home</a>
		<a href=""
			ng-href="incidentDetails.jsp?pid={{ctrl.pid}}&dname={{ctrl.dname}}"
			class="col-xs-2 col-sm-2">Incident Details</a> <a href=""
			ng-href="physicalExam.html?pid={{ctrl.pid}}&dname={{ctrl.dname}}"
			class="col-xs-2 col-sm-2">Physical Examination</a> <a href=""
			ng-href="NeurologicalExam.html?pid={{ctrl.pid}}&dname={{ctrl.dname}}"
			class="col-xs-3 col-sm-3">Neurological Examination</a> <a href=""
			ng-href="ClinicalExam.html?pid={{ctrl.pid}}&dname={{ctrl.dname}}"
			class="col-xs-2 col-sm-2 active">Clinical Examination</a>
		<ul class="nav navbar-right navbar-nav col-xs-2 col-sm-2"
			style="color: #f2f2f2; text-align: center;">
			<li class="dropdown"><a href="" ng-href="#" class="dropdown-toggle"
				data-toggle="dropdown" style="overflow: hidden;"><i
					class="fa fa-user"></i> Dr.<%=uname%><b class="caret"></b></a>
				<ul class="dropdown-menu" style="background-color: #000000">
					<li><a href="#"><i class="fa fa-fw fa-user"></i> Profile</a></li>
					<li><a href="#"><i class="fa fa-fw fa-gear"></i> Settings</a></li>
					<li class="divider"></li>
					<li><a href="LogoutServlet"><i
							class="fa fa-fw fa-power-off"></i> Log Out</a></li>
				</ul></li>
		</ul>
	</div>
	<div style="height: 2px"></div>
	<div ng-controller="dbDataPostCtrl as ctrl" style="padding-top: 2px;"
		class="collapse navbar-collapse" id="navbar1">
		<div class="col-xs-4" style="align: left">
			<strong>Patient Name:</strong> <label style="text-align: left">{{ctrl.pData1.pname}}</label>
			&nbsp;
		</div>
		<div class="col-xs-4" style="align: centre">
			<strong>Patient Age :</strong> <label style="text-align: centre">{{ctrl.pData1.age}}</label>
			&nbsp;
		</div>
		<div class="col-xs-4" style="align: right">
			<strong>Patient Gender:</strong> <label style="text-align: right">{{ctrl.pData1.gender}}</label>
			&nbsp;
		</div>
	</div>
	<br>
	<div class="col-sm-1 container-fluid"></div>
	<div id="clinicalForm" class=" col-sm-10 container-fluid"
		ng-controller="dbDataPostCtrl as ctrl">
		<form class="form-horizontal ">
		
		  <!--  **************Any change in GCS/Neurological examination******************-->			
		  <div class="form-group ">
				<label class="control-label col-sm-4 " style="text-align: left">Any change in GCS/Neurological examination :</label>
				<div class="col-sm-6">
					<span class="segmented"> 
					    <label><input type="radio" name="gcsExam" id="gcsExam1" value="1" ng-model="ctrl.myData4.anyChangeNeurological"><span class="label">Yes</span></label>
						<label><input type="radio" name="gcsExam" id="gcsExam2" value="0" ng-model="ctrl.myData4.anyChangeNeurological"><span class="label">No</span></label>
					</span>
				</div>
			</div>
			<br>

			<div class="form-group ">
				<label class="control-label col-sm-5 " style="text-align: left">CT
					scan head showed : </label>
				<div class="container-fluid" data-ng-init="cbtnId1='ct1';">
					<div>
						<button type="button" class="btn btn-info"
							data-ng-attr-id="cbtnId1" ng-click="ctrl.showTextarea(cbtnId1)">Textarea</button>
						<button type="button" class="btn btn-info"
							data-ng-attr-id="cbtnId1" ng-click="ctrl.showTouchpad(cbtnId1)">Touchpad</button>
					</div>
					<div class="col-sm-12">
						<textarea ng-show="!ctrl.myData4.ctScanHeadSketchPad;"
							class="form-control" rows="5" id="other"
							ng-model="ctrl.myData4.ctScanHead" placeholder="Description"
							style="width: 100%"></textarea>
					</div>
					<div>
						<div ng-show="ctrl.myData4.ctScanHeadSketchPad;"
							ng-controller="MyCtrl as ctrl2" class="modal-body col-sm-12"
							ng-style="{'max-width': boundingBox.width + 'px', 'max-height': boundingBox.height + 'px'}">
							<signature-pad accept="accept" style="border: 1px solid black;"
								clear="clear" height="220" width="600" dataurl="dataurl"></signature-pad>
							<span ng-hide="true">{{ctrl.ctouch1=dataurl}}</span>
							<div class="buttons" data-ng-init="sbtnId1='ct_scan_head';">
								<button type="button" class="btn btn-default color"
									ng-click="clear()">Clear</button>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="form-group ">
				<div>
					<label class="control-label col-sm-5" style="text-align: left">Other
						relevant investigations(X-rays/MRI):</label>
				</div>
				<div class="container-fluid" data-ng-init="cbtnId2='ct2';">
					<div>
						<button type="button" class="btn btn-info"
							data-ng-attr-id="cbtnId2" ng-click="ctrl.showTextarea(cbtnId2)">Textarea</button>
						<button type="button" class="btn btn-info"
							data-ng-attr-id="cbtnId2" ng-click="ctrl.showTouchpad(cbtnId2)">Touchpad</button>
					</div>
					<div class="col-sm-12">
						<textarea ng-show="!ctrl.myData4.xrayDetailsSketchPad;"
							class="form-control" rows="5" id="other"
							ng-model="ctrl.myData4.xrayDetails" placeholder="Description"
							style="width: 100%"></textarea>
					</div>
					<div>
						<div ng-show="ctrl.myData4.xrayDetailsSketchPad;"
							ng-controller="MyCtrl" class="modal-body col-sm-12"
							ng-style="{'max-width': boundingBox.width + 'px', 'max-height': boundingBox.height + 'px'}">
							<signature-pad accept="accept" style="border: 1px solid black;"
								clear="clear" height="220" width="600" dataurl="dataurl"></signature-pad>
							<span ng-hide="true">{{ctrl.ctouch2=dataurl}}</span>
							<div class="buttons" data-ng-init="sbtnId2='xray_details';">
								<button type="button" class="btn btn-default color"
									ng-click="clear()">Clear</button>
							</div>
						</div>
					</div>
				</div>
			</div>


			<div class="form-group ">
				<label class="control-label col-sm-5" style="text-align: left">Management
					Plan (in Hospital):</label>
				<div class="container-fluid" data-ng-init="cbtnId3='ct3';">
					<div>
						<button type="button" class="btn btn-info "
							data-ng-attr-id="cbtnId3" ng-click="ctrl.showTextarea(cbtnId3)">Textarea</button>
						<button type="button" class="btn btn-info"
							data-ng-attr-id="cbtnId3" ng-click="ctrl.showTouchpad(cbtnId3)">Touchpad</button>
					</div>
					<div class="col-sm-12">
						<textarea ng-show="!ctrl.myData4.managementPlanSketchPad;"
							class="form-control" rows="5" id="other"
							ng-model="ctrl.myData4.managementPlan" placeholder="Description"
							style="width: 100%"></textarea>
					</div>
					<div>
						<div ng-show="ctrl.myData4.managementPlanSketchPad;"
							ng-controller="MyCtrl" class="modal-body col-sm-12"
							ng-style="{'max-width': boundingBox.width + 'px', 'max-height': boundingBox.height + 'px'}">
							<signature-pad accept="accept" style="border: 1px solid black;"
								clear="clear" height="220" width="600" dataurl="dataurl"></signature-pad>
							<span ng-hide="true">{{ctrl.ctouch3=dataurl}}</span>
							<div class="buttons" data-ng-init="sbtnId3='mngmt_plan';">
								<button type="button" class="btn btn-default color"
									ng-click="clear()">Clear</button>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="form-group ">
				<label class="control-label col-sm-5 " style="text-align: left">Course
					in the Hospital(including repeat CT scan done, if any):</label>
				<div class="container-fluid" data-ng-init="cbtnId4='ct4';">
					<div>
						<button type="button" class="btn btn-info"
							data-ng-attr-id="cbtnId4" ng-click="ctrl.showTextarea(cbtnId4)">Textarea</button>
						<button type="button" class="btn btn-info"
							data-ng-attr-id="cbtnId4" ng-click="ctrl.showTouchpad(cbtnId4)">Touchpad</button>
					</div>
					<div class="col-sm-12">
						<textarea ng-show="!ctrl.myData4.courseInHospitalSketchPad;"
							class="form-control" rows="5" id="other"
							ng-model="ctrl.myData4.courseInHospital"
							placeholder="Description" style="width: 100%"></textarea>
					</div>
					<div>
						<div ng-show="ctrl.myData4.courseInHospitalSketchPad;"
							ng-controller="MyCtrl" class="modal-body col-sm-12"
							ng-style="{'max-width': boundingBox.width + 'px', 'max-height': boundingBox.height + 'px'}">
							<signature-pad accept="accept" style="border: 1px solid black;"
								clear="clear" height="220" width="600" dataurl="dataurl"></signature-pad>
							<span ng-hide="true">{{ctrl.ctouch4=dataurl}}</span>
							<div class="buttons" data-ng-init="sbtnId4='course_in_hospital';">
								<button type="button" class="btn btn-default color"
									ng-click="clear()">Clear</button>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="form-group ">
				<label class="control-label col-sm-5 " style="text-align: left">Condition
					at Discharge:</label>
				<div class="container-fluid " data-ng-init="cbtnId5='ct5';">
					<div>
						<button type="button" class="btn btn-info"
							data-ng-attr-id="cbtnId5" ng-click="ctrl.showTextarea(cbtnId5)">Textarea</button>
						<button type="button" class="btn btn-info"
							data-ng-attr-id="cbtnId5" ng-click="ctrl.showTouchpad(cbtnId5)">Touchpad</button>
					</div>
					<div class="col-sm-12">
						<textarea ng-show="!ctrl.myData4.conditionAtDischargeSketchPad;"
							class="form-control" rows="5" id="other"
							ng-model="ctrl.myData4.conditionAtDischarge"
							placeholder="Description" style="width: 100%"></textarea>
					</div>
					<div>
						<div ng-show="ctrl.myData4.conditionAtDischargeSketchPad;"
							ng-controller="MyCtrl" class="modal-body col-sm-12"
							ng-style="{'max-width': boundingBox.width + 'px', 'max-height': boundingBox.height + 'px'}">
							<signature-pad accept="accept" style="border: 1px solid black;"
								clear="clear" height="220" width="600" dataurl="dataurl"></signature-pad>
							<span ng-hide="true">{{ctrl.ctouch5=dataurl}}</span>
							<div class="buttons"
								data-ng-init="sbtnId5='condition_at_discharge';">
								<button type="button" class="btn btn-default color"
									ng-click="clear()">Clear</button>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="form-group " ng-controller="MyCtrl as ctrl2">
				<div class="col-sm-offset-4 col-sm-3"
					data-ng-init="clinicalbtnId='form4';">
					<button data-ng-attr-id="clinicalbtnId" type="button"
						class="btn btn-success "
						ng-click="ctrl.confirmSubmit(clinicalbtnId);">Submit</button>
				</div>

			</div>
		</form>
	</div>
</body>
</html>
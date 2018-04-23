
<%
	HttpSession session2 = request.getSession();
	String uname = (String) session2.getAttribute("uname");
%>
<html ng-app="createTrauma">
<head>
<script src="angular.js"></script>
<script src="signature_pad.min.js"></script>
<script src="signature.js"></script>
<script src="upload.js"></script>
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap-slider.css">
<script src="bootstrap/js/jquery-3.1.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="inc.js"></script>
<script src="neuro.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="ng-file-upload-bower-12.2.13/ng-file-upload-shim.min.js"></script>
<!-- for no html5 browsers support -->
<script src="ng-file-upload-bower-12.2.13/ng-file-upload.min.js"></script>
<script src="CreateTraumaApp.js"></script>
<script src="CreateTraumaController.js"></script>
<script src="CreateTraumaService.js"></script>
<script src="GlobalURL.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="neuro1.js"></script>
<script type="text/javascript" src="neuro2.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-slider.css" rel="stylesheet">
<script type="text/javascript" src="showAndHideForm.js"></script>
<link rel="stylesheet" href="upload.css">
<link href="bootstrap/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<style>
.color {
	background-color: #e7e7e7;
	color: black;
}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>


<body>
	<div ng-controller="dbDataPostCtrl as ctrl">

		<!-- **************************Incident Form Starts*********************************  -->

		<div id="f1">
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

			<div class="collapse navbar-collapse" id="navbar">
				<a class="col-xs-1 col-sm-1" href="doctorHome.jsp" id="Home">Home</a>
				<a href="incidentDetails.jsp?pid={{ctrl.pid}}&dname=<%=uname%>"
					class="col-xs-2 col-sm-2 active">Incident Details</a> <a href=""
					ng-href="physicalExam.html?pid={{ctrl.pid}}&dname=<%=uname%>"
					class="col-xs-2 col-sm-2">Physical Examination</a> <a
					href="#f3" onClick="javascript:showNeurological()"
					class="col-xs-3 col-sm-3">Neurological Examination</a> <a
					href="#f4" onClick="javascript:showClinical()"
					class="col-xs-2 col-sm-2">Clinical Examination</a>
				<ul class="nav navbar-right navbar-nav col-xs-2 col-sm-2"
					style="color: #f2f2f2; text-align: center;">
					<li class="dropdown"><a href="" ng-href="#"
						class="dropdown-toggle" data-toggle="dropdown"
						style="overflow: hidden;"><i class="fa fa-user"></i> Dr. <%=uname%>
							<b class="caret"></b></a>
						<ul class="dropdown-menu" style="background-color: #000000">
							<li><a href="#"><i class="fa fa-fw fa-user"></i> Profile</a></li>
							<li><a href="#"><i class="fa fa-fw fa-gear"></i>
									Settings</a></li>
							<li class="divider"></li>
							<li><a href="LogoutServlet"><i
									class="fa fa-fw fa-power-off"></i> Log Out</a></li>
						</ul>
				</ul>
			</div>
			<div style="height: 2px"></div>
			<div style="padding-top: 2px;" class="collapse navbar-collapse"
				id="navbar1">
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
			<div class="container-fluid">
				<div id="incidentForm" class=" col-sm-10 container-fluid ">
					<form class="form-horizontal">
						<div class="media-body">
							<div class="form-group">
								<!-- Date input -->
								<label class="control-label col-sm-3" for="date"
									style="text-align: left">Date and time of Examination:</label>
								<div class="col-sm-3">
									<span ng-hide="true">{{ctrl.myData1.dateOfExamination=ctrl.myData1.dateOfExamination
										| date : "longDate"}}</span> <input name="DOE" type="date"
										class="form-control" id="date_of_exam"
										ng-model="ctrl.myData1.dateOfExamination">
								</div>
								<div class="col-sm-3">
									<span ng-hide="true">{{ctrl.myData1.timeOfExamination=ctrl.myData1.timeOfExamination
										| date : "shortTime"}}</span> <input name="Time" type="time"
										class="form-control" id="time_of_exam"
										ng-model="ctrl.myData1.timeOfExamination">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-3" for="informant_name"
									style="text-align: left">Informant's Name:</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="informant_name"
										placeholder="Enter informant's name"
										ng-model="ctrl.myData1.informantName">
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-3" style="text-align: left">Informant's
									type:</label>
								<div class="col-sm-3">
									<span class="segmented"> <label><input
											type="radio" name="infor-type" id="type-e" value="Eyewitness"
											ng-model="ctrl.myData1.informantType" checked><span
											class="label">Eyewitness</span></label> <label><input
											type="radio" name="infor-type" id="type-w" value="Hearsay"
											ng-model="ctrl.myData1.informantType"><span
											class="label">Hearsay</span></label>
									</span>
								</div>
							</div>

							<div class="form-group">
								<!-- Date input -->
								<label class="control-label col-sm-3" for="date-of-injury"
									style="text-align: left">Date and time of injury:</label>
								<div class="col-sm-3">
									<span ng-hide="true">{{ctrl.myData1.dateOfInjury=ctrl.myData1.dateOfInjury
										| date : "longDate"}}</span> <input name="DOI" type="date"
										class="form-control" id="date_of_injury"
										ng-model="ctrl.myData1.dateOfInjury">
								</div>
								<div class="col-sm-3">
									<span ng-hide="true">{{ctrl.myData1.timeOfInjury=ctrl.myData1.timeOfInjury
										}}</span> <input name="TOI" type="text" placeholder="__:__:__"
										class="form-control" id="time_of_injury"
										ng-model="ctrl.myData1.timeOfInjury">
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-sm-3" for="place of injury"
									style="text-align: left">Place of Injury:</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="place-of-injury"
										placeholder="Enter place of injury"
										ng-model="ctrl.myData1.placeOfInjury">
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-sm-3 " for="history"
									style="text-align: left">History of injury in detail:</label>
								<div class="col-sm-7">
									<ul class="list-group">
										<li class="list-group-item"><center>
												<b>Incident:</b>
											</center>
											<div class="container-fluid">
												<div class="col-xm-10">
													<span class="segmented"> <label><input
															type="radio" id="input-rta" value="RTA"
															ng-model="ctrl.myData1.incidentScenario"
															onclick="javascript:show2();" name="incident"><span
															class="label">RTA</span></label> <label><input
															name="incident" id="input-fall" value="Fall" type="radio"
															ng-model="ctrl.myData1.incidentScenario"
															onclick="javascript:show1();"><span class="label">Fall</span></label>
														<label><input type="radio" name="incident"
															id="input-assault" value="Assault" type="radio"
															ng-model="ctrl.myData1.incidentScenario"
															onclick="javascript:show5();"><span class="label">Assault</span></label>
														<label><input name="incident" id="input-other"
															value="Other" type="radio"
															ng-model="ctrl.myData1.incidentScenario"
															onclick="javascript:show6();"><span class="label">Others</span></label>
													</span>
												</div>

											</div></li>
										<div id="div6" style="display: none">
											<li class="list-group-item">
												<div class="container-fluid">
													<div class="col-sm-8">
														<div class="container-fluid" data-ng-init="ibtnId2='it2';">
															<div>
																<button type="button" class="btn btn-info"
																	data-ng-attr-id="ibtnId2"
																	ng-click="ctrl.showTextarea(ibtnId2)">Textarea</button>
																<button type="button" class="btn btn-info"
																	data-ng-attr-id="ibtnId2"
																	ng-click="ctrl.showTouchpad(ibtnId2)">Touchpad</button>
															</div>
															<div class="col-sm-12">
																<textarea ng-show="!ctrl.myData1.otherInfo_flag;"
																	class="form-control" rows="5" id="other"
																	ng-model="ctrl.myData1.otherInfo"
																	placeholder="Description" style="width: 100%"></textarea>
															</div>
															<div>
																<div ng-show="ctrl.myData1.otherInfo_flag;"
																	ng-controller="MyCtrl as ctrl2"
																	class="modal-body col-sm-12"
																	ng-style="{'max-width': boundingBox.width + 'px', 'max-height': boundingBox.height + 'px'}">
																	<signature-pad accept="accept"
																		style="border: 1px solid black;" clear="clear"
																		height="220" width="600" dataurl="dataurl"></signature-pad>
																	<span ng-hide="true">{{ctrl.itouch2=dataurl}}</span>
																	<div class="buttons"
																		data-ng-init="sbtnId2='otherInfo';">
																		<button type="button" class="btn btn-default color"
																			ng-click="clear()">Clear</button>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</li>
										</div>


										<div id="div1" style="display: none">
											<li class="list-group-item">Vehicle Type:
												<div class="container-fluid">
													<div class="col-sm-8">
														<div class="segmented">
															<label><input type="radio"
																onclick="javascript:show3();" name="vt" value="true"
																ng-model="ctrl.myData1.vehicle_type"><span
																class="label">Two Wheeler</span></label> <label><input
																type="radio" onclick="javascript:show4();" value="false"
																name="vt" ng-model="ctrl.myData1.vehicle_type"><span
																class="label">Four Wheeler</span></label>
														</div>
													</div>
												</div>
											</li>
										</div>
										<div id="div5" style="display: none">
											<li class="list-group-item">Person:
												<div class="container-fluid">
													<div class="col-sm-8">
														<div class="segmented">
															<label><input type="radio" name="ka" value="true"
																ng-model="ctrl.myData1.assault_person_type"><span
																class="label">known</span></label> <label><input
																type="radio" name="ka" value="false"
																ng-model="ctrl.myData1.assault_person_type"><span
																class="label">Unknown</span></label>
														</div>
													</div>
												</div>
											</li>
										</div>
										<div id="div4" style="display: none">
											<li class="list-group-item">Alcohol Intake:
												<div class="container-fluid">
													<div class="col-sm-8">
														<div class="segmented">
															<label><input type="radio" name="fallalc"
																value="true" ng-model="ctrl.myData1.fall_alcohol"><span
																class="label">Yes</span></label> <label><input
																type="radio" name="fallalc" value="false"
																ng-model="ctrl.myData1.fall_alcohol"><span
																class="label">No</span></label>
														</div>
													</div>
												</div>
											</li>
										</div>
										<div id="div7" style="display: none">
											<li class="list-group-item">Site of Fall:
												<div class="container-fluid">
													<div class="col-sm-8">
														<div class="container-fluid" data-ng-init="ibtnId1='it1';">
															<div>
																<button type="button" class="btn btn-info"
																	data-ng-attr-id="ibtnId1"
																	ng-click="ctrl.showTextarea(ibtnId1)">Textarea</button>
																<button type="button" class="btn btn-info"
																	data-ng-attr-id="ibtnId1"
																	ng-click="ctrl.showTouchpad(ibtnId1)">Touchpad</button>
															</div>
															<div class="col-sm-12">
																<textarea ng-show="!ctrl.myData1.fall_siteoffall_flag;"
																	class="form-control" rows="5" id="sof"
																	ng-model="ctrl.myData1.fall_siteoffall"
																	placeholder="Description" style="width: 100%"></textarea>
															</div>
															<div>
																<div ng-show="ctrl.myData1.fall_siteoffall_flag;"
																	ng-controller="MyCtrl as ctrl2"
																	class="modal-body col-sm-12"
																	ng-style="{'max-width': boundingBox.width + 'px', 'max-height': boundingBox.height + 'px'}">
																	<signature-pad accept="accept"
																		style="border: 1px solid black;" clear="clear"
																		height="220" width="600" dataurl="dataurl"></signature-pad>
																	<span ng-hide="true">{{ctrl.itouch1=dataurl}}</span>
																	<div class="buttons"
																		data-ng-init="sbtnId1='fall_siteoffall';">
																		<button type="button" class="btn btn-default color"
																			ng-click="clear()">Clear</button>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</li>
										</div>
										<div id="div2" style="display: none">
											<li class="list-group-item">Alcohol Intake:
												<div class="container-fluid">
													<div class="col-sm-8">
														<div class="segmented">
															<label><input type="radio" name="fouralc"
																value="true" ng-model="ctrl.myData1.rta_four_alcohol"><span
																class="label">Yes</span></label> <label><input
																type="radio" name="fouralc" value="value"
																ng-model="ctrl.myData1.rta_four_alcohol"><span
																class="label">No</span></label>
														</div>
													</div>
												</div>
											</li>
											<li class="list-group-item">Victim Type:
												<div class="container-fluid">
													<div class="col-sm-10">
														<div class="segmented">
															<label><input type="radio" name="vt1"
																value="Driver"
																ng-model="ctrl.myData1.rta_four_victimtype"><span
																class="label">Driver</span></label> <label><input
																type="radio" name="vt1" value="Passenger"
																ng-model="ctrl.myData1.rta_four_victimtype"><span
																class="label">Passenger</span></label> <label><input
																type="radio" name="vt1" value="Pedestrian"
																ng-model="ctrl.myData1.rta_four_victimtype"><span
																class="label">Pedestrian</span></label>
														</div>
													</div>
												</div>
											</li>
										</div>
										<div id="div3" style="display: none">
											<li class="list-group-item">Helmet:
												<div class="container-fluid">
													<div class="col-sm-8">
														<div class="segmented">
															<label><input type="radio" name="ht" value="true"
																ng-model="ctrl.myData1.rta_two_helmet"><span
																class="label">Yes</span></label> <label><input
																type="radio" name="ht" value="false"
																ng-model="ctrl.myData1.rta_two_helmet"><span
																class="label">No</span></label>
														</div>
													</div>
												</div>
											</li>
											<li class="list-group-item">Alcohol Intake:
												<div class="container-fluid">
													<div class="col-sm-8">
														<div class="segmented">
															<label><input type="radio" name="twoalc"
																value="true" ng-model="ctrl.myData1.rta_two_alcohol"><span
																class="label">Yes</span></label> <label><input
																type="radio" name="twoalc" value="false"
																ng-model="ctrl.myData1.rta_two_alcohol"><span
																class="label">No</span></label>
														</div>
													</div>
												</div>
											</li>
										</div>
									</ul>
								</div>
								<br>
								<div class="col-xs-12">
									<div class="col-xs-2">
										<label class="control-label" for="additional details"
											style="text-align: left">Additional Details:</label>
									</div>
									<div class="container-fluid col-xs-9"
										style="padding-left: 100px;" data-ng-init="ibtnId3='it3';">
										<div>
											<button type="button" class="btn btn-info"
												data-ng-attr-id="ibtnId3"
												ng-click="ctrl.showTextarea(ibtnId3)">Textarea</button>
											<button type="button" class="btn btn-info"
												data-ng-attr-id="ibtnId3"
												ng-click="ctrl.showTouchpad(ibtnId3)">Touchpad</button>
										</div>
										<div class="col-sm-12">
											<textarea ng-show="!ctrl.myData1.commonText_flag;"
												class="form-control" rows="5" id="other"
												ng-model="ctrl.myData1.commonText" placeholder="Description"
												style="width: 100%"></textarea>
										</div>
										<div>
											<div ng-show="ctrl.myData1.commonText_flag;"
												ng-controller="MyCtrl as ctrl2" class="modal-body col-sm-12"
												ng-style="{'max-width': boundingBox.width + 'px', 'max-height': boundingBox.height + 'px'}">
												<signature-pad accept="accept"
													style="border: 1px solid black;" clear="clear" height="220"
													width="600" dataurl="dataurl"></signature-pad>
												<span ng-hide="true">{{ctrl.itouch3=dataurl}}</span>
												<div class="buttons" data-ng-init="sbtnId3='commonText';">
													<button type="button" class="btn btn-default color"
														ng-click="clear()">Clear</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="form-group">
								<div class="col-sm-offset-4 col-sm-3"
									data-ng-init="patientbtnId='form1';">
									<button data-ng-attr-id="patientbtnId" type="button"
										class="btn btn-success "
										ng-click="ctrl.confirmSubmit(patientbtnId);">Submit</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- **********************************************Incident Form Complete****************************************** -->

		<!-- **********************************************Neurological Form Start****************************************** -->

		<div id="f3" style="display: none;">
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

			<div class="collapse navbar-collapse" id="navbar">
				<a class="col-xs-1 col-sm-1" href="doctorHome.jsp" id="Home">Home</a>
				<a href=""
					ng-href="incidentDetails.jsp?pid={{ctrl.pid}}&dname={{ctrl.dname}}"
					class="col-xs-2 col-sm-2">Incident Details</a> <a href=""
					ng-href="physicalExam.html?pid={{ctrl.pid}}&dname={{ctrl.dname}}"
					class="col-xs-2 col-sm-2">Physical Examination</a> <a href=""
					ng-href="NeurologicalExam.html?pid={{ctrl.pid}}&dname={{ctrl.dname}}"
					class="col-xs-3 col-sm-3 active">Neurological Examination</a> <a
					href=""
					ng-href="ClinicalExam.html?pid={{ctrl.pid}}&dname={{ctrl.dname}}"
					class="col-xs-2 col-sm-2 ">Clinical Examination</a>
				<ul class="nav navbar-right navbar-nav col-xs-2 col-sm-2"
					style="color: #f2f2f2; text-align: center;">
					<li class="dropdown"><a href="" ng-href="#"
						class="dropdown-toggle" data-toggle="dropdown"
						style="overflow: hidden;"><i class="fa fa-user"></i>
							Dr.{{ctrl.dname}}<b class="caret"></b></a>
						<ul class="dropdown-menu" style="background-color: #000000">
							<li><a href="#"><i class="fa fa-fw fa-user"></i> Profile</a></li>
							<li><a href="#"><i class="fa fa-fw fa-gear"></i>
									Settings</a></li>
							<li class="divider"></li>
							<li><a href="LogoutServlet"><i
									class="fa fa-fw fa-power-off"></i> Log Out</a></li>
						</ul></li>
				</ul>
			</div>

			<div style="height: 2px"></div>
			<div style="padding-top: 2px;" class="collapse navbar-collapse"
				id="navbar1">
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
			<div id="neurologicalForm" class="col-sm-10 container-fluid">
				<form class="form-horizontal">
					<div class="borders col-xs-9">
						<div class="form-group">
							<label class="control-label col-sm-10" style="text-align: left">Glasgow
								Coma Scale</label> <br> <br>
						</div>
						<div class="form-group" style="padding-left: 1em">
							<ul class="nav nav-tabs">
								<li class="active"><a data-toggle="tab" href="#menu1"
									onclick="loadFinalValue()">Before Resuscitation</a></li>
								<li><a data-toggle="tab" href="#menu2"
									onclick="loadIntitialValue()">After Resuscitation</a></li>
							</ul>

							<div class="tab-content">
								<div id="menu1" class="tab-pane fade in active">
									<div class="col-xs-12">
										<div class="col-xs-6"></div>
										<label class="col-xs-1" style="color: #6a6a6a;">Initial</label>
										<label class="col-xs-1" style="color: #6a6a6a;">Final</label>
									</div>
									<div class="col-xs-12">
										<div class="col-xs-6">
											<label style="padding-top: 20px;" class="segmented1"><input
												type="radio"><span class="label">E</span></label> <span
												style="padding-left: 20px;" class="segmented2"> <label><input
													type="radio" name="es" value="1"
													onclick="check1(this.value)"><span class="label">1</span></label>
												<label><input type="radio" name="es" value="2"
													onclick="check1(this.value)"><span class="label">2</span></label>
												<label><input type="radio" name="es" value="3"
													onclick="check1(this.value)"><span class="label">3</span></label>
												<label><input type="radio" name="es" value="4"
													onclick="check1(this.value)"><span class="label">4</span></label>
											</span>
										</div>
										<div class="col-xs-1" style="padding-top: 25px;">
											<input type="text" size="1" id="erbi"
												ng-model="ctrl.myData3.eyeOpeneingScoreInitial" readonly>
										</div>
										<div class="col-xs-1" style="padding-top: 25px;">
											<input type="text" size="1" id="erbf"
												ng-model="ctrl.myData3.eyeOpeningScoreAfterRes" readonly>
										</div>
									</div>
									<div class="col-xs-12">
										<div class="col-xs-6">
											<label style="padding-top: 20px;" class="segmented1"><input
												type="radio"><span class="label">M</span></label> <span
												style="padding-left: 20px;" class="segmented2"> <label><input
													type="radio" name="ms" value="1"
													onclick="check2(this.value)"><span class="label">1</span></label>
												<label><input type="radio" name="ms" value="2"
													onclick="check2(this.value)"><span class="label">2</span></label>
												<label><input type="radio" name="ms" value="3"
													onclick="check2(this.value)"><span class="label">3</span></label>
												<label><input type="radio" name="ms" value="4"
													onclick="check2(this.value)"><span class="label">4</span></label>
												<label><input type="radio" name="ms" value="5"
													onclick="check2(this.value)"><span class="label">5</span></label>
												<label><input type="radio" name="ms" value="6"
													onclick="check2(this.value)"><span class="label">6</span></label>
											</span>
										</div>
										<div class="col-xs-1" style="padding-top: 25px;">
											<input type="text" size="1" id="mrbi"
												ng-model="ctrl.myData3.motorResponseScoreInitial" readonly>
										</div>
										<div class="col-xs-1" style="padding-top: 25px;">
											<input type="text" size="1" id="mrbf"
												ng-model="ctrl.myData3.motorResponseScoreAfterRes" readonly>
										</div>
									</div>
									<div class="col-xs-12">
										<div class="col-xs-6">
											<label style="padding-top: 20px;" class="segmented1"><input
												type="radio"><span class="label">V</span></label> <span
												style="padding-left: 20px;" class="segmented2"> <label><input
													type="radio" name="vs" value="1"
													onclick="check3(this.value)"><span class="label">1</span></label>
												<label><input type="radio" name="vs" value="2"
													onclick="check3(this.value)"><span class="label">2</span></label>
												<label><input type="radio" name="vs" value="3"
													onclick="check3(this.value)"><span class="label">3</span></label>
												<label><input type="radio" name="vs" value="4"
													onclick="check3(this.value)"><span class="label">4</span></label>
												<label><input type="radio" name="vs" value="5"
													onclick="check3(this.value)"><span class="label">5</span></label>
											</span>
										</div>
										<div class="col-xs-1" style="padding-top: 25px;">
											<input type="text" size="1" id="vrbi"
												ng-model="ctrl.myData3.verbalResponseScoreInitial" readonly>
										</div>
										<div class="col-xs-1" style="padding-top: 25px;">
											<input type="text" size="1" id="vrbf"
												ng-model="ctrl.myData3.verbalResponseScoreAfterRes" readonly>
										</div>
									</div>
								</div>
								<div id="menu2" class="tab-pane fade">
									<div class="col-xs-12">
										<div class="col-xs-6"></div>
										<label class="col-xs-1" style="color: #6a6a6a;">Initial</label>
										<label class="col-xs-1" style="color: #6a6a6a;">Final</label>
									</div>
									<div class="col-xs-12">
										<div class="col-xs-6">
											<label style="padding-top: 20px;" class="segmented1"><input
												type="radio"><span class="label">E</span></label> <span
												style="padding-left: 20px;" class="segmented2"> <label><input
													type="radio" name="esf" value="1"
													onclick="check4(this.value)"><span class="label">1</span></label>
												<label><input type="radio" name="esf" value="2"
													onclick="check4(this.value)"><span class="label">2</span></label>
												<label><input type="radio" name="esf" value="3"
													onclick="check4(this.value)"><span class="label">3</span></label>
												<label><input type="radio" name="esf" value="4"
													onclick="check4(this.value)"><span class="label">4</span></label>
											</span>
										</div>
										<div class="col-xs-1" style="padding-top: 25px;">
											<input type="text" size="1" id="erai"
												ng-model="ctrl.myData3.eyeOpeneingScoreInitial" readonly>
										</div>
										<div class="col-xs-1" style="padding-top: 25px;">
											<input type="text" size="1" id="eraf"
												ng-model="ctrl.myData3.eyeOpeningScoreAfterRes" readonly>
										</div>
									</div>
									<div class="col-xs-12">
										<div class="col-xs-6">
											<label style="padding-top: 20px;" class="segmented1"><input
												type="radio"><span class="label">M</span></label> <span
												style="padding-left: 20px;" class="segmented2"> <label><input
													type="radio" name="msf" value="1"
													onclick="check5(this.value)"><span class="label">1</span></label>
												<label><input type="radio" name="msf" value="2"
													onclick="check5(this.value)"><span class="label">2</span></label>
												<label><input type="radio" name="msf" value="3"
													onclick="check5(this.value)"><span class="label">3</span></label>
												<label><input type="radio" name="msf" value="4"
													onclick="check5(this.value)"><span class="label">4</span></label>
												<label><input type="radio" name="msf" value="5"
													onclick="check5(this.value)"><span class="label">5</span></label>
												<label><input type="radio" name="msf" value="6"
													onclick="check5(this.value)"><span class="label">6</span></label>
											</span>
										</div>
										<div class="col-xs-1" style="padding-top: 25px;">
											<input type="text" size="1" id="mrai"
												ng-model="ctrl.myData3.motorResponseScoreInitial" readonly>
										</div>
										<div class="col-xs-1" style="padding-top: 25px;">
											<input type="text" size="1" id="mraf"
												ng-model="ctrl.myData3.motorResponseScoreAfterRes" readonly>
										</div>
									</div>
									<div class="col-xs-12">
										<div class="col-xs-6">
											<label style="padding-top: 20px;" class="segmented1"><input
												type="radio"><span class="label">V</span></label> <span
												style="padding-left: 20px;" class="segmented2"> <label><input
													type="radio" name="vsf" value="1"
													onclick="check6(this.value)"><span class="label">1</span></label>
												<label><input type="radio" name="vsf" value="2"
													onclick="check6(this.value)"><span class="label">2</span></label>
												<label><input type="radio" name="vsf" value="3"
													onclick="check6(this.value)"><span class="label">3</span></label>
												<label><input type="radio" name="vsf" value="4"
													onclick="check6(this.value)"><span class="label">4</span></label>
												<label><input type="radio" name="vsf" value="5"
													onclick="check6(this.value)"><span class="label">5</span></label>
											</span>
										</div>
										<div class="col-xs-1" style="padding-top: 25px;">
											<input type="text" size="1" id="vrai"
												ng-model="ctrl.myData3.verbalResponseScoreInitial" readonly>
										</div>
										<div class="col-xs-1" style="padding-top: 25px;">
											<input type="text" size="1" id="vraf"
												ng-model="ctrl.myData3.verbalResponseScoreAfterRes" readonly>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>

					<div class="borders col-xs-9">
						<div class="form-group">
							<label class="control-label col-sm-10" style="text-align: left">
								Horizontal oculocephalic reflex </label> <br>
							<br>
							<div class="col-xs-12">
								<div class="col-sm-1">
									<label class="control-label col-sm-2" style="text-align: left;">Right:</label>
								</div>
								<div class="col-xs-11">
									<span class="segmented"> <label> <input
											type="radio" name="radioHRight"
											ng-model="ctrl.myData3.horizontalOculocephalicReflexRight"
											ng-true-value="present" value="present"><span
											class="label">Present</span>
									</label> <label> <input type="radio" name="radioHRight"
											ng-model="ctrl.myData3.horizontalOculocephalicReflexRight"
											ng-true-value="absent" value="absent"><span
											class="label">Absent</span>
									</label> <label> <input type="radio" name="radioHRight"
											ng-model="ctrl.myData3.horizontalOculocephalicReflexRight"
											ng-true-value="not_tested" value="not_tested"><span
											class="label">Not Tested</span>
									</label>
									</span>
								</div>
							</div>
							<div class="col-xs-12">
								<div class="col-sm-1">
									<label class="control-label col-sm-2" style="text-align: left;">Left:</label>
								</div>
								<div class="col-xs-11">
									<span class="segmented"> <label> <input
											type="radio" name="radioHLeft"
											ng-model="ctrl.myData3.horizontalOculocephalicReflexLeft"
											ng-true-value="present" value="present"><span
											class="label">Present</span>
									</label> <label> <input type="radio" name="radioHLeft"
											ng-model="ctrl.myData3.horizontalOculocephalicReflexLeft"
											ng-true-value="absent" value="absent"><span
											class="label">Absent</span>
									</label> <label> <input type="radio" name="radioHLeft"
											ng-model="ctrl.myData3.horizontalOculocephalicReflexLeft"
											ng-true-value="not_tested" value="not_tested"><span
											class="label">Not Tested</span>
									</label>
									</span>
								</div>
							</div>
						</div>
					</div>
					<div class="borders col-xs-9">
						<div class="form-group">
							<label class="control-label col-sm-10" style="text-align: left">
								Pupilliary Light reflex </label> <br> <br>
							<div class="col-sm-12">
								<div class="col-xs-1">
									<label class="control-label col-sum-2"
										style="text-align: left; padding-right: 1em;">Right:</label>
								</div>
								<div class="col-xs-11">
									<span class="segmented"> <label><input
											type="radio" name="radioPRight"
											ng-model="ctrl.myData3.pupiliaryLightReflexRight"
											ng-true-value="normal" value="normal"><span
											class="label">Normal</span></label> <label><input
											type="radio" name="radioPRight"
											ng-model="ctrl.myData3.pupiliaryLightReflexRight"
											ng-true-value="sluggish" value="sluggish"><span
											class="label">Sluggish</span></label> <label><input
											type="radio" name="radioPRight"
											ng-model="ctrl.myData3.pupiliaryLightReflexRight"
											ng-true-value="absent" value="absent"><span
											class="label">Absent</span></label> <label><input
											type="radio" name="radioPRight"
											ng-model="ctrl.myData3.pupiliaryLightReflexRight"
											ng-true-value="cannot_access" value="cannot_access" checked><span
											class="label">Not Recorded</span></label>
									</span>
								</div>
							</div>

							<div class="col-sm-12">
								<div class="col-xs-1">
									<label class="control-label"
										style="text-align: left; padding-right: 1em;"> Left:</label>
								</div>
								<div class="col-xs-11">
									<span class="segmented"> <label><input
											type="radio" name="radioPLeft"
											ng-model="ctrl.myData3.pupiliaryLightReflexLeft"
											ng-true-value="normal" value="normal"><span
											class="label">Normal</span></label> <label><input
											type="radio" name="radioPLeft"
											ng-model="ctrl.myData3.pupiliaryLightReflexLeft"
											ng-true-value="sluggish" value="sluggish"><span
											class="label">Sluggish</span></label> <label><input
											type="radio" name="radioPLeft"
											ng-model="ctrl.myData3.pupiliaryLightReflexLeft"
											ng-true-value="absent" value="absent"><span
											class="label">Absent</span></label> <label><input
											type="radio" name="radioPLeft"
											ng-model="ctrl.myData3.pupiliaryLightReflexLeft"
											ng-true-value="not recorded" value="not recorded" checked><span
											class="label">Not Recorded</span></label>
									</span>
								</div>
							</div>
						</div>
						<div class="form-group col-xs-12">
							<div class="col-xs-3">
								<label class="control-label" style="text-align: left">Size
									of Pupil(mm):</label> <br> <br>
							</div>
							<div class="col-xs-9" style="padding-top: 15px;">
								<div class="range" id="sizeOfPupil">
									<input type="range" min="1" max="5" steps="1" value="1"
										ng-model="ctrl.myData3.pupiliaryLightSizeOfPupil">
								</div>
								<ul class="range-labels">
									<li class="active selected">1</li>
									<li>2</li>
									<li>3</li>
									<li>4</li>
									<li>5</li>
								</ul>
								<script src="rangeslider.js"></script>
							</div>
						</div>
					</div>


					<div class="borders col-xs-9">
						<div class="form-group">
							<label class="control-label col-sm-10" style="text-align: left">Motor
								System Examination</label> <br> <br>
						</div>
						<div class="form-group" style="padding-left: 1em">
							<ul class="nav nav-tabs">
								<li class="active"><a data-toggle="tab" href="#mLeft"
									onclick="loadLRFinalValue()">Left</a></li>
								<li><a data-toggle="tab" href="#mRight"
									onClick="loadLRInitialValue()">Right</a></li>
							</ul>

							<div class="tab-content">
								<div id="mLeft" class="tab-pane fade in active">
									<div class="col-xs-12">
										<div class="col-xs-12">
											<label class="control-label col-xs-1"><h4>Tone</h4></label> <label
												class="control-label col-xs-2"
												style="padding-left: 589px; padding-top: 15px;">Right</label>

										</div>
										<div class="col-sm-12">
											<div class="col-xs-10">
												<div class="col-xs-2">
													<label class="control-label"> Upper: </label>
												</div>
												<div class="col-xs-10">
													<span class="segmented3" id="id1"> <label><input
															type="radio" name="mlu" value="Normal"
															onClick="ToneUpperInitial(this.value)"
															ng-model="ctrl.myData3.motorSystemExaminationUpperLeftTone"><span
															class="label">Normal</span></label> <label><input
															type="radio" name="mlu" value="Increased"
															onClick="ToneUpperInitial(this.value)"
															ng-model="ctrl.myData3.motorSystemExaminationUpperLeftTone"><span
															class="label">Increased</span></label> <label><input
															type="radio" name="mlu" value="Decreased"
															onClick="ToneUpperInitial(this.value)"
															ng-model="ctrl.myData3.motorSystemExaminationUpperLeftTone"><span
															class="label">Decreased</span></label> <label><input
															type="radio" name="mlu" value="Absent"
															onClick="ToneUpperInitial(this.value)"
															ng-model="ctrl.myData3.motorSystemExaminationUpperLeftTone"><span
															class="label">Absent</span></label> <label><input
															type="radio" name="mlu" value="Not Recorded"
															ng-model="ctrl.myData3.motorSystemExaminationUpperLeftTone"
															checked><span class="label">Not Recorded</span></label>
													</span>
												</div>
											</div>
											<div class="col-xs-2">
												<input type="text" id="truval" size="10"
													value="Not Recorded"
													style="padding-top: 5px; border: 0; background-color: #80F876; font-weight: bold;"
													readonly>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="col-sm-10">
												<div class="col-xs-2">
													<label class="control-label"> Lower: </label>
												</div>

												<div class="col-xs-10">
													<span class="segmented3" id="id2"> <label><input
															type="radio" name="mll" value="Normal"
															onClick="ToneLowerInitial(this.value)"
															ng-model="ctrl.myData3.motorSystemExaminationLowerLeftTone"><span
															class="label">Normal</span></label> <label><input
															type="radio" name="mll" value="Increased"
															onClick="ToneLowerInitial(this.value)"
															ng-model="ctrl.myData3.motorSystemExaminationLowerLeftTone"><span
															class="label">Increased</span></label> <label><input
															type="radio" name="mll" value="Decreased"
															onClick="ToneLowerInitial(this.value)"
															ng-model="ctrl.myData3.motorSystemExaminationLowerLeftTone"><span
															class="label">Decreased</span></label> <label><input
															type="radio" name="mll" value="Absent"
															onClick="ToneLowerInitial(this.value)"
															ng-model="ctrl.myData3.motorSystemExaminationLowerLeftTone"><span
															class="label">Absent</span></label> <label><input
															type="radio" name="mll" value="Not Recorded"
															ng-model="ctrl.myData3.motorSystemExaminationLowerLeftTone"
															checked><span class="label">Not Recorded</span></label>
													</span>
												</div>
											</div>
											<div class="col-xs-2">
												<input type="text" id="trlval" size="10"
													value="Not Recorded"
													style="padding-top: 5px; border: 0; background-color: #80F876; font-weight: bold;"
													readonly>
											</div>
										</div>
										<div class="col-xs-12">
											<label class="control-label col-xs-1"><h4>Power</h4></label>
											<label class="control-label col-xs-2"
												style="padding-left: 265px; padding-top: 15px;">Right</label>

										</div>
										<div class="col-sm-12">
											<div class="col-xs-1">
												<label class="control-label"> Upper: </label>
											</div>
											<div class="col-xs-4" style="padding-top: 5px;">
												<span class="segmented2" id="id3"> <label><input
														type="radio" name="mplu" value="1"
														onClick="PowerUpperInitial(this.value)"
														ng-model="ctrl.myData3.motorSystemExaminationUpperLeftPower"><span
														class="label">1</span></label> <label><input type="radio"
														name="mplu" value="2"
														onClick="PowerUpperInitial(this.value)"
														ng-model="ctrl.myData3.motorSystemExaminationUpperLeftPower"><span
														class="label">2</span></label> <label><input type="radio"
														name="mplu" value="3"
														onClick="PowerUpperInitial(this.value)"
														ng-model="ctrl.myData3.motorSystemExaminationUpperLeftPower"><span
														class="label">3</span></label> <label><input type="radio"
														name="mplu" value="4"
														onClick="PowerUpperInitial(this.value)"
														ng-model="ctrl.myData3.motorSystemExaminationUpperLeftPower"><span
														class="label">4</span></label> <label><input type="radio"
														name="mplu" value="5"
														onClick="PowerUpperInitial(this.value)"
														ng-model="ctrl.myData3.motorSystemExaminationUpperLeftPower"><span
														class="label">5</span></label>
												</span>
											</div>
											<div class="col-xs-2">
												<input type="text" id="pruval" size="2"
													style="padding-top: 10px; border: 0; background-color: #80F876; font-weight: bold;"
													readonly>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="col-xs-1">
												<label class="control-label"> Lower: </label>
											</div>
											<div class="col-xs-4" style="padding-top: 5px;">
												<span class="segmented2" id="id4"> <label><input
														type="radio" name="mpll" value="1"
														onClick="PowerLowerInitial(this.value)"
														ng-model="ctrl.myData3.motorSystemExaminationLowerLeftPower"><span
														class="label">1</span></label> <label><input type="radio"
														name="mpll" value="2"
														onClick="PowerLowerInitial(this.value)"
														ng-model="ctrl.myData3.motorSystemExaminationLowerLeftPower"><span
														class="label">2</span></label> <label><input type="radio"
														name="mpll" value="3"
														onClick="PowerLowerInitial(this.value)"
														ng-model="ctrl.myData3.motorSystemExaminationLowerLeftPower"><span
														class="label">3</span></label> <label><input type="radio"
														name="mpll" value="4"
														onClick="PowerLowerInitial(this.value)"
														ng-model="ctrl.myData3.motorSystemExaminationLowerLeftPower"><span
														class="label">4</span></label> <label><input type="radio"
														name="mpll" value="5"
														onClick="PowerLowerInitial(this.value)"
														ng-model="ctrl.myData3.motorSystemExaminationLowerLeftPower"><span
														class="label">5</span></label>
												</span>
											</div>
											<div class="col-xs-2">
												<input type="text" id="prlval" size="2"
													style="padding-top: 10px; border: 0; background-color: #80F876; font-weight: bold;"
													readonly>
											</div>
										</div>
									</div>
								</div>
								<div id="mRight" class="tab-pane fade">
									<div class="col-xs-12">
										<div class="col-xs-12">
											<label class="control-label col-xs-1"><h4>Tone</h4></label> <label
												class="control-label col-xs-2"
												style="padding-left: 589px; padding-top: 15px;">Left</label>

										</div>
										<div class="col-sm-12">
											<div class="col-xs-10">
												<div class="col-xs-2">
													<label class="control-label"> Upper: </label>
												</div>
												<div class="col-xs-10">
													<span class="segmented3" id="id5"> <label><input
															type="radio" name="mru" value="Normal"
															onClick="ToneUpperFinal(this.value)"
															ng-model="ctrl.myData3.motorSystemExaminationUpperRightTone"><span
															class="label">Normal</span></label> <label><input
															type="radio" name="mru" value="Increased"
															onClick="ToneUpperFinal(this.value)"
															ng-model="ctrl.myData3.motorSystemExaminationUpperRightTone"><span
															class="label">Increased</span></label> <label><input
															type="radio" name="mru" value="Decreased"
															onClick="ToneUpperFinal(this.value)"
															ng-model="ctrl.myData3.motorSystemExaminationUpperRightTone"><span
															class="label">Decreased</span></label> <label><input
															type="radio" name="mru" value="Absent"
															onClick="ToneUpperFinal(this.value)"
															ng-model="ctrl.myData3.motorSystemExaminationUpperRightTone"><span
															class="label">Absent</span></label> <label><input
															type="radio" name="mru" value="Not Recorded"
															ng-model="ctrl.myData3.motorSystemExaminationUpperRightTone"
															checked><span class="label">Not Recorded</span></label>
													</span>
												</div>
											</div>
											<div class="col-xs-2">
												<input type="text" id="tluval" size="10"
													value="Not Recorded"
													style="padding-top: 10px; border: 0; background-color: #80F876; font-weight: bold;"
													readonly>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="col-sm-10">
												<div class="col-xs-2">
													<label class="control-label"> Lower: </label>
												</div>
												<div class="col-xs-10">
													<span class="segmented3" id="id6"> <label><input
															type="radio" name="mrl" value="Normal"
															onClick="ToneLowerFinal(this.value)"
															ng-model="ctrl.myData3.motorSystemExaminationLowerRightTone"><span
															class="label">Normal</span></label> <label><input
															type="radio" name="mrl" value="Increased"
															onClick="ToneLowerFinal(this.value)"
															ng-model="ctrl.myData3.motorSystemExaminationLowerRightTone"><span
															class="label">Increased</span></label> <label><input
															type="radio" name="mrl" value="Decreased"
															onClick="ToneLowerFinal(this.value)"
															ng-model="ctrl.myData3.motorSystemExaminationLowerRightTone"><span
															class="label">Decreased</span></label> <label><input
															type="radio" name="mrl" value="Absent"
															onClick="ToneLowerFinal(this.value)"
															ng-model="ctrl.myData3.motorSystemExaminationLowerRightTone"><span
															class="label">Absent</span></label> <label><input
															type="radio" name="mrl" value="Not Recorded" checked
															ng-model="ctrl.myData3.motorSystemExaminationLowerRightTone"><span
															class="label">Not Recorded</span></label>
													</span>
												</div>
											</div>
											<div class="col-xs-2">
												<input type="text" id="tllval" size="10"
													value="Not Recorded"
													style="padding-top: 10px; border: 0; background-color: #80F876; font-weight: bold;"
													readonly>
											</div>
										</div>
										<div class="col-xs-12">
											<label class="control-label col-xs-1"><h4>Power</h4></label>
											<label class="control-label col-xs-2"
												style="padding-left: 265px; padding-top: 15px;">Left</label>

										</div>
										<div class="col-sm-12">
											<div class="col-xs-1">
												<label class="control-label"> Upper: </label>
											</div>
											<div class="col-xs-4" style="padding-top: 5px;">
												<span class="segmented2" id="id7"> <label><input
														type="radio" name="mpru" value="1"
														onClick="PowerUpperFinal(this.value)"
														ng-model="ctrl.myData3.motorSystemExaminationUpperRightPower"><span
														class="label">1</span></label> <label><input type="radio"
														name="mpru" value="2"
														onClick="PowerUpperFinal(this.value)"
														ng-model="ctrl.myData3.motorSystemExaminationUpperRightPower"><span
														class="label">2</span></label> <label><input type="radio"
														name="mpru" value="3"
														onClick="PowerUpperFinal(this.value)"
														ng-model="ctrl.myData3.motorSystemExaminationUpperRightPower"><span
														class="label">3</span></label> <label><input type="radio"
														name="mpru" value="4"
														onClick="PowerUpperFinal(this.value)"
														ng-model="ctrl.myData3.motorSystemExaminationUpperRightPower"><span
														class="label">4</span></label> <label><input type="radio"
														name="mpru" value="5"
														onClick="PowerUpperFinal(this.value)"
														ng-model="ctrl.myData3.motorSystemExaminationUpperRightPower"><span
														class="label">5</span></label>
												</span>
											</div>
											<div class="col-xs-2">
												<input type="text" id="pluval" size="2"
													style="padding-top: 10px; border: 0; background-color: #80F876; font-weight: bold;"
													readonly>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="col-xs-1">
												<label class="control-label"> Lower: </label>
											</div>
											<div class="col-xs-4" style="padding-top: 5px;">
												<span class="segmented2" id="id8"> <label><input
														type="radio" name="mprl" value="1"
														onClick="PowerLowerFinal(this.value)"
														ng-model="ctrl.myData3.motorSystemExaminationLowerRightPower"><span
														class="label">1</span></label> <label><input type="radio"
														name="mprl" value="2"
														onClick="PowerLowerFinal(this.value)"
														ng-model="ctrl.myData3.motorSystemExaminationLowerRightPower"><span
														class="label">2</span></label> <label><input type="radio"
														name="mprl" value="3"
														onClick="PowerLowerFinal(this.value)"
														ng-model="ctrl.myData3.motorSystemExaminationLowerRightPower"><span
														class="label">3</span></label> <label><input type="radio"
														name="mprl" value="4"
														onClick="PowerLowerFinal(this.value)"
														ng-model="ctrl.myData3.motorSystemExaminationLowerRightPower"><span
														class="label">4</span></label> <label><input type="radio"
														name="mprl" value="5"
														onClick="PowerLowerFinal(this.value)"
														ng-model="ctrl.myData3.motorSystemExaminationLowerRightPower"><span
														class="label">5</span></label>
												</span>
											</div>
											<div class="col-xs-2">
												<input type="text" id="pllval" size="2"
													style="padding-top: 10px; border: 0; background-color: #80F876; font-weight: bold;"
													readonly>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<br>
					<div class="col-xs-10">
						<div class="form-group ">
							<label class="control-label col-sm-10 "
								style="text-align: left; margin-top: 10px;">
								Neurological deficits - Carnial Nerve/Limb Paralysis/Sensory
								Loss/Bowel-Bladder involvement : </label> <br> <br>
							<div class="container-fluid" data-ng-init="nbtnId1='nt1';">
								<div style="padding-left: 400px;">
									<button type="button" class="btn btn-info"
										data-ng-attr-id="nbtnId1"
										ng-click="ctrl.showTextarea(nbtnId1)">Textarea</button>
									<button type="button" class="btn btn-info"
										data-ng-attr-id="nbtnId1"
										ng-click="ctrl.showTouchpad(nbtnId1)">Touchpad</button>
								</div>
								<div class="col-sm-12">
									<textarea
										ng-show="!ctrl.myData3.anyOtherNeurologicalDeficitsSketchpad;"
										class="form-control" rows="5" id="neurolo"
										ng-model="ctrl.myData3.anyOtherNeurologicalDeficits"
										placeholder="Description" style="width: 100%"></textarea>
								</div>
								<div
									ng-show="ctrl.myData3.anyOtherNeurologicalDeficitsSketchpad;">
									<div ng-controller="MyCtrl as ctrl2"
										class="modal-body col-sm-12"
										ng-style="{'max-width': boundingBox.width + 'px', 'max-height': boundingBox.height + 'px'}">
										<signature-pad accept="accept"
											style="border: 1px solid black;" clear="clear" height="220"
											width="600" dataurl="dataurl"></signature-pad>
										<span ng-hide="true">{{ctrl.ntouch1=dataurl}}</span>
										<div class="buttons">
											<button type="button" class="btn btn-default"
												ng-click="clear()">Clear</button>
										</div>
									</div>

								</div>
							</div>
						</div>
					</div>
					<div class="form-group ">
						<div class="col-sm-offset-4 col-sm-3 "
							data-ng-init="neurobtnId='form3';">
							<button data-ng-attr-id="neurobtnId" type="button"
								class="btn btn-success "
								ng-click="ctrl.confirmSubmit(neurobtnId);">Submit</button>
						</div>
					</div>
				</form>
			</div>

		</div>
		<!-- **********************************************Neurological Form Complete************************************** -->

		<!-- **********************************************Clinical Form Start********************************************* -->
		<div id="f4" style="display: none;">
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

			<div class="collapse navbar-collapse" id="navbar">
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
					<li class="dropdown"><a href="" ng-href="#"
						class="dropdown-toggle" data-toggle="dropdown"
						style="overflow: hidden;"><i class="fa fa-user"></i> Dr.<%=uname%><b
							class="caret"></b></a>
						<ul class="dropdown-menu" style="background-color: #000000">
							<li><a href="#"><i class="fa fa-fw fa-user"></i> Profile</a></li>
							<li><a href="#"><i class="fa fa-fw fa-gear"></i>
									Settings</a></li>
							<li class="divider"></li>
							<li><a href="LogoutServlet"><i
									class="fa fa-fw fa-power-off"></i> Log Out</a></li>
						</ul></li>
				</ul>
			</div>
			<div style="height: 2px"></div>
			<div style="padding-top: 2px;" class="collapse navbar-collapse"
				id="navbar1">
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
			<div id="clinicalForm" class=" col-sm-10 container-fluid">
				<form class="form-horizontal ">
					<!--  **************Any change in GCS/Neurological examination******************-->
					<div class="form-group ">
						<label class="control-label col-sm-4 " style="text-align: left">Any
							change in GCS/Neurological examination :</label>
						<div class="col-sm-6">
							<span class="segmented"> <label><input
									type="radio" name="gcsExam" id="gcsExam1" value="1"
									ng-model="ctrl.myData4.anyChangeNeurological"><span
									class="label">Yes</span></label> <label><input type="radio"
									name="gcsExam" id="gcsExam2" value="0"
									ng-model="ctrl.myData4.anyChangeNeurological"><span
									class="label">No</span></label>
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
									ng-model="ctrl.myData4.managementPlan"
									placeholder="Description" style="width: 100%"></textarea>
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
									<div class="buttons"
										data-ng-init="sbtnId4='course_in_hospital';">
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
		</div>
		<!-- **********************************************Clinical Form Complete****************************************** -->
	
	</div>
</body>
</html>
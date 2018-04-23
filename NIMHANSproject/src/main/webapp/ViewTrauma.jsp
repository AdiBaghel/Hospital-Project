
<%
	HttpSession session2 = request.getSession();
	String uname = (String) session2.getAttribute("uname");
%>
<html ng-app="traumaApp">
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
<script src="physical.js"></script>
<script src="neuro.js"></script>
<script src="neuro1.js"></script>
<script src="neuro2.js"></script>
<script src="ng-file-upload-bower-12.2.13/ng-file-upload-shim.min.js"></script>
<script src="ng-file-upload-bower-12.2.13/ng-file-upload.min.js"></script>
<script src="TraumaApp.js"></script>
<script src="ViewTraumaController.js"></script>
<script src="ViewTraumaService.js"></script>
<script src="GlobalURL.js"></script>
<script type="text/javascript" src="showAndHideForm.js"></script>
<link rel="stylesheet" href="upload.css">
<link href="bootstrap/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-2.1.1.js"></script>
<script src="https://code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.10.4/themes/flick/jquery-ui.css">
<link rel="stylesheet" href="bootstrap/css/slider.css">
<script src="bootstrap/js/slider.js"></script>
<style>
.color {
	background-color: #e7e7e7;
	color: black;
}
</style>
</head>
<body>
	<div ng-controller="dbDataGetCtrl as ctrl">

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
				<a href="#f1" onClick="javascript:showIncident()"
					class="col-xs-2 col-sm-2 active">Incident Details</a> <a href="#f2"
					onClick="javascript:showPhysical()" class="col-xs-2 col-sm-2">Physical
					Examination</a> <a href="#f3" onClick="javascript:showNeurological()"
					class="col-xs-3 col-sm-3">Neurological Examination</a> <a
					href="#f4" onClick="javascript:showClinical()"
					class="col-xs-2 col-sm-2">Clinical Examination</a>
				<ul class="nav navbar-right navbar-nav col-xs-2 col-sm-2"
					style="color: #f2f2f2; text-align: center;">
					<li class="dropdown"><a href="" ng-href="#"
						class="dropdown-toggle" data-toggle="dropdown"
						style="overflow: hidden;"> <i class="fa fa-user"></i> Dr. <%=uname%><b
							class="caret"></b></a>
						<ul class="dropdown-menu" style="background-color: #000000">
							<li><a href="#"><i class="fa fa-fw fa-user"></i> Profile</a></li>
							<li><a href="#"><i class="fa fa-fw fa-gear"></i>Settings</a></li>
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
					<strong>Patient Name:</strong> <label style="text-align: left">{{ctrl.myData8.pname}}</label>
					&nbsp;
				</div>
				<div class="col-xs-4" style="align: centre">
					<strong>Patient Age :</strong> <label style="text-align: centre">{{ctrl.myData8.age}}</label>
					&nbsp;
				</div>
				<div class="col-xs-4" style="align: right">
					<strong>Patient Gender:</strong> <label style="text-align: right">{{ctrl.myData8.gender}}</label>
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
									<span ng-hide="true"></span> <input name="DOE" type="date"
										class="form-control" id="date_of_exam"
										value="{{ctrl.myData1[0].dateOfExamination}}" readonly>
								</div>
								<div class="col-sm-3">
									<span ng-hide="true"></span> <input name="Time" type="text"
										class="form-control" id="time_of_exam"
										value="{{ctrl.myData1[0].timeOfExamination}}" readonly>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-3" for="informant_name"
									style="text-align: left">Informant's Name:</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="informant_name"
										placeholder="Enter informant's name"
										value="{{ctrl.myData1[0].informantName}}" readonly>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-sm-3" style="text-align: left">Informant's
									type:</label>
								<div class="col-sm-5" ng-model="ctrl.myData1.informantType">
									<span class="segmented"> <label><input
											type="radio" name="infor-type" id="type-e" value="Eyewitness"
											ng-model="ctrl.myData1.informantType"
											ng-checked="ctrl.myData1[0].informantType == 'Eyewitness'"
											ng-true-value="Eyewitness" value="Eyewitness"
											disabled="disabled"><span class="label">Eyewitness</span></label>
										<label><input type="radio" name="infor-type"
											id="type-w" value="Hearsay"
											ng-model="ctrl.myData1.informantType"
											ng-checked="ctrl.myData1[0].informantType == 'Hearsay'"
											ng-true-value="Hearsay" value="Hearsay" disabled="disabled"><span
											class="label">Hearsay</span></label>
									</span>
								</div>
							</div>

							<div class="form-group">
								<!-- Date input -->
								<label class="control-label col-sm-3" for="date-of-injury"
									style="text-align: left">Date and time of injury:</label>
								<div class="col-sm-3">
									<span ng-hide="true"></span> <input name="DOI" type="date"
										class="form-control" id="date_of_injury"
										value="{{ctrl.myData1[0].dateOfInjury}}" readonly>
								</div>
								<div class="col-sm-3">
									<span ng-hide="true"></span> <input name="TOI" type="text"
										class="form-control" id="time_of_injury"
										value="{{ctrl.myData1[0].timeOfInjury}}" readonly>
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-sm-3" for="place of injury"
									style="text-align: left">Place of Injury:</label>
								<div class="col-sm-6">
									<input type="text" class="form-control" id="place-of-injury"
										value="{{ctrl.myData1[0].placeOfInjury}}" readonly>
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
															onclick="javascript:show2();"
															ng-checked="ctrl.myData1[0].incidentScenario == 'RTA'"
															ng-true-value="RTA" name="incident"><span
															class="label">RTA</span></label> <label><input
															name="incident" id="input-fall" value="Fall" type="radio"
															onclick="javascript:show1();"
															ng-checked="ctrl.myData1[0].incidentScenario == 'Fall'"
															ng-true-value="Fall"><span class="label">Fall</span></label>
														<label><input type="radio" name="incident"
															id="input-assault" value="Assault" type="radio"
															onclick="javascript:show5();"
															ng-checked="ctrl.myData1[0].incidentScenario == 'Assault'"
															ng-true-value="Assault"><span class="label">Assault</span></label>
														<label><input name="incident" id="input-other"
															value="Other" type="radio"
															ng-checked="ctrl.myData1[0].incidentScenario == 'Other'"
															ng-true-value="Other" onclick="javascript:show6();"><span
															class="label">Others</span></label>
													</span>
												</div>

											</div></li>

										<div id="div6" style="display: none">
											<li class="list-group-item">
												<div class="container-fluid">
													<div class="col-sm-8">
														<div class="container-fluid">

															<div class="col-sm-12"
																ng-if="!ctrl.myData1[0].otherInfo_flag;">
																<textarea ng-show="!ctrl.myData1[0].otherInfo_flag;"
																	class="form-control" rows="5" id="other"
																	ng-model="ctrl.myData1[0].otherInfo"
																	placeholder="Description" style="width: 100%" readonly></textarea>
															</div>
															<div ng-if="ctrl.myData1[0].otherInfo_flag">
																<div>
																	<img class="col-sm-12"
																		ng-show="ctrl.myData1[0].otherInfo"
																		ng-src="data:image/JPEG;base64,{{ctrl.myData9.otherInfo}}"
																		height="220" width="568" />
																</div>
															</div>
															<div ng-if="ctrl.myData2[0].otherInfo==null">
																<span>No Details<span>
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
															<label><input type="radio" name="vt"
																ng-checked="ctrl.myData1[0].vehicle_type=='1'"
																onclick="javascript:show3();"><span
																class="label">Two Wheeler</span></label> <label><input
																type="radio" name="vt"
																ng-checked="ctrl.myData1[0].vehicle_type=='0'"
																onclick="javascript:show4();"><span
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
															<label><input type="radio" name="ka"
																ng-checked="ctrl.myData1[0].assault_person_type=='1'"
																disabled="disabled"><span class="label">known</span></label>
															<label><input type="radio" name="ka"
																ng-checked="ctrl.myData1[0].assault_person_type=='0'"
																disabled="disabled"><span class="label">Unknown</span></label>
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
																ng-checked="ctrl.myData1[0].fall_alcohol=='1'"><span
																class="label">Yes</span></label> <label><input
																type="radio" name="fallalc"
																ng-checked="ctrl.myData1[0].fall_alcohol=='0'"><span
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
														<div class="container-fluid">

															<div class="col-sm-12"
																ng-if="!ctrl.myData1[0].siteoffall_flag;">
																<textarea ng-show="!ctrl.myData1[0].siteoffall_flag;"
																	class="form-control" rows="5" id="other"
																	ng-model="ctrl.myData1[0].siteoffall"
																	placeholder="Description" style="width: 100%" readonly></textarea>
															</div>
															<div ng-if="ctrl.myData1[0].siteoffall_flag">
																<div>
																	<img class="col-sm-12"
																		ng-show="ctrl.myData1[0].siteoffall"
																		ng-src="data:image/JPEG;base64,{{ctrl.myData9.otherInfo}}"
																		height="220" width="568" />
																</div>
															</div>
															<div ng-if="ctrl.myData1[0].siteoffall==null">
																<span>No Details<span>
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
																ng-checked="ctrl.myData1[0].rta_four_alcohol=='1'"><span
																class="label">Yes</span></label> <label><input
																type="radio" name="fouralc"
																ng-checked="ctrl.myData1[0].rta_four_alcohol=='0'"><span
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
																ng-checked="ctrl.myData1[0].rta_four_victimtype=='Driver'"><span
																class="label">Driver</span></label> <label><input
																type="radio" name="vt1"
																ng-checked="ctrl.myData1[0].rta_four_victimtype=='Passenger'"><span
																class="label">Passenger</span></label> <label><input
																type="radio" name="vt1"
																ng-checked="ctrl.myData1[0].rta_four_victimtype=='Pedestrian'"><span
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
															<label><input type="radio" name="ht" input
																ng-checked="ctrl.myData1[0].rta_two_helmet=='1'">><span
																class="label">Yes</span></label> <label><input
																type="radio" name="ht"
																ng-checked="ctrl.myData1[0].rta_two_helmet=='0'"><span
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
																ng-checked="ctrl.myData1[0].rta_two_alcohol=='1'"><span
																class="label">Yes</span></label> <label><input
																type="radio" name="twoalc"
																ng-checked="ctrl.myData1[0].rta_two_alcohol=='0'"><span
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
									<div class="container-fluid col-xs-9">

										<div class="col-sm-12"
											ng-if="!ctrl.myData1[0].commonText_flag;">
											<textarea ng-show="!ctrl.myData1[0].commonText_flag;"
												class="form-control" rows="5" id="other"
												ng-model="ctrl.myData1[0].commonText" style="width: 100%"
												readonly></textarea>
										</div>
										<div class="col-sm-12"
											ng-if="ctrl.myData1[0].commonText_flag;">
											<div>
												<img class="col-sm-12" ng-show="ctrl.myData1[0].commonText"
													ng-src="data:image/JPEG;base64,{{ctrl.myData9.commonText}}"
													height="220" width="568" />
											</div>
										</div>
										<div ng-if="ctrl.myData1[0].commonText==null">
											<span>No Details<span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- **********************************************Incident Form Complete****************************************** -->

		<!-- **********************************************Physical Form Start****************************************** -->
		<div id="f2" style="display: none;">
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
				<a href="#f1" onClick="javascript:showIncident()"
					class="col-xs-2 col-sm-2">Incident Details</a> <a href="#f2"
					onClick="javascript:showPhysical()"
					class="col-xs-2 col-sm-2 active">Physical Examination</a> <a
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
					<strong>Patient Name:</strong> <label style="text-align: left">{{ctrl.myData8.pname}}</label>
					&nbsp;
				</div>
				<div class="col-xs-4" style="align: centre">
					<strong>Patient Age :</strong> <label style="text-align: centre">{{ctrl.myData8.age}}</label>
					&nbsp;
				</div>
				<div class="col-xs-4" style="align: right">
					<strong>Patient Gender:</strong> <label style="text-align: right">{{ctrl.myData8.gender}}</label>
					&nbsp;
				</div>
			</div>

			<br>

			<div class="col-sm-1 container-fluid"></div>
			<div id="physicalForm" class="col-xs-12 container-fluid">
				<form class="form-horizontal">
				
					<div class="borders col-xs-9">
						<label style="padding-top: 10px; padding-left: 270px"><b><h3>History
									of injury in detail:</h3></b></label>
						<div class="form-group">
							<div class="col-xs-12">
								<div class="col-xs-6">
									<div>
										<label> <input type="checkbox"
											ng-checked="ctrl.myData2[0].lossOfConsciousness == 1"
											disabled="disabled" />Loss Of Consciousness
										</label>
									</div>

									<br>

									<div>
										<label> <input type="checkbox"
											ng-checked="ctrl.myData2[0].lucidInterval == 1"
											disabled="disabled">Lucid Interval
										</label>
									</div>
									<br>

									<div>
										<label><input type="checkbox"
											ng-checked="ctrl.myData2[0].seizures == 1"
											disabled="disabled" />Seizures</label>
									</div>
									<!-- seizure division closed -->

									<br>

									<div>

										<label> <input type="checkbox"
											ng-checked="ctrl.myData2[0].vomiting == 1"
											disabled="disabled" />Vomiting
										</label>

									</div>
									<!-- vomiting division closed -->

									<br>

									<div>
										<label> <input type="checkbox"
											ng-checked="ctrl.myData2[0].amnesia == 1" disabled="disabled" />Amnesia
										</label>

									</div>
									<!-- amnesia division closed -->

									<br>

									<div>
										<label>Bleeding from: </label> <label> <input
											type="checkbox"
											ng-checked="ctrl.myData2[0].bleedingFromEar== 1"
											disabled="disabled" /> Ear
										</label> <label><input type="checkbox"
											ng-checked="ctrl.myData2[0].bleedingFromNose== 1"
											disabled="disabled" /> Nose </label>
									</div>
									<!-- bleedingfrom division closed -->
								</div>

								<div class="container-fluid col-xs-6">

									<div class="col-sm-12"
										ng-if="!ctrl.myData2[0].historyOfInjuryCommonFlag;">
										<textarea
											ng-show="!ctrl.myData2[0].historyOfInjuryCommonFlag;"
											class="form-control" rows="5" id="other"
											ng-model="ctrl.myData2[0].historyOfInjuryCommon;"
											style="width: 100%" readonly></textarea>
									</div>
									<div class="col-sm-12"
										ng-if="ctrl.myData2[0].historyOfInjuryCommonFlag;">
										<div>
											<img class="col-sm-12"
												ng-show="ctrl.myData2[0].historyOfInjuryCommon;"
												ng-src="data:image/JPEG;base64,{{ctrl.myData7.historyOfInjuryCommonFlag}}"
												height="220" width="568" />
										</div>
									</div>
									<div ng-if="ctrl.myData2[0].historyOfInjuryCommon==null">
										<span>No Details<span>
									</div>
								</div>

							</div>
						</div>
					</div>
					<br>

					<div class="borders col-xs-9">
						<div class="col-xs-12">

							<label style="padding-top: 10px; padding-left: 270px"><h3>Vital
									signs on arrival:</h3></label> <br>
							<div class="col-xs-5">
								<label style="padding-left: 40px;"><h4>Airway on
										arrival:</h4></label> <br>
								<p>
									<span class="segmented"> <label><input
											type="radio" name="airway" id="type-c"
											ng-checked="ctrl.myData2[0].airwayOnArrival=='Clear'"
											value="Clear" disabled="disabled"><span class="label">clear</span></label>
										<label><input type="radio" name="airway" id="type-r"
											ng-checked="ctrl.myData2[0].airwayOnArrival=='Requires Intubation'"
											value="Requires Intubation" disabled="disabled"><span
											class="label">Requires Intubation</span></label>
									</span>
								</p>
							</div>
							<div class="col-xs-7">
								<label style="padding-left: 80px;"><h4>Spontaneous
										Respiration:</h4></label>

								<p>
									<span class="segmented"> <label><input
											type="radio" name="Spontaneous" id="type-c"
											ng-checked="ctrl.myData2[0].spontaneousRespiration=='Normal'"
											value="Normal" disabled="disabled"><span
											class="label">Normal</span></label> <label><input
											type="radio" name="Spontaneous" id="type-r"
											ng-checked="ctrl.myData2[0].spontaneousRespiration=='Tachypnoeic'"
											value="Tachypnoeic" disabled="disabled"><span
											class="label">Tachypnoeic</span></label> <label><input
											type="radio" name="Spontaneous" id="type-g"
											ng-checked="ctrl.myData2[0].spontaneousRespiration=='Gasping'"
											value="Gasping" disabled="disabled"><span
											class="label">Gasping</span></label>
									</span>
								</p>
							</div>
						</div>
						<div>
							<label><h4>Carotid Pulsations:</h4></label>
						</div>
						<div class="col-xs-12">
							<div class="col-xs-6">
								<label style="padding-left: 100px;"><h5>
										<b>LEFT</b>
									</h5></label>
								<div>
									<span class="segmented"> <label><input
											type="radio" name="lp"
											ng-checked="ctrl.myData2[0].carotidPulsationLeft=='1'"
											disabled><span class="label">Present</span></label> <label><input
											type="radio" name="lp"
											ng-checked="ctrl.myData2[0].carotidPulsationLeft=='0'"
											disabled> <span class="label">Absent</span></label>
									</span>
								</div>
							</div>
							<div class="col-xs-6">
								<label style="padding-left: 100px;"><h5>
										<b>RIGHT</b>
									</h5></label>
								<div>
									<span class="segmented"> <label><input
											type="radio" name="lp"
											ng-checked="ctrl.myData2[0].carotidPulsationRight=='1'"
											disabled="disabled"><span class="label">Present</span></label>
										<label><input type="radio" name="lp"
											ng-checked="ctrl.myData2[0].carotidPulsationRight=='0'"
											disabled="disabled"> <span class="label">Absent</span></label>
									</span>
								</div>
							</div>
						</div>
					</div>

					<div class="borders col-xs-9">
						<div>
							<div class=" col-xs-12">
								<label><strong>Pulse Rate(/min):</strong></label>
							</div>
							<div class="col-xs-12">
								<div class="col-xs-2" style="padding-top: 25px;">
									<input type="text" id="pulse" size="5"
										value="{{ctrl.myData2[0].pulseRrate}}" readonly />
								</div>

							</div>
						</div>
					</div>
					<div class="borders col-xs-9">
						<div>
							<div class=" col-xs-12">
								<label><strong>Blood Pressure on
										Arrival(/mmHg):</strong></label>
							</div>

							<div class="col-xs-2" style="padding-top: 15px;">
								<label>Systolic</label>
							</div>
							<div class="col-xs-12">
								<div class="col-xs-2" style="padding-top: 25px">
									<input type="text" id="slid2"
										value="{{ctrl.myData2[0].bpOnArrivalSystolic}}" readonly />
								</div>

							</div>

							<div class="col-xs-2" style="padding-top: 15px;">
								<label>Dystolic</label>
							</div>
							<div class="col-xs-12">
								<div class="col-xs-2" style="padding-top: 25px;">
									<input type="text" id="slid3"
										value="{{ctrl.myData2[0].bpOnArrivalDystolic}}" readonly />
								</div>

							</div>
						</div>
					</div>
					<div class="borders col-xs-9">
						<div class="container-fluid">
							<div class=" col-xs-12">
								<label><strong>Blood Pressure after half
										hour(/mmHg):</strong></label>
							</div>

							<div class="col-xs-2"
								style="padding-top: 25px; padding-right: 10px;">
								<label>Systolic</label>
							</div>
							<div class="col-xs-12">
								<div class="col-xs-2" style="padding-top: 25px;">
									<input type="text" id="slid4"
										value="{{ctrl.myData2[0].bpAfterHalfHourSystolic}}" readonly />

								</div>

							</div>

							<div class="col-xs-2" style="padding-top: 25px;">
								<label>Dystolic</label>
							</div>
							<div class="col-xs-12">
								<div class="col-xs-2" style="padding-top: 25px;">
									<input type="text" id="slid5"
										value="{{ctrl.myData2[0].bpAfterHalfHourDystolic}}" readonly />
								</div>

							</div>
						</div>
					</div>





					<div class="borders col-xs-9">
						<div class="form-group col-sm-12">
							<label class="control-label col-sm-12" style="text-align: left">Systemic
								Examination:</label>
							<div>

								<div style="padding-top: 10px">
									<span class="segmented"> <label><input
											name="csf" id="type-r" value="Rhinorrhoea" type="radio"
											ng-model="ctrl.myData2.csf"
											ng-checked="ctrl.myData2[0].csf=='Rhinorrhoea'" disabled><span
											class="label">Rhinorrhoea</span></label> <label><input
											name="csf" id="type-o" value="Otorrhoea" type="radio"
											ng-model="ctrl.myData2.csf"
											ng-checked="ctrl.myData2[0].csf=='Otorrhoea'" disabled><span
											class="label">Otorrhoea</span></label> <label><input
											name="csf" id="type-b" value="Both" type="radio"
											ng-model="ctrl.myData2.csf"
											ng-checked="ctrl.myData2[0].csf=='Both'" disabled><span
											class="label">Both</span></label>
									</span>

								</div>
								<div class="col-xs-12">
								<!-- csf division closed -->
								<div class="col-xs-6">
									<div class="col-xs-10" style="padding-top: 20px">

										<div>
											<label><input type="checkbox" id="type-apb"
												ng-checked="ctrl.myData2[0].activePeripheralBleeding==1"
												id="type-apb" value="Active peripheral Bleeding"
												disabled="disabled" />Active peripheral Bleeding</label>
										</div>

										<div>
											<label> <input type="checkbox"
												ng-checked="ctrl.myData2[0].fractures==1" id="type-fracture"
												value="Fractures" disabled="disabled" />Fractures
											</label>
										</div>
										<div>
											<label><input type="checkbox"
												ng-checked="ctrl.myData2[0].peripheralPulses==1"
												id="type-pp" value="Peripheral Pulses" disabled="disabled" />Peripheral
												Pulses</label>

										</div>

										<!--peripheral pulses division closed -->

										<div>
											<label><input type="checkbox"
												ng-checked="ctrl.myData2[0].chestInjury==1" id="type-ci"
												value="Chest Injury" disabled="disabled" />Chest Injury</label>
										</div>
										<!-- chest injury division closed -->

										<div>
											<label><input type="checkbox"
												ng-checked="ctrl.myData2[0].abdominalInjury==1" id="type-ai"
												value="Abdominal Injury" disabled="disabled" />Abdominal
												Injury</label>

										</div>
										<!-- abdominal injury division closed -->

										<div>
											<label><input type="checkbox"
												ng-checked="ctrl.myData2[0].wounds==1" id="type-w"
												value="Abdominal Injury" disabled="disabled" />Wounds</label>

										</div>
										<!-- wounds division closed -->
									</div>

									<div class="form-group">
										<label class="control-label col-sm-12"
											style="text-align: left">Details Of Spine
											Examination:</label>
										<div>
											<label class="radio-inline"> <input type="checkbox"
												id="type-t" ng-checked="ctrl.myData2[0].spinalTenderness==1"
												value="Spinal Tenderness" type="checkbox"
												disabled="disabled" /><b>Spinal Tenderness </label>
										</div>

										<div>
											<label class="radio-inline"> <input type="checkbox"
												id="type-d" ng-checked="ctrl.myData2[0].spinalDeformity==1"
												value="Spinal Deformity" type="checkbox" disabled="disabled" /><b>Spinal
													Deformity </label>
										</div>
									</div>
								</div>
								<div class="container-fluid col-xs-6">

									<div class="col-sm-12"
										ng-if="!ctrl.myData2[0].systemicExaminationCommonFlag;">
										<textarea
											ng-show="!ctrl.myData2[0].systemicExaminationCommonFlag;"
											class="form-control" rows="5" id="other"
											ng-model="ctrl.myData2[0].systemicExaminationCommon;"
											style="width: 100%" readonly></textarea>
									</div>
									<div class="col-sm-12"
										ng-if="ctrl.myData2[0].systemicExaminationCommonFlag;">
										<div>
											<img class="col-sm-12"
												ng-show="ctrl.myData2[0].systemicExaminationCommon;"
												ng-src="data:image/JPEG;base64,{{ctrl.myData7.systemicExaminationCommonFlag}}"
												height="220" width="568" />
										</div>
									</div>
									<div ng-if="ctrl.myData2[0].systemicExaminationCommon==null">
										<span>No Details<span>
									</div>
								</div>
								</div>
								<!-- touchpad closed -->
							</div>
							<!--container closed  -->
						</div>
						<!-- spinal division closed -->
					</div>

				</form>
			</div>
		</div>

		<!-- **********************************************Physical Form Complete****************************************** -->

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
				<a href="#f1" onClick="javascript:showIncident()"
					class="col-xs-2 col-sm-2">Incident Details</a> <a href="#f2"
					onClick="javascript:showPhysical()" class="col-xs-2 col-sm-2">Physical
					Examination</a> <a href="#f3" onClick="javascript:showNeurological()"
					class="col-xs-3 col-sm-3 active">Neurological Examination</a> <a
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
					<strong>Patient Name:</strong> <label style="text-align: left">{{ctrl.myData8.pname}}</label>
					&nbsp;
				</div>
				<div class="col-xs-4" style="align: centre">
					<strong>Patient Age :</strong> <label style="text-align: centre">{{ctrl.myData8.age}}</label>
					&nbsp;
				</div>
				<div class="col-xs-4" style="align: right">
					<strong>Patient Gender:</strong> <label style="text-align: right">{{ctrl.myData8.gender}}</label>
					&nbsp;
				</div>
			</div>
			<div id="neurologicalForm" class="col-sm-12 container-fluid">
				<form class="form-horizontal">

					<!-- *************************Glasgow Coma Scale****************************** -->

					<div class="borders col-xs-9">
						<div class="form-group">
							<label class="control-label col-sm-10" style="text-align: left">Glasgow
								Coma Scale</label> <br> <br>
						</div>
						<div class="form-group" style="padding-left: 1em">
							<div class="col-xs-12">
								<div class="col-xs-2"></div>
								<label class="col-xs-1" style="color: #6a6a6a;">Initial</label>
								<label class="col-xs-1" style="color: #6a6a6a;">Final</label>
							</div>
							<div class="col-xs-12">
								<div class="col-xs-2">
									<label style="padding-top: 20px;" class="segmented1"><input
										type="radio"><span class="label">E</span></label>
								</div>
								<div class="col-xs-1" style="padding-top: 25px;">
									<input type="text" size="1" id="erbi"
										value="{{ctrl.myData3[0].eyeOpeneingScoreInitial}}" readonly>
								</div>
								<div class="col-xs-1" style="padding-top: 25px;">
									<input type="text" size="1" id="erbf"
										value="{{ctrl.myData3[0].eyeOpeningScoreAfterRes}}" readonly>
								</div>
							</div>
							<div class="col-xs-12">
								<div class="col-xs-2">
									<label style="padding-top: 20px;" class="segmented1"><input
										type="radio"><span class="label">M</span></label>
								</div>
								<div class="col-xs-1" style="padding-top: 25px;">
									<input type="text" size="1" id="mrbi"
										value="{{ctrl.myData3[0].motorResponseScoreInitial}}" readonly>
								</div>
								<div class="col-xs-1" style="padding-top: 25px;">
									<input type="text" size="1" id="mrbf"
										value="{{ctrl.myData3[0].motorResponseScoreAfterRes}}"
										readonly>
								</div>
							</div>
							<div class="col-xs-12">
								<div class="col-xs-2">
									<label style="padding-top: 20px;" class="segmented1"><input
										type="radio"><span class="label">V</span></label>
								</div>
								<div class="col-xs-1" style="padding-top: 25px;">
									<input type="text" size="1" id="vrbi"
										value="{{ctrl.myData3[0].verbalResponseScoreInitial}}"
										readonly>
								</div>
								<div class="col-xs-1" style="padding-top: 25px;">
									<input type="text" size="1" id="vrbf"
										value="{{ctrl.myData3[0].verbalResponseScoreAfterRes}}"
										readonly>
								</div>
							</div>
						</div>
					</div>
					<!--****************************Glasgow Coma Scale Completer*************************  -->
					<!--************************  Horizontal Oculocephalic Reflex************************* -->
					<div class="borders col-xs-9">
						<div class="form-group">
							<label class="control-label col-sm-10" style="text-align: left">Horizontal
								oculocephalic reflex </label> <br> <br>
							<div class="col-xs-12">
								<div class="col-sm-1">
									<label class="control-label col-sm-2" style="text-align: left;">Right:</label>
								</div>
								<div class="col-xs-11">
									<span class="segmented"> <label> <input
											type="radio" name="radioHRight"
											ng-model="ctrl.myData3.horizontalOculocephalicReflexRight"
											ng-checked="ctrl.myData3[0].horizontalOculocephalicReflexRight == 'present'"
											ng-true-value="present" value="present" disabled><span
											class="label">Present</span></label> <label> <input
											type="radio" name="radioHRight"
											ng-model="ctrl.myData3.horizontalOculocephalicReflexRight"
											ng-checked="ctrl.myData3[0].horizontalOculocephalicReflexRight == 'absent'"
											ng-true-value="absent" value="absent" disabled><span
											class="label">Absent</span></label> <label> <input
											type="radio" name="radioHRight"
											ng-model="ctrl.myData3.horizontalOculocephalicReflexRight"
											ng-checked="ctrl.myData3[0].horizontalOculocephalicReflexRight == 'not_tested'"
											ng-true-value="not_tested" value="not_tested" disabled><span
											class="label">Not Tested</span></label>
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
											ng-checked="ctrl.myData3[0].horizontalOculocephalicReflexLeft == 'present'" ng-value="present" disabled><span
											class="label">Present</span></label> <label> <input
											type="radio" name="radioHLeft"
											ng-checked="ctrl.myData3[0].horizontalOculocephalicReflexLeft == 'absent'"
									         ng-value="absent" disabled><span
											class="label">Absent</span></label> <label> <input
											type="radio" name="radioHLeft"
											ng-checked="ctrl.myData3[0].horizontalOculocephalicReflexLeft == 'not_tested'"
											 ng-value="not_tested" disabled><span
											class="label">Not Tested</span></label>
									</span>
								</div>
							</div>
						</div>
					</div>
					<!--************************  Horizontal Oculocephalic Reflex Complete************************* -->

					<!--************************  Pupilliary Light Reflex************************* -->

					<div class="borders col-xs-9">
						<div class="form-group">
							<label class="control-label col-sm-10" style="text-align: left">Pupilliary
								Light reflex </label> <br> <br>
							<div class="col-sm-12">
								<div class="col-xs-1">
									<label class="control-label col-sum-2"
										style="text-align: left; padding-right: 1em;">Right:</label>
								</div>
								<div class="col-xs-11">
									<span class="segmented"> <label><input
											type="radio" name="radioPRight"
											ng-model="ctrl.myData3.pupiliaryLightReflexRight"
											ng-checked="ctrl.myData3[0].pupiliaryLightReflexRight == 'normal'"
											ng-true-value="normal" value="normal" disabled><span
											class="label">Normal</span></label> <label><input
											type="radio" name="radioPRight"
											ng-model="ctrl.myData3.pupiliaryLightReflexRight"
											ng-checked="ctrl.myData3[0].pupiliaryLightReflexRight == 'sluggish'"
											ng-true-value="sluggish" value="sluggish" disabled><span
											class="label">Sluggish</span></label> <label><input
											type="radio" name="radioPRight"
											ng-model="ctrl.myData3.pupiliaryLightReflexRight"
											ng-checked="ctrl.myData3[0].pupiliaryLightReflexRight == 'absent'"
											ng-true-value="absent" value="absent" disabled><span
											class="label">Absent</span></label> <label><input
											type="radio" name="radioPRight"
											ng-model="ctrl.myData3.pupiliaryLightReflexRight"
											ng-checked="ctrl.myData3[0].pupiliaryLightReflexRight == 'cannot_access'"
											ng-true-value="cannot_access" value="cannot_access" disabled><span
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
											ng-checked="ctrl.myData3[0].pupiliaryLightReflexLeft == 'normal'"
											ng-true-value="normal" value="normal" disabled><span
											class="label">Normal</span></label> <label><input
											type="radio" name="radioPLeft"
											ng-model="ctrl.myData3.pupiliaryLightReflexLeft"
											ng-checked="ctrl.myData3[0].pupiliaryLightReflexLeft == 'sluggish'"
											ng-true-value="sluggish" value="sluggish" disabled><span
											class="label">Sluggish</span></label> <label><input
											type="radio" name="radioPLeft"
											ng-model="ctrl.myData3.pupiliaryLightReflexLeft"
											ng-checked="ctrl.myData3[0].pupiliaryLightReflexLeft == 'absent'"
											ng-true-value="absent" value="absent" disabled><span
											class="label">Absent</span></label> <label><input
											type="radio" name="radioPLeft"
											ng-model="ctrl.myData3.pupiliaryLightReflexLeft"
											ng-checked="ctrl.myData3[0].pupiliaryLightReflexLeft == 'cannot_access'"
											ng-true-value="cannot_access" value="cannot_access" disabled
											checked><span class="label">Not Recorded</span></label>
									</span>
								</div>
							</div>
						</div>
						<div class="form-group col-xs-12">
							<div class="col-xs-3">
								<label class="control-label" style="text-align: left">Size
									of Pupil(mm):</label> <br> <br>
							</div>

							<div class="col-xs-9" id="sizeOfPupil">
								<span class="segmented2"> <label> <input
										type="radio" name="radioHLeft"
										ng-model="ctrl.myData3.pupiliaryLightSizeOfPupil"
										ng-checked="ctrl.myData3[0].pupiliaryLightSizeOfPupil == '1'"
										ng-true-value="1" value="1" disabled><span
										class="label">1</span>
								</label> <label> <input type="radio" name="radioHLeft"
										ng-model="ctrl.myData3.pupiliaryLightSizeOfPupil"
										ng-checked="ctrl.myData3[0].pupiliaryLightSizeOfPupil == '2'"
										ng-true-value="2" value="2"disabled"><span
										class="label">2</span>
								</label> <label> <input type="radio" name="radioHLeft"
										ng-model="ctrl.myData3.pupiliaryLightSizeOfPupil"
										ng-checked="ctrl.myData3[0].pupiliaryLightSizeOfPupil == '3'"
										ng-true-value="3" value="3" disabled><span
										class="label">3</span>
								</label> <label> <input type="radio" name="radioHLeft"
										ng-model="ctrl.myData3.pupiliaryLightSizeOfPupil"
										ng-checked="ctrl.myData3[0].pupiliaryLightSizeOfPupil == '4'"
										ng-true-value="4" value="4" disabled><span
										class="label">4</span>
								</label> <label> <input type="radio" name="radioHLeft"
										ng-model="ctrl.myData3.pupiliaryLightSizeOfPupil"
										ng-checked="ctrl.myData3[0].pupiliaryLightSizeOfPupil == '5'"
										ng-true-value="5" value="5" disabled><span
										class="label">5</span>
								</label>
								</span>
							</div>
						</div>
					</div>
					<!--************************  Pupilliary Light Reflex Complete************************* -->
					<!--************************  Motor System Examination********************************** -->
					<div class="borders col-xs-9">
						<div class="form-group">
							<label class="control-label col-sm-10" style="text-align: left">Motor
								System Examination</label> <br> <br>
						</div>
						<div class="form-group" style="padding-left: 1em">
							<div class="col-xs-12">
								<label class="control-label col-xs-1"><h4>Tone</h4></label> <label
									class="control-label col-xs-1"
									style="padding-left: 15px; padding-top: 15px;">Left</label> <label
									class="control-label col-xs-1"
									style="padding-left: 70px; padding-top: 15px;">Right</label>
							</div>
							<div class="col-sm-12">
								<div class="col-xs-1">
									<label class="control-label"> Upper: </label>
								</div>
								<div class="col-xs-11">
									<input type="text" id="tluval" size="10"
										value="{{ctrl.myData3[0].motorSystemExaminationUpperLeftTone}}"
										style="padding-top: 5px;" readonly> <input type="text"
										id="truval" size="10"
										value="{{ctrl.myData3[0].motorSystemExaminationUpperRightTone}}"
										style="padding-top: 5px;" readonly>
								</div>
							</div>
							<div class="col-sm-12">
								<div class="col-xs-1">
									<label class="control-label"> Lower: </label>
								</div>
								<div class="col-xs-11">
									<input type="text" id="tllval" size="10"
										value="{{ctrl.myData3[0].motorSystemExaminationLowerLeftTone}}"
										style="padding-top: 5px;" readonly> <input type="text"
										id="trlval" size="10"
										value="{{ctrl.myData3[0].motorSystemExaminationLowerRightTone}}"
										style="padding-top: 5px;" readonly>
								</div>
							</div>
							<div class="col-xs-12">
								<label class="control-label col-xs-1"><h4>Power</h4></label> <label
									class="control-label col-xs-1"
									style="padding-left: 15px; padding-top: 15px;">Left</label> <label
									class="control-label col-xs-1"
									style="padding-left: 70px; padding-top: 15px;">Right</label>
							</div>
							<div class="col-sm-12">
								<div class="col-xs-1">
									<label class="control-label"> Upper: </label>
								</div>
								<div class="col-xs-11">
									<input type="text" id="pluval" size="10"
										style="padding-top: 10px;"
										value="{{ctrl.myData3[0].motorSystemExaminationUpperLeftPower}}"
										readonly> <input type="text" id="pruval" size="10"
										style="padding-top: 10px;"
										value="{{ctrl.myData3[0].motorSystemExaminationUpperRightPower}}"
										readonly>
								</div>
							</div>
							<div class="col-sm-12">
								<div class="col-xs-1">
									<label class="control-label"> Lower: </label>
								</div>
								<div class="col-xs-11">
									<input type="text" id="pllval" size="10"
										style="padding-top: 10px;"
										value="{{ctrl.myData3[0].motorSystemExaminationLowerLeftPower}}"
										readonly> <input type="text" id="prlval" size="10"
										style="padding-top: 10px;"
										value="{{ctrl.myData3[0].motorSystemExaminationLowerRightPower}}"
										readonly>
								</div>
							</div>
						</div>
					</div>
					<!--************************  Motor System Examination Complete************************* -->

					<!--************************  Any other Neurological Deficits************************* -->

					<div class="form-group ">
						<label class="control-label col-sm-12 " style="text-align: left">
							Any other neurological deficits like carnial nerve or limb
							paralysis, sensory loss and bowel/bladder involvement : </label> <br>
						<br>
						<div class="container-fluid">
							<div class="col-sm-12"
								ng-if="!ctrl.myData3[0].anyOtherNeurologicalDeficitsSketchpad;">
								<textarea
									ng-show="!ctrl.myData3[0].anyOtherNeurologicalDeficitsSketchpad;"
									class="form-control" rows="5" id="other"
									ng-model="ctrl.myData3[0].anyOtherNeurologicalDeficits"
									placeholder="Description" style="width: 100%" readonly></textarea>
							</div>
							<div
								ng-if="ctrl.myData3[0].anyOtherNeurologicalDeficitsSketchpad">
								<div>
									<img class="col-sm-12"
										ng-show="ctrl.myData3[0].anyOtherNeurologicalDeficits"
										ng-src="data:image/JPEG;base64,{{ctrl.myData6.anyOtherNeurologicalDeficits}}"
										height="220" width="568" />
								</div>
							</div>
							<div ng-if="ctrl.myData3[0].anyOtherNeurologicalDeficits==null"><span>No Details<span>
							</div>
						</div>
					</div>
					<!--************************  Any other Neurological Deficits Complete************************* -->
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
				<a href="#f1" onClick="javascript:showIncident()"
					class="col-xs-2 col-sm-2">Incident Details</a> <a href="#f2"
					onClick="javascript:showPhysical()" class="col-xs-2 col-sm-2">Physical
					Examination</a> <a href="#f3" onClick="javascript:showNeurological()"
					class="col-xs-3 col-sm-3">Neurological Examination</a> <a
					href="#f4" onClick="javascript:showClinical()"
					class="col-xs-2 col-sm-2 active">Clinical Examination</a>
				<ul class="nav navbar-right navbar-nav col-xs-2 col-sm-2"
					style="color: #f2f2f2; text-align: center;">
					<li class="dropdown"><a href="" ng-href="#"
						class="dropdown-toggle" data-toggle="dropdown"
						style="overflow: hidden;"> <i class="fa fa-user"></i> Dr. <%=uname%><b
							class="caret"></b></a>
						<ul class="dropdown-menu" style="background-color: #000000">
							<li><a href="#"><i class="fa fa-fw fa-user"></i> Profile</a></li>
							<li><a href="#"><i class="fa fa-fw fa-gear"></i>Settings</a></li>
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
					<strong>Patient Name:</strong> <label style="text-align: left">{{ctrl.myData8.pname}}</label>
					&nbsp;
				</div>
				<div class="col-xs-4" style="align: centre">
					<strong>Patient Age :</strong> <label style="text-align: centre">{{ctrl.myData8.age}}</label>
					&nbsp;
				</div>
				<div class="col-xs-4" style="align: right">
					<strong>Patient Gender:</strong> <label style="text-align: right">{{ctrl.myData8.gender}}</label>
					&nbsp;
				</div>
			</div>
			<br>
			<div class="col-sm-1 container-fluid"></div>
			<div id="clinicalForm" class=" col-sm-12 container-fluid">
				<form class="form-horizontal ">
					<!--  **************Any change in GCS/Neurological examination******************-->
					<div class="form-group ">
						<label class="control-label col-sm-4 " style="text-align: left">Any
							change in GCS/Neurological examination :</label>
						<div class="col-sm-6">
							<span class="segmented"> <label><input
									type="radio" name="gcsExam" id="gcsExam1" value="1"
									ng-checked="ctrl.myData4[0].anyChangeNeurological==1"
									ng-model="ctrl.myData4[0].anyChangeNeurological"
									disabled="disabled"><span class="label">Yes</span></label> <label><input
									type="radio" name="gcsExam" id="gcsExam2" value="0"
									ng-checked="ctrl.myData4[0].anyChangeNeurological==0"
									ng-model="ctrl.myData4[0].anyChangeNeurological"
									disabled="disabled"><span class="label">No</span></label>
							</span>
						</div>
					</div>
					<br>
					<!-- <div class="form-group ">
							<label class="control-label col-sm-4 " style="text-align: left">Any
								change in GCS/Neurological examination noted during observation:</label>
							<div class="container-fluid col-sm-5 ">
								<div class="col-sm-6 ">
									<label class="radio-inline"> <input type="radio"
										name="gcsExam" id="gcsExam1" value="1"
										ng-checked="ctrl.myData4[0].anyChangeNeurological==1"
										ng-model="ctrl.myData4[0].anyChangeNeurological" disabled="disabled">Yes
									</label>
								</div>
								<div class="col-sm-4 ">
									<label class="radio-inline"> <input type="radio"
										name="gcsExam" id="gcsExam2" value="0"
										ng-checked="ctrl.myData4[0].anyChangeNeurological==0"
										ng-model="ctrl.myData4[0].anyChangeNeurological" disabled="disabled">No
									</label>
								</div>
							</div>
						</div> -->
					<div class="form-group ">
						<label class="control-label col-sm-4 " style="text-align: left">CT
							scan head showed : </label>
						<div class="container-fluid">
							<div class="col-sm-12"
								ng-if="!ctrl.myData4[0].ctScanHeadSketchPad;">
								<textarea ng-show="!ctrl.myData4[0].ctScanHeadSketchPad;"
									class="form-control" rows="5" id="other"
									ng-model="ctrl.myData4[0].ctScanHead" placeholder="Description"
									style="width: 100%" readonly></textarea>
							</div>
							<div ng-if="ctrl.myData4[0].ctScanHeadSketchPad;">
								<div>
									<img class="col-sm-12" ng-show="ctrl.myData4[0].ctScanHead"
										ng-src="data:image/JPEG;base64,{{ctrl.myData6.ctScanHead}}"
										height="220" width="568" />
								</div>
							</div>
							<div ng-if="ctrl.myData4[0].ctScanHead==null">
								<span>No Details<span>
							</div>
						</div>
					</div>

					<div class="form-group ">
						<div>
							<label class="control-label col-sm-4 " style="text-align: left">Other
								relevant investigations(X-rays/MRI):</label>
						</div>
						<div class="container-fluid">
							<div class="col-sm-12"
								ng-if="!ctrl.myData4[0].xrayDetailsSketchPad;">
								<textarea ng-show="!ctrl.myData4[0].xrayDetailsSketchPad;"
									class="form-control" rows="5" id="other"
									ng-model="ctrl.myData4[0].xrayDetails"
									placeholder="Description" style="width: 100%" readonly></textarea>
							</div>
							<div ng-if="ctrl.myData4[0].xrayDetailsSketchPad;">
								<div>
									<img class="col-sm-12" ng-show="ctrl.myData4[0].xrayDetails"
										ng-src="data:image/JPEG;base64,{{ctrl.myData6.xrayDetails}}"
										height="220" width="568" />
								</div>
							</div>
							<div ng-if="ctrl.myData4[0].xrayDetails==null">
								<span>No Details<span>
							</div>
						</div>
					</div>
					<div class="form-group ">
						<label class="control-label col-sm-4 " style="text-align: left">Management
							Plan (in Hospital):</label>
						<div class="container-fluid">
							<div class="col-sm-12"
								ng-if="!ctrl.myData4[0].managementPlanSketchPad;">
								<textarea ng-show="!ctrl.myData4[0].managementPlanSketchPad;"
									class="form-control" rows="5" id="other"
									ng-model="ctrl.myData4[0].managementPlan"
									placeholder="Description" style="width: 100%" readonly></textarea>
							</div>
							<div ng-if="ctrl.myData4[0].managementPlanSketchPad;">
								<div>
									<img class="col-sm-12" ng-show="ctrl.myData4[0].managementPlan"
										ng-src="data:image/JPEG;base64,{{ctrl.myData6.managementPlan}}"
										height="220" width="568" />
								</div>
							</div>
							<div ng-if="ctrl.myData4[0].managementPlan==null">
								<span>No Details<span>
							</div>


						</div>
					</div>
					<div class="form-group ">
						<label class="control-label col-sm-4 " style="text-align: left">Course
							in the Hospital(including repeat CT scan done, if any):</label>
						<div class="container-fluid">
							<div class="col-sm-12"
								ng-if="!ctrl.myData4[0].courseInHospitalSketchPad;">
								<textarea ng-show="!ctrl.myData4[0].courseInHospitalSketchPad;"
									class="form-control" rows="5" id="other"
									ng-model="ctrl.myData4[0].courseInHospital"
									placeholder="Description" style="width: 100%" readonly></textarea>
							</div>
							<div ng-if="ctrl.myData4[0].courseInHospitalSketchPad;">
								<div>
									<img class="col-sm-12"
										ng-show="ctrl.myData4[0].courseInHospital"
										ng-src="data:image/JPEG;base64,{{ctrl.myData6.courseInHospital}}"
										height="220" width="568" />
								</div>

							</div>
							<div ng-if="ctrl.myData4[0].courseInHospital==null">
								<span>No Details<span>
							</div>
						</div>
					</div>
					<div class="form-group ">
						<label class="control-label col-sm-4 " style="text-align: left">Condition
							at Discharge:</label>
						<div class="container-fluid ">
							<div class="col-sm-12"
								ng-if="!ctrl.myData4[0].conditionAtDischargeSketchPad;">
								<textarea
									ng-show="!ctrl.myData4[0].conditionAtDischargeSketchPad;"
									class="form-control" rows="5" id="other"
									ng-model="ctrl.myData4[0].conditionAtDischarge"
									placeholder="Description" style="width: 100%" readonly></textarea>
							</div>
							<div ng-if="ctrl.myData4[0].conditionAtDischargeSketchPad;">
								<div>
									<img class="col-sm-12"
										ng-show="ctrl.myData4[0].conditionAtDischarge"
										ng-src="data:image/JPEG;base64,{{ctrl.myData6.conditionAtDischarge}}"
										height="220" width="568" />
								</div>
							</div>
							<div ng-if="ctrl.myData4[0].conditionAtDischarge==null">
								<span>No Details<span>
							</div>


						</div>
					</div>
				</form>
			</div>
		</div>
		<!-- **********************************************Clinical Form Complete****************************************** -->

	</div>
</body>
</html>
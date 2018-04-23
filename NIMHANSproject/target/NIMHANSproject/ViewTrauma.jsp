<%
 
	HttpSession session2 = request.getSession();
	String uname = (String) session2.getAttribute("uname");				
%>
<html ng-app="traumaApp">

<head>
<meta charset="UTF-8">

<title>Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">

<script src="bootstrap/js/jquery-3.1.1.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="angular.js"></script>
<script src="signature_pad.min.js"></script>
<script src="signature.js"></script>
<script src="ng-file-upload-bower-12.2.13/ng-file-upload-shim.min.js"></script>
<!-- for no html5 browsers support -->
<script src="ng-file-upload-bower-12.2.13/ng-file-upload.min.js"></script>
<script src="upload.js"></script>

<script src="TraumaApp.js"></script>
<script src="ViewTraumaController.js"></script>
<script src="ViewTraumaService.js"></script>
<link rel="stylesheet" href="upload.css">
<script src="GlobalURL.js"></script>
<!-- Custom Fonts -->
<link href="bootstrap/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<style>
a {
	color: darkgrey;
	text-decoration: none;
}

.btn-info {
	color: darkgrey;
	background-color: #455a64;
	border-color: #455a64;
}

.navbar-header .navbar-toggle .icon-bar {
	background-color: black;
}
</style>

</head>

<body style="background-color: #eceff1;">
	<div class="container-fixed">
		<div class="row">
			<div class="col-sm-1">

				<img src="images/nms.jpg">

			</div>
			<div class="col-sm-11">
				<h1>National Institute Of Mental Health And Neurosciences</h1>

			</div>
		</div>
	</div>
	<div class="container-fluid" style="background-color: #455a64">
		<nav>
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					style="background-color: darkgrey;" data-toggle="collapse"
					data-target="#bs-menu-navbar-collapse-1" aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>

			<div class="collapse navbar-collapse" id="bs-menu-navbar-collapse-1">
				<ul class="nav navbar-nav"  >
   					<li ><a href="doctorHome.jsp">Home</a></li>
  				</ul>

				<ul class="nav navbar-right navbar-nav">
					<form class="navbar-form navbar-left" role="search"></form>

					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"><i class="fa fa-user"></i> Dr. <%=uname%> <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="#"><i class="fa fa-fw fa-user"></i> Profile</a>
							</li>
							<li><a href="#"><i class="fa fa-fw fa-gear"></i>
									Settings</a></li>
							<li class="divider"></li>
							<li>
                            	<a href="LogoutServlet"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                        	</li>
						</ul></li>
				</ul>

			</div>

		</nav>
	</div>

	<div class="container-fluid" ng-controller="dbDataGetCtrl as ctrl">

		<!---sidebar-->

		<div class="col-md-2 col-sm-2 innerForm-tab-menu">
			<br>

			<div class="list-group">
				<a href="#incidentForm" class="list-group-item active text-center">INCIDENT
					DETAILS</a> <a href="#physicalForm" class="list-group-item text-center">PHYSICAL
					EXAMINATION</a> <a href="#neurologicalForm"
					class="list-group-item text-center">NEUROLOGICAL EXAMINATION</a> <a
					href="#clinicalForm" class="list-group-item text-center">CLINICAL
					EXAMINATON</a>
			</div>

		</div>

		<!---INCIDENT DETAILS FORM START-->
		<br>
		<div>
			<div>
				<div class="col-xs-3" style="align: left">
					<strong>Patient Name:</strong> <label style="text-align: left">{{ctrl.myData8.pname}}</label>
					&nbsp;
				</div>
				<div class="col-xs-3" style="align: centre">
					<strong>Patient Age :</strong> <label style="text-align: left">{{ctrl.myData8.age}}</label>
					&nbsp;
				</div>
				<div class="col-xs-3" style="align: right">
					<strong>Patient Gender:</strong> <label style="text-align: left">{{ctrl.myData8.gender}}</label>
					&nbsp;
				</div>
			</div>
		</div>

		<div id="newForm" class="col-md-10 col-sm-10">
			<div class="jumbotron"
				style="background-color: white; min-height: 1000px;">


				<div id="incidentForm" class="container-fluid"
					style="border: 1px solid black; border-radius: 20px;">
					<h3>
						<strong><u>INCIDENT DETAILS:</u></strong>
					</h3>
					<br>


					<form class="form-horizontal">

						<div class="media-body">
							<div class="form-group">
								<label class="control-label col-sm-4" for="refer"
									style="text-align: left">Referred from:</label>
								<div class="col-sm-5">
									<input name="referred_from" type="text" class="form-control"
										id="referred_from" value="{{ctrl.myData1[0].referredFrom}}" readonly>
								</div>
							</div>

							<div class="form-group">
								<!-- Date input -->
								<label class="control-label col-sm-4" for="date"
									style="text-align: left">Date and time of Examination:</label>
								<div class="col-sm-3">
									<input name="DOE" type="date" class="form-control"
										id="date_of_exam"
										value="{{ctrl.myData1[0].dateOfExamination}}" readonly>
								</div>
								<div class="col-sm-2">
									<input name="Time" type="time" class="form-control"
										id="time_of_exam"
										value="{{ctrl.myData1[0].timeOfExamination}}" readonly>
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-sm-4" for="informant_name"
									style="text-align: left">Informant's Name:</label>
								<div class="col-sm-5">

									<input type="text" class="form-control" id="informant_name"
										placeholder="Enter informant's name"
										value="{{ctrl.myData1[0].informantName}}" readonly>
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-sm-4" style="text-align: left">Informant's
									type:</label>
								<div class="col-sm-2" ng-model="ctrl.myData1.informantType">
									<label class="radio-inline"> <input name="infor-type"
										id="type-e" type="radio" ng-model="ctrl.myData1.informantType"
										ng-checked="ctrl.myData1[0].informantType == 'Eyewitness'"
										ng-true-value="Eyewitness" value="Eyewitness" disabled="disabled" />Eyewitness
									</label>
								</div>
								<div class="col-sm-2">
									<label class="radio-inline"> <input name="infor-type"
										id="type-w" type="radio" ng-model="ctrl.myData1.informantType"
										ng-checked="ctrl.myData1[0].informantType == 'Hearsay'"
										ng-true-value="Hearsay" value="Hearsay" disabled="disabled"/>Hearsay
									</label>
								</div>
							</div>

							<div class="form-group">
								<!-- Date input -->
								<label class="control-label col-sm-4" for="date-of-injury"
									style="text-align: left">Date and time of injury:</label>
								<div class="col-sm-3">
									<input name="DOI" type="date" class="form-control"
										id="date_of_injury" value="{{ctrl.myData1[0].dateOfInjury}}" readonly>
								</div>
								<div class="col-sm-2">
									<input name="TOI" type="time" class="form-control"
										id="time_of_injury" value="{{ctrl.myData1[0].timeOfInjury}}" readonly>
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-sm-4" style="text-align: left">Place
									of Injury:</label>
								<div class="col-sm-5">
									<input type="text" class="form-control" id="place-of-injury"
										value="{{ctrl.myData1[0].placeOfInjury}}" readonly>
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-sm-4" for="history"
									style="text-align: left">History of injury in detail:</label>
								<div class="col-sm-5">
									<ul class="list-group">
										<li class="list-group-item">Incident:
											<div class="container-fluid">
												<div class="col-sm-3">
													<label class="radio-inline"> <input name="incident"
														id="input-rta" value="RTA" type="radio"
														ng-checked="ctrl.myData1[0].incidentScenario == 'RTA'"
														ng-true-value="RTA" disabled="disabled"/>RTA
													</label>
												</div>
												<div class="col-sm-3">
													<label class="radio-inline"> <input name="incident"
														id="input-fall" value="Fall" type="radio"
														ng-checked="ctrl.myData1[0].incidentScenario == 'Fall'"
														ng-true-value="Fall" disabled="disabled"/>Fall
													</label>
												</div>
												<div class="col-sm-3">
													<label class="radio-inline"> <input name="incident"
														id="input-assault" value="Assa ult" type="radio"
														ng-checked="ctrl.myData1[0].incidentScenario == 'Assault'"
														ng-true-value="Assault" disabled="disabled"/>Assault
													</label>
												</div>
												<div class="col-sm-2">
													<label class="radio-inline"> <input name="incident"
														id="input-other" value="Other" type="radio"
														ng-model="ctrl.myData1.injuryScenario"
														ng-checked="ctrl.myData1[0].incidentScenario == 'Other'"
														ng-true-value="Other" disabled="disabled"/>Other
													</label>
												</div>
											</div>

										</li>
										<li class="list-group-item">Victim Type:
											<div class="container-fluid">
												<div class="col-sm-3">
													<label class="radio-inline"> <input name="victim"
														id="input-driver" value="Driver" type="radio"
														ng-checked="ctrl.myData1[0].victimType == 'Driver'"
														ng-true-value="Driver" disabled="disabled"/>Driver
													</label>
												</div>
												<div class="col-sm-4">
													<label class="radio-inline"> <input name="victim"
														id="input-pass" value="Passenger" type="radio"
														ng-checked="ctrl.myData1[0].victimType == 'Passenger'"
														ng-true-value="Passenger" disabled="disabled"/>Passenger
													</label>
												</div>
												<div class="col-sm-3">
													<label class="radio-inline"> <input name="victim"
														id="input-pedest" value="Pedestrian" type="radio"
														ng-checked="ctrl.myData1[0].victimType == 'Pedestrian'"
														ng-true-value="Pedestrian" disabled="disabled"/>Pedestrian
													</label>
												</div>

											</div>

										</li>
										<li class="list-group-item">Helmet:
											<div class="container-fluid">
												<div class="col-sm-3">
													<label class="radio-inline"> <input name="helmet"
														id="input-yes" value="Yes" type="radio"
														ng-checked="ctrl.myData1[0].helmet == 1"
														ng-true-value="Yes" disabled="disabled"/>Yes
													</label>
												</div>
												<div class="col-sm-3">
													<label class="radio-inline"> <input name="helmet"
														id="input-no" value="No" type="radio"
														ng-checked="ctrl.myData1[0].helmet == 0"
														ng-true-value="No" disabled="disabled"/>No
													</label>
												</div>
											</div>

										</li>
										<li class="list-group-item">Alcohol Intake:
											<div class="container-fluid">
												<div class="col-sm-3">
													<label class="radio-inline"> <input name="alcohol"
														id="input-yes" value="Yes" type="radio"
														ng-checked="ctrl.myData1[0].alcoholIntake == 1"
														ng-true-value="Yes" disabled="disabled"/>Yes
													</label>
												</div>
												<div class="col-sm-3">
													<label class="radio-inline"> <input name="alcohol"
														id="input-no" value="No" type="radio"
														ng-checked="ctrl.myData1[0].alcoholIntake == 0"
														ng-true-value="No" disabled="disabled"/>No
													</label>
												</div>
											</div>

										</li>
									</ul>
								</div>
							</div>
						</div>
					</form>
				</div>

				<!--INCIDENT DATA FORM END-->
				<br>
				<!--PHYSICAL EXAMINATION FORM START-->
				<div id="physicalForm" class="container-fluid"
					style="border: 1px solid black; border-radius: 20px;">
					<h3>
						<strong><u>PHYSICAL EXAMINATION:</u></strong>
					</h3>
					<br>
					<form class="form-horizontal">
						<div class="form-group">

							<div class="col-sm-12">
								<label class="control-label" for="history"
									style="text-align: left">History of injury in detail:</label>

								<div>
									<input type="checkbox"
										ng-checked="ctrl.myData2[0].lossOfConsciousness == 1" disabled="disabled"/>Loss
									Of Consciousness
									<div class="container-fluid" ng-if="ctrl.myData2[0].lossOfConsciousness"> 
										<div ng-if="ctrl.myData2[0].locFlag!=1 && ctrl.myData2[0].locDescription!=null">
											<textarea ng-show="!ctrl.myData2[0].locFlag;"
												class="form-control" rows="5" id="locText"
												ng-model="ctrl.myData2[0].locDescription"
												placeholder="Description" style="width: 100%" readonly></textarea>
										</div>
										<!-- textarea closed -->
										<div ng-if="ctrl.myData2[0].locFlag==1 && ctrl.myData2[0].locDescription!=null">
											<div>
												<img ng-show="ctrl.myData2[0].locFlag"
													ng-src="data:image/JPEG;base64,{{ctrl.myData7.locDescription}}"
													height="220" width="701" />
											</div>
										</div>
										<div ng-if="ctrl.myData2[0].locDescription==null">
											<span>(No Description)</span>
										</div>
										<!-- touchpad closed -->
									</div>
									<!-- container closed -->
								</div>
								<!-- loc closed -->
								<br>

								<div>
									<input type="checkbox"
										ng-checked="ctrl.myData2[0].lucidInterval == 1" disabled="disabled"/>Lucid
									Interval
									<!--  true is assigned to val2 when checkbox is checked and in this case "true" is assigned to ng-true-value and "false" is assigned to ng-false-value-->
									<div class="container-fluid" ng-if="ctrl.myData2[0].lucidInterval">
										<div ng-if="ctrl.myData2[0].lucidFlag!=1 && ctrl.myData2[0].lucidDescription!=null">
											<textarea ng-show="!ctrl.myData2[0].lucidFlag;"
												class="form-control" rows="5" id="lucidText"
												ng-model="ctrl.myData2[0].lucidDescription"
												placeholder="Description" style="width: 100%" readonly></textarea>
										</div>
										<!-- textarea closed -->
										<div ng-if="ctrl.myData2[0].lucidFlag==1 && ctrl.myData2[0].lucidDescription!=null">
											<div>
												<img ng-show="ctrl.myData2[0].lucidFlag"
													ng-src="data:image/JPEG;base64,{{ctrl.myData7.lucidDescription}}"
													height="220" width="701" />
											</div>
										</div>
										<!-- touchpad closed -->
										<div ng-if="ctrl.myData2[0].lucidDescription==null">
											<span>(No Description)</span>
										</div>
									</div>
									<!-- container closed -->
								</div>
								<!-- lucid division closed -->
								<br>

								<div>
									<input type="checkbox"
										ng-checked="ctrl.myData2[0].seizures == 1" disabled="disabled"/>Seizures
									<div class="container-fluid" ng-if="ctrl.myData2[0].seizures">
										<div ng-if="ctrl.myData2[0].seizureFlag!=1 && ctrl.myData2[0].seizuresDescription!=null">
											<textarea ng-show="!ctrl.myData2[0].seizureFlag;"
												class="form-control" rows="5" id="seizureText"
												ng-model="ctrl.myData2[0].seizuresDescription"
												placeholder="Description" style="width: 100%" readonly></textarea>
										</div>
										<!-- textarea closed -->
										<div ng-if="ctrl.myData2[0].seizureFlag==1 && ctrl.myData2[0].seizuresDescription!=null">
											<div>
												<img ng-show="ctrl.myData2[0].seizureFlag"
													ng-src="data:image/JPEG;base64,{{ctrl.myData7.seizureDescription}}"
													height="220" width="701" />
											</div>
										</div>
										<!-- touchpad closed -->
										<div ng-if="ctrl.myData2[0].seizuresDescription==null">
											<span>(No Description)</span>
										</div>
									</div>
									<!-- container closed -->
								</div>
								<!-- seizure division closed -->
								<br>

								<div>
									<input type="checkbox"
										ng-checked="ctrl.myData2[0].vomiting == 1" disabled="disabled"/>Vomiting
									<div class="container-fluid" ng-if="ctrl.myData2[0].vomiting">
										<div ng-if="ctrl.myData2[0].vomitingFlag !=1 && ctrl.myData2[0].vomitingDescription!=null">
											<textarea ng-show="!ctrl.myData2[0].vomitingFlag;"
												class="form-control" rows="5" id="vomitingText"
												ng-model="ctrl.myData2[0].vomitingDescription"
												placeholder="Description" style="width: 100%" readonly></textarea>
										</div>
										<!-- textarea closed -->
										<div ng-if="ctrl.myData2[0].vomitingFlag==1 && ctrl.myData2[0].vomitingDescription!=null">
											<div>
												<img ng-show="ctrl.myData2[0].vomitingFlag"
													ng-src="data:image/JPEG;base64,{{ctrl.myData7.vomitingDescription}}"
													height="220" width="701" />
											</div>
										</div>
										<!-- touchpad closed -->
										<div ng-if="ctrl.myData2[0].vomitingDescription==null">
											<span>(No Description)</span>
										</div>
									</div>
									<!-- container closed -->
								</div>
								<!-- vomiting division closed -->
								<br>

								<div>
									<input type="checkbox"
										ng-checked="ctrl.myData2[0].amnesia == 1" disabled="disabled"/>Amnesia
									<div class="container-fluid" ng-if="ctrl.myData2[0].amnesia">
										<div ng-if="ctrl.myData2[0].amnesiaFlag!=1 && ctrl.myData2[0].amnesiaDescription!=null">
											<textarea ng-show="!ctrl.myData2[0].amnesiaFlag;"
												class="form-control" rows="5" id="amnesiaText"
												ng-model="ctrl.myData2[0].amnesiaDescription"
												placeholder="Description" style="width: 100%" readonly></textarea>
										</div>
										<!-- textarea closed -->
										<div ng-if="ctrl.myData2[0].amnesiaFlag==1 && ctrl.myData2[0].amnesiaDescription!=null">
											<div>
												<img ng-show="ctrl.myData2[0].amnesiaFlag"
													ng-src="data:image/JPEG;base64,{{ctrl.myData7.amnesiaDescription}}"
													height="220" width="701" />
											</div>
										</div>
										<!-- touchpad closed -->
										<div ng-if="ctrl.myData2[0].amnesiaDescription==null">
											<span>(No Description)</span>
										</div>
									</div>
									<!-- container closed -->
								</div>
								<!-- amnesia division closed -->
								<br>

								<div>
									Bleeding from:
									<input type="checkbox"
										ng-checked="ctrl.myData2[0].bleedingFromEar== 1" disabled="disabled"/> Ear
									<input type="checkbox"
										ng-checked="ctrl.myData2[0].bleedingFromNose== 1" disabled="disabled"/> Nose
									<div class="container-fluid" ng-if="ctrl.myData2[0].bleedingFromEar==1 || ctrl.myData2[0].bleedingFromNose==1">
										<div ng-if="ctrl.myData2[0].bleedingFromFlag!=1 && ctrl.myData2[0].bleedingFromDescription!=null">
											<textarea ng-show="!ctrl.myData2[0].bleedingFromFlag;"
												class="form-control" rows="5" id="bleedingFrmText"
												ng-model="ctrl.myData2[0].bleedingFromDescription"
												placeholder="Description" style="width: 100%" readonly></textarea>
										</div>
										<!-- textarea closed -->
										<div ng-if="ctrl.myData2[0].bleedingFromFlag==1 && ctrl.myData2[0].bleedingFromDescription!=null">
											<div>
												<img ng-show="ctrl.myData2[0].bleedingFromFlag"
													ng-src="data:image/JPEG;base64,{{ctrl.myData7.bleedingFromDescription}}"
													height="220" width="701" />
											</div>
										</div>
										<!-- touchpad closed -->
										<div ng-if="ctrl.myData2[0].bleedingFromDescription==null">
											<span>(No Description)</span>
										</div>
									</div>
									<!-- container closed -->
								</div>
								<!-- bleedingfrom division closed -->
							</div>
						</div>

						<div class="form-group">
							<div>
								<label class="control-label col-sm-12" style="text-align: left">Vital
									signs on Arrival:</label>
							</div>
							<br>
							<div class="col-sm-12">
								<ul class="list-group">
									<li class="list-group-item"><strong>Airway on
											arrival:</strong>
										<div class="container-fluid">
											<div class="col-sm-4">
												<label class="radio-inline"> <input name="airway"
													id="type-c"
													ng-checked="ctrl.myData2[0].airwayOnArrival=='Clear'"
													value="Clear" type="radio" disabled="disabled"/>Clear
												</label>
											</div>
											<div class="col-sm-4">
												<label class="radio-inline"> <input name="airway"
													id="type-r"
													ng-checked="ctrl.myData2[0].airwayOnArrival=='Requires Intubation'"
													value="Requires Intubation" type="radio" disabled="disabled"/>Requires
													Intubation
												</label>
											</div>
										</div></li>

									<li class="list-group-item"><strong>Spontaneous
											Respiration</strong>
										<div class="container-fluid">
											<div class="col-sm-4">
												<label class="radio-inline"> <input
													name="Spontaneous" id="type-c"
													ng-checked="ctrl.myData2[0].spontaneousRespiration=='Normal'"
													value="Normal" type="radio" disabled="disabled"/>Normal
												</label>
											</div>
											<div class="col-sm-4">
												<label class="radio-inline"> <input
													name="Spontaneous" id="type-r"
													ng-checked="ctrl.myData2[0].spontaneousRespiration=='Tachypnoeic'"
													value="Tachypnoeic" type="radio" disabled="disabled"/>Tachypnoeic
												</label>
											</div>
											<div class="col-sm-4">
												<label class="radio-inline"> <input
													name="Spontaneous" id="type-g"
													ng-checked="ctrl.myData2[0].spontaneousRespiration=='Gasping'"
													value="Gasping" type="radio" disabled="disabled"/>Gasping
												</label>
											</div>
										</div></li>

									<li class="list-group-item ">
										<div class="container-fluid">
											<label class="col-sm-4"><strong>Pulse
													Rate(/min):</strong></label>
											<div class="col-sm-4">
												<input type="text" class="form-control" id="pulse"
													value="{{ctrl.myData2[0].pulseRrate }}" readonly/>
											</div>
										</div>
									</li>

									<li class="list-group-item">
										<div class="container-fluid">
											<label class="col-sm-4"><strong>Blood
													Pressure on Arrival(/mmHg):</strong></label>
											<div class="col-sm-4">
												<input type="text" class="form-control" id="bp"
													value="{{ctrl.myData2[0].bpOnArrival}}" readonly/>
											</div>
										</div>
									</li>

									<li class="list-group-item">
										<div class="container-fluid">
											<label class="col-sm-4"><strong>Blood
													Pressure After Half Hour(/mmHg):</strong></label>
											<div class="col-sm-4">
												<input type="text" class="form-control" id="bpafter"
													value="{{ctrl.myData2[0].bpAfterHalfHour}}" readonly/>
											</div>
										</div>
									</li>
								</ul>
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-12">
								<label class="control-label col-sm-12" style="text-align: left">Systemic
									Examination:</label>
								<div>
									<div class="col-sm-4">
										<label class="radio-inline"> <input name="csf"
											id="type-r" ng-checked="ctrl.myData2[0].csf=='Rhinorrhoea'"
											value="Rhinorrhoea" type="radio" disabled="disabled"/>Rhinorrhoea
										</label>
									</div>
									<div class="col-sm-4">
										<label class="radio-inline"> <input name="csf"
											id="type-o" ng-checked="ctrl.myData2[0].csf=='Otorrhoea'"
											value="Otorrhoea" type="radio" disabled="disabled"/> Otorrhoea
										</label>
									</div>
									<div class="col-sm-4">
										<label class="radio-inline"> <input name="csf"
											id="type-b" ng-checked="ctrl.myData2[0].csf=='Both'"
											value="Both" type="radio" disabled="disabled"/>Both
										</label>
									</div>

									<div class="container-fluid" ng-if="ctrl.myData2[0].csf">
										<div ng-if="ctrl.myData2[0].csfFlag!=1 && ctrl.myData2[0].csfDesc!=null">
											<textarea ng-show="!ctrl.myData2[0].csfFlag;"
												class="form-control" rows="5" id="csfText"
												ng-model="ctrl.myData2[0].csfDesc" placeholder="Description"
												style="width: 100%" readonly></textarea>
										</div>

										<div ng-if="ctrl.myData2[0].csfFlag==1 && ctrl.myData2[0].csfDesc!=null">
											<div>
												<img ng-show="ctrl.myData2[0].csfFlag"
													ng-src="data:image/JPEG;base64,{{ctrl.myData7.csfDesc}}"
													height="220" width="701" />
											</div>
										</div>
										<!-- touchpad closed -->
										<div ng-if="ctrl.myData2[0].csfDesc==null">
											<span>(No Description)</span>
										</div>
									</div>
									<!--container closed  -->
								</div>
								<!-- csf division closed -->

								<div>
									<input type="checkbox"
										ng-checked="ctrl.myData2[0].activePeripheralBleeding==1"
										id="type-apb" value="Active peripheral Bleeding" disabled="disabled"/>Active
									peripheral Bleeding
									<div class="container-fluid" ng-if="ctrl.myData2[0].activePeripheralBleeding">
										<div ng-if="ctrl.myData2[0].activePeripheralBleedingFlag!=1 && ctrl.myData2[0].activePeripheralBleedingDesc!=null">
											<textarea
												ng-show="!ctrl.myData2[0].activePeripheralBleedingFlag;"
												class="form-control" rows="5" id="apbText"
												ng-model="ctrl.myData2[0].activePeripheralBleedingDesc"
												placeholder="Description" style="width: 100%" readonly></textarea>
										</div>
										<!-- textarea closed -->

										<div ng-if="ctrl.myData2[0].activePeripheralBleedingFlag==1 && ctrl.myData2[0].activePeripheralBleedingDesc!=null">
											<div>
												<img ng-show="ctrl.myData2[0].activePeripheralBleedingFlag"
													ng-src="data:image/JPEG;base64,{{ctrl.myData7.activeDesc}}"
													height="220" width="701" />
											</div>
										</div>
										<!-- touchpad closed -->
										<div ng-if="ctrl.myData2[0].activePeripheralBleedingDesc==null">
											<span>(No Description)</span>
										</div>
									</div>
									<!-- container closed -->
								</div>
								<!-- active peripheral bleeding division closed -->

								<div>
									<input type="checkbox"
										ng-checked="ctrl.myData2[0].fractures==1" id="type-fracture"
										value="Fractures" disabled="disabled"/>Fractures
									<div class="container-fluid" ng-if="ctrl.myData2[0].fractures">
										<div ng-if="ctrl.myData2[0].fracturesFlag!=1 && ctrl.myData2[0].fracturesDesc!=null">
											<textarea ng-show="!ctrl.myData2[0].fracturesFlag;"
												class="form-control" rows="5" id="fractureText"
												ng-model="ctrl.myData2[0].fracturesDesc"
												placeholder="Description" style="width: 100%" readonly></textarea>
										</div>
										<!-- textarea closed -->
										<div ng-if="ctrl.myData2[0].fracturesFlag==1 && ctrl.myData2[0].fracturesDesc!=null">
											<div>
												<img ng-show="ctrl.myData2[0].fracturesFlag"
													ng-src="data:image/JPEG;base64,{{ctrl.myData7.fractureDesc}}"
													height="220" width="701" />
											</div>
										</div>
										<!-- touchpad closed -->
										<div ng-if="ctrl.myData2[0].fracturesDesc==null">
											<span>(No Description)</span>
										</div>
									</div>
									<!-- container closed -->
								</div>
								<!-- fractures division closed -->

								<div>
									<input type="checkbox"
										ng-checked="ctrl.myData2[0].peripheralPulses==1" id="type-pp"
										value="Peripheral Pulses" disabled="disabled"/>Peripheral Pulses
									<div class="container-fluid" ng-if="ctrl.myData2[0].peripheralPulses">
										<div ng-if="ctrl.myData2[0].peripheralPulsesFlag!=1 && ctrl.myData2[0].peripheralPulsesDesc!=null">
											<textarea ng-show="!ctrl.myData2[0].peripheralPulsesFlag;"
												class="form-control" rows="5" id="fractureText"
												ng-model="ctrl.myData2[0].peripheralPulsesDesc"
												placeholder="Description" style="width: 100%" readonly></textarea>
										</div>
										<!-- textarea closed -->
										<div ng-if="ctrl.myData2[0].peripheralPulsesFlag==1 && ctrl.myData2[0].peripheralPulsesDesc!=null">
											<div>
												<img ng-show="ctrl.myData2[0].peripheralPulsesFlag"
													ng-src="data:image/JPEG;base64,{{ctrl.myData7.peripheralDesc}}"
													height="220" width="701" />
											</div>
										</div>
										<!-- touchpad closed -->
										<div ng-if="ctrl.myData2[0].peripheralPulsesDesc==null">
											<span>(No Description)</span>
										</div>
									</div>
									<!-- container closed -->
								</div>
								<!--peripheral pulses division closed -->

								<div>
									<input type="checkbox"
										ng-checked="ctrl.myData2[0].chestInjury==1" id="type-ci"
										value="Chest Injury" disabled="disabled"/>Chest Injury
									<div class="container-fluid" ng-if="ctrl.myData2[0].chestInjury">
										<div ng-if="ctrl.myData2[0].chestInjuryFlag!=1 && ctrl.myData2[0].chestInjuryDesc!=null">
											<textarea ng-show="!ctrl.myData2[0].chestInjuryFlag;"
												class="form-control" rows="5" id="chestinjuryText"
												ng-model="ctrl.myData2[0].chestInjuryDesc"
												placeholder="Description" style="width: 100%" readonly></textarea>
										</div>
										<!-- textarea closed -->
										<div ng-if="ctrl.myData2[0].chestInjuryFlag==1 && ctrl.myData2[0].chestInjuryDesc!=null">
											<div>
												<img ng-show="ctrl.myData2[0].chestInjuryFlag"
													ng-src="data:image/JPEG;base64,{{ctrl.myData7.chestInjuryDes}}"
													height="220" width="701" />
											</div>
										</div>
										<!-- touchpad closed -->
										<div ng-if="ctrl.myData2[0].chestInjuryDesc==null">
											<span>(No Description)</span>
										</div>
									</div>
									<!-- container closed -->
								</div>
								<!-- chest injury division closed -->

								<div>
									<input type="checkbox"
										ng-checked="ctrl.myData2[0].abdominalInjury==1" id="type-ai"
										value="Abdominal Injury" disabled="disabled"/>Abdominal Injury
									<div class="container-fluid" ng-if="ctrl.myData2[0].abdominalInjury">
										<div ng-if="ctrl.myData2[0].abdominalInjuryFlag!=1 && ctrl.myData2[0].abdominalInjuryDesc!=null">
											<textarea ng-show="!ctrl.myData2[0].abdominalInjuryFlag;"
												class="form-control" rows="5" id="abdominalInjuryText"
												ng-model="ctrl.myData2[0].abdominalInjuryDesc"
												placeholder="Description" style="width: 100%" readonly></textarea>
										</div>
										<!-- textarea closed -->
										<div ng-if="ctrl.myData2[0].abdominalInjuryFlag==1 && ctrl.myData2[0].abdominalInjuryDesc!=null">
											<div>
												<img ng-show="ctrl.myData2[0].abdominalInjuryFlag"
													ng-src="data:image/JPEG;base64,{{ctrl.myData7.abdominalDescription}}"
													height="220" width="701" />
											</div>
										</div>
										<!-- touchpad closed -->
										<div ng-if="ctrl.myData2[0].abdominalInjuryDesc==null">
											<span>(No Description)</span>
										</div>
									</div>
									<!-- container closed -->
								</div>
								<!-- abdominal injury division closed -->

								<div>
									<input type="checkbox" ng-checked="ctrl.myData2[0].wounds==1"
										id="type-w" value="Abdominal Injury" disabled="disabled"/>Wounds
									<div class="container-fluid" ng-if="ctrl.myData2[0].wounds">
										<div ng-if="ctrl.myData2[0].woundsFlag!=1 && ctrl.myData2[0].woundsDesc!=null">
											<textarea ng-show="!ctrl.myData2[0].woundsFlag;"
												class="form-control" rows="5" id="woundsText"
												ng-model="ctrl.myData2[0].woundsDesc"
												placeholder="Description" style="width: 100%" readonly></textarea>
										</div>
										<!-- textarea closed -->
										<div ng-if="ctrl.myData2[0].woundsFlag==1 && ctrl.myData2[0].woundsDesc!=null">
											<div>
												<img ng-show="ctrl.myData2[0].woundsFlag"
													ng-src="data:image/JPEG;base64,{{ctrl.myData7.woundsDesc}}"
													height="220" width="701" />
											</div>
										</div>
										<!-- touchpad closed -->
										<div ng-if="ctrl.myData2[0].woundsDesc==null">
											<span>(No Description)</span>
										</div>
									</div>
									<!-- container closed -->
								</div>
								<!-- wounds division closed -->

								<div>
									<label class="control-label col-sm-12" style="text-align: left">Details
										Of Spine Examination:</label>
									<div class="control-label col-sm-12">	
										<div class="col-sm-4">
											<label class="radio-inline"> <input name="spinal"
												id="type-t" ng-checked="ctrl.myData2[0].spinalTenderness==1"
												value="Spinal Tenderness" type="checkbox" disabled="disabled"/>Spinal Tenderness
											</label>
										</div>
										<div class="col-sm-4">
											<label class="radio-inline"> <input name="spinal"
												id="type-d" ng-checked="ctrl.myData2[0].spinalDeformity==1"
												value="Spinal Deformity" type="checkbox" disabled="disabled"/>Spinal Deformity
											</label>
										</div>
									</div>
									<div class="container-fluid" ng-if="ctrl.myData2[0].spinalTenderness==1 || ctrl.myData2[0].spinalDeformity==1">
										<div ng-if="ctrl.myData2[0].spinalFlag!=1 && ctrl.myData2[0].spinalDesc!=null">
											<textarea ng-show="!ctrl.myData2[0].spinalFlag;"
												class="form-control" rows="5" id="spinalText"
												ng-model="ctrl.myData2[0].spinalDesc"
												placeholder="Description" style="width: 100%" readonly></textarea>
										</div>
										<div ng-if="ctrl.myData2[0].csfFlag==1 && ctrl.myData2[0].spinalDesc!=null">
											<div>
												<img ng-show="ctrl.myData2[0].spinalFlag"
													ng-src="data:image/JPEG;base64,{{ctrl.myData7.spinalDesc}}"
													height="220" width="701" />
											</div>
										</div>
										<!-- touchpad closed -->
										
										<div ng-if="ctrl.myData2[0].spinalDesc==null">
											<span>(No Description)</span>
										</div>
									</div>
									<!--container closed  -->
								</div>
								<!-- spinal division closed -->
							</div>
						</div>
					</form>
				</div>
				<!--PHYSICAL EXAMINATION FORM END-->
				<br>

				<!--NEUROLOGICAL EXAMINATION FORM START-->
				<div id="neurologicalForm" class="container-fluid"
					style="border: 1px solid black; border-radius: 20px;">
					<form class="form-horizontal">

						<div class="form-group">
							<h3 class="control-label col-xs-6" style="text-align: left">
								<strong><u>NEUROLOGICAL EXAMINATION</u></strong>
							</h3>
						</div>
						<br>

						<div class="form-group">
							<label class="control-label col-xs-10" style="text-align: left">
								Details of sensorium initially and after primary
								resuscitation(write appropriate score)</label>
						</div>

						<div class="form-group">
							<h4 class="control-label col-xs-6" style="text-align: centre">
								<b>Glasgow Coma Scale</b>
							</h4>
						</div>

						<div class="form-group">
							<label class="control-label col-xs-4"
								style="text-align: left; padding-left: 50px;"> Eye
								Openeing Score : </label>
						</div>

						<div>
							<div class="form-group"
								style="text-align: left; padding-left: 50px; float: left;">
								<label class="control-label col-xs-4"
									style="text-align: left; float: left"> Initial </label>

								<div ng-hide="ctrl.editMode"
									ng-switch="ctrl.myData3[0].eyeOpeneingScoreInitial"
									class="col-xs-8">
									<input type="text" class="form-control"
										id="eye_Openeing_Score_Initial" ng-switch-when="1"
										value="No response" readonly> 
									<input type="text"
										class="form-control" id="eye_Openeing_Score_Initial"
										ng-switch-when="2" value="To pain" readonly> 
									<input type="text"
										class="form-control" id="eye_Openeing_Score_Initial"
										ng-switch-when="3" value="To verbal command" readonly> 
									<input
										type="text" class="form-control"
										id="eye_Openeing_Score_Initial" ng-switch-when="4"
										value="Spontaneously" readonly> 
									<input type="text"
										class="form-control" id="eye_Openeing_Score_Initial"
										ng-switch-default value="--" readonly>
								</div>
							</div>

							<div class="form-group"
								style="text-align: left; padding-right: 50px; padding-left: 50px; float: right;">
								<label class="control-label col-xs-5"
									style="text-align: left; float: left"> After
									resuscitation </label>


								<div ng-hide="ctrl.editMode"
									ng-switch="ctrl.myData3[0].eyeOpeneingScoreInitial"
									class="col-xs-7">
									<input type="text" class="form-control"
										id="eye_Openeing_Score_After" ng-switch-when="1"
										value="No response" readonly> 
									<input type="text"
										class="form-control" id="eye_Openeing_Score_After"
										ng-switch-when="2" value="To pain" readonly> 
									<input type="text"
										class="form-control" id="eye_Openeing_Score_After"
										ng-switch-when="3" value="To verbal command" readonly> 
									<input
										type="text" class="form-control" id="eye_Openeing_Score_After"
										ng-switch-when="4" value="Spontaneously" readonly> 
									<input
										type="text" class="form-control" id="eye_Openeing_Score_After"
										ng-switch-default value="--" readonly>
								</div>


							</div>
						</div>

						<br> <br>

						<div class="form-group">
							<label class="control-label col-xs-4"
								style="text-align: left; padding-left: 50px;"> Motor
								Response Score : </label>
						</div>

						<div>
							<div class="form-group"
								style="text-align: left; padding-left: 50px; float: left;">
								<label class="control-label col-xs-4"
									style="text-align: left; float: left"> Initial </label>

								<div ng-switch="ctrl.myData3[0].motorResponseScoreInitial"
									class="col-xs-8">
									<input type="text" class="form-control"
										id="motor_response_Score_initial" ng-switch-when="1"
										value="No response" readonly> 
									<input type="text"
										class="form-control" id="motor_response_Score_initial"
										ng-switch-when="2" value="Decerebrate" readonly> 
									<input
										type="text" class="form-control"
										id="motor_response_Score_initial" ng-switch-when="3"
										value="Decorticate" readonly> 
									<input type="text"
										class="form-control" id="motor_response_Score_initial"
										ng-switch-when="4" value="Flexian Withdrawal" readonly> 
									<input
										type="text" class="form-control"
										id="motor_response_Score_initial" ng-switch-when="5"
										value="Localise pain" readonly> 
									<input type="text"
										class="form-control" id="motor_response_Score_initial"
										ng-switch-when="6" value="Obey" readonly> 
									<input type="text"
										class="form-control" id="motor_response_Score_initial"
										ng-switch-default value="--" readonly>
								</div>

							</div>

							<div class="form-group"
								style="text-align: left; padding-right: 50px; padding-left: 50px; float: right;">
								<label class="control-label col-xs-5"
									style="text-align: left; float: left"> After
									resuscitation </label>

								<div ng-switch="ctrl.myData3[0].motorResponseScoreAfterRes"
									class="col-xs-7">
									<input type="text" class="form-control"
										id="motor_response_Score_after" ng-switch-when="1"
										value="No response" readonly> 
									<input type="text"
										class="form-control" id="motor_response_Score_after"
										ng-switch-when="2" value="Decerebrate" readonly> 
									<input
										type="text" class="form-control"
										id="motor_response_Score_after" ng-switch-when="3"
										value="Decorticate" readonly> 
									<input type="text"
										class="form-control" id="motor_response_Score_after"
										ng-switch-when="4" value="Flexian Withdrawal" readonly> 
									<input
										type="text" class="form-control"
										id="motor_response_Score_after" ng-switch-when="5"
										value="Localise pain" readonly> 
									<input type="text"
										class="form-control" id="motor_response_Score_after"
										ng-switch-when="6" value="Obey" readonly> 
									<input type="text"
										class="form-control" id="motor_response_Score_after"
										ng-switch-default value="--" readonly>
								</div>
							</div>
						</div>

						<br> <br>

						<div class="form-group">
							<label class="control-label col-xs-4"
								style="text-align: left; padding-left: 50px;"> Response
								Score : </label>
						</div>

						<div>
							<div class="form-group"
								style="text-align: left; padding-left: 50px; float: left;">
								<label class="control-label col-xs-4"
									style="text-align: left; float: left"> Initial </label>

								<div ng-switch="ctrl.myData3[0].verbalResponseScoreInitial"
									class="col-xs-8">
									<input type="text" class="form-control"
										id="verbal_response_Score_initial" ng-switch-when="1"
										value="No response" readonly> 
									<input type="text"
										class="form-control" id="verbal_response_Score_initial"
										ng-switch-when="2" value="Incomprehensible sounds" readonly> 
									<input
										type="text" class="form-control"
										id="verbal_response_Score_initial" ng-switch-when="3"
										value="Inappro Words" readonly> 
									<input type="text"
										class="form-control" id="verbal_response_Score_initial"
										ng-switch-when="4" value="Disoriented" readonly> 
									<input
										type="text" class="form-control"
										id="verbal_response_Score_initial" ng-switch-when="5"
										value="Oriented" readonly> 
									<input type="text"
										class="form-control" id="verbal_response_Score_initial"
										ng-switch-default value="--" readonly>
								</div>

							</div>

							<div class="form-group"
								style="text-align: left; padding-right: 50px; padding-left: 50px; float: right;">
								<label class="control-label col-xs-5"
									style="text-align: left; float: left"> After
									resuscitation </label>

								<div ng-switch="ctrl.myData3[0].verbalResponseScoreAfterRes"
									class="col-xs-7">
									<input type="text" class="form-control"
										id="verbal_response_Score_after" ng-switch-when="1"
										value="No response" readonly> 
									<input type="text"
										class="form-control" id="verbal_response_Score_after"
										ng-switch-when="2" value="Incomprehensible sounds" readonly> 
									<input
										type="text" class="form-control"
										id="verbal_response_Score_after" ng-switch-when="3"
										value="Inappro Words" readonly> 
									<input type="text"
										class="form-control" id="verbal_response_Score_after"
										ng-switch-when="4" value="Disoriented" readonly> 
									<input
										type="text" class="form-control"
										id="verbal_response_Score_after" ng-switch-when="5"
										value="Oriented" readonly> 
									<input type="text"
										class="form-control" id="verbal_response_Score_after"
										ng-switch-default value="--" readonly>
								</div>

							</div>
						</div>
						<br> <br>

						<div class="form-group">
							<label class="control-label col-sm-10" style="text-align: left">
								Horizontal oculocephalic reflex </label> <br> <br>

							<div class="col-sm-8" style="padding-left: 5em">
								<label class="control-label col-sum-2"
									style="text-align: left; padding-right: 1em;">Right : </label>
								<label class="radio-inline"> <input type="radio"
									name="radioPresentR"
									ng-model="ctrl.myData3.horizontalOculocephalicReflexRight"
									ng-checked="ctrl.myData3[0].horizontalOculocephalicReflexRight == 'present'"
									ng-true-value="present" value="present" disabled>Present
								</label> <label class="radio-inline"> <input type="radio"
									name="radioAbsentR"
									ng-model="ctrl.myData3.horizontalOculocephalicReflexRight"
									ng-checked="ctrl.myData3[0].horizontalOculocephalicReflexRight == 'absent'"
									ng-true-value="absent" value="absent" disabled>Absent
								</label> <label class="radio-inline"> <input type="radio"
									name="radioNotTestedR"
									ng-model="ctrl.myData3.horizontalOculocephalicReflexRight"
									ng-checked="ctrl.myData3[0].horizontalOculocephalicReflexRight == 'not_tested'"
									ng-true-value="not_tested" value="not_tested" disabled>Not
									Tested
								</label>
							</div>
							<div class="col-sm-8" style="padding-left: 5em">
								<label class="control-label col-sum-2"
									style="text-align: left; padding-right: 1em;"> Left : </label>
								<label class="radio-inline"> <input type="radio"
									name="radioPresentL"
									ng-model="ctrl.myData3.horizontalOculocephalicReflexLeft"
									ng-checked="ctrl.myData3[0].horizontalOculocephalicReflexLeft == 'present'"
									ng-true-value="present" value="present" disabled> Present
								</label> <label class="radio-inline"> <input type="radio"
									name="radioAbsentL"
									ng-model="strl.myData3.horizontalOculocephalicReflexLeft"
									ng-checked="ctrl.myData3[0].horizontalOculocephalicReflexLeft == 'absent'"
									ng-true-value="absent" value="absent" disabled> Absent
								</label> <label class="radio-inline"> <input type="radio"
									name="radioNotTestedL"
									ng-model="ctrl.myData3.horizontalOculocephalicReflexLeft"
									ng-checked="ctrl.myData3[0].horizontalOculocephalicReflexLeft == 'not_tested'"
									ng-true-value="not_tested" value="not_tested" disabled> Not
									Tested
								</label>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-10" style="text-align: left">
								Pupilliary Light reflex </label> <br> <br>
							<div class="col-sm-8" style="padding-left: 5em">
								<label class="control-label col-sum-2"
									style="text-align: left; padding-right: 1em;"> Right :
								</label> <label class="radio-inline"> <input type="radio"
									name="radioPresentPupR"
									ng-model="ctrl.myData3.pupiliaryLightReflexRight"
									ng-checked="ctrl.myData3[0].pupiliaryLightReflexRight == 'normal'"
									ng-true-value="normal" value="normal" disabled> Normal
								</label> <label class="radio-inline"> <input type="radio"
									name="radioAbsentPupR"
									ng-model="ctrl.myData3.pupiliaryLightReflexRight"
									ng-checked="ctrl.myData3[0].pupiliaryLightReflexRight == 'sluggish'"
									ng-true-value="sluggish" value="sluggish" disabled> Sluggish
								</label> <label class="radio-inline"> <input type="radio"
									name="radioNotTestedPupR"
									ng-model="ctrl.myData3.pupiliaryLightReflexRight"
									ng-checked="ctrl.myData3[0].pupiliaryLightReflexRight == 'absent'"
									ng-true-value="absent" value="absent" disabled> Absent
								</label> <label class="radio-inline"> <input type="radio"
									name="radioNotTested"
									ng-model="ctrl.myData3.pupiliaryLightReflexRight"
									ng-checked="ctrl.myData3[0].pupiliaryLightReflexRight == 'cannot_access'"
									ng-true-value="cannot_access" value="cannot_access" disabled>
									Cannot Access
								</label>
							</div>

							<div class="col-sm-8" style="padding-left: 5em">
								<label class="control-label col-sum-2"
									style="text-align: left; padding-right: 1em;"> Left : 
								</label>
								<label class="radio-inline"> <input type="radio"
									name="radioPresentPupL"
									ng-model="ctrl.myData3.pupiliaryLightReflexLeft"
									ng-checked="ctrl.myData3[0].pupiliaryLightReflexLeft == 'normal'"
									ng-true-value="normal" value="normal" disabled> Normal
								</label> 
								<label class="radio-inline"> <input type="radio"
									name="radioAbsentPupL"
									ng-model="ctrl.myData3.pupiliaryLightReflexLeft"
									ng-checked="ctrl.myData3[0].pupiliaryLightReflexLeft == 'sluggish'"
									ng-true-value="sluggish" value="sluggish" disabled> Sluggish
								</label> 
								<label class="radio-inline"> <input type="radio"
									name="radioNotTestedPupL"
									ng-model="ctrl.myData3.pupiliaryLightReflexLeft"
									ng-checked="ctrl.myData3[0].pupiliaryLightReflexLeft == 'absent'"
									ng-true-value="absent" value="absent" disabled> Absent
								</label> 
								<label class="radio-inline"> <input type="radio"
									name="radioNotTestedPupL"
									ng-model="ctrl.myData3.pupiliaryLightReflexLeft"
									ng-checked="ctrl.myData3[0].pupiliaryLightReflexLeft == 'cannot_access'"
									ng-true-value="cannot_access" value="cannot_access" disabled> Cannot
									Access
								</label>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-10" style="text-align: left">
								Motor System Examination</label>
						</div>

						<div class="form-group" style="padding-left: 5em;">
							<div class="container-fluid">

								<div class="row">
									<div class="col-xs-2 "></div>
									<div class="col-xs-5 ">
										<label class="control-label" style="text-align: left">Right</label>
									</div>
									<div class="col-xs-5 ">
										<label class="control-label" style="text-align: left">Left</label>
									</div>
								</div>

								<div class="row" style="padding-top: 1em;">
									<div class="col-xs-2">
										<label class="control-label" style="text-align: left">Upper:
										</label>
									</div>
									<div class="col-xs-5"
										style="background-color: lavender; padding-bottom: 1em;">
										<label class="control-label" style="text-align: left">Tone:
										</label> <input type="text" class="form-control" id="toneUpperRight"
											value="{{ctrl.myData3[0].motorSystemExaminationUpperRightTone}}" readonly/>
									</div>
									<div class="col-xs-5"
										style="background-color: lavender; padding-bottom: 1em;">
										<label class="control-label " style="text-align: left">Tone:
										</label> <input type="text " class="form-control" id="toneUpperLeft"
											value="{{ctrl.myData3[0].motorSystemExaminationUpperLeftTone}}" readonly />
									</div>
								</div>

								<div class="row ">
									<div class="col-xs-2 "></div>
									<div class="col-xs-5"
										style="background-color: lavender; padding-bottom: 1em;">
										<label class="control-label" style="text-align: left">Power:
										</label> <input type="text" class="form-control" id="powerUpperRight"
											value="{{ctrl.myData3[0].motorSystemExaminationUpperRightPower}}" readonly/>
									</div>
									<div class="col-xs-5"
										style="background-color: lavender; padding-bottom: 1em;">
										<label class="control-label " style="text-align: left">Power:
										</label> <input type="text " class="form-control" id="powerUpperRight"
											value="{{ctrl.myData3[0].motorSystemExaminationUpperLeftPower}}" readonly/>
									</div>
								</div>

								<div class="row " style="padding-top: 1em;">
									<div class="col-xs-2 ">
										<label class="control-label " style="text-align: left">Lower:
										</label>
									</div>
									<div class="col-xs-5 "
										style="background-color: lavender; padding-bottom: 1em;">
										<label class="control-label" style="text-align: left">Tone:
										</label> <input type="text" class="form-control" id="toneLowerRight"
											value="{{ctrl.myData3[0].motorSystemExaminationLowerRightTone}}" readonly/>
									</div>
									<div class="col-xs-5"
										style="background-color: lavender; padding-bottom: 1em;">
										<label class="control-label " style="text-align: left">Tone:
										</label> <input type="text" class="form-control" id="toneLowerLeft"
											value="{{ctrl.myData3[0].motorSystemExaminationLowerLeftTone}}" readonly/>
									</div>
								</div>

								<div class="row ">
									<div class="col-xs-2"></div>
									<div class="col-xs-5"
										style="background-color: lavender; padding-bottom: 1em;">
										<label class="control-label" style="text-align: left">Power:
										</label> <input type="text" class="form-control" id="powerLowerRight"
											value="{{ctrl.myData3[0].motorSystemExaminationLowerLeftPower}}" readonly/>
									</div>
									<div class="col-xs-5"
										style="background-color: lavender; padding-bottom: 1em;">
										<label class="control-label " style="text-align: left">Power:
										</label> <input type="text" class="form-control" id="powerLowerLeft"
											value="{{ctrl.myData3[0].motorSystemExaminationLowerRightPower}}" readonly/>
									</div>
								</div>

							</div>
						</div>

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
								<div ng-if="ctrl.myData3[0].anyOtherNeurologicalDeficits==null">
									<span>No Details<span>
								</div>
							</div>
						</div>
					</form>

				</div>
				<!--NEUROLOGICAL EXAMINATION FORM END-->
				<br>
				<!--CLINICAL EXAMINATION FORM START-->
				<div id="clinicalForm" class="container-fluid "
					style="border: 1px solid black; border-radius: 20px;">
					<h3>
						<strong><u>CLINICAL EXAMINATION:</u></strong>
					</h3>
					<br>
					<form class="form-horizontal ">
						<div class="form-group ">
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
						</div>

						<div class="form-group ">
							<label class="control-label col-sm-4 " style="text-align: left">CT
								scan head showed : </label>
							<div class="container-fluid">
								<div class="col-sm-12"
									ng-if="!ctrl.myData4[0].ctScanHeadSketchPad;">
									<textarea ng-show="!ctrl.myData4[0].ctScanHeadSketchPad;"
										class="form-control" rows="5" id="other"
										ng-model="ctrl.myData4[0].ctScanHead"
										placeholder="Description" style="width: 100%" readonly></textarea>
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
										<img class="col-sm-12"
											ng-show="ctrl.myData4[0].managementPlan"
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

		</div>
	</div>
</body>
</html>
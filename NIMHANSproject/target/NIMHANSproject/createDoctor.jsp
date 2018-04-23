<%
 
	HttpSession session2 = request.getSession();
	String uname = (String) session2.getAttribute("uname");				
%>


<html ng-app="createDoctor">

<head>
    <meta charset="UTF-8">

    <title>Create Patient</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">

    <script src="bootstrap/js/jquery-3.1.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="angular.js"></script>
	<script src="createDoctor_NG.js"></script>
	<script src="GlobalURL.js"></script>
	

    <!-- Custom Fonts -->
    <link href="bootstrap/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

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

<body style="background-color:#eceff1;">
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
                <button type="button" class="navbar-toggle collapsed" style="background-color: darkgrey;" data-toggle="collapse" data-target="#bs-menu-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>

            <div class="collapse navbar-collapse" id="bs-menu-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="adminHome.jsp">Home</a></li>
                </ul>

                <ul class="nav navbar-right navbar-nav">
                    <form class="navbar-form navbar-left" role="search">

                    </form>

                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <%=uname%> <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="#"><i class="fa fa-fw fa-user"></i> Profile</a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-fw fa-gear"></i> Settings</a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="LogoutServlet"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                            </li>
                        </ul>
                    </li>
                </ul>

            </div>

        </nav>
    </div>

    <div class="container-fluid">

		<div id="newForm" class="col-md-10 col-sm-10" ng-controller="createDoctorCtrl as ctrl">
            <div class="jumbotron" style="background-color:white; min-height:1000px;">
                <div class="container-fluid" style="border:1px solid black; border-radius: 20px;">
                    <h3><strong>CREATE NEW Doctor</strong></h3>
                    <br>

                    <form class="form-horizontal">                    
                        
                      <div class="media-body">
                        <div class="form-group">
                            <label class="control-label col-sm-4" style="text-align: left">Doctor ID : </label>
                            <div class="col-sm-5">
                                 <input type="text" class="form-control" id="did" placeholder="Enter Doctor ID" ng-model="ctrl.dData.did">
                            </div>
                            
                           <button type="button" class="btn btn-info" ng-click="ctrl.generateDoctorID()">Generate ID</button> 
						</div>
						
                       <div class="form-group">
							<label class="control-label col-sm-4" style="text-align: left">Doctor Name : </label>
                            <div class="col-sm-5">
                                 <input type="text" class="form-control" id="dname" placeholder="Enter Doctor Name" ng-model="ctrl.dData.dname">
                            </div>
						</div>
						
                       <div class="form-group">
							<label class="control-label col-sm-4" style="text-align: left">Doctor Contact : </label>
                            <div class="col-sm-5">
                                 <input type="text" class="form-control" id="dcontact" placeholder="Enter Doctor Contact" ng-model="ctrl.dData.dcontact">
                            </div>
						</div>

                       <div class="form-group">
							<label class="control-label col-sm-4" style="text-align: left">Doctor Email : </label>
                            <div class="col-sm-5">
                                 <input type="text" class="form-control" id="demail" placeholder="Enter Doctor Email" ng-model="ctrl.dData.demail">
                            </div>
						</div>

                       <div class="form-group">
							<label class="control-label col-sm-4" style="text-align: left">Doctor Address : </label>
                            <div class="col-sm-5">
                                 <input type="text" class="form-control" id="daddress" placeholder="Enter Doctor Address" ng-model="ctrl.dData.daddress">
                            </div>
						</div>
	
                       <div class="form-group">
							<label class="control-label col-sm-4" style="text-align: left">Doctor Department : </label>
                            <div class="col-sm-5">
                                 <input type="text" class="form-control" id="ddept" placeholder="Enter Doctor Department" ng-model="ctrl.dData.ddept">
                            </div>
                        </div>

						<div class="form-group">
							<label class="control-label col-sm-4" style="text-align: left">Security Question : </label>
							<div class="col-sm-5">
									<!--Dropdown  -->

									<input list="question" class="form-control" id="ques" placeholder="Choose security question " type="text" ng-model="ctrl.uData.secQues">

									<datalist id="question">
										<option
											value="What was the name of your elementary / primary school?" />
										<option
											value="In what city or town does your nearest sibling live?" />
										<option value="Which day of the week were you born?" />
									</datalist>

								</div>

							</div>


							<div class="form-group">
								<label class="control-label col-sm-4" style="text-align: left">Security Answer : </label>
								<div class="col-sm-5">
									<input type="text" class="form-control" id="ans"
										placeholder="Enter Answer" ng-model="ctrl.uData.secAns">
								</div>

							</div>

							<div class="form-group">
								<label class="control-label col-sm-4" style="text-align: left">Password : </label>
								<div class="col-sm-5">
									<input type="password" class="form-control" id="pass"
										placeholder="Enter New Password" ng-model="ctrl.uData.password">
								</div>

							</div>
							<br>
                        <div class="form-group">
                            <div class="col-sm-offset-4 col-sm-3">
                                <button type="button" class="btn btn-success" ng-click="ctrl.confirmSubmit()">Submit</button>
                            </div>
                        </div>
                      </div>
                    </form>
                </div>

                </div>

        </div>
    </div>
	<div class="footer navbar-fixed-bottom"
		style="background-color: #455a64">
					  <p>Trauma Centre, NIMHANS, Bangalore-560029, India</p>   
 
	</div>
</body>
</html>
<%
 
	HttpSession session2 = request.getSession();
	String uname = (String) session2.getAttribute("uname");				
%>
<html ng-app="viewPatient">

<head>
    <meta charset="UTF-8">

    <title>View Patient</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">

    <script src="bootstrap/js/jquery-3.1.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="angular.js"></script>
	<script src="ViewPatient_NG.js"></script>
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
                    <li><a href="doctorHome.jsp">Home</a></li>
                </ul>

                <ul class="nav navbar-right navbar-nav">
                    <form class="navbar-form navbar-left" role="search">

                    </form>

                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> Dr. <%=uname%> <b class="caret"></b></a>
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

		<div id="newForm" class="col-md-10 col-sm-10" ng-controller="viewPatientCtrl as ctrl">
            <div class="jumbotron" style="background-color:white; min-height:1000px;">
                <div class="container-fluid" style="border:1px solid black; border-radius: 20px;">
                    <h3><strong>VIEW PATIENT</strong></h3>
                    <br>

                    <form class="form-horizontal">                    
                        
                      <div class="media-body">
                        <div class="form-group">
                            <label class="control-label col-sm-4" style="text-align: left">Patient ID : </label>
                            <div class="col-sm-5">
                                 <input type="text" class="form-control" id="pid" value="{{ctrl.pData.pid}}" readonly>
                            </div>
                   
						</div>
						
                       <div class="form-group">
							<label class="control-label col-sm-4" style="text-align: left">Patient Name : </label>
                            <div class="col-sm-5">
                                 <input type="text" class="form-control" id="pname" value="{{ctrl.pData.pname}}" readonly>
                            </div>
						</div>
						
                       <div class="form-group">
							<label class="control-label col-sm-4" style="text-align: left">Patient Contact : </label>
                            <div class="col-sm-5">
                                 <input type="text" class="form-control" id="pcontact" value="{{ctrl.pData.pcontact}}" readonly>
                            </div>
						</div>

                       <div class="form-group">
							<label class="control-label col-sm-4" style="text-align: left">Patient Email : </label>
                            <div class="col-sm-5">
                                 <input type="text" class="form-control" id="pemail"  value="{{ctrl.pData.pemail}}" readonly>
                            </div>
						</div>

                       <div class="form-group">
							<label class="control-label col-sm-4" style="text-align: left">Patient Address : </label>
                            <div class="col-sm-5">
                                 <input type="text" class="form-control" id="paddress" value="{{ctrl.pData.paddress}}" readonly>
                            </div>
						</div>
	
                       <div class="form-group">
							<label class="control-label col-sm-4" style="text-align: left">Patient Age : </label>
                            <div class="col-sm-5">
                                 <input type="text" class="form-control" id="pAge" value="{{ctrl.pData.age}}" readonly>
                            </div>
                        </div>
						
                        <div class="form-group">
                            <label class="control-label col-sm-4" style="text-align: left">Gender:</label>
                            <div class="col-sm-2">
                                <label class="radio-inline">
									<input name="gender" id="input-gender-male" ng-checked="ctrl.pData.gender == 'M'"
										ng-true-value="M" value="M" type="radio" disabled="disabled"/>Male
                                </label>
                            </div>
                            <div class="col-sm-2" >
                                <label class="radio-inline">
                                <input name="gender" id="input-gender-female" ng-checked="ctrl.pData.gender == 'F'"
										ng-true-value="F" value="F" type="radio" disabled="disabled"/>Female
                                </label>
                            </div>
                        </div>
						<br>
                      
                      </div>
                    </form>
                </div>

                </div>

        </div>
    </div>
</body>
</html>
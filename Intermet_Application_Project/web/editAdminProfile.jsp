<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>Edit Profile</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<script src="js/jquery.min.js"></script>
		<script src="js/skel.min.js"></script>
		<script src="js/skel-layers.min.js"></script>
		<script src="js/init.js"></script>
		<noscript>
			<link rel="stylesheet" href="css/skel.css" />
			<link rel="stylesheet" href="css/style.css" />
			<link rel="stylesheet" href="css/style-xlarge.css" />
		</noscript>
	</head>
	<body>

		<!-- Header -->
		<header id="header">
				<h1><a href="adminHome.jsp">ADE </a></h1>
				<nav id="nav">
					<ul>
						<li><a href="adminHome.jsp">Home</a></li>
						<li><a href="viewAircrafts.jsp">Aircrafts</a></li>
						<li><a href="viewFlights.jsp">Flights</a></li>
						<li><a href="editAdminProfile.jsp">Edit Profile</a></li>
						<li><a href="index.jsp" class="button special">Log Out</a></li>
						
					</ul>
				</nav>
			</header>

		

		<!-- Code Here -->
			<div class="container 50%">
			<br> <br> 
            <form action="EditAdminProfile" method="post">
                <h2> Edit profile  </h2>
                <li><input type="text" name="NName" value="" placeholder="First Name" /></li>
                <br>
                <li><input type="text" name="LName" value="" placeholder="Last Name" /></li>
                <br>
                <li><input type="email" name="NEmail" value="" placeholder="Email"/></li>
                <br>
                <li><input type="password" name="Npassword" placeholder="Password"></li>
                <br>
                <input value="Edit" class="special big" type="submit">
            </form>
				</div>

			<div class="container 50%">	
				<h1 align="left">
			    	OR  
				</h1>
			</div>
			
			<br>
			<div class="container 50%">
                <form action="adminHome.jsp" method="post">
                    <input value="cancel" class="special big" type="submit">
				</form>
	
			</div>
			<br>
			<br>

		

		<br> <br> <br><br><br><br>
		<!-- Footer -->
			<footer id="footer">
				<div class="container">
					<ul class="copyright">
						<li><a href="#">Contact us</a></li>
						<li> <a href="#">About us</a></li>
					</ul>
				</div>
			</footer>

	</body>
</html>
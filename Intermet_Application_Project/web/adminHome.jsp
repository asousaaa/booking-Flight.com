<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>Home</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />

		<script src="js/jquery.min.js"></script>
		<script src="js/skel.min.js"></script>
		<script src="js/init.js"></script>

	</head>
	<body class="landing">
            <%
         
            
            %>
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

		<!-- Banner -->
			<section id="banner">
				<h2>Welcome to website.</h2>
			
			</section>
 <br> <br>
		
			<div class="container">
					<form action="addAircraft.jsp" method="post">
						<ul class="actions">
							<li><input value="Add Aircraft" type="submit"></li>
						</ul>
					</form>
				</div>
			<br>

			<div class="container">
				<form action="addFlight.jsp" method="post">
					<ul class="actions">
						<li><input value="Add Flight" type="submit"></li>
					</ul>
				</form>
			</div>
			<br>

			<div class="container">
				<form action="updateAircraft.jsp" method="post">
					<ul class="actions">
						<li><input value="Update Aircraft" type="submit"></li>
					</ul>
				</form>
			</div>
			<br>

			<div class="container">
				<form action="updateFlight.jsp" method="post">
					<ul class="actions">
						<li><input value="Update flight" type="submit"></li>
					</ul>
				</form>
			</div>
			<br>

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
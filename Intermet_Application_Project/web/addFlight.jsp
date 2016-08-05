<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Add Flight</title>
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
        
        <script>
        function validate(form)
                    {
                        var now = new Date();
                        now=now.toISOString().substring(0, 10);
                        var target = form.date.value;
                        if(target < now)
                        {
                           alert("the choosen date must be a future date");
                            return false;
                        }
                        else
                        {
                            return true;
                        }
                    }
                </script>
    </head>
    <body>

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
        <div class="container 50%">
            <br> <br> 
            <form action="viewFlights.jsp" method="post" onsubmit="return validate(this);">
            <h2> Add Flight  </h2>
            <li>Source: </li>
                <input type="text" name="source" value="" required/>
                <br>
                <li>Destination: </li>
                <input type="text" name="destination" value="" required/>
                <br>
                <li> Number Of Seats for First Class: </li>
                <input type="number" name="numOfSeatsforFirst" value="" required/>
                <br> <br>
                <li> Price of First Class Ticket: </li>
                <input type="number" name="priceOfFirst" value="" required/>
                <br> <br>
                <li>Number Of Seats for Business Class: </li>
                <input type="number" name="numOfSeatsforBusiness" value="" required/>
                <br> <br>
                <li>Price of Business Class Ticket:</li>
                <input type="number" name="priceOfBusiness" value="" required/>
                <br><br>
                <li>Number Of Seats for Economy Class:</li>
                <input type="number" name="numOfSeatsforEconomy" value="" required/>
                <br><br>
                <li>Price of Economy Class Ticket:</li>
                <input type="number" name="priceOfEconomy" value="" required/>
                <br><br>
                <li>Flight Date:</li>
                <input type="date" name="date" required>
                <br><br>
                <li>Flight time:</li>
                <input type="time" name="time" required>
                <br><br>
                <li>AirCraft ID:</li>
                <input type="number" name="airCraftId" required>
                <br><br>
                <input value="Add Flight" class="special big" type="submit">
            </form>
        </div>
        <br><br><br><br>
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
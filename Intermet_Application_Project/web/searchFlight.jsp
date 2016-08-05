<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Search Flight</title>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <meta name="description" content="" />
        <meta name="keywords" content="" />
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
    <header id="header">
        <h1><a href="index.jsp">ADE</a></h1>
        <nav id="nav">
        <ul>
            <li><a href="userHome.jsp">Home</a></li>
            <li><a href="searchFlight.jsp">Search</a></li>						
            <li><a href="edit_profile.jsp">Edit Profile</a></li>
            <li><a href="index.jsp" class="button special">Log Out</a></li>
        </ul>
        </nav>
    </header>
    <div class="container 50%">
        <form NAME="form" action="SearchAvaliableFlights" method="post" onsubmit="return validate(this)" ><br>
            <h2> Search: </h2>
            <li><input required type="text" name="source" value="" placeholder="From" /></li> 
            <br>
            <li><input required type="text" name="destination" value="" placeholder="To" /></li>  
            <br>
            <li><input required type="text" name="numOfSeats1" value="" placeholder="Number Of Seats in First Class"/></li>
            <br>
            <li><input required type="text" name="numOfSeats2" value="" placeholder="Number Of Seats in Business Class"/></li>
            <br>
            <li><input required type="text" name="numOfSeats3" value="" placeholder="Number Of Seats in Economy Class "/></li>
            <br>
            <li> <input required type="date" name="date" placeholder="Date"> </li>
            <br> <br> <br> <br>
            <input value="Search" class="special big" type="submit">
        </form>
    </div>
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
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Sign Up</title>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <meta name="description" content="" />
        <meta name="keywords" content="" />
        <script src="js/jquery.min.js"></script>
        <script src="js/skel.min.js"></script>
        <script src="js/init.js"></script>
        <script type="text/javascript" src="js/jquery.js"></script>
        
        <script type="text/javascript"> 
        function sendajax(){
                       
            alert("ana hena");
            var Email = document.getElementById("Email").value;
            var xmlhttp = new XMLHttpRequest();
            
            xmlhttp.open("POST","process_ajax",true);
            xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xmlhttp.send("Email="+Email");

            
            xmlhttp.onreadystatechange=function()
            {
                if (xmlhttp.readyState==4 && xmlhttp.status==200)
                {
                    if(xmlhttp.responseText == "email already exist choose another one" )
                    {
                        document.getElementById("show_response").innerHTML=xmlhttp.responseText;
                        return false;
                    }
                     
                }
                
                document.getElementById("show_response").innerHTML=xmlhttp.status;
                else return true;
            }
        }
    </script> 
       
        
        
    </head>
    <body class="landing">
    <!-- Banner -->
    <section id="banner">
        <h2>Hi. This is ADE.</h2>
        <p>Travel safe with us.</p>
    </section>
    <br> <br> <br>
    
    <div class="container 50%">  :
        <form action="confirm_sign_up.jsp" method="post" onsubmit="return sendajax();">
            <h2> sign up from here </h2>
            <li><input type="text" name="FName" value="" placeholder="First Name" required/></li> 
            <br>
            <li><input type="text" name="LName" value="" placeholder="Last Name" required/></li>  
            <br>
            <li><input type="email" name="Email" value="" placeholder="Email" required/></li>
            <div id="show_response"></div>
            <br>
            <li> <input type="password" name="password" placeholder="Password" required/></li>
            <br>
                <select  name="type">
                <option value="admin">admin</option>
                <option value="user">user</option>
                </select>
            <br> <br> <br> <br>
            <input value="sign up" class="special big" type="submit">
        </form>
    </div>
    <br><br><br>
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
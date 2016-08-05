<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>ADE</title>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <meta name="description" content="" />
        <meta name="keywords" content="" />
        <script src="js/jquery.min.js"></script>
        <script src="js/skel.min.js"></script>
        <script src="js/init.js"></script>
    </head>
    <body class="landing">
    <!-- Banner -->
    <section id="banner">
        <h2>Hi. This is ADE.</h2>
        <p>Travel safe with us.</p>
    </section>
        <br> <br> <br>
				
    <div class="container 50%">
        <form action=" Confrim_login.jsp" method="post">
            <h2> login from here </h2>
            <li><input type="email" name="Email" placeholder="Email" required/></li>
            <br>
            <li> <input type="password" name="password" placeholder="Password" required></li>
            <br>
                <select  name="type">   
                    <option value="admin">admin</option>
                    <option value="user">user</option>
                </select>
            <br><br>
            <input value="login" class="special big" type="submit">
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
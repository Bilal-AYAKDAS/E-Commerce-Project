<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
        <meta name="viewport" content="width=device-width, initial-scale=1">

    <title> E -Commerce Login </title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function() { 
        });
    
    function loginFonks(){
        var email = $('#email').val();
        var password = $('#password').val();
        var dogrumu ="";
        $.ajax({
            url: "ajaxLogin.jsp", 
            type: "GET",
            data: {
                email: email,
                password: password
            },
            success: function(responseMessage) {
            dogrumu = responseMessage.trim(); 
            if(dogrumu =="1"){
                alert("Giriş Başarılı.");
                window.location.href = "http://localhost:8080/ECommerceProject/mainPage.jsp";
            }else if(dogrumu =="0"){
                alert("Şİfre yada email bilgisi hatalı.Tekrar deneyin");
            }
            },
            error: function(xhr, status, error) {
                console.error(error);
            }
        });
            
    }
    </script>
</head>
<body>

    <div style ="display: flex; flex-direction: column; ">
        <div id="image" style=" margin-left: 500px; margin-top: 100px; width:350px; height:100px;" class="box"><img src="images/novanest.jpeg" style="width: 450px;height: 100px;"/></div>
        <div style="margin-top: 0px;" >
            <table style="margin-left: 500px;">
                <tr>
                    <div class="form-outline mb-4">
                        <th>Email address </th>
                        <td><input type="email" id="email" class="form-control"/></td>
                    </div>
                </tr>
                <tr>
                    <div class="form-outline mb-4">
                        <th>Password </th>
                        <td><input type="password" id="password" class="form-control"/></td>
                    </div>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="form2Example31" checked />
                        <label class="form-check-label" for="form2Example31"> Remember me </label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>  
                        <button type="button" onclick="loginFonks()"style="width:250px;" class="btn btn-primary mb-4">Sign in</button>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td><div class="text-center"><p>Not a member? <a href="http://localhost:8080/ECommerceProject/signUp.jsp">Register</a></p></div></td>
                </tr>
            </table>
        </div>
    </div>
</body>
</html>


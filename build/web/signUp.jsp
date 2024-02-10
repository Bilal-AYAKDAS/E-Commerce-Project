<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title> E -Commerce Login </title>
    
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function() { 
            // Sayfa yüklendiğinde çalışacak JavaScript/jQuery kodları
            // Örnek bir butona tıklama event'i ve Ajax isteği
        });
    
    function signUpFonks(){
        var name = $('#name').val();
        var surname = $('#surname').val();
        var address = $('#address').val();
        var email = $('#email').val();
        var phoneNumber = $('#phoneNumber').val();
        var userName = $('#userName').val();
        var password = $('#password').val();

        $.ajax({
            url: "ajaxSignUp.jsp", 
            type: "GET",
            data: {
                name: name,                
                surname:surname,
                address:address,
                email: email,
                phoneNumber:phoneNumber,
                userName:userName,
                password: password
            },
            success: function(responseMessage) {
             alert(responseMessage);
             window.location.href = "http://localhost:8080/ECommerceProject/Login.jsp";

            },
            error: function(xhr, status, error) {
                alert("Kayıt Edilemedi Hatalı.");
                console.error(error);
            }
        });
            
    }
    </script>
</head>
<body>
    <div><form>
      <!-- Email input -->
      <table style="margin-left: 500px;margin-top: 100px">
          <tr>
            <div class="form-outline mb-4">
                <th>Name:</th>
                <td><input type="name" id="name" class="form-control"/></td>
            </div>
        </tr>
          <tr>					
            <div class="form-outline mb-4">
                <th>Surname:</th>
                <td><input type="text" id="surname" class="form-control"/></td>
            </div>
        </tr>
          <tr>
            <div class="form-outline mb-4">
                <th>Address:</th>
                <td><textarea id="address" style="height: 100px; width: 250px;" class="form-control"/></textarea>
            </div>
        </tr>
        <tr>
            <div class="form-outline mb-4">
                <th>Email: </th>
                <td><input type="email" id="email" class="form-control"/></td>
            </div>
        </tr>
        <tr>
            <div class="form-outline mb-4">
                <th>Phone Number:</th>
                <td><input type="text" id="phoneNumber" class="form-control"/></td>
            </div>
        </tr>
        <tr>
            <div class="form-outline mb-4">
                <th>User name:</th>
                <td><input type="text" id="userName" class="form-control"/></td>
            </div>
        </tr>
        <tr><!-- Password input -->
            <div class="form-outline mb-4">
                <th>Password </th>
                <td><input type="password" id="password" class="form-control"/></td>
            </div>
        </tr>
                
        <tr>
            <td></td>
            <td>  <!-- Submit button -->
                <button type="button" onclick="signUpFonks()"style="width:250px;" class="btn btn-primary mb-4">Sign Up</button>
            </td>
        </tr>
        
        
    </table>
      
      <!-- 2 column grid layout for inline styling -->
      <div class="">
    
        <div  id="result" class="col d-flex justify-content-center">
          <!-- Checkbox -->
                   
        </div>
        
      </div>

    
      
</form></div>

</body>
</html>


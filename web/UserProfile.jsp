<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
    String userId = (String)session.getAttribute("userId");

    String name = "";
    String surname = "";
    String userName = "";
    String address = "";
    String email = "";
    String phoneNumber = "";
    String password = "";
 
    String url = "jdbc:postgresql://localhost/ecommerce";
    Connection connection;
    ResultSet rs;
    String sqlstr = "SELECT name,surname,username,adress,email,phone_number,password FROM users WHERE user_id = "+userId+";";
    Statement st;
    Class.forName("org.postgresql.Driver");
    connection = DriverManager.getConnection(url,"postgres","root");
    st = connection.createStatement();
    rs = st.executeQuery(sqlstr);
     
    rs.next();
    name = rs.getString(1);
    surname = rs.getString(2);
    userName = rs.getString(3);
    address = rs.getString(4);
    email = rs.getString(5);
    phoneNumber = rs.getString(6);
    password = rs.getString(7);
    %>
<head>
    <title> E -Commerce Login </title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <script>
        $(document).ready(function() { 
        });
    
    function userUpdt(){
        var address = $('#address').val();
        var email = $('#email').val();
        var phoneNumber = $('#phoneNumber').val();
        var password = $('#password').val();
        $.ajax({
            url: "ajaxUserUpdt.jsp", 
            type: "GET",
            data: {address:address,
                    email: email,
                    phoneNumber:phoneNumber,
                    password: password
            },
            success: function(responseMessage) {
             alert("Kayıt başarılı");
             window.location.reload();

            },
            error: function(xhr, status, error) {
                alert("Kayıt Edilemedi Hatalı.");
                console.error(error);
            }
        });
            
    }
    </script>
    <style>
        body {
    

.form-control:focus {
    box-shadow: none;
    border-color: #BA68C8
}

.profile-button {
    background: rgb(99, 39, 120);
    box-shadow: none;
    border: none
}

.profile-button:hover {
    background: #682773
}

.profile-button:focus {
    background: #682773;
    box-shadow: none
}

.profile-button:active {
    background: #682773;
    box-shadow: none
}

.back:hover {
    color: #682773;
    cursor: pointer
}

.labels {
    font-size: 11px
}

.add-experience:hover {
    background: #BA68C8;
    color: #fff;
    cursor: pointer;
    border: solid 1px #BA68C8
}
    </style>
</head>
<body>
    <div style ="display: flex; flex-direction: row;padding-left: 0px; background-color: #f0f0f0;" >
            <div onclick="location.href='http://localhost:8080/ECommerceProject/mainPage.jsp';" id="image" style="width:250px; height:80px;" class="box"><img src="images/novanest.jpeg" style="width: 250px;height: 80px;"/></div>
            <div id="search" style="width:535px;" class="box">
                     
            </div>
            <div id="hesabımButton" style=" margin-left:1px; margin-top: 7px;  width:110px;" class="box">
                <button onclick="location.href ='http://localhost:8080/ECommerceProject/UserProfile.jsp';" class="btn btn-primary"><i class="fas fa-user-circle"></i>Hesabım</button>
            </div>
            <div id="favoriButton" style=" margin-left:1px; margin-top: 7px;  width:120px;" class="box">
                <button onclick="location.href='http://localhost:8080/ECommerceProject/favoriProducts.jsp';" class="btn btn-danger"><i class="fas fa-heart"></i>Favorilerim</button>
            </div>
           <div id="sepetButton" style=" margin-left: 5px; margin-top: 7px;  width:110px;" class="box">
                <button onclick="location.href='http://localhost:8080/ECommerceProject/basket.jsp';" class="btn btn-warning"><i class="fas fa-shopping-cart"></i>Sepetim</button>
            </div>
            <div id="ordersButton" style=" margin-left:1px; margin-top: 7px;  width:130px;" class="box">
                <button onclick="location.href='http://localhost:8080/ECommerceProject/orders.jsp';" class="btn btn-success"><i class="fas fa-list"></i> Siparişlerim</button>
            </div>   
        </div>
   <div class="container-fluid bg-white mt-5 mb-5">
       
        <div class="col-md-5 " style="margin-left: 400px;">
            <div class="p-3 py-5">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4 class="text-right">Kullanıcı Bilgileri </h4>
                </div>
                <div class="row mt-2">
                    <div class="col-md-6"><label class="labels">Adı</label><input  type="text" class="form-control" placeholder="first name" readonly disabled value="<%=name%>"></div>
                    <div class="col-md-6"><label class="labels">Soyadı</label><input type="text" class="form-control" value="<%=surname%>" readonly disabled placeholder="surname"></div>
                    <div class="col-md-12"><label class="labels">Kullanıcı Adı</label><input type="text" class="form-control" placeholder="enter email id" readonly disabled  value="<%=userName%>"></div>

                </div>
                <div class="row mt-3">
                    <div class="col-md-12"><label class="labels">Telefon</label><input id="phoneNumber" type="text" class="form-control" placeholder="enter phone number" value="<%=phoneNumber%>"></div>
                    <div class="col-md-12"><label class="labels">Adres</label> <input id="address" type="text" class="form-control"  placeholder="enter address line 1" value="<%=address%>"></div>
                    <div class="col-md-12"><label class="labels">Email</label><input id="email" type="text" class="form-control" placeholder="enter email id" value="<%=email%>"></div>
                    <div class="col-md-12"><label class="labels">Şifre</label><input id="password" type="text" class="form-control" placeholder="enter email id" value="<%=password%>"></div>

                </div>
                    <div class="mt-5 text-center"><button onclick="userUpdt()" class="btn btn-primary profile-button" type="button" style="width:550px; ">Kaydet</button></div>
            </div>
        </div>
        
    </div>

</body>
</html>


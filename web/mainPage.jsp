<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.sql.DataSource" %>

<!DOCTYPE html>
<html>
<head>
    <% 
        String userId = (String)session.getAttribute("userId");
    %>   

    <title> E -Commerce Main </title>
    
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

    <style>
        .wrapper {
    /* Örnek genel stil ayarları */
    width: 100%;
    max-width: 1200px;
    margin: 0 auto;
}

.header {
    /* Üst kısım stilleri */
    background-color: #f0f0f0;
    padding: 20px;
    /* Diğer gerekli stil ayarları */
}

.main-content {
    /* Alt kısım (ana içerik) stilleri */
    padding: 20px;
    /* Diğer gerekli stil ayarları */
}
    </style>
    <script>
        
        $(document).ready(function() { 
            getMenu();
            getProducts();
            $('#yenileme-kapalı').click(function(event) {
                event.preventDefault(); // Formun gönderimini engelle
            });
            $('#searchButton').click(function(event) {
                event.preventDefault(); 
            });
        });
    
    function showHiddenDiv(submenuseemId) {
    var divElement = document.getElementById(submenuseemId);
        if (divElement.style.display === "block") {
            divElement.style.display = "none"; // Elementi gizle
        } else {
            divElement.style.display = "block"; // Elementi göster
        }
    }
    
    function getMenu(){
        $.ajax({
            url: "ajaxGetMenu.jsp", 
            type: "GET", // 
            success: function(response) {                
                $("#menu").html(response); 
            },
            error: function(xhr, status, error) {
                console.error(error); 
            }
        });
    }
    
   function subMenu(menuNo){
        var menuId = menuNo;
        $.ajax({
            url: "ajaxGetSubMenu.jsp", 
            type: "GET", 
            data: {
                menuId: menuId
            },
            success: function(response) {                
                $("#submenuseem" + menuId).html(response); 
            },
            error: function(xhr, status, error) {
                console.error(error); 
            }
        });
    }

    function getProducts(){
        var productName = $('#searchingProducts').val();
        $.ajax({
            url: "ajaxGetProductsSearch.jsp", 
            type: "GET",
            data: {
                productName: productName
            },
            success: function(response) {                
                $("#third").html(response); 
            },
            error: function(xhr, status, error) {
                console.error(error); 
            }
        });
    }
    
    function getProductsSubMenu(subMenuId){
        $.ajax({
            url: "ajaxGetProductsSubMenu.jsp",
            type: "GET",
            data: {
                subMenuId: subMenuId
            },
            success: function(response) {                
                $("#third").html(response);
            },
            error: function(xhr, status, error) {
                console.error(error); 
            }
        });
    }
    
    function favProducts(productId){
        $.ajax({
            url: "ajaxFavProduct.jsp", 
            type: "GET",
            data: {
                productId: productId
            },
            success: function(responseMessage) {
             alert(responseMessage.trim());

            },
            error: function(xhr, status, error) {
                alert("Kayıt Edilemedi Hatalı.");
                console.error(error);
            }
        });
    }
    
    function addBasket(productId){
        
        $.ajax({
            url: "ajaxAddBasket.jsp", 
            type: "GET",
            data: {
                productId: productId
            },
            success: function(responseMessage) {
             alert(responseMessage.trim());

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
    <div id="yenileme-kapalı" style ="display: flex; flex-direction:column;padding-left: 0px;">
        <div style ="display: flex; flex-direction: row;padding-left: 0px;">
            <div onclick="location.href='http://localhost:8080/ECommerceProject/mainPage.jsp';" id="image" style="width:250px; height:80px;" class="box"><img src="images/novanest.jpeg" style="width: 250px;height: 80px;"/></div>
            <div id="search" style="width:535px;" class="box">
                <nav class="navbar navbar-light">
                    <form class="form-inline">
                      <input id="searchingProducts" style="width: 450px" class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search"/>
                      <button id="searchButton" onclick="getProducts()" class="btn btn-secondary"><i class="fas fa-search"></i></button>                    
                    </form>
                </nav>              
            </div>
            <div id="hesabımButton" style=" margin-left:1px; margin-top: 7px;  width:110px;" class="box">
                <button onclick="location.href='http://localhost:8080/ECommerceProject/UserProfile.jsp';" class="btn btn-primary"><i class="fas fa-user-circle"></i>Hesabım</button>
            </div>
            <div id="favoriButton" style=" margin-left:1px; margin-top: 7px;  width:120px;" class="box">
                <button onclick="location.href='http://localhost:8080/ECommerceProject/favoriProducts.jsp';" class="btn btn-danger"><i class="fas fa-heart"></i>Favorilerim</button>
            </div>
            <div id="sepetButton" style=" margin-left: 5px; margin-top: 7px;  width:110px;" class="box">
                <div><button onclick="location.href='http://localhost:8080/ECommerceProject/basket.jsp';" class="btn btn-warning"><i class="fas fa-shopping-cart"></i>Sepetim</button></div>
            </div>
            <div id="ordersButton" style=" margin-left:1px; margin-top: 7px;  width:130px;" class="box">
                <button onclick="location.href='http://localhost:8080/ECommerceProject/orders.jsp';" class="btn btn-success"><i class="fas fa-list"></i> Siparişlerim</button>
            </div>   
        </div>
        <div style ="display: flex; flex-direction: row; padding-left: 0px;">
        <div style="width: 250px; position: static">
            <table class="table table-hover">
                <thead class="thead-dark">
                  <tr>
                    <th scope="col">MENU</th>
                  </tr>
                </thead>
                <tbody id="menu"></tbody>
            </table>   
        </div>
        <div id="third" style ="display: flex; flex-direction: column;"></div>
        </div>
    </div>
</body>
</html>


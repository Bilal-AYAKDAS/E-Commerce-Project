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
            // Sayfa yüklendiğinde çalışacak JavaScript/jQuery kodları
            // Örnek bir butona tıklama event'i ve Ajax isteği
            getBasket();            
            $(document).ready(function() {
                $('#yenileme-kapalı').click(function(event) {
                    event.preventDefault(); // Formun gönderimini engelle
                    // Form gönderimi yerine yapılacak işlemler
                });
            });
        $('#searchButton').click(function(event) {
                event.preventDefault(); // Butonun varsayılan tıklama davranışını engelle
                // Butonun tıklama işlevi
            });
        });
    
    function getBasket(){
        $.ajax({
            url: "ajaxGetBasket.jsp", // Ajax isteğinin yönlendirileceği sayfa
            type: "GET",
            success: function(response) {
                // İstek başarılıysa yapılacak işlemler
                
                $("#third").html(response); // Sonucu 'result' div'ine ekleme
            },
            error: function(xhr, status, error) {
                // İstek başarısız olursa yapılacak işlemler
                console.error(error); // Hata mesajını konsola yazdırma
            }
        });
    }
    function pay(sellId){
        window.open ("http://localhost:8080/ECommerceProject/Paying.jsp?sellId="+sellId,"mywindow","menubar=1,resizable=1,width=550,height=650px");
    }
    function basketProductsDelete(basketId){
        $.ajax({
            url: "ajaxBasketProductDel.jsp", 
            type: "GET",
            data: {
                basketId: basketId
            },
            success: function(responseMessage) {
             alert(responseMessage.trim());
             window.location.reload();
            },
            error: function(xhr, status, error) {
                alert("Silinemedi  Hatalı.");
                console.error(error);
            }
        });
    }
    

    </script>
</head>
<body>
    
          
        <div id="yenileme-kapalı" style ="display: flex; flex-direction:column;padding-left: 0px;">

        <div style ="background-color: rgba(200, 200, 200, 0.5); display: flex; flex-direction: row;padding-left: 0px;">
            <div onclick="location.href='http://localhost:8080/ECommerceProject/mainPage.jsp';" id="image" style="width:250px; height:80px;" class="box"><img src="images/novanest.jpeg" style="width: 250px;height: 80px;"/></div>
            <div id="search" style="width:535px;" class="box">
                   
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
            <div class="card" style="background-color:rgba(200, 200, 200, 0.5); margin-top: 5px; height:70px; width: 450px;  "><div class="card-body"> <h1 class="display-3" style="font-size:30px;">Sepetim</h1></div></div>
       
        </div>
        <div id="third"></div>
</body>
</html>


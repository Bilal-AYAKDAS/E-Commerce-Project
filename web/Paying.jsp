<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
    String sellId = request.getParameter("sellId");
    %>
<head>
    <title> PAYİNG PAGE </title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        $(document).ready(function() { 
            
        });
    
    function createOrder(){
        var sellId = '<%=sellId%>';

        $.ajax({
            url: "ajaxCreateOrder.jsp", 
            type: "GET",
            data: {sellId: sellId
            },
            success: function(responseMessage) {
             alert("Ödeme başarılı");
             window.location.reload();

            },
            error: function(xhr, status, error) {
                alert("Ödeme Hatalı.");
                console.error(error);
            }
        });
            
    }
    </script>
    <style>
      .padding{
    padding:5rem !important;
}
.card {
    margin-bottom: 1.5rem;
} 

.card {
    position: relative;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-direction: column;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 1px solid #c8ced3;
    border-radius: .25rem;
}

.card-header:first-child {
    border-radius: calc(0.25rem - 1px) calc(0.25rem - 1px) 0 0;
}

.card-header {
    padding: .75rem 1.25rem;
    margin-bottom: 0;
    background-color: #f0f3f5;
    border-bottom: 1px solid #c8ced3;
}

.card-body {
    flex: 1 1 auto;
    padding: 1.25rem;
}

.form-control:focus {
    color: #5c6873;
    background-color: #fff;
    border-color: #c8ced3 !important;
    outline: 0;
    box-shadow: 0 0 0 #F44336;
}
        
    </style>
</head>

<body>
    
<div class="padding">
<div class="row">
<div class="col-sm-6">
<div class="card">
<div class="card-header">
<strong>Credit Card</strong>
<small>enter your card details</small>
</div>
<div class="card-body">
<div class="row">
    <div class="col-sm-12">
        <div class="form-group">
            <label for="name">Name</label>
            <input class="form-control" id="name" type="text" placeholder="Enter your name">
        </div>
    </div>
</div>
<div class="row">
<div class="col-sm-12">
<div class="form-group">
<label for="ccnumber">Credit Card Number</label>
<div class="input-group">
    <input class="form-control" type="text" placeholder="0000 0000 0000 0000" autocomplete="email"/>
<div class="input-group-append">
    <span class="input-group-text">
    <i class="mdi mdi-credit-card"></i>
</span>
</div>
</div> 
</div>
</div>
</div>

<div class="row">
<div class="form-group col-sm-4">
<label for="ccmonth">Month</label>
<select class="form-control" id="ccmonth">
<option>1</option>
<option>2</option>
<option>3</option>
<option>4</option>
<option>5</option>
<option>6</option>
<option>7</option>
<option>8</option>
<option>9</option>
<option>10</option>
<option>11</option>
<option>12</option>
</select>
</div>
<div class="form-group col-sm-4">
<label for="ccyear">Year</label>
<select class="form-control" id="ccyear">
<option>2024</option>
<option>2025</option>
<option>2026</option>
<option>2027</option>
<option>2028</option>
<option>2029</option>
<option>2030</option>

</select>
</div>
<div class="col-sm-4">
<div class="form-group">
<label for="cvv">CVV/CVC</label>
<input class="form-control" id="cvv" type="text" placeholder="123">
</div>
</div>
</div>

</div>
<div class="card-footer">
<button onclick="createOrder()"class="btn btn-sm btn-success float-right" type="submit">
<i class="mdi mdi-gamepad-circle"></i> PAY</button>
<button class="btn btn-sm btn-danger" type="reset">
<i class="mdi mdi-lock-reset"></i> Reset</button>
</div>
</div>
</div>
</div>
</div>
    
    
    
</body>
</html>


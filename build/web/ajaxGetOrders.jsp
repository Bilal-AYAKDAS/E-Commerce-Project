<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException"%>
<%@ page import=" java.sql.Statement"%>
<%@ page import="java.util.logging.Level"%>
<%@ page import=" java.util.logging.Logger"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

    <style>
        .myDiv {
            padding: 10px; 
            margin-left: 4px;
            margin-right: 4px;
            height: 300px;
            width: 200px;
            border-radius: 3%;
            background-color: rgba(200, 200, 200, 0.5);
        }
        img {
          width: 170px; 
          height: auto; 
        }
        h4{
            font-size:1em;
        }
        h5{
            font-size:1em;
        }
    </style>
</head>
<body>
<%
    String userId = (String)session.getAttribute("userId");
	
        String url = "jdbc:postgresql://localhost/ecommerce";
        String sqlstr = "{CALL get_orders_summary(?)}";
        Connection con;
        CallableStatement callableStatement = null;
        ResultSet rs = null;
        Class.forName("org.postgresql.Driver");
        con = DriverManager.getConnection(url, "postgres", "root");
        callableStatement = con.prepareCall(sqlstr);
        callableStatement.setInt(1, Integer.parseInt(userId)); 
        rs = callableStatement.executeQuery();
        
%>  <table class="table table-striped table-hover  ">
            <thead class="thead-dark">
                <tr>
                    <th></th>
                    <th>SİPARİŞ TARİHİ</th>
                    <th>TOPLAM FİYAT</th>
                    <th>TOPLAM MİKTAR</th>
                    <th>SİPARİŞ ADRESİ</th>
                    <th></th>
                </tr>
            </thead>
    <%  int count=0;
        while(rs.next()){
            count++;
    %>      
        <tr>
            <td><%=count%></td>
            <td><h4><%=rs.getString(1)%></h4></td>
            <td><h5><%=rs.getString(2)+"  TL"%></h5></td>
            <td><h5><%=rs.getString(4)%></h5></td>
            <td><h5><%=rs.getString(3)%></h5></td>
        </tr>  
        <%}%>
  
    </table>
        <br>
</body>
<%
  rs.close();
  con.close(); 
%>
</html>
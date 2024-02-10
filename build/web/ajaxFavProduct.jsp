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


<%
    String hata="";
    String userId = (String)session.getAttribute("userId");
    String productId = request.getParameter("productId");


    try {
    String url = "jdbc:postgresql://localhost/ecommerce";
    Connection connection;
    String s;
    Class.forName("org.postgresql.Driver");
    connection = DriverManager.getConnection(url,"postgres","root");
    String INSERT_USERS_SQL = "INSERT INTO favori_products" +
        "  (user_id, product_id) VALUES " +
        " (?, ?);";
     PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL);
     preparedStatement.setInt(1, Integer.parseInt(userId)); 
     preparedStatement.setInt(2, Integer.parseInt(productId));
      
     int affectedRows = preparedStatement.executeUpdate();
        if (affectedRows > 0) {
            // Ekleme başarılı oldu
            out.println("Ürün favorilere eklendi.");
        } else {
            // Ekleme başarısız
            out.println("Ürün favorilere eklenemedi.");
        }
        
        preparedStatement.close();
        connection.close();
   
     }catch (Exception e) {
        // Hata yakalanırsa, hatayı kullanıcıya göster
        hata = "Error: " + e.getMessage();
        out.print(hata);
    }
 
%>

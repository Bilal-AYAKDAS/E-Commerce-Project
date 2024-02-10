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

    String hata ="";
    String name = request.getParameter("name");
    String surname = request.getParameter("surname");
    String address = request.getParameter("address");
    String email = request.getParameter("email");
    String phoneNumber = request.getParameter("phoneNumber");
    String userName = request.getParameter("userName");
    String password = request.getParameter("password");
    
    try {
    String url = "jdbc:postgresql://localhost/ecommerce";
    Connection connection;
    String s;
    Class.forName("org.postgresql.Driver");
    connection = DriverManager.getConnection(url,"postgres","root");
    String INSERT_USERS_SQL = "INSERT INTO users" +
        "  (username, name, surname, email, password, phone_number,adress ) VALUES " +
        " (?, ?, ?, ?, ?, ?, ?);";
        
    PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL);
       preparedStatement.setString(1, userName);
       preparedStatement.setString(2, name);
       preparedStatement.setString(3, surname);
       preparedStatement.setString(4, email);
       preparedStatement.setString(5, password);
       preparedStatement.setString(6, phoneNumber);
       preparedStatement.setString(7, address);
       out.println(preparedStatement);
       preparedStatement.executeUpdate();
   
     }catch (Exception e) {
        hata = "Error: " + e.getMessage();
        out.print(hata);
    }
 
%>

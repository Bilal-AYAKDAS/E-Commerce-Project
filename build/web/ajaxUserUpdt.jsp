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
    String userId = (String)session.getAttribute("userId");
    String hata ="";
    String address = request.getParameter("address");
    String email = request.getParameter("email");
    String phoneNumber = request.getParameter("phoneNumber");
    String password = request.getParameter("password");
    try {
        String url = "jdbc:postgresql://localhost/ecommerce";
        Connection connection;
        String s;
        Class.forName("org.postgresql.Driver");
        connection = DriverManager.getConnection(url,"postgres","root");
        String UPDATE_USERS_SQL = "UPDATE users SET email = ?, password = ?, phone_number = ?, adress = ? WHERE user_id = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USERS_SQL);
           preparedStatement.setString(1, email);
           preparedStatement.setString(2, password);
           preparedStatement.setString(3, phoneNumber);
           preparedStatement.setString(4, address);
           preparedStatement.setInt(5, Integer.parseInt(userId));

           out.println(preparedStatement);
           preparedStatement.executeUpdate();
     }catch (Exception e) {
        hata = "Error: " + e.getMessage();
        out.print(hata);
    }
 
%>

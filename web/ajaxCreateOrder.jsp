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
    String userId = (String)session.getAttribute("userId");
    String sellId = request.getParameter("sellId");
    Connection connection = null;
    CallableStatement callableStatement = null;
    try {
        String url = "jdbc:postgresql://localhost/ecommerce";
        String s;
        Class.forName("org.postgresql.Driver");
        connection = DriverManager.getConnection(url, "postgres", "root");

        callableStatement = connection.prepareCall("{call create_order(?)}");
        callableStatement.setInt(1, Integer.parseInt(sellId)); 

        boolean hadResults = callableStatement.execute();

        if (hadResults) {
            out.println("Sipariş Oluşturuldu.");
        } else {
            out.println("Sipariş Oluşturulamadı.");
        }

     }catch (Exception e) {
        // Hata yakalanırsa, hatayı kullanıcıya göster
        hata = "Error: " + e.getMessage();
        out.print(hata);
    }
 
%>

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
    String favId = request.getParameter("favId");
    
	String url = "jdbc:postgresql://localhost/ecommerce";
        Connection connection;
        Class.forName("org.postgresql.Driver");
        connection = DriverManager.getConnection(url,"postgres","root");
        String deleteSQL = "DELETE FROM  favori_products WHERE favori_id = ?";
        PreparedStatement deleteStatement = connection.prepareStatement(deleteSQL);
        deleteStatement.setInt(1, Integer.parseInt(favId));
        int rowCount = deleteStatement.executeUpdate();
        if (rowCount > 0) {
            out.println("SİLİNDİ.");
        } else {
            out.println("SİLİNEMEDİ.");
        }
        connection.close(); 
%>

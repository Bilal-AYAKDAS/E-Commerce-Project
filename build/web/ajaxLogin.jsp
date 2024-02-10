<%@ page language="java" contentType ="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    //Email ve  Password  Parametre Olarak Alma
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String responseMessage="";
    try {

    String url = "jdbc:postgresql://localhost/ecommerce";
    Connection connection;
    ResultSet rs;
    String sqlstr = "SELECT password,user_id FROM users WHERE email='"+email+"';";
    Statement st;
    Class.forName("org.postgresql.Driver");
    connection = DriverManager.getConnection(url,"postgres","root");
    st = connection.createStatement();
    rs = st.executeQuery(sqlstr);
     
    rs.next();
    String dbPasss=rs.getString(1);
  
    if(password.equals(dbPasss)){
        String userId=rs.getString(2);
        session.setAttribute("userId",userId); 
        out.print("1");
     }else{
     out.print("0");
     }
    } catch (Exception e) {
        responseMessage = "Error: " + e.getMessage();
    }
%>

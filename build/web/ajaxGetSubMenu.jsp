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

<%
    String menuId = request.getParameter("menuId");
        String url = "jdbc:postgresql://localhost/ecommerce";
        Connection con;
        ResultSet rs;
        String s;
        String sqlstr = "SELECT * FROM submenu where menu_id="+menuId;
        Statement st;
        Class.forName("org.postgresql.Driver");
        con = DriverManager.getConnection(url,"postgres","root");
        st = con.createStatement();
        rs = st.executeQuery(sqlstr);
   
   

%>
</head>
<body>


    <%int count=0;
        while(rs.next()){
        count++;
    %>
    <td style="display: block; margin: 0; padding: 0;"> 
            <table class="table table-hover" style="margin: 0; padding: 0;"> 
                <tr style="height:2px">
                <td hidden=""><%=rs.getString(1)%></td>
                <td id ="searchButton" onclick="getProductsSubMenu('<%=rs.getString(1)%>')" style="height:2px "><%=rs.getString(3)%></td>
                </tr>
            </table>
        </td>
    
    <%}%>
 
            
        
</body>
<%
  rs.close();
  st.close();
  con.close(); 
%>
</html>
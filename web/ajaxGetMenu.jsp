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

</head>
<body>
<%
	String url = "jdbc:postgresql://localhost/ecommerce";
        Connection con;
        ResultSet rs;
        String s;
        String sqlstr = "SELECT * FROM menu";
        Statement st;
        Class.forName("org.postgresql.Driver");
        con = DriverManager.getConnection(url,"postgres","root");
        st = con.createStatement();
        rs = st.executeQuery(sqlstr);
%>
    <%int count=0;
        while(rs.next()){
        count++;
        String submenuseemId ="submenuseem"+rs.getString(1);
    %>          
<tr  onclick="showHiddenDiv('<%=submenuseemId%>')"class="menu-count">
      <td hidden=""><%=rs.getString(1)%></td>
      <td class="table-secondary" onclick="subMenu('<%=rs.getString(1)%>')"><%=rs.getString(2)%></td>
    </tr>
    <tr id ="<%=submenuseemId%>">
    </tr>
    <tbody id="submenuseem"></tbody>
    <%}%>
 
            
  

</body>
<%
  rs.close();
  st.close();
  con.close(); 
%>
</html>
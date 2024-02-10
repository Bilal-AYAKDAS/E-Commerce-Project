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
          height: 180px; 
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
     String productName = request.getParameter("productName");
	String url = "jdbc:postgresql://localhost/ecommerce";
        Connection con;
        ResultSet rs;
        String s;
        String sqlstr = "SELECT product_name,price,product_image,product_id FROM products WHERE product_name ILIKE '%"+productName+"%';";
        Statement st;
        Class.forName("org.postgresql.Driver");
        con = DriverManager.getConnection(url,"postgres","root");
        st = con.createStatement();
        rs = st.executeQuery(sqlstr);
%>
    <%int count=0;
        while(rs.next()){
        count++;
        %>      
       
        <div style ="display: flex; flex-direction: row;padding-left: 10px; margin-bottom: 10px">
        
            <div style ="display: flex; flex-direction: column;" class="myDiv">
                <div>
                    <img src="<%=rs.getString(3)%>"/>
                 </div>
                 <div>
                    <h4><%=rs.getString(1)%></h4>

                </div>
                 <div>
                    <h5><%=rs.getString(2)+"  TL"%></h5>
                </div>
                 <div><button onclick="addBasket('<%=rs.getString(4)%>')" class="btn btn-warning">
                    <i class="fas fa-shopping-cart"></i> Sepete Ekle
                  </button>
                   <button  onclick="favProducts('<%=rs.getString(4)%>')" class="btn btn-danger">
                    <i class="fas fa-heart"></i>
                  </button>
                </div>
            </div>
                <%if(rs.next()){%>

                <div style ="display: flex; flex-direction: column;"class="myDiv">
                <div>
                    <img src="<%=rs.getString(3)%>"/>
                 </div>
                 <div>
                    <h4><%=rs.getString(1)%></h4>
                </div>
                 <div>
                    <h5><%=rs.getString(2)+"  TL"%></h5>
                </div>
                 <div><button onclick="addBasket('<%=rs.getString(4)%>')" class="btn btn-warning">
                    <i class="fas fa-shopping-cart"></i> Sepete Ekle
                  </button>
                   <button  onclick="favProducts('<%=rs.getString(4)%>')" class="btn btn-danger">
                    <i class="fas fa-heart"></i>
                  </button>
                </div>
            </div>
                <%}if(rs.next()){%>

                <div style ="display: flex; flex-direction: column;"class="myDiv">
                <div>
                    <img src="<%=rs.getString(3)%>"/>
                 </div>
                 <div>
                    <h4><%=rs.getString(1)%></h4>
                </div>
                 <div>
                    <h5><%=rs.getString(2)+"  TL"%></h5>
                </div>
                 <div><button onclick="addBasket('<%=rs.getString(4)%>')" class="btn btn-warning">
                    <i class="fas fa-shopping-cart"></i> Sepete Ekle
                  </button>
                   <button onclick="favProducts('<%=rs.getString(4)%>')" class="btn btn-danger">
                    <i class="fas fa-heart"></i>
                  </button>
                </div>
            </div>
                <%}if(rs.next()){%>

              <div style ="display: flex; flex-direction: column;"class="myDiv">
                <div>
                    <img src="<%=rs.getString(3)%>"/>
                 </div>
                 <div>
                    <h4><%=rs.getString(1)%></h4>
                </div>
                 <div>
                    <h5><%=rs.getString(2)+"  TL"%></h5>
                </div>
                 <div><button onclick="addBasket('<%=rs.getString(4)%>')" class="btn btn-warning">
                    <i class="fas fa-shopping-cart"></i> Sepete Ekle
                  </button>
                   <button onclick="favProducts('<%=rs.getString(4)%>')" class="btn btn-danger">
                    <i class="fas fa-heart"></i>
                  </button>
                </div>
            </div>
                <%}if(rs.next()){%>
                <div style ="display: flex; flex-direction: column;"class="myDiv">
             <div>
                    <img src="<%=rs.getString(3)%>"/>
                 </div>
                 <div>
                    <h4><%=rs.getString(1)%></h4>
                </div>
                 <div>
                    <h5><%=rs.getString(2)+"  TL"%></h5>
                </div>
                 <div><button onclick="addBasket('<%=rs.getString(4)%>')" class="btn btn-warning">
                    <i class="fas fa-shopping-cart"></i> Sepete Ekle
                  </button>
                   <button onclick="favProducts('<%=rs.getString(4)%>')" class="btn btn-danger">
                    <i class="fas fa-heart"></i>
                  </button>
                </div>
            </div>
            <%}%>
        </div>

        <%}%>
 
            
  

</body>
<%
  rs.close();
  st.close();
  con.close(); 
%>
</html>
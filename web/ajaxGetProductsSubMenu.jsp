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
            /*border: 0.0005px solid #000;  2 piksel kalınlığında, siyah renkte bir kenarlık */
            padding: 10px; /* İç kenarlara 10 piksellik boşluk */
            margin-left: 4px;
            margin-right: 4px;/* Diğer elementlerle arasında 20 piksel boşluk */
            height: 300px;
            width: 200px;
            border-radius: 3%;
            background-color: rgba(200, 200, 200, 0.5);
        }
        img {
          width: 170px; /* Genişlik */
          height: 180px; /* Otomatik yükseklik ayarı, genişliğe oranlı olarak */
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
     String subMenuId = request.getParameter("subMenuId");
	String url = "jdbc:postgresql://localhost/ecommerce";
        Connection con;
        ResultSet rs;
        String s;
        String sqlstr = "SELECT product_name,price,product_image FROM products WHERE submenu_id ="+subMenuId+";";
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
                 <div><button class="btn btn-warning">
                    <i class="fas fa-shopping-cart"></i> Sepete Ekle
                  </button>
                   <button class="btn btn-danger">
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
                 <div><button class="btn btn-warning">
                    <i class="fas fa-shopping-cart"></i> Sepete Ekle
                  </button>
                   <button class="btn btn-danger">
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
                 <div><button class="btn btn-warning">
                    <i class="fas fa-shopping-cart"></i> Sepete Ekle
                  </button>
                   <button class="btn btn-danger">
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
                 <div><button class="btn btn-warning">
                    <i class="fas fa-shopping-cart"></i> Sepete Ekle
                  </button>
                   <button class="btn btn-danger">
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
                 <div><button class="btn btn-warning">
                    <i class="fas fa-shopping-cart"></i> Sepete Ekle
                  </button>
                   <button class="btn btn-danger">
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
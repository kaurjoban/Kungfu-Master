<%@page import="java.sql.*"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date.*" %>
<%@page import="java.lang.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet"/>
       
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap-3.3.7-dist/css/lightbox.css" rel="stylesheet" type="text/css"/>
        <script src="bootstrap-3.3.7-dist/js/lightbox.min.js" type="text/javascript"></script>
        <title>JSP Page</title>
        <script type="text/javascript">
           
    
    
            
            </script>
            
        
    </head>
    <body>
        <center><label style="font-size: 40px;color: rgb(25,52,81)">Account Details</label></center>
    <div class="container-fluid" >
        <div class="col-sm-10 col-sm-offset-1"   style="background-color:white;margin-top: 10px;border: solid 2px black; padding: 0px">
                    
                <div  data-toggle="collapse" data-target="#basic" style="background: rgb(25,52,81);font-size:20px; padding: 10px;height: 60px"> 
                      <div class="collapse in" id="basic">
                         
                          
                          <form action="account_info_kf.jsp" method="post">
                              
                          <div class="row" style="padding: 10px">
                             
                             
                             
                            <div class="col-sm-2">
                                <label style="font-size: 20px;color: rgb(25,52,81);color: white">From</label>
                            </div>
                             
                             <div class="col-sm-3">
                                 <input type="date" name="d1" style="font-size: 17px"/>
                            </div>
                             
                            <div class="col-sm-2">
                                <label style="font-size: 20px;color: rgb(25,52,81);color: white">To</label>
                            </div>
                             <div class="col-sm-3">
                                 <input type="date" name="d2" style="font-size: 17px"/> 
                            </div>
                       <input type="submit" value="Search"  class="btn btn-success"  style="background: rgb(25,52,81);color:white"/>    
                         </div> 
                    
                          </form>
        
        
        <%  
           String status="";
           int stu_id= (Integer)session.getAttribute("stu_id");
          Class.forName("com.mysql.jdbc.Driver");
                Connection conn2 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/kung_fu","root","admin");
                Statement stmt2 = conn2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet rs2 = stmt2.executeQuery("select * from amount_charged_kf where stu_id=\'"+stu_id+"\'");
                
             while(rs2.next()) {
                 
                   int total = rs2.getInt("total");
                   int fee_type_id = rs2.getInt("fee_type_id");
                   
                   Date date = rs2.getDate("date");
                   
                   Class.forName("com.mysql.jdbc.Driver");
                Connection conn1 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/kung_fu","root","admin");
                Statement stmt1 = conn1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet rs1 = stmt1.executeQuery("select * from fee_type where fee_type_id=\'"+ fee_type_id+"\'");
                while(rs1.next()){
                    String fee_type=rs1.getString("fee_type");
         
                  %>
                   
                 
                 
                  
        <%
            }
               }
  
              %>
                         </div>      
              </div>
                      </div> 
              </div> 
                      
                      
    
   
</body>
</html>
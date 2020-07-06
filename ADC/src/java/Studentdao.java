/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Deepak
 */
import java.util.*;
import java.sql.*;
public class Studentdao {
    
     public static Connection getConnection(){  
        Connection con=null;  
        try{  
//            Class.forName("oracle.jdbc.driver.OracleDriver");  
//            con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","oracle");  
        }catch(Exception e){System.out.println(e);}  
        return con;  
    }  
}

  
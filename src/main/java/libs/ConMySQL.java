/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package libs;
import java.sql.*;
/**
 *
 * @author Danillo Lima
 */
public class ConMySQL {
    public static Connection conecta(){
        Connection c = null; 
        try{
            String driverName = "com.mysql.jdbc.Driver";                        
            Class.forName(driverName);
            String serverName = "35.239.136.207";    
            String mydatabase = "scalar";     
            String url = "jdbc:mysql://" + serverName + "/" + mydatabase;
            String username = "root";       
            String password = "sYH1Hi1Tqp5W";      
            c = DriverManager.getConnection(url, username, password);
        }catch(SQLException e){
            e.printStackTrace();
        }
        catch(ClassNotFoundException e){
        
        }
        return c;
    }
}

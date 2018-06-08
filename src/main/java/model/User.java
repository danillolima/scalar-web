package model;
import java.sql.*;
import libs.ConMySQL;

/**
 *
 * @author Aluno
 */
public class User {

    private String id;

    public User(String user, String email, String senha, String endereco) {
        this.user = user;
        this.email = email;
        this.senha = senha;
        this.endereco = endereco;
    }
    private String user;
    private String email;
    private String senha;
    private String endereco;
   
    public User() {
       user = null;
    }
    
    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }
     public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }
    
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
    
    public static User getUsuario(String user){
        Connection c;
        c = ConMySQL.conecta();
        PreparedStatement p;
        ResultSet r;
        User userFound = null;
        try{
            p = c.prepareStatement("select * from users where user = ?");
            p.setString(1, user);
            r = p.executeQuery();
            if(r.next()){
                userFound = new User();
                userFound.setId(r.getString("idUser"));
                userFound.setSenha(r.getString("pass"));
                userFound.setEmail(r.getString("email"));
                userFound.setUser(r.getString("user"));
                userFound.setEndereco(r.getString("adress"));
            }
             c.close();
        }catch(SQLException e){
            
        }
        return userFound;
    }
    
    public static void saveUsuario(User newUser){
        Connection c;
        c = ConMySQL.conecta();
        PreparedStatement p;
        ResultSet r;
          try{
            p = c.prepareStatement("insert into users values (default, ?, ?, ?, ?) ");
            p.setString(1, newUser.getUser());
            p.setString(2, newUser.getEmail());
            p.setString(3, newUser.getSenha());
            p.setString(4, newUser.getEndereco());
            p.executeUpdate();
             c.close();
        }catch(SQLException e){
            
        }
    }
}

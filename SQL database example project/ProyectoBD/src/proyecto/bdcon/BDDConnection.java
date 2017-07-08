/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package proyecto.bdcon;

import java.sql.*;



/**
 *
 * @author JAVA
 */
public class  BDDConnection {



    public static Connection conexion;


    public Connection getConexion() {
        return conexion;
     
    }
     public void setConexion(Connection conexion){
     this.conexion=conexion;

     }

     public BDDConnection conectar(){

        try {
          Class.forName("oracle.jdbc.OracleDriver");
          String baseoracle="jdbc:oracle:thin:@localhost:1521:xe";
            conexion = DriverManager.getConnection(baseoracle, "hr", "hr");
          
        }
        catch (SQLException ex) {
            
        }
         catch (ClassNotFoundException ex) {
           
        }
      return this;
     }

     public boolean ejecutar (String sql){
       try{
       Statement sentencia;
       sentencia = getConexion().createStatement(ResultSet.TYPE_FORWARD_ONLY,ResultSet.CONCUR_READ_ONLY);
       sentencia.executeUpdate(sql);
       getConexion().commit();
       sentencia.close();

       }catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
       return true;
     }


     public ResultSet consultar(String sql){
         ResultSet resultado=null;
         try{
         Statement sentencia;
         sentencia= getConexion().createStatement(ResultSet.TYPE_FORWARD_ONLY,ResultSet.CONCUR_READ_ONLY);
         resultado=sentencia.executeQuery(sql);
         getConexion().commit();

         }catch (SQLException e) {
            e.printStackTrace();

      return null ;
     }return resultado;
    }


}
			// librares con relative
			// path
      // para
	// conectarse	// con	// la	// base 	// de
			// datos
	
	

	
   




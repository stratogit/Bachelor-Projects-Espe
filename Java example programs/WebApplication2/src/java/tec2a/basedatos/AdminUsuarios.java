/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tec2a.basedatos;

import tec2a.beans.UserBean;
import java.sql.Connection;
import java.util.List;
import tec2a.basedatos.BDDConnection;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.ArrayList;
import tec2a.excepciones.CuentaException;
/**
 *
 * @author Java
 */
public class AdminUsuarios {

    public void crearCuenta(Cuenta cta) throws CuentaException{
        try{
        Connection conection=BDDConnection.getConnection();
        Statement stm=conection.createStatement();
        String sentenciaInsert="insert into cuenta values('"+cta.getUsuario()+"',"+cta.getContraseña()+",')";

        System.out.println(sentenciaInsert);
        stm.executeUpdate(sentenciaInsert);
        }
        catch(SQLException ex){
        ex.printStackTrace();
        throw new CuentaException("Error al crear la cuenta");
        }
    }

    public Cuenta buscarCuenta(String usuario) {
        try {
            Connection conection = BDDConnection.getConnection();
            Statement stm = conection.createStatement();
            String QuerySearch = "select * from usuarios where usuario='" +usuario + "'";
            //El resulset es un puntero que permite ir barriendo lo que tiene la tabla
            ResultSet resultado = stm.executeQuery(QuerySearch);
            if(resultado.next()){
            // con el next me permite ir barriendo los objetos de la tabla al siguiente
            return new Cuenta(resultado.getString(1),resultado.getString(2));
            }else{
                return null;
            }
            //System.out.println(QuerySearch);
            //stm.executeUpdate(QuerySearch);
        } catch (SQLException ex) {
            ex.printStackTrace();

        }
        return null;
    }

    public void eliminarCuenta(String usuario) {
        try {
            Connection conection = BDDConnection.getConnection();
            Statement stm = conection.createStatement();
            String sentenciaDelete = "delete from cuenta where usuario='" + usuario + "'";
            System.out.println(sentenciaDelete);
            stm.executeUpdate(sentenciaDelete);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void actualizarCuenta(String usuario) {
        try {
            Connection conection = BDDConnection.getConnection();
            Statement stm = conection.createStatement();
            String sentenciaUpdate = "update cuenta set  + where usuario='" + usuario + "'";
            System.out.println(sentenciaUpdate);
            stm.executeUpdate(sentenciaUpdate);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public List<Cuenta> getCuentas() {
        //crear lista de cuentas

        try {
            List<Cuenta> cuentas= new ArrayList<Cuenta>();

            Connection conection = BDDConnection.getConnection();
            
            String Query = "select * from cuenta";
            Statement stm = conection.createStatement();
            ResultSet resultado = stm.executeQuery(Query);
            while(resultado.next()){
            Cuenta a= new Cuenta(resultado.getString(1), resultado.getString(2));
            cuentas.add(a);
            }
            return cuentas;

            //System.out.println(Query);
            //stm.executeUpdate(Query);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

   
}

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package tec2a.basedatos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Java
 */
public class BDDConnection {

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto", "root", "root");
            return con;
        } catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println("Error al conectarse" + ex.getMessage());
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        return null;
    }
}


/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package tec2a.beans;

import tec2a.basedatos.AdminUsuarios;
import tec2a.basedatos.Cuenta;
public class UserBean {

    private String user;
    private String password;
    private String user1;
    private String password1;
    private String validar;
    /** Creates a new instance of UserBean */
    Cuenta usuarios = new Cuenta();
    AdminUsuarios usar =new AdminUsuarios();
    public UserBean() {
    }

    public String getValidar() {
     usuarios = usar.buscarCuenta(user);
     user1 = usuarios.getUsuario();
     password1 = usuarios.getContraseña();

     if(user.compareTo(user1)==0 && password.compareTo(password1)==0){
            if(user1.compareTo("admin")==0){
                return "casoa";
            }else{
                return "casou";
            }
            
        }
        else{
        return "error";
        }

    }


    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

}

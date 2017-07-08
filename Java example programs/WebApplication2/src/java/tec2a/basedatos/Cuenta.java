package tec2a.basedatos;

public class Cuenta {
	private String usuario;
	private String contraseña;

    public Cuenta(String usuario, String contraseña) {
        this.usuario = usuario;
        this.contraseña = contraseña;
    }
	
	public Cuenta(String usuario){
		this.usuario=usuario;
	}

    public Cuenta() {
    }
	
	

    public String getContraseña() {
        return contraseña;
    }

    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }
	
	
	
}

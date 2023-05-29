package clases;
import java.util.ArrayList;
import java.util.List;

public class Comida {
	private String nombre;
    private String tipo;
    private List<String> ingredientes;
    private List<Comida> recomendaciones;
    private int puntuacion;
    
    public Comida(String nombre, String tipo, List<String> ingredientes) {
        this.nombre = nombre;
        this.tipo = tipo;
        this.ingredientes = ingredientes;
        this.recomendaciones = new ArrayList<>();
    }

    public void agregarRecomendacion(Comida comida) {
        recomendaciones.add(comida);
    }
    
    public int getPuntuacion() {
        return puntuacion;
    }

    public void setPuntuacion(int puntuacion) {
        this.puntuacion = puntuacion;
    }
 // Setter and getter for the 'nombre' attribute
    public String getNombre() {
        return nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    // Setter and getter for the 'tipo' attribute
    public String getTipo() {
        return tipo;
    }
    
    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
    
    // Setter and getter for the 'ingredientes' attribute
    public List<String> getIngredientes() {
        return ingredientes;
    }
    
    public void setIngredientes(List<String> ingredientes) {
        this.ingredientes = ingredientes;
    }
    
    // Setter and getter for the 'recomendaciones' attribute
    public List<Comida> getRecomendaciones() {
        return recomendaciones;
    }
    
    public void setRecomendaciones(List<Comida> recomendaciones) {
        this.recomendaciones = recomendaciones;
    }
}

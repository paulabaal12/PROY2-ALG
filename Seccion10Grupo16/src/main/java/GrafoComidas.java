import java.util.ArrayList;
import java.util.List;

public class GrafoComidas {
	private List<Comida> nodos;

    public GrafoComidas() {
        this.nodos = new ArrayList<>();
    }

    public void agregarComida(Comida comida) {
        nodos.add(comida);
    }

    public List<Comida> buscarComidaPorTipo(String tipoComida) {
        List<Comida> comidasEncontradas = new ArrayList<>();
        for (Comida comida : nodos) {
            if (comida.getTipo().equals(tipoComida)) {
                comidasEncontradas.add(comida);
            }
        }
        return comidasEncontradas;
    }

    public Comida buscarComidaPorNombre(String nombreComida) {
        for (Comida comida : nodos) {
            if (comida.getNombre().equals(nombreComida)) {
                return comida;
            }
        }
        return null; // Si no se encontró ninguna comida con ese nombre
    }

    public List<Comida> generarRecomendacion(String tipoComida, List<String> ingredientes,
                                             List<String> ingredientesExcluidos, String nombreComida) {
        List<Comida> recomendaciones = new ArrayList<>();
        Comida comidaReferencia = buscarComidaPorNombre(nombreComida);
        
        if (comidaReferencia == null) {
            return recomendaciones; // Si no se encontró la comida de referencia, retornar lista vacía
        }
        
        for (Comida comida : nodos) {
            if (comida.getTipo().equals(tipoComida) && contieneIngredientes(comida, ingredientes) &&
                    !contieneIngredientes(comida, ingredientesExcluidos)) {
                // Calcular puntuación basada en la cantidad de ingredientes coincidentes con la comida de referencia
                int puntuacion = contarIngredientesCoincidentes(comida, comidaReferencia);
                comida.setPuntuacion(puntuacion);
                recomendaciones.add(comida);
            }
        }
        
        // Ordenar las recomendaciones por puntuación en orden descendente
        recomendaciones.sort((c1, c2) -> Integer.compare(c2.getPuntuacion(), c1.getPuntuacion()));
        
        // Retornar las primeras 3 recomendaciones (o menos si no hay suficientes)
        return recomendaciones.subList(0, Math.min(recomendaciones.size(), 3));
    }

    private boolean contieneIngredientes(Comida comida, List<String> ingredientes) {
        for (String ingrediente : ingredientes) {
            if (comida.getIngredientes().contains(ingrediente)) {
                return true;
            }
        }
        return false;
    }

    private int contarIngredientesCoincidentes(Comida comida1, Comida comida2) {
        int contador = 0;
        for (String ingrediente : comida1.getIngredientes()) {
            if (comida2.getIngredientes().contains(ingrediente)) {
                contador++;
            }
        }
        return contador;
    }
}

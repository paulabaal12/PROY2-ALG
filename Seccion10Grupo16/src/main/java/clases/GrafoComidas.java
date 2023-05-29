package clases;
import java.util.ArrayList;
import java.util.List;

public class GrafoComidas {
	private List<Comida> nodos;
	private List<Comida> comidasEncontradas = new ArrayList<>();
	private List<Comida> comidasEncontradasconIngredientes = new ArrayList<>();
	private List<Comida> related = new ArrayList<>();
    public GrafoComidas() {
        this.nodos = new ArrayList<>();
    }
    //comida de neo4j
    private void agregarComida(Comida comida) {
        nodos.add(comida);
    }
    //tipo del input del usuario
    private List<Comida> buscarComidaPorTipo(String tipoComida) {
    	if(tipoComida==null) {
    		comidasEncontradas=nodos;
    	}
    	else if(related.size()>0) {
    		for (Comida comida : related) {
                if (comida.getTipo().equals(tipoComida)) {
                    comidasEncontradas.add(comida);
                }
            }
    	}
    	else {
    		for (Comida comida : nodos) {
                if (comida.getTipo().equals(tipoComida)) {
                    comidasEncontradas.add(comida);
                }
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
    private List<Comida> relatedfoods(String Name){
    	try (EmbeddedNeo4j neo4j = new EmbeddedNeo4j("bolt://107.22.72.216:7687", "neo4j", "form-barges-sills")) {
            related=neo4j.getComidasWithCommonIngredients(Name);
        } catch (Exception e) {
            e.printStackTrace();
        }
    	return related;
    }
    //Type es la lista de ingredientes; buttonName, la lista de tipos;y comidaList, la lista de nodos de comida en neo4j
    public List<Comida> generarRecomendacion(List<Comida> comidaList, ArrayList<String> buttonName, ArrayList<String> Type,String Name) {
        List<Comida> recomendaciones = new ArrayList<>();
        relatedfoods(Name);
        for(Comida comida:comidaList) {
        	agregarComida(comida);
        }
        
        
        for (String tipo : buttonName) {
            buscarComidaPorTipo(tipo);
        }
        contieneIngredientes(Type);
        
        for(Comida comida: comidasEncontradasconIngredientes) {
        	comida.setPuntuacion(contarIngredientesComida(comida,Type));
        	recomendaciones.add(comida);
        }
        // Ordenar las recomendaciones por puntuación en orden descendente
        recomendaciones.sort((c1, c2) -> Integer.compare(c2.getPuntuacion(), c1.getPuntuacion()));
        
        // Retornar las primeras 3 recomendaciones (o menos si no hay suficientes)
        return recomendaciones.subList(0, Math.min(recomendaciones.size(), 3));
    }
    //ingredientes del input del usuario
    private List<Comida> contieneIngredientes( List<String> ingredientes) {
    	if(ingredientes==null) {
    		comidasEncontradasconIngredientes=comidasEncontradas;
    	}
    	else {
    		for (Comida comida : comidasEncontradas) {
            	for(String ingrediente : ingredientes) {
            		if (comida.getIngredientes().contains(ingrediente.toLowerCase())&&(!containsComida(comidasEncontradasconIngredientes,comida))) {
            			comidasEncontradasconIngredientes.add(comida);
                    }
            	}
                
            }
    	}
        
        return comidasEncontradasconIngredientes;
    }
    private int contarIngredientesComida(Comida comida, List<String> ingredientes) {
        int count = 0;
        if(ingredientes==null) {
    		count=0;
    	}
        else {
        	for (String ingrediente : ingredientes) {
                if (comida.getIngredientes().contains(ingrediente.toLowerCase())) {
                    count++;
                }
            }
        }
        
        return count;
    }
    
    private boolean containsComida(List<Comida> comidas, Comida comida) {
        for (int i = 0; i < comidas.size(); i++) {
            if (comidas.get(i) != null && comidas.get(i).equals(comida)) {
                return true;
            }
        }
        return false;
    }
    
}

package clases;
import org.neo4j.driver.AuthTokens;
import org.neo4j.driver.Driver;
import org.neo4j.driver.GraphDatabase;
import org.neo4j.driver.Record;
import org.neo4j.driver.Result;
import org.neo4j.driver.Session;
import org.neo4j.driver.Value;
import org.neo4j.driver.Values;
import org.neo4j.driver.types.Node;

import java.util.ArrayList;
import java.util.List;

public class EmbeddedNeo4j implements AutoCloseable {
    private final Driver driver;

    public EmbeddedNeo4j(String uri, String user, String password) {
        driver = GraphDatabase.driver(uri, AuthTokens.basic(user, password));
    }

    public List<Comida> getComidaList() {
        List<Comida> comidaList = new ArrayList<>();

        try (Session session = driver.session()) {
            String query = "MATCH (c:Comida) RETURN c.nombre AS nombre, c.ingredientes AS ingredientes, c.tipo AS tipo";
            Result result = session.run(query);

            while (result.hasNext()) {
                Record record = result.next();
                String nombre = record.get("nombre").asString();
                List<String> ingredientes = record.get("ingredientes").asList(Value::asString);
                String tipo = record.get("tipo").asString();
                Comida comida = new Comida(nombre, tipo, ingredientes);
                comidaList.add(comida);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return comidaList;
    }
    
    public ArrayList<String> getTipos() {
        ArrayList<String> tipoList = new ArrayList<>();

        try (Session session = driver.session()){

            String query = "MATCH (tipo:Tipo) RETURN tipo.nombre AS tipo";

            Result result = session.run(query);

            while (result.hasNext()) {
                Record record = result.next();
                String tipo = record.get("tipo").asString();
                tipoList.add(tipo);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return tipoList;
    }
    
    public ArrayList<String> getIngredientes() {
        ArrayList<String> ingredienteList = new ArrayList<>();

        try (Session session = driver.session()){

            String query = "MATCH (ingrediente:Ingrediente) RETURN ingrediente.nombre AS ingrediente";

            Result result = session.run(query);

            while (result.hasNext()) {
                Record record = result.next();
                String ingrediente = record.get("ingrediente").asString();
                ingredienteList.add(ingrediente);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return ingredienteList;
    }
    
    public ArrayList<Comida> tieneComida(List<String> Tipo) {
        ArrayList<Comida> comidaportipo = new ArrayList<>();

        try (Session session = driver.session()) {
        	for(String tipo:Tipo) {
        		String query = "MATCH (t:Tipo {nombre: $tipo})-[:TIENE_COMIDA]->(c:Comida) RETURN c.nombre AS nombre, c.ingredientes AS ingredientes, c.tipo AS tipo";

	            Result result = session.run(query, Values.parameters("tipo", tipo));
	
	            while (result.hasNext()) {
	                Record record = result.next();
	                String nombre = record.get("nombre").asString();
	                List<String> ingredientes = record.get("ingredientes").asList(Value::asString);
	                String tipoComida = record.get("tipo").asString();
	                
	                Comida comida = new Comida(nombre,tipoComida, ingredientes);
	                comidaportipo.add(comida);
	               }
        	
            
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return comidaportipo;
    }
    /*
    public ArrayList<Comida> Ingredientede(List<String> ingredientes, List<Comida> comidas) {
        ArrayList<Comida> comidaporingredientes = new ArrayList<>();

        try (Session session = driver.session()) {
            for (Comida comida : comidas) {
                String tipoComida = comida.getTipo();
                String query ="MATCH (t:Tipo {nombre: $tipoComida})-[:TIENE_COMIDA]->(c:Comida) WHERE i.nombre IN $ingredientes RETURN c.nombre AS nombre, c.ingredientes AS ingredientes, c.tipo AS tipo ";
                //String query = "MATCH (t:Tipo {nombre: $tipoComida})-[:TIENE_COMIDA]->(c:Comida)-[:INGREDIENTE_DE]->(i:Ingrediente) " +
                  //      "WHERE i.nombre IN $ingredientes " +
                 //       "RETURN c.nombre AS nombre, c.ingredientes AS ingredientes, c.tipo AS tipo";

                Result result = session.run(query, Values.parameters("tipoComida", tipoComida, "ingredientes", ingredientes));

                while (result.hasNext()) {
                    Record record = result.next();
                    String nombre = record.get("nombre").asString();
                    List<String> ingredientesComida = record.get("ingredientes").asList(Value::asString);
                    String tipoComidaResult = record.get("tipo").asString();

                    Comida comidaResult = new Comida(nombre, tipoComidaResult, ingredientesComida);
                    comidaporingredientes.add(comidaResult);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return comidaporingredientes;
    }
*/
    public void delete(String name) {
        try (Session session = driver.session()) {
            String query = "MATCH (c:Comida {nombre: $nombre}) DELETE c";
            session.run(query, Values.parameters("nombre", name));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public List<Comida> getComidasWithCommonIngredients(String comidaName) {
        List<Comida> comidas = new ArrayList<>();

        try (Session session = driver.session()) {
            String query = "MATCH (c1:Comida)-[:TIENE_INGREDIENTE_EN_COMUN]-(c2:Comida) " +
                    "WHERE c1.nombre = $comidaName " +
                    "RETURN c2";

            Result result = session.run(query, Values.parameters("comidaName", comidaName));

            while (result.hasNext()) {
                Record record = result.next();
                Node c2 = record.get("c2").asNode();
                //Comida comida = new Comida();
                //comida.setNombre(c2.get("nombre").asString());
                String nombre = record.get("nombre").asString();
                List<String> ingredientes = record.get("ingredientes").asList(Value::asString);
                String tipoComida = record.get("tipo").asString();
                
                Comida comida = new Comida(nombre,tipoComida, ingredientes);
                comidas.add(comida);
            }
        }

        return comidas;
    }
    public void insert(Comida comida) {
        try (Session session = driver.session()) {
            String query = "CREATE (c:Comida {nombre: $nombre, ingredientes: $ingredientes, tipo: $tipo})";
            session.run(query, Values.parameters(
                    "nombre", comida.getNombre(),
                    "ingredientes", comida.getIngredientes(),
                    "tipo", comida.getTipo()
            ));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @Override
    public void close() throws Exception {
        driver.close();
    }
}

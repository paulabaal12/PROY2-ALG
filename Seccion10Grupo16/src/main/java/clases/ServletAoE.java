package clases;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ServletAoE")
public class ServletAoE extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String nombre = request.getParameter("nombre");
    	String nombreE = request.getParameter("nombreE");
        String ingredientes = request.getParameter("ingredientes");
        String tipo = request.getParameter("tipo");
        List<String> ing ;
        
        // Get the existing ArrayList from the session
        HttpSession session = request.getSession();
        
        List<Comida> comidaList = (ArrayList<Comida>) session.getAttribute("comidaList");
        
        
        String action = request.getParameter("action");
        String submit = request.getParameter("submit");
        
        try (EmbeddedNeo4j neo4j = new EmbeddedNeo4j("bolt://107.22.72.216:7687", "neo4j", "form-barges-sills")) {
            // Retrieve the comidaList from the Neo4j database
            comidaList = neo4j.getComidaList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (action != null || submit != null) {
        	request.setAttribute("comidaList", comidaList);
        	for(Comida comida: comidaList) {
        		System.out.println(comida.getNombre());
        	}
        	
        	if(nombre!=null&&ingredientes!=null&&tipo!=null&&nombre!=""&&ingredientes!=""&&tipo!="") {
        		ing= new ArrayList<>(Arrays.asList(ingredientes.split(",")));
            	Comida comida= new Comida(nombre, tipo, ing);
        		try (EmbeddedNeo4j neo4j = new EmbeddedNeo4j("bolt://107.22.72.216:7687", "neo4j", "form-barges-sills")) {
	                // Retrieve the comidaList from the Neo4j database
	        		neo4j.insert(comida);
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
        	}
        	if(nombreE!=null&& nombreE!="") {
        		try (EmbeddedNeo4j neo4j = new EmbeddedNeo4j("bolt://107.22.72.216:7687", "neo4j", "form-barges-sills")) {
	                // Retrieve the comidaList from the Neo4j database
	        		neo4j.delete(nombreE);
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
        	}
        	System.out.println(nombreE);
        	
       }
        
        
     
        // Set the 'comidaList' attribute in the request
        
        
        
        
        // Forward the request and response to the 'Home.jsp' page
        request.getRequestDispatcher("Home.jsp").forward(request, response);
    }
    
    
}
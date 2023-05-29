package clases;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/MyServlet")
public class MyServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the selected button names from the request parameters
        String[] selectedButtonName = request.getParameterValues("buttonName");
        String[] selectedButtonNameT = request.getParameterValues("Type");

        
        // Get the existing ArrayList from the session
        HttpSession session = request.getSession();
        ArrayList<String> buttonName = (ArrayList<String>) session.getAttribute("buttonName");
        ArrayList<String> Type = (ArrayList<String>) session.getAttribute("Type");
        //List<Comida> comidaList = new ArrayList<>();
        List<Comida> comidaList = (ArrayList<Comida>) session.getAttribute("comidaList");
        ArrayList<String> tipoList = (ArrayList<String>) session.getAttribute("tipoList");
        ArrayList<String> ingredienteList = (ArrayList<String>) session.getAttribute("ingredienteList");
        GrafoComidas recommendation = new GrafoComidas();
        //List<Comida> recommendedComidas = new ArrayList<>();
        List<Comida> recommendedComidas = (ArrayList<Comida>) session.getAttribute("recommendedComidas");
        /*GrafoComidas recommendation = new GrafoComidas();
        List<Comida> recommendedComidas = (ArrayList<Comida>) session.getAttribute("recommendedComidas");*/
        // If the ArrayList doesn't exist in the session, create a new one
        if (buttonName == null) {
            buttonName = new ArrayList<>();
        }
        if (Type == null) {
            Type = new ArrayList<>();
        }
        /*
        if ( recommendedComidas== null) {
            recommendedComidas = new ArrayList<>();
        }*/
        if (selectedButtonName != null) {
        	// Process each selected button name
            for (String name : selectedButtonName) {
                if (containsTipoComida(buttonName, name)) {
                    // If the name already exists, remove it
                    buttonName.remove(name);
                } else {
                    // If the name doesn't exist, add it
                    buttonName.add(name);
                }
            }
        }
        
        if (selectedButtonNameT != null) {
        	// Process each selected button name
            for (String name : selectedButtonNameT) {
                if (containsTipoComida(Type, name)) {
                    // If the name already exists, remove it
                    Type.remove(name);
                } else {
                    // If the name doesn't exist, add it
                    Type.add(name);
                }
            }
        }
        try (EmbeddedNeo4j neo4j = new EmbeddedNeo4j("bolt://107.22.72.216:7687", "neo4j", "form-barges-sills")) {
            // Retrieve the comidaList from the Neo4j database
            comidaList = neo4j.getComidaList();
            tipoList = neo4j.getTipos();
            ingredienteList = neo4j.getIngredientes();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
     // Check if the recommendation action is triggered
        String action = request.getParameter("action");
        String submit = request.getParameter("submit");
        // Save the updated ArrayList in the session
        session.setAttribute("buttonName", buttonName);
        
        // Save the updated ArrayList in the session
        session.setAttribute("Type", Type);

        String selectedOption = request.getParameter("option");

        // Set the 'comidaList' attribute in the request
        request.setAttribute("comidaList", comidaList);
        
        // Set the 'tipoList' attribute in the request
        request.setAttribute("tipoList", tipoList);
        
        // Set the 'ingredienteList' attribute in the request
        request.setAttribute("ingredienteList", ingredienteList);
        if (submit != null) {
       	 
       	 request.setAttribute("option", selectedOption);
       	 System.out.println(selectedOption);
       }
        
        if (action != null) {
             recommendedComidas = recommendation.generarRecomendacion(comidaList, buttonName, Type,selectedOption);
            // Set the 'recommendedComidas' attribute in the request
            request.setAttribute("recommendedComidas", recommendedComidas);
            for(Comida comida: recommendedComidas) {
            	System.out.println(comida.getNombre());
            }
            for(String tipo:buttonName) {
            	System.out.println(tipo);
            }
        }
        
        
        
        // Forward the request and response to the 'index.jsp' page
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
    
    private boolean containsTipoComida(ArrayList<String> Tipos, String tipo) {
        for (int i = 0; i < Tipos.size(); i++) {
            if (Tipos.get(i) != null && Tipos.get(i).equals(tipo)) {
                return true;
            }
        }
        return false;
    }
}
import java.io.IOException;
import java.util.ArrayList;
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

        // Get the existing ArrayList from the session
        HttpSession session = request.getSession();
        ArrayList<String> buttonName = (ArrayList<String>) session.getAttribute("buttonName");

        // If the ArrayList doesn't exist in the session, create a new one
        if (buttonName == null) {
            buttonName = new ArrayList<>();
        }

        if (selectedButtonName != null) {
            // Add each selected button name to the ArrayList
            for (String name : selectedButtonName) {
            	if(!containsTipoComida(buttonName,name)) {
            		buttonName.add(name);
            	}
            }
        }

        // Save the updated ArrayList in the session
        session.setAttribute("buttonName", buttonName);

        // Redirect the user back to the JSP page
        response.sendRedirect("index.jsp");
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
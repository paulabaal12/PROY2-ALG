<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="clases.Comida" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sección10 Grupo16</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <style>
        .w3-btn { width:3000px; }
        .center { display: flex; justify-content: center; }
        .title-text { font-size: 100px;  text-align: center; margin-bottom: 1px; margin-top: 1px;}
        .title-image { width: 25%; }
        .subtitle { font-size: 24px; text-align: center; margin-bottom: 1px; margin-top: 1px;}
        .receipt-row {
		    display: flex;
		    justify-content: space-between;
		    margin-bottom: 10px;
		}
		
		p.thick {
		  font-weight: bold;
		}
		
		.receipt-column-left {
		    flex-basis: 20%;
		    text-align: left;
		    padding-left: 22px;
		}
		
		.receipt-column-right {
		    flex-basis: 20%;
		    text-align: right;
		    padding-right: 25px;
		}
		p.small {
		  line-height: 0.8;
		}
		.receipt-column-item {
		    flex-basis: 50%;
		    text-align: left;
		}
        .leftcolumn {   
		  float: left;
		  width: 75%;
		}
		
		/* Add a card effect for articles */
		.card {
		  background-color: white;
		  padding: 20px;
		  margin-top: 20px;
		}
		/* Right column */
		.rightcolumn {
		  float: left;
		  width: 25%;
		  padding-left: 20px;
		}
		.footer {
		  
		  text-align: center;
		  
		}
		/* Clear floats after the columns */
		.row::after {
		  content: "";
		  display: table;
		  clear: both;
		}
		/* Header/Blog Title */
		.header {
		  padding: 5px;
		  text-align: center;
		  background: white;
		  
		}
		/* Change color on hover */
		.topnav a:hover {
		  background-color: #ddd;
		  color: black;
		}
		/* Style the topnav links */
		.topnav a {
		  float: left;
		  display: block;
		  color: #f2f2f2;
		  text-align: center;
		  padding: 14px 16px;
		  text-decoration: none;
		}
		/* Style the top navigation bar */
		.topnav {
		  overflow: hidden;
		  background-color: #FF446D;
		}
		
    </style>
</head>
<body style="background-color:#FFAACC; margin-bottom: 40px; padding: 20px;">
	<div class="header">
	  <h1 class="title-text" style="text-align: center; font-family: Blippo, fantasy; color: #FFE23C; text-shadow: 2px 2px #48ACF0;"  >FOODIE</h1>
      <p class="subtitle">recomendaciones de comida</p>
      <img src="img3.png" alt="Person" class="title-image" >
    </div>
    <div class="topnav">
	  <a href="index.jsp">Home</a>
	  <a href="Home.jsp">Agregar o eliminar</a>
	</div>
    <div class="header" style="margin-top: 20px;">
   		<img src="img2.jpeg" alt="comic" style="width:60%" >
    </div>
    
<div class="row">
    <div class="w3-center">
    	<div class="leftcolumn">
    		<div class="card">
        
		        <form method="post" action="MyServlet">
		            <button value="Desayuno" name="buttonName" class="w3-button w3-round-large" style="color: #f2f2f2; width:27%; background-color:#48ACF0;font-size: 30px;  margin-left:20px; margin-right:20px;" >Desayuno</button>
		            <button value="Almuerzo" name="buttonName" class="w3-button w3-round-large" style="color: #f2f2f2; width:27%; background-color:#48ACF0;font-size:30px; margin-left:20px; margin-right:20px;">Almuerzo/Cena</button>
		            <button value="Postre" name="buttonName" class="w3-button w3-round-large" style="color: #f2f2f2; width:27%; background-color:#48ACF0;font-size:30px;  margin-left:20px; margin-right:20px;">Postre</button>
		            <button value="Bebidas" name="buttonName" class="w3-button w3-round-large" style="color: #f2f2f2; width:27%; background-color:#FFE23C;font-size:30px; margin-top:20px; margin-left:20px; margin-right:20px;">Bebidas</button>
		            <button value="Picante" name="buttonName" class="w3-button w3-round-large" style="color: #f2f2f2; width:27%; background-color:#FFE23C;font-size:30px; margin-top:20px; margin-left:20px; margin-right:20px;">Picante</button>
		            <button value="Vegano" name="buttonName" class="w3-button w3-round-large" style="color: #f2f2f2; width:27%; background-color:#FFE23C;font-size:30px; margin-top:20px; margin-left:20px; margin-right:20px;">Vegano</button>
		            <button value="Snacks" name="buttonName" class="w3-button w3-round-large" style="color: #f2f2f2; width:27%; background-color:#48ACF0;font-size:30px; margin-top:20px; margin-left:20px; margin-right:20px;">Snacks</button>
		            <button value="Saludable" name="buttonName" class="w3-button w3-round-large" style="color: #f2f2f2; width:27%; background-color:#48ACF0;font-size:30px; margin-top:20px; margin-left:20px; margin-right:20px;">Saludable</button>
		            <button value="Coreano" name="buttonName" class="w3-button w3-round-large" style="color: #f2f2f2; width:27%; background-color:#48ACF0;font-size:30px; margin-top:20px; margin-left:20px; margin-right:20px;">Coreano</button>
		            <button value="Huevo" name="Type" class="w3-button w3-round-large" style="color: #f2f2f2; width:27%; background-color:#FFE23C;font-size: 30px; margin-top:20px; margin-left:20px; margin-right:20px;" >Huevo</button>
		            <button value="Queso" name="Type" class="w3-button w3-round-large" style="color: #f2f2f2; width:27%; background-color:#FFE23C;font-size:30px;margin-top:20px ;margin-left:20px; margin-right:20px;">Queso</button>
		            <button value="Leche" name="Type" class="w3-button w3-round-large" style="color: #f2f2f2; width:27%; background-color:#FFE23C;font-size:30px; margin-top:20px; margin-left:20px; margin-right:20px;">Leche</button>
		            <button value="Frijol" name="Type" class="w3-button w3-round-large" style="color: #f2f2f2; width:27%; background-color:#48ACF0;font-size:30px; margin-top:20px; margin-left:20px; margin-right:20px;">Frijol</button>
		            <button value="Tortilla de harina" name="Type" class="w3-button w3-round-large" style="color: #f2f2f2; width:27%; background-color:#48ACF0;font-size:30px; margin-top:20px; margin-left:20px; margin-right:20px;">Tortilla de harina</button>
		            <button value="Tomate" name="Type" class="w3-button w3-round-large" style="color: #f2f2f2; width:27%; background-color:#48ACF0;font-size:30px; margin-top:20px;  margin-left:20px; margin-right:20px;">tomate</button>
		            <button value="Pan" name="Type" class="w3-button w3-round-large" style="color: #f2f2f2; width:27%; background-color:#FFE23C;font-size:30px; margin-top:20px; margin-left:20px; margin-right:20px;">Pan</button>
		            <button value="Salchicha" name="Type" class="w3-button w3-round-large" style="color: #f2f2f2; width:27%; background-color:#FFE23C;font-size:30px; margin-top:20px; margin-left:20px; margin-right:20px;">Salchicha</button>
		            <button value="Aguacate" name="Type" class="w3-button w3-round-large" style="color: #f2f2f2; width:27%; background-color:#FFE23C;font-size:30px; margin-top:20px; margin-left:20px; margin-right:20px;">Aguacate</button>
		            <button value="Comida rápida" name="buttonName" class="w3-button w3-round-large" style="color: #f2f2f2; width:27%; background-color:#48ACF0;font-size:30px; margin-top:20px; margin-left:20px; margin-right:20px;">Comida rápida</button>
		            <button value="Papa" name="Type" class="w3-button w3-round-large" style="color: #f2f2f2; width:27%; background-color:#48ACF0;font-size:30px; margin-top:20px; margin-left:20px; margin-right:20px;">Papa</button>
		            <button value="Lechuga" name="Type" class="w3-button w3-round-large" style="color: #f2f2f2; width:27%; background-color:#48ACF0;font-size:30px; margin-top:20px; margin-left:20px; margin-right:20px;">Lechuga</button>
		            <button value="Kimchi" name="Type" class="w3-button w3-round-large" style="color: #f2f2f2; width:27%; background-color:#FFE23C;font-size:30px; margin-top:20px; margin-left:20px; margin-right:20px;">Kimchi</button>
		            <button value="Tofu" name="Type" class="w3-button w3-round-large" style="color: #f2f2f2; width:27%; background-color:#FFE23C;font-size:30px; margin-top:20px; margin-left:20px; margin-right:20px;">Tofu</button>
		            <button value="Pollo" name="Type" class="w3-button w3-round-large" style="color: #f2f2f2; width:27%; background-color:#FFE23C;font-size:30px; margin-top:20px; margin-left:20px; margin-right:20px;">Pollo</button>
		            
		            <button value="Sándwiches" name="buttonName" class="w3-button w3-round-large" style="color: #f2f2f2; width:27%; background-color:#48ACF0;font-size:30px; margin-top:20px; margin-left:20px; margin-right:20px;">Sándwiches</button>
		            <button value="Pastas" name="buttonName" class="w3-button w3-round-large" style="color: #f2f2f2; width:27%; background-color:#48ACF0;font-size:30px; margin-top:20px; margin-left:20px; margin-right:20px;">Pastas</button>
		            <button value="Sopas" name="buttonName" class="w3-button w3-round-large" style="color: #f2f2f2; width:27%; background-color:#48ACF0;font-size:30px; margin-top:20px; margin-left:20px; margin-right:20px;">Sopas</button>
		            <button value="Japonesa" name="buttonName" class="w3-button w3-round-large" style="color: #f2f2f2; width:27%; background-color:#FFE23C;font-size:30px; margin-top:20px; margin-left:20px; margin-right:20px;">Japonesa</button>
		            <button value="Mexicana" name="buttonName" class="w3-button w3-round-large" style="color: #f2f2f2; width:27%; background-color:#FFE23C;font-size:30px; margin-top:20px; margin-left:20px; margin-right:20px;">Mexicana</button>
		            <button value="Ensaladas" name="buttonName" class="w3-button w3-round-large" style="color: #f2f2f2; width:27%; background-color:#FFE23C;font-size:30px; margin-top:20px; margin-left:20px; margin-right:20px;">Ensaladas</button>
		            
		            
		            <button value="vegetales" name="Type" class="w3-button w3-round-large" style="color: #f2f2f2; width:27%; background-color:#48ACF0;font-size:30px; margin-top:20px; margin-left:20px; margin-right:20px;">Vegetales</button>
		            <button value="frutas" name="Type" class="w3-button w3-round-large" style="color: #f2f2f2; width:27%; background-color:#48ACF0;font-size:30px; margin-top:20px; margin-left:20px; margin-right:20px;">Frutas</button>
		            <button value="fideos" name="Type" class="w3-button w3-round-large" style="color: #f2f2f2; width:27%; background-color:#48ACF0;font-size:30px; margin-top:20px; margin-left:20px; margin-right:20px;">Fideos</button>
		            <button value="carne" name="Type" class="w3-button w3-round-large" style="color: #f2f2f2; width:27%; background-color:#FFE23C;font-size:30px; margin-top:20px; margin-left:20px; margin-right:20px;">Carne</button>
		            <button value="agua" name="Type" class="w3-button w3-round-large" style="color: #f2f2f2; width:27%; background-color:#FFE23C;font-size:30px; margin-top:20px; margin-left:20px; margin-right:20px;">Agua</button>
		            <button value="nueces" name="Type" class="w3-button w3-round-large" style="color: #f2f2f2; width:27%; background-color:#FFE23C;font-size:30px; margin-top:20px; margin-left:20px; margin-right:20px;">Nueces</button>
		            <button value="arroz" name="Type" class="w3-button w3-round-large" style="color: #f2f2f2; width:27%; background-color:#48ACF0;font-size:30px; margin-top:20px; margin-left:20px; margin-right:20px;">Arroz</button>
		            <button value="tortilla" name="Type" class="w3-button w3-round-large" style="color: #f2f2f2; width:27%; background-color:#48ACF0;font-size:30px; margin-top:20px; margin-left:20px; margin-right:20px;">Tortilla</button>
		            <button value="tortilla de maíz" name="Type" class="w3-button w3-round-large" style="color: #f2f2f2; width:27%; background-color:#48ACF0;font-size:30px; margin-top:20px; margin-left:20px; margin-right:20px;">Tortilla de Maíz</button>
		            <button value="harina" name="Type" class="w3-button w3-round-large" style="color: #f2f2f2; width:27%; background-color:#FFE23C;font-size:30px; margin-top:20px; margin-left:20px; margin-right:20px;">Harina</button>
		            <button value="yogurt" name="Type" class="w3-button w3-round-large" style="color: #f2f2f2; width:27%; background-color:#FFE23C;font-size:30px; margin-top:20px; margin-left:20px; margin-right:20px;">Yogurt</button>
		            <button value="salsa" name="Type" class="w3-button w3-round-large" style="color: #f2f2f2; width:27%; background-color:#FFE23C;font-size:30px; margin-top:20px; margin-left:20px; margin-right:20px;">Salsa</button>
		        </form>
        	</div>
        </div>
      </div>
      <div class="w3-center">
    <div class="rightcolumn">
        <div class="card">
            <p class="thick">RECEIPT OF SALE</p>
            <p class="thick">SHOP NAME</p>
            <p style="font-size: 14px;">Address:</p>
            <p style="font-size: 14px;">Tel:</p>
            <p>--------------------------------------</p>
            <div class="receipt-row">
	                <span class="receipt-column-left" >QTY</span>
	                <span class="receipt-column-item">ITEM</span>
	                <span class="receipt-column-right">AMT</span>
            </div>
            <p>--------------------------------------</p>
            <%-- Display the items from the ArrayList --%>
            <% 
	            ArrayList<String> buttonName = (ArrayList<String>) session.getAttribute("buttonName");
	            
	            if (buttonName != null) {
	                for (String item : buttonName) {
	                	out.println("<div class='receipt-row'><span class='receipt-column-left'>1</span><span class='receipt-column-item'>" + item + "</span><span class='receipt-column-right'>Q0.00</span></div>");
	                }
	            }
				ArrayList<String> Type = (ArrayList<String>) session.getAttribute("Type");
                
                if (Type != null) {
                    for (String item : Type) {
                    	out.println("<div class='receipt-row'><span class='receipt-column-left'>1</span><span class='receipt-column-item'>" + item + "</span><span class='receipt-column-right'>Q0.00</span></div>");
                    }
                }
                String selectedOption = (String) session.getAttribute("selectedOption");
                if (selectedOption != null) {
                    out.println("<div class='receipt-row'><span class='receipt-column-left'>1</span><span class='receipt-column-item'>" + selectedOption + "</span><span class='receipt-column-right'>Q0.00</span></div>");
                }
            %>
            <p>--------------------------------------</p>
            <p class="thick" style="word-spacing: 160px;">Total Q0.00</p>
            <p style="word-spacing: 162px;">Cash Q0.00</p>
            <p style="word-spacing: 145px;">Change Q0.00</p>
            <p>--------------------------------------</p>
            <p class="thick">THANK YOU!</p>
        </div>
    </div>
</div>
 </div>
      <div class="w3-center">
      	<div class="footer">
      		<div class="card">
		        
				<form class="w3-container w3-card-4" action="MyServlet" method="post" style="font-size:30px; margin-top:20px; margin-bottom:20px;">
				  <h2 style="font-size:40px;">¿Ya tienes algo pensado?</h2>
				
				  <select class="w3-select w3-border" name="option">
				    <option value="" disabled selected>Choose your option</option>
				    <option value="Omelette">Omelette</option>
				    <option value="Huevos Revueltos">Huevos Revueltos</option>
				    <option value="Flan">Flan</option>
				  </select>
				
				  <button name="submit" class="w3-button w3-round-large" style="color: #f2f2f2; width:27%; background-color:#FFE23C;font-size:30px; margin-top:20px; margin-left:20px; margin-right:20px; margin-bottom:20px;">Register</button>
				</form>
				<form method="post" action="MyServlet">
				<button name="action" value="action" class="w3-button w3-circle " style="color: #f2f2f2; background-color:#FF446D;font-size:30px; margin-top:20px; margin-left:20px; margin-right:20px;">+</button>
				</form>
			</div>
		</div>
    </div>
    <div class="w3-center">
    	<div class="footer">
    		<div class="card">
    			<p>Recomendaciones</p>
    			<%-- Display the items from the ArrayList --%>
	            <% 
			        List<Comida> recommendedComidas = (List<Comida>) request.getAttribute("recommendedComidas");
			        if (recommendedComidas != null) {
			            for (Comida comida : recommendedComidas) {
			                out.println("Nombre: " + comida.getNombre() + "<br>");
			             // imprime los ingredientes
			                out.print("Ingredientes: ");
			                List<String> ingredientes = comida.getIngredientes();
			                for (int i = 0; i < ingredientes.size(); i++) {
			                    out.print(ingredientes.get(i));
			                    if (i < ingredientes.size() - 1) {
			                        out.print(", ");
			                    }
			                }
			                out.println("<br>");
			                out.println("Tipo: " + comida.getTipo() + "<br>");
			              //  out.println("Puntuacion: " + comida.getPuntuacion() + "<br>");
			                out.println("<br>");
			            }
			        }
			        %>
    		</div>
    	</div>
    </div>
</body>
</html>
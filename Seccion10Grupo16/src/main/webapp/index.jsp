<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
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
		  padding: 20px;
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
    </style>
</head>
<body style="background-color:#EEF1BD; margin-bottom: 40px; padding: 20px;">
	<div class="header">
	  <h1 class="title-text" style="text-align: center;">FOODIE</h1>
      <p class="subtitle">recomendaciones de comida</p>
      <img src="img3.png" alt="Person" class="title-image" >

    </div>
    <div class="header" style="margin-top: 20px;">
   		<img src="img2.jpeg" alt="comic" style="width:60%" >
    </div>
<div class="row">
    <div class="w3-center">
    	<div class="leftcolumn">
    		<div class="card">
        
		        <form method="post" action="MyServlet">
		            <button value="Desayuno" name="buttonName" class="w3-button w3-round-large" style="width:27%; background-color:#C1292E;font-size: 30px;  margin-left:20px; margin-right:20px;" >Desayuno</button>
		            <button value="Almuerzo/Cena" name="buttonName" class="w3-button w3-round-large" style="width:27%; background-color:#C1292E;font-size:30px; margin-left:20px; margin-right:20px;">Almuerzo/Cena</button>
		            <button value="Postre" name="buttonName" class="w3-button w3-round-large" style="width:27%; background-color:#C1292E;font-size:30px;  margin-left:20px; margin-right:20px;">Postre</button>
		            <button value="Bebidas" name="buttonName" class="w3-button w3-round-large" style="width:27%; background-color:#698F3F;font-size:30px; margin-top:20px; margin-left:20px; margin-right:20px;">Bebidas</button>
		            <button value="Picante" name="buttonName" class="w3-button w3-round-large" style="width:27%; background-color:#698F3F;font-size:30px; margin-top:20px; margin-left:20px; margin-right:20px;">Picante</button>
		            <button value="Vegano" name="buttonName" class="w3-button w3-round-large" style="width:27%; background-color:#698F3F;font-size:30px; margin-top:20px; margin-left:20px; margin-right:20px;">Vegano</button>
		            <button value="Snacks" name="buttonName" class="w3-button w3-round-large" style="width:27%; background-color:#235789;font-size:30px; margin-top:20px; margin-left:20px; margin-right:20px;">Snacks</button>
		            <button value="Saludable" name="buttonName" class="w3-button w3-round-large" style="width:27%; background-color:#235789;font-size:30px; margin-top:20px; margin-left:20px; margin-right:20px;">Saludable</button>
		            <button value="Coreano" name="buttonName" class="w3-button w3-round-large" style="width:27%; background-color:#235789;font-size:30px; margin-top:20px; margin-left:20px; margin-right:20px;">Coreano</button>
		            <button value="Huevo" name="buttonName" class="w3-button w3-round-large" style="width:27%; background-color:#C1292E;font-size: 30px; margin-top:20px; margin-left:20px; margin-right:20px;" >Huevo</button>
		            <button value="Queso" name="buttonName" class="w3-button w3-round-large" style="width:27%; background-color:#C1292E;font-size:30px;margin-top:20px ;margin-left:20px; margin-right:20px;">Queso</button>
		            <button value="Leche" name="buttonName" class="w3-button w3-round-large" style="width:27%; background-color:#C1292E;font-size:30px; margin-top:20px; margin-left:20px; margin-right:20px;">Leche</button>
		            <button value="Frijol" name="buttonName" class="w3-button w3-round-large" style="width:27%; background-color:#698F3F;font-size:30px; margin-top:20px; margin-left:20px; margin-right:20px;">Frijol</button>
		            <button value="Tortilla de harina" name="buttonName" class="w3-button w3-round-large" style="width:27%; background-color:#698F3F;font-size:30px; margin-top:20px; margin-left:20px; margin-right:20px;">Tortilla de harina</button>
		            <button value="Tomate" name="buttonName" class="w3-button w3-round-large" style="width:27%; background-color:#698F3F;font-size:30px; margin-top:20px;  margin-left:20px; margin-right:20px;">tomate</button>
		            <button value="Pan" name="buttonName" class="w3-button w3-round-large" style="width:27%; background-color:#235789;font-size:30px; margin-top:20px; margin-left:20px; margin-right:20px;">Pan</button>
		            <button value="Salchicha" name="buttonName" class="w3-button w3-round-large" style="width:27%; background-color:#235789;font-size:30px; margin-top:20px; margin-left:20px; margin-right:20px;">Salchicha</button>
		            <button value="Aguacate" name="buttonName" class="w3-button w3-round-large" style="width:27%; background-color:#235789;font-size:30px; margin-top:20px; margin-left:20px; margin-right:20px;">Aguacate</button>
		            <button value="Comida rápida" name="buttonName" class="w3-button w3-round-large" style="width:27%; background-color:#698F3F;font-size:30px; margin-top:20px; margin-left:20px; margin-right:20px;">Comida rápida</button>
		            <button value="Papa" name="buttonName" class="w3-button w3-round-large" style="width:27%; background-color:#698F3F;font-size:30px; margin-top:20px; margin-left:20px; margin-right:20px;">Papa</button>
		            <button value="Lechuga" name="buttonName" class="w3-button w3-round-large" style="width:27%; background-color:#698F3F;font-size:30px; margin-top:20px; margin-left:20px; margin-right:20px;">Lechuga</button>
		            <button value="Kimchi" name="buttonName" class="w3-button w3-round-large" style="width:27%; background-color:#235789;font-size:30px; margin-top:20px; margin-left:20px; margin-right:20px;">Kimchi</button>
		            <button value="Tofu" name="buttonName" class="w3-button w3-round-large" style="width:27%; background-color:#235789;font-size:30px; margin-top:20px; margin-left:20px; margin-right:20px;">Tofu</button>
		            <button value="Pollo" name="buttonName" class="w3-button w3-round-large" style="width:27%; background-color:#235789;font-size:30px; margin-top:20px; margin-left:20px; margin-right:20px;">Pollo</button>
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
		        <h2 style="font-size:40px;">¿Ya tienes algo pensado?</h2>
				<form  style ="font-size:30px; margin-top:20px; margin-down:20px;">
				  <input list="comidas" style =" margin-top:20px; margin-down:20px;">
				  <datalist id="comidas">
				    <option value="Omelette">
				    <option value="Huevos revueltos">
				    <option value="Flan">
				    <option value="Avena">
				    <option value="Spaghetti">
				  </datalist>
				</form>
			</div>
		</div>
    </div>
</body>
</html>
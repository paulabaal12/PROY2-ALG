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
<body style="background-color:#EEF1BD; margin-bottom: 40px; padding: 20px;">
	<div class="header">
	  <h1 class="title-text" style="text-align: center; font-family: Blippo, fantasy; color: #FFE23C; text-shadow: 2px 2px #48ACF0;">FOODIE</h1>
      <p class="subtitle">agregar o eliminar</p>
      <img src="img3.png" alt="Person" class="title-image" >
    </div>
    <div class="topnav">
	  <a href="index.jsp">Home</a>
	  <a href="Home.jsp">Agregar o eliminar</a>
	</div> 
<div class="row">
    <div class="w3-center">
    	<div class="leftcolumn">
    		<div class="card">
				<form class="w3-container w3-card-4" method="post" action="ServletAoE">
				  <h2 class="w3-text-blue">Agregar Comida</h2>
				  <p>      
				  <label class="w3-text-blue"><b>Nombre de la Comida</b></label>
				  <input class="w3-input w3-border" name="nombre" type="text"></p>
				  <p>      
				  <label class="w3-text-blue"><b>Ingredientes (Separados por comas)</b></label>
				  <input class="w3-input w3-border" name="ingredientes" type="text"></p>
				  <p>      
				  <label class="w3-text-blue"><b>Tipo</b></label>
				  <input class="w3-input w3-border" name="tipo" type="text"></p>
				   
				  <button name="action" value="action" style="width: 27%;" class="w3-btn w3-blue">Register</button></p>
				
				</form>
				<form class="w3-container w3-card-4" style="margin-top: 20px;" method="post" action="ServletAoE">
				  <h2 class="w3-text-red">Eliminar Comida</h2>
				  <p>      
				  <label class="w3-text-red"><b>Nombre de la Comida</b></label>
				  <input class="w3-input w3-border" name="nombreE" type="text"></p>
				  <p>     
				  <button name="submit" value="submit" style="width: 27%;"class="w3-btn w3-red">Register</button></p>
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
	            ArrayList<Comida> buttonName = (ArrayList<Comida>) request.getAttribute("comidaList");
	            
	            if (buttonName != null) {
	                for (Comida item : buttonName) {
	                	out.println("<div class='receipt-row'><span class='receipt-column-left'>1</span><span class='receipt-column-item'>" + item.getNombre() + "</span><span class='receipt-column-right'>Q0.00</span></div>");
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

</body>
</html>
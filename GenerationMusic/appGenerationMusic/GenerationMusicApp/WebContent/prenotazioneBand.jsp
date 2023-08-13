<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, java.util.List"%>
<%@ page import="model.Band"%>
<%@ page import="util.ArtistiUtil"%>
<%@ page import="model.Utente"%>
<%@ page import="DAO.CommentiArtistiDAO"%>
<%@ page import="model.CommentiArtista"%>
<%@ page import="model.GiorniDisp"%>
<%@ page import="DAO.giorniDispDAO"%>
<%@ page import="DAO.bandDAO"%>
<%@ page import="model.GiorniDisp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	int idBand = (int) session.getAttribute("idBand");

	Band b =bandDAO.recuperaBandTramiteIDint(idBand);
	Utente u = (Utente) session.getAttribute("utente");

	%>
	
	
	<h1> invia richiesta tramite questo form </h1>
	<br><br>
	
	<form action="servlet" method="post">
	<input type="hidden" name="operazione" value="prenotazioneBand">
    <input type="hidden" name="idUtente" value="<%= u.getIdUtente() %>">
    <input type="hidden" name="idBand" value="<%= b.getIdBand() %>">

    <label for="data">Seleziona una data:</label>
    <select name="data" id="data">
     <% List<GiorniDisp> listaGiorniDisp = giorniDispDAO.listaGiorniDiUnaBand(b);  %>
     <%  for (GiorniDisp g : listaGiorniDisp) {
   %>
       <option value="<%= g.getData() %>"><%= g.getData() %></option>
   <% } %>
     
   
    
    </select>

    <br><br>

    <label for="commento">Inserisci un commento:</label>
    <textarea name="commento" id="commento" rows="4" cols="50"></textarea>

    <br><br>

    <input type="submit" value="Invia">
    </form>
	
</body>
</html>
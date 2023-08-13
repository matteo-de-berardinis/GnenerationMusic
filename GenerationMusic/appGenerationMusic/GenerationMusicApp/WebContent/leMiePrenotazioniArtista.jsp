<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList, java.util.List" %>
<%@ page import="model.Utente, model.Artista, model.Band, model.Locale, model.Cliente, model.Proprietario, model.Prenotazione" %>
<%@ page import="DAO.artistiDAO, DAO.prenotazioneDAO, DAO.bandDAO, DAO.LocaleDAO,DAO.UtenteDAO" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!--Custom header css-->
<link href="css/header.css" rel="stylesheet">
<link href="css/index.css" rel="stylesheet">
<!--Bootstrap Icons-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!--Header-->
<%@include file="header.jsp" %>

<body>
   
        
<%Utente u2=(Utente) session.getAttribute("utente");
Artista a=(Artista)session.getAttribute("artista");
%>
    
  <div class="container border bg-white rounded " style="text-align: center; margin-top: 150px;">
    <h1>Le tue prenotazioni</h1>
    <table class="table table-dark table-striped ">
      <thead>
        <tr>
          <th scope="col">#ID</th>
          <th scope="col">Nome Utente</th>
          <th scope="col">Data</th>
          <th scope="col">Commento</th>
          
          <th scope="col"></th>
        </tr>
      </thead>
      <tbody>
      <%
List<Prenotazione> lista = prenotazioneDAO.ottieniListaPrenotazioneArtista(a.getId());

    for (Prenotazione p : lista) {
        Utente utente=UtenteDAO.recuperaUtentePerId(p.getIdUtente());
        Band b = bandDAO.recuperaBandDefinitiva(p.getIdBand());
        Locale l = LocaleDAO.recuperaLocaleTramiteId(p.getIdLocale());

        %>
        <tr>
          <th scope="row"><%=p.getIdPrenotazione()%></th>
          <td><% if (u != null) { %>
                       <%= utente.getNickname() %>
                       <% } else if (b != null) { %>
                       <%= b.getBand() %>
                       <% } else if (l != null) { %>
                       <%= l.getNome() %>
                       <% } %></td>
          <td><%= p.getData() %></td>
          <td><%= p.getCommento() %></td>
          
          <td>
            
             <form action="servlet" method="post">
        <input type="hidden" name="operazione" value="cancellaPrenotazioneArtista">
            <input type="hidden" name="idPrenotazione" value="<%= p.getIdPrenotazione() %>">
            <input type="submit" class="btn btn-danger" value="Elimina">
        </form> 
        </td>
        </tr>
    <% }
%>
         
        
        <!-- Fine -->
      </tbody>
    </table>
  </div>
</body>
</html>
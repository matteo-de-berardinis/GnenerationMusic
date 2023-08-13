<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, java.util.List"%>
<%@ page import="model.Artista"%>
<%@ page import="util.ArtistiUtil"%>
<%@ page import="model.Utente"%>
<%@ page import="model.Locale"%>
<%@ page import="model.CommentiArtista"%>
<%@ page import="model.GiorniDisp"%>
<%@ page import="DAO.giorniDispDAO"%>
<%@ page import="DAO.LocaleDAO"%>
<%@ page import="model.GiorniDisp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/index.css" />
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
     <!--FontAwesome-->
     <script src="https://kit.fontawesome.com/b60ea6b0a3.js" crossorigin="anonymous"></script>
      <!--Custom css-->
    <link href="css/header.css" rel="stylesheet">
    <link href="css/registrazione.css" rel="stylesheet">
</head>
<!-- Header -->
<%@include file="header.jsp" %>
<body>
<%
	int idLocale = (int) session.getAttribute("idLocale");

	Locale l = LocaleDAO.recuperaLocaleTramiteId(idLocale);
	Utente u2 = (Utente) session.getAttribute("utente");

	%>
    <section class="h-100 h-custom" style="background-color: #ffffff00;">
        <div class="container registrazione py-5 h-100">
          <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-lg-8 col-xl-6">
              <div class="card rounded-3">
                <img src="img/backgroundImmagine2.PNG"
                  class="w-100" style="border-top-left-radius: .3rem; border-top-right-radius: .3rem;"
                  alt="Sample photo">
                <div class="card-body p-4 p-md-5">
                  <h3 class="mb-4 pb-2 pb-md-0 mb-md-5 px-md-2">Info Registrazione</h3>
      
                  <form class="px-md-2" action="servlet" method="post">
	<input type="hidden" name="operazione" value="prenotazioneLocale">
    <input type="hidden" name="idUtente" value="<%= u.getIdUtente() %>">
    <input type="hidden" name="idLocale" value="<%= l.getId() %>">
     <input type="hidden" name="nomeLocale" value="<%= l.getNome() %>">
      
                    <label for="data">Seleziona una data:</label>
    <select name="data" id="data">
     <% List<GiorniDisp> listaGiorniDisp = giorniDispDAO.listaGiorniDiUnLocale(l) ;%>
     <%  for (GiorniDisp g : listaGiorniDisp) {
   %>
       <option value="<%= g.getData() %>"><%= g.getData() %></option>
   <% } %>
     
   
    
    </select>

    <br><br>

    <label for="commento">Inserisci un commento:</label>
    <textarea name="commento" id="commento" rows="4" cols="50"></textarea>

    <br><br>
                    
      
                   
      
                    <button type="submit" class="btn btn-dark btn-lg mb-1" value = "Completa registrazione">Invia</button>
      
                  </form>
      
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
</body>
</html>
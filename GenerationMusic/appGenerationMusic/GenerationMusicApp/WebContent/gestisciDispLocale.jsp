<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList,java.util.List" %>
<%@ page import="model.Utente,model.Artista,model.Band,model.Locale,model.Proprietario,model.GiorniDisp, model.Cliente" %>
<%@ page import="DAO.giorniDispDAO,DAO.LocaleDAO" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestisci disponibilità</title>
    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <!--FontAwesome-->
    <script src="https://kit.fontawesome.com/b60ea6b0a3.js" crossorigin="anonymous"></script>
    <!--Owl Carousel-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"
        integrity="sha512-tS3S5qG0BlhnQROyJXvNjeEM4UpMXHrQfTGmbQ1gKmelCxlSEBUaxhRBj/EFTzpbP4RVSrpEikbmdJobCvhE3g=="
        crossorigin="anonymous" />
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css"
        integrity="sha512-sMXtMNL1zRzolHYKEujM2AqCLUR9F2C4/05cdbxjjLSRvMQIciEPCQZo++nk7go3BtSuK9kfa/s+a4f4i5pLkw=="
        crossorigin="anonymous" />

    <!--Custom css-->
    <link href="css/header.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/index.css" />
    <link rel="stylesheet" type="text/css" href="css/pagina.css" />
    <link rel="stylesheet" type="text/css" href="css/commenti.css" />
</head>

<!-- Header -->
<%@include file="header.jsp" %>

<body style="margin-top: 150px ">
    

    <div class="container mt-5" style="text-align: center; margin-top: 150px ">
        <div class="container bg-dark text-white border rounded" style="justify-content: center;">
            <h1>I tuoi giorni disponibili</h1>
            <div class="row">
             <%
int id = (int) session.getAttribute("idLocale");
Locale l = LocaleDAO.recuperaLocaleTramiteId(id);
List<GiorniDisp> lista = giorniDispDAO.listaGiorniDiUnLocale(l);
for (GiorniDisp g : lista) {
%>
                <div class="col-lg-3 col-md-6 my-4">
                    <div class="card text-black" style="width: 18rem; background-color: rgb(208, 210, 212);">
                        <div class="card-body">
                            <h5 class="card-title">Giorno disponibile</h5>
                            <h6 class="card-subtitle mb-2 text-muted"><%= g.getData() %></h6>
                            
                            <input type="submit" class="btn btn-dark mt-5" value="Rimuovi">
                            
                        </div>
                    </div>
                </div>
                
                <% } %>
                

                <div class="container rounded border text-black mb-5" style="max-width: 80%;  background-color: rgb(208, 210, 212);">
                    <h1>Inserisci nuova data</h1>
<form action="servlet" method="post" autocomplete="on">
    <input type="hidden" name="operazione" value="inserisciNuovaDataLocale">
    <label for="inserisciGiornoDisp"><b class="bg-dark rounded border-light text-white px-2 py-1 ">Data in cui sei disponibile:</b></label><br><br>
    <input type="date" id="inserisciGiornoDisp" name="inserisciGiornoDisp" required><br>
    
    <div class="container my-3" style="text-align: center" >
    <a href="leMiePrenotazioniLocale.jsp?idLocale=<%= l.getId() %>"><button class=" btn btn-dark btn-lg">Aggiungi prenotazione</button></a>
    </div>
</form>
                </div>

            </div>
        </div>
    </div>
</body>

</html>
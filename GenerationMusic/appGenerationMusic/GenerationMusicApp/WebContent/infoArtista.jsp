<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList, java.util.List" %>
<%@ page import="model.Artista" %>
<%@ page import="util.ArtistiUtil"%>
<%@ page import="model.Utente" %>
<%@ page import="DAO.CommentiArtistiDAO" %>
<%@ page import="model.CommentiArtista" %>
<%@ page import="model.GiorniDisp" %>
<%@ page import="DAO.giorniDispDAO" %>
<%@ page import="DAO.artistiDAO" %>
<%@ page import="model.GiorniDisp" %>


<%@ page
	import="model.Band, model.Locale, model.Cliente, model.Proprietario"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Informazioni Artista</title>
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

<!--Header-->

<%@include file="header.jsp"%>

<!--Fine Header-->
<%
    List<Artista> listaArtisti = (List<Artista>) session.getAttribute("listaArtisti");
    int idArtista = (int) session.getAttribute("idArtista");
    
    Artista a = artistiDAO.recuperaArtistaDefinitivo(idArtista);
    int media = CommentiArtistiDAO.mediaValutazioneArtista(idArtista);
%>
<% Utente u2=(Utente)session.getAttribute("utente"); %>

    <div class="container" style="margin-top: 120px;">
    
<div class="container bg-dark rounded border px-4 pt-2 mb-2 text-white border border-light" style="margin-top: 290px; margin-left: 40px;  z-index: 2; width:fit-content; position: absolute; min-width: 250px;">
                        <h2><%=a.getNickname() %></h2>
                    </div>
        <div class="container rounded-top border text-white d-flex flex-row"
            style="background-color: black; background-size: cover; background-repeat: no-repeat; background-position: center; height: 20rem; z-index: -1;">

            <div class="ms-5 mt-5 d-flex flex-column" style="width: 250px; flex-shrink: 0; position: relative;">
            <%if(a.getImg() != null) {%>
                <img src="<%=a.getImg() %>" alt="Generic placeholder image" class="img-fluid img-thumbnail mt-5" style="width: 210px; z-index: 1;">
                <%} else { %>
                <img src="img\avatar.png" alt="Generic placeholder image" class="img-fluid img-thumbnail mt-5"
                    style="width: 210px; z-index: 1;">
                    
                    <% } %>
                    
            </div>
            <% if(media <= 59){ %>
            
            <span class="badge bg-danger rounded-circle border"
                style="position: absolute; margin-left: 230px; margin-top: 70px; width: 50px; height: 50px; z-index: 1;">
                <h3 class="py-1"><%=media %></h3>
            </span>
            
            <% } else if (media > 59 && media <= 79){%>
            
            <span class="badge bg-success rounded-circle border"
                style="position: absolute; margin-left: 230px; margin-top: 70px; width: 50px; height: 50px; z-index: 1;">
                <h3 class="py-1"><%=media %></h3>
            </span>
            
            <% } else if (media > 79){%>
            
            <span class="badge bg-primary rounded-circle border"
                style="position: absolute; margin-left: 230px; margin-top: 70px; width: 50px; height: 50px; z-index: 1;">
                <h3 class="py-1"><%=media %></h3>
            </span>
            
            <% } %>
           
        </div>


        <div class="container bg-dark text-white py-5 border">
            <div class="row">
                <div class="col-sm-4 px-5">

<p>Nome d'arte: <%=a.getNomeArtista() %></p>
                    <p>Anno di Nascita: <%=a.getAnnoNascita() %></p>
                  
                    <p>Nazionalità: <%=a.getNazionalita() %></p>
                    <p>Genere: <%=a.getGenere() %></p>
                </div>
<div class="col-sm-8 px-5 ">
                    <h3>BIO</h3><%=a.getBio() %>
                </div>
                </div>
            <div class="container bg-light">
                 <div class="container py-5" style="text-align: center">
                    <!--Giorni disponibili-->
                    
                    
                   <h2 class="text-dark"> Disponibile in data:</h2>
                   
                   <ul class="list-group">
                    
  <% List<GiorniDisp> listaGiorniDisp = giorniDispDAO.listaGiorniDiUnArtista(a);%>
     <%  for (GiorniDisp g : listaGiorniDisp) {
   %>
  <li class="list-group-item list-group-item-dark"><h4><%= g.getData() %></h4>
  </li>
<% } %>
  
</ul>
 
       
   
<div class= "container my-4" style= "text-align: center">

<a href="prenotazioneArtista.jsp" class="btn btn-danger btn-lg">Prenota </a>
</div>
                <!--Fine carousel-->
                <br><br>
            </div>
            
            
             <!-- Commenti -->

            <section>
                <div class="container bg-dark rounded-bottom py-5">
                    <div class="row d-flex justify-content-center">
                        <div class="col-md-12 col-lg-10">
                            <div class="card text-dark">
                                <div class="card-body p-4">
                                    <h4 class="mb-0">Recensioni</h4>
                                    <p class="fw-light mb-4 pb-2">Ordinate dal più recente</p>


                                </div>
                                <%List<CommentiArtista>lista=CommentiArtistiDAO.listaGiorniDiUnArtista(a);  %>
									<%for(CommentiArtista c:lista){
										%>
                                	    <hr class="my-0" />
                                <div class="card-body p-4">
                                    <div class="d-flex flex-start">
                                       
                                        <div>
                                            <h6 class="fw-bold mb-1"><%=c.getNickname() %></h6>
                                            <div class="d-flex align-items-center mb-3">
                                                <p class="mb-0">
                                                   <% if(c.getValutazione() <= 59){ %>
                                                    			<span class="badge bg-danger ms-5"><%=c.getValutazione() %></span>
                                                    			<%} else if (c.getValutazione() > 59 && c.getValutazione() <=79){  %>
                                                    			<span class="badge bg-success ms-5"><%=c.getValutazione() %></span>
                                                    			<%} else if (c.getValutazione() > 79) {  %>
                                                    			<span class="badge bg-primary ms-5"><%=c.getValutazione() %></span>
                                                    			<% } %>
                                                </p>

                                            </div>
                                           <%=c.getTesto() %>

                                        </div>
                                    </div>
                                </div>
                                <% } %>
                                
                                </div>
                        </div>
                    </div>
                </div>

                <!--Sezione Inserisci commento-->
                
                <form action="servlet" method="post">
<input type="hidden" name="operazione" value="inserisciCommento">
<div class="container-fluid bg-dark my-5 py-5 text-dark rounded">
                        <div class="row d-flex justify-content-center">
                            <div class="col-md-10 col-lg-8 col-xl-6">
                                <div class="card">
                                    <div class="card-body p-4">
                                        <div class="d-flex flex-start w-100">
                                            
                                            <div class="w-100">
                                                <h5>Aggiungi recensione</h5>

                                                <div class="form-outline">
                                                    <textarea class="form-control" id="textAreaExample" rows="4"
                                                        placeholder="Commento" name="commento"></textarea>

                                                </div>
                                                 <input type="hidden" name="emailUtente" value="<%=u2.getEmail() %>">
                                                 <input type="hidden" name="idArtista" value="<%=a.getId() %>">
  
  
                                                <div class="mt-3">
                                                    <label class="form-label" for="voto">Voto</label>
                                                    <input id="voto" class="form-control" type="number" name="valutazione" min="0"
                                                        max="100" />
                                                    <input type="submit" class="btn btn-dark mt-4" value="Invia commento">
                                                        Invia<i class="fas fa-long-arrow-alt-right ms-1"></i>
                                                    </input>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </section>

			</div>
			</div>

            <!--Jquery -->
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

         
        
</body>

</html>



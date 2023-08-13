<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList, java.util.List" %>
<%@ page import="model.Locale" %>
<%@ page import="util.ArtistiUtil"%>
<%@ page import="model.Utente" %>
<%@ page import="DAO.CommentiLocaleDAO" %>
<%@ page import="model.CommentoLocale" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
<body>

<%
    List<Locale> listalocale = (List<Locale>) session.getAttribute("listaLocali");
    int idLocale = (int) session.getAttribute("idLocale");

    Locale  l = ArtistiUtil.trovaLocalePerID(listalocale, idLocale);
    Utente u=(Utente)session.getAttribute("utente");
%>
 <div class="container" style="margin-top: 120px;">
    
<div class="container bg-dark rounded border px-4 pt-2 mb-2 text-white border border-light" style="margin-top: 290px; margin-left: 40px;  z-index: 2; width:fit-content; position: absolute; min-width: 250px;">
                        <h2><%=l.getNome() %></h2>
                    </div>
        <div class="container rounded-top border text-white d-flex flex-row"
            style="background-image: url(immagini/background4.jpg); background-size: cover; background-repeat: no-repeat; background-position: center; height: 20rem; z-index: -1;">

            <div class="ms-5 mt-5 d-flex flex-column" style="width: 250px; flex-shrink: 0; position: relative;">
                <img src="<%=l.getImg() %>" alt="Generic placeholder image" class="img-fluid img-thumbnail mt-5"
                    style="width: 210px; z-index: 1;">
                    
            </div>
            <span class="badge bg-primary rounded-circle border"
                style="position: absolute; margin-left: 230px; margin-top: 70px; width: 50px; height: 50px; z-index: 1;">
                <h3 class="py-1">95</h3>
            </span>
           
        </div>


        <div class="container bg-dark text-white py-5 border">
            <div class="row">
                <div class="col-sm-4 px-5">
                    <p><%=l.getRegione() %></p>
                    <p><%=l.getCitta() %></p>
                    <p><%=l.getCapienza() %></p>
                   
                </div>
                <div class="col-sm-8 px-5 ">
                    <h3>Il nostro locale</h3><%=l.getBio() %>
                </div>
            </div>
            <div class="container bg-light">
                <div class="container paginaCarousel py-5">
                    <!--Carousel immagini-->
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <p class="lead fw-normal mb-0">Foto recenti</p>
                        <p class="mb-0"><a href="#!" class="text-muted">Mostra tutto</a></p>
                    </div>
                    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                        <div class="carousel-indicators">
                            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0"
                                class="active" aria-current="true" aria-label="Slide 1"></button>
                            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                                aria-label="Slide 2"></button>
                            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                                aria-label="Slide 3"></button>
                        </div>
                     <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img src="img\disco1.jpg"
                                            class="d-block w-100" alt="...">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="img\disco2.jpg"
                                            class="d-block w-100" alt="...">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="img\disco4.jpg"
                                            class="d-block w-100" alt="...">
                                    </div>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
                            data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
                            data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
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
                                
                                <%List<CommentoLocale>lista=CommentiLocaleDAO.listaCommentiLocale(l); %>
									<%for(CommentoLocale c:lista){
					%>

                                <hr class="my-0" />
                                <div class="card-body p-4">
                                    <div class="d-flex flex-start">
                                        <img class="rounded-circle shadow-1-strong me-3" src="immagini/avatar.png"
                                            alt="avatar" width="60" height="60" />
                                        <div>
                                            <h6 class="fw-bold mb-1"><%=c.getUsername() %></h6>
                                            <div class="d-flex align-items-center mb-3">
                                                <p class="mb-0">
                                                    #<%=c.getIdCommento() %>
                                                    <span class="badge bg-primary ms-5"><%=c.getValutazione() %></span>
                                                </p>

                                            </div>
                                            <%=c.getTesto() %>

                                        </div>
                                    </div>
                                </div>
                                <% }%>

                                
                            </div>
                        </div>
                    </div>
                </div>

                <!--Sezione Inserisci commento-->
                <form action="inserisciCommentoLocale" method="post">
                    <div class="container-fluid bg-dark my-5 py-5 text-dark rounded">
                        <div class="row d-flex justify-content-center">
                            <div class="col-md-10 col-lg-8 col-xl-6">
                                <div class="card">
                                    <div class="card-body p-4">
                                        <div class="d-flex flex-start w-100">
                                            <img class="rounded-circle shadow-1-strong me-3" src="immagini/avatar.png"
                                                alt="avatar" width="65" height="65" />
                                            <div class="w-100">
                                                <h5>Aggiungi recensione</h5>

                                                <div class="form-outline">
                                                    <textarea class="form-control" id="textAreaExample" rows="4"
                                                        placeholder="Commento" name="commento2"></textarea>

                                                </div>
                                                <div class="mt-3">
                                                    <label class="form-label" for="voto">Voto</label>
                                                    <input id="valutazione" name="valutazione" class="form-control" type="number" min="0"
                                                        max="100" />
                                                        <input type="hidden" name="emailUtente" value="<%= u.getEmail() %>">
   														<input type="hidden" name="idArtista" value="<%= l.getId() %>">	
                                                    <submit type="submit" class="btn btn-dark mt-4" value="Invia Commento">
                                                        Invia<i class="fas fa-long-arrow-alt-right ms-1"></i>
                                                    </submit>
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


            <!--Jquery -->
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

            
        </div>

</body>
</html>
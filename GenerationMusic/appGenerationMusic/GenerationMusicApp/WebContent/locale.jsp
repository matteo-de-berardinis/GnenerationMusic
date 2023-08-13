<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, java.util.List"%>
<%@ page
	import="model.Utente, model.Artista, model.Band, model.Locale, model.Cliente, model.Proprietario"%>
<%@ page import="DAO.LocaleDAO"%>

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
    <!--Owl Carousel-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"
        integrity="sha512-tS3S5qG0BlhnQROyJXvNjeEM4UpMXHrQfTGmbQ1gKmelCxlSEBUaxhRBj/EFTzpbP4RVSrpEikbmdJobCvhE3g=="
        crossorigin="anonymous" />
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css"
        integrity="sha512-sMXtMNL1zRzolHYKEujM2AqCLUR9F2C4/05cdbxjjLSRvMQIciEPCQZo++nk7go3BtSuK9kfa/s+a4f4i5pLkw=="
        crossorigin="anonymous" />

    <!--Custom header css-->
    <link href="css/header.css" rel="stylesheet">
</head>
<%
int id = (int) session.getAttribute("idLocale");
Locale l = LocaleDAO.recuperaLocaleTramiteId(id);
Proprietario p = LocaleDAO.recuperaProprietarioCompleto(id);

%>
<body>
    <div class="container">
        <div class="d-flex justify-content-center">
            <h1>Benvenuto nel Profilo del tuo Locale</h1>
        </div>

    </div>
    <section class="h-100 gradient-custom-2">
        <div class="container py-5 h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col col-lg-9 col-xl-7">
                    <div class="card">
                        <div class="rounded-top text-white d-flex flex-row"
                            style="background-color: #000; height:200px; ">
                            <div class="ms-4 mt-5 d-flex flex-column" style="width: 150px;">
                                <img src=" <%=l.getImg() %> " alt="Generic placeholder image"
                                    class="img-fluid img-thumbnail mt-4 mb-2" style="width: 150px; z-index: 1">
                                <a href="modificaDatiLocale.jsp" ><button type="button" class="btn btn-dark" style="z-index: 1;">
                                    Modifica Dati
                                </button></a><br>

                            </div>
                            <div class="ms-3" style="margin-top: 130px;">
                                <h5><%=l.getNome()%></h5>

                            </div>
                        </div>
                        <br><br><br><br><br><br>
                        <div class="card-body p-4 text-black">
                            <p class="lead fw-normal mb-1 " style="text-align: center; font-size: x-large;">Informazioni
                                Locale</p>

                            <!--Collapsible-->

                            <div id="info" class="collapse">
                                <div class="p-4 info-background rounded">
                                    <input type="text" class="form-control bg-dark" placeholder="Nome Locale: <%=l.getNome()%>"
                                        disabled><br>
                                    <input type="text" class="form-control bg-dark" placeholder="Città: <%=l.getCitta() %>"
                                        disabled><br>
                                    <input type="text" class="form-control bg-dark" placeholder="Capienza: <%=l.getCapienza() %>"
                                        disabled><br>
                                    <input type="text" class="form-control bg-dark" placeholder="Regione: <%=l.getRegione() %>"
                                        disabled><br>
                                    <input type="text" class="form-control bg-dark" placeholder="Proprietario: <%=p.getNome() %>"
                                        disabled><br>
                                  
                                        <div class="container p-5 my-5 bg-dark text-white rounded"><h1>Bio</h1>
                                            <p><%=l.getBio() %></p></div>
        
                                        </div>

                                </div>
                            </div>

                            <div class="d-flex justify-content-center my-3">
                                <a href="#info" class="btn btn-dark" data-bs-toggle="collapse">Mostra</a>
                            </div>



                            <!--Carousel immagini-->
                            <div class="d-flex justify-content-between align-items-center mb-4 my-5">
                                <p class="lead fw-normal mb-0">Foto recenti</p>
                                <p class="mb-0"><a href="#!" class="text-muted">Mostra tutto</a></p>
                            </div>
                            <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                                <div class="carousel-indicators">
                                    <button type="button" data-bs-target="#carouselExampleIndicators"
                                        data-bs-slide-to="0" class="active" aria-current="true"
                                        aria-label="Slide 1"></button>
                                    <button type="button" data-bs-target="#carouselExampleIndicators"
                                        data-bs-slide-to="1" aria-label="Slide 2"></button>
                                    <button type="button" data-bs-target="#carouselExampleIndicators"
                                        data-bs-slide-to="2" aria-label="Slide 3"></button>
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
                                <button class="carousel-control-prev" type="button"
                                    data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Previous</span>
                                </button>
                                <button class="carousel-control-next" type="button"
                                    data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Next</span>
                                </button>
                            </div>

                            <!--Fine carousel-->

                            <!--Prenotazioni-->
                            
                            <div class="d-flex justify-content-center my-5">
                                <a href="leMiePrenotazioniLocale.jsp?idLocale=<%= l.getId() %>" class="btn btn-dark">Prenotazioni</a>
                            </div>
                             <div class="d-flex justify-content-center my-5">
                                <a href="gestisciDispLocale.jsp" class="btn btn-dark" >Gestisti disponibilità</a>
                            </div>
                           
                            <!--Fine Prenotazioni-->
                        </div>
                    </div>
                </div>
            </div>
        
    </section>

</body>

</html>
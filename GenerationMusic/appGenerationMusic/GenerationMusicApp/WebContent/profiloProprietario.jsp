<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import = "model.Proprietario" %>
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

<!--Header-->


<!--Fine Header-->

<body>
<%Proprietario p = (Proprietario)session.getAttribute("proprietario"); %>
    <div class="container">
        <div class="d-flex justify-content-center">
            <h1>Benvenuto nella tua area personale</h1>
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
                                <img src="immagini/avatar.png" alt="Generic placeholder image"
                                    class="img-fluid img-thumbnail mt-4 mb-2" style="width: 150px; z-index: 1">
                                <button type="button" class="btn btn-dark" style="z-index: 1;">
                                    Modifica Profilo
                                </button><br>

                            </div>
                            <div class="ms-3" style="margin-top: 130px;">
                                <h5><%=p.getNickname() %></h5>

                            </div>
                        </div>
                        <br><br><br><br><br><br>
                        <div class="card-body p-4 text-black">
                            <p class="lead fw-normal mb-1 " style="text-align: center; font-size: x-large;">Informazioni
                                Personali</p>

                            <!--Collapsible-->

                            <div id="info" class="collapse">
                                <div class="p-4 info-background rounded">
                                    <input type="text" class="form-control bg-dark" placeholder="Nome: <%=p.getNome() %>"
                                        disabled><br>
                                    <input type="text" class="form-control bg-dark" placeholder="Cognome: <%=p.getCognome() %>"
                                        disabled><br>
                                    <input type="text" class="form-control bg-dark"
                                        placeholder="Anno di nascita: <%=p.getAnnoNascita() %>" disabled><br>
                                    <input type="text" class="form-control bg-dark" placeholder="Nazionalit�: <%=p.getNazionalita() %>"
                                        disabled><br>
                                    
                                    <input type="text" class="form-control bg-dark" placeholder="Email: <%=p.getEmail() %>"
                                        disabled><br>
                                    <input type="text" class="form-control bg-dark"
                                        placeholder="Citt� di residenza: <%=p.getCitta() %>" disabled>
                                        <br>
									<input type="text" class="form-control bg-dark"
                                        placeholder="Numero locali: <%=p.getLocali().size() %>" disabled><br>
                                        
                                    <div class="container p-5 my-5 bg-dark text-white rounded">
                                        <h1>Bio</h1>
                                        <p><%=p.getBio() %></p>
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
                                        <img src="https://mdbcdn.b-cdn.net/img/Photos/Lightbox/Original/img%20(112).webp"
                                            class="d-block w-100" alt="...">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="https://mdbcdn.b-cdn.net/img/Photos/Lightbox/Original/img%20(107).webp"
                                            class="d-block w-100" alt="...">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="https://mdbcdn.b-cdn.net/img/Photos/Lightbox/Original/img%20(108).webp"
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

                            <!--Lista Locali-->

                            <div class="container-fluid cardLocale mt-5 rounded">
                                <div class="card-body p-4 text-black">
                                    <p class="lead fw-normal mb-1 " style="text-align: center; font-size: x-large;">I
                                        miei Locali</p>

                                    <div class="row ">
                                        <div class="col-sm-6 p-3">
                                            <div class="cards_wrapper">
                                                <div class="card h-100">
                                                    <img src="immagini/copertina1.png" class="card-img-fluid" alt="...">
                                                    <div class="card-body">
                                                        <h5 class="card-title">Nome Locale</h5>
                                                        <p class="card-text">Lorem ipsum dolor sit amet consectetur
                                                            adipisicing elit. Culpa facilis
                                                            porro molestias error aliquam, rerum quia et quas cupiditate
                                                            eveniet accusantium, odio
                                                            eius
                                                            quis dolorum vero quam! Non, maxime autem!</p>
                                                        <a href="#" class="btn btn-dark">Profilo</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6 p-3">
                                            <div class="cards_wrapper">
                                                <div class="card h-100">
                                                    <img src="immagini/copertina1.png" class="card-img-fluid" alt="...">
                                                    <div class="card-body">
                                                        <h5 class="card-title">Nome Locale</h5>
                                                        <p class="card-text">Lorem ipsum dolor sit amet consectetur
                                                            adipisicing elit. Culpa facilis
                                                            porro molestias error aliquam, rerum quia et quas cupiditate
                                                            eveniet accusantium, odio
                                                            eius
                                                            quis dolorum vero quam! Non, maxime autem!</p>
                                                        <a href="#" class="btn btn-dark">Profilo</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="d-flex justify-content-center mt-3">
                                        <button type="button" class="btn btn-dark" style="z-index: 1;">
                                            Aggiungi locale
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <!--Fine Lista Locali-->

                            <!--Prenotazioni-->

                            <div class="d-flex justify-content-center my-5">
                                <a href="#prenotazioni" class="btn btn-dark" data-bs-toggle="collapse">Prenotazioni</a>
                            </div>
                            <div id="prenotazioni" class="collapse">

                            </div>

                            <!--Fine Prenotazioni-->

                        </div>
                    </div>
                </div>
            </div>
    </section>

</body>

</html>
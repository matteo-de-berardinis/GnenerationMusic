<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.commentiAdmin" %>
<%@ page import="DAO.commentiAdminDAO" %>
<%@ page
	import="model.Utente, model.Artista, model.Band, model.Locale, model.Cliente, model.Proprietario"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Commenti Sito</title>

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

<body>
<% List<commentiAdmin> lista = commentiAdminDAO.getCommenti(); %>
<section>
    <div class="container bg-dark rounded-bottom py-5" style="margin-top: 150px;">
        <div class="row d-flex justify-content-center">
            <div class="col-md-12 col-lg-10">
                <div class="card text-dark">
                    <div class="card-body p-4">
                        <h4 class="mb-0">Commenti sito</h4>
                        <p class="fw-light mb-4 pb-2">Ordinate dal più vecchio</p>


                    </div>
<% for (commentiAdmin commento : lista) { %>
    
                    <hr class="my-0" />
                    <div class="card-body p-4">
                        <div class="d-flex flex-start">
                            <img class="rounded-circle shadow-1-strong me-3" src="immagini/avatar.png"
                                alt="avatar" width="60" height="60" />
                            <div>
                                <h6 class="fw-bold mb-1"><%= commento.getNomeUtente() %></h6>
                                <div class="d-flex align-items-center mb-3">
                                    <p class="mb-0">
                                        <%= commento.getEmail() %>
                                        
                                    </p>

                                </div>
                                 <%= commento.getTesto() %>
                               

                            </div>
                        </div>
                    </div>
<% } %>
                    
                </div>
            </div>
        </div>
       
    </div>

    
</section>

    
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, java.util.List"%>
<%@ page
	import="model.Utente, model.Artista, model.Band, model.Locale, model.Cliente, model.Proprietario"%>
<%@ page import="DAO.artistiDAO"%>

<!DOCTYPE html>
<html lang="en" data-bs-theme="auto">

<head>
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

<!-- Header -->

<%@include file="header.jsp" %> 

<!-- Fine Header -->


<body style="background-image: url(img/ws_Dance_Music.jpg); background-size: cover; margin-top:120px;">
  <main>
    <div class="container my-3 rounded border bg-dark" style="min-width: 75%; text-align: center;">
      <div class="container p-5 my-2 bg-dark text-white">
      <h1> I nostri Locali </h1>
      </div>
      <div class="row">
 
<!--  Elenco nomi locali-->
			<% List<Locale> listaLocali = (List<Locale>) session.getAttribute("listaLocali");
			if (listaLocali != null) {
			
				for (Locale l : listaLocali) {
					%>
       
        <div class="col-md-8 col-lg-4 col-xl-3 my-3">
            	<div class="cards_wrapper">
							<div class="card h-100">
							<% if(l.getImg() != null) {%>
								<img src="<%=l.getImg() %>" class="card-img-fluid" alt="...">
								<%} else { %>
								<img src="img/copertina1.png" class="card-img-fluid" alt="...">
								<% } %>
								<div class="card-body">
									<h5 class="card-title"><%=l.getNome()%></h5>
									<p class="card-text"><%=l.getBio() %></p>
										<form action="servlet" method="post">
										<input type="hidden" name="operazione" value="infoLocale">
						<input type="hidden" name="dati_nascosti" value="<%=l.getId()%>">
						<% 	if (u != null) {%>
	<input type="submit" class="btn btn-dark" value="Profilo">
	</form>
<% } else {%>
   
<% }
%>
						
					
								</div>
							</div>
						</div>
					</div>
					<%
					}
					}
					%>
        </div>

        

       

         
         


          



         

        

          
      
    </div>
 
  </main>
</body>

</html>
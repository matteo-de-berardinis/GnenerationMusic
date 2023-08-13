<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, java.util.List"%>
<%@ page
	import="model.Utente, model.Artista, model.Band, model.Locale, model.Cliente, model.Proprietario"%>
<%@ page import="DAO.artistiDAO"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home</title>
<!-- Latest compiled and minified CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/index.css"/>
<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!--FontAwesome-->
<script src="https://kit.fontawesome.com/b60ea6b0a3.js"
	crossorigin="anonymous"></script>
<!--Owl Carousel-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"
	integrity="sha512-tS3S5qG0BlhnQROyJXvNjeEM4UpMXHrQfTGmbQ1gKmelCxlSEBUaxhRBj/EFTzpbP4RVSrpEikbmdJobCvhE3g=="
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css"
	integrity="sha512-sMXtMNL1zRzolHYKEujM2AqCLUR9F2C4/05cdbxjjLSRvMQIciEPCQZo++nk7go3BtSuK9kfa/s+a4f4i5pLkw=="
	crossorigin="anonymous" />

<!--Custom header css-->
<link href="css/header.css" rel="stylesheet">
</head>


<%@include file="header.jsp"%>
				






<!--Fine Header-->

<body>
	

	<div class="container background"
		style="text-align: center; min-width: 90%; background-image: url(img/backgroundImmagine.PNG); margin-top: 120px;">

	</div>
	<!--Container Principale-->
	<div class="container-xxl my-3 justify-content-evenly"
		style="min-width: 75%; text-align: center;">


		<!--Sezione Artisti-->
		<div class="container" style="font-size: 60px;">I nostri artisti</div>
		<div id="slider-artisti" class="owl-carousel owl-theme">

			
			
		<%// Elenco nomi artisti
		List<Artista> listaArtisti = (List<Artista>) session.getAttribute("listaArtisti");
		if (listaArtisti != null) {
		
			for (Artista a : listaArtisti) {
			%>
			<div class="item">
				<div class="cards_wrapper">
					<div class="card">
					
						<img src="<%=a.getImg() %>" class="card-img-top" alt="img/artista.png">
						
						<div class="card-body">
							<h5 class="card-title"><%=a.getNomeArtista()%></h5>
							<p class="card-text"><%=a.getBio() %></p>

							<form action="servlet" method="post">
							<input type="hidden" name="operazione" value="infoArtista">
								<input type="hidden" name="dati_nascosti" value="<%=a.getId()%>"> 
								<%


if (u != null) {%>
	<input type="submit" class="btn btn-dark" value="Profilo">
<% } else {%>
   
<% }
%>
							
							</form>

						</div>
					</div>
				</div>
			</div>
			<%
			}
			
			}%> 
			
			</div>
			
			<% 	if (u != null) {%>
		<div class="container my-3 btn-lg" style="text-align: center;">
			<a href = "tuttiArtisti.jsp"><button type="button" class="btn btn-dark">Scopri di più</button></a>
		</div>
		
				<% } else {
   
}
%>
		
		<!--Fine Sezione Artisti-->
		
		<!--Sezione Band-->
		<div class="container mt-5" style="font-size: 60px; text-align: center;">Le nostre band</div>
		<div id="slider-band" class="owl-carousel owl-theme">
			
			
			<!-- Elenco Band -->
			<% List <Band> listaBand = (List<Band>) session.getAttribute("listaBand"); 
				if (listaBand != null) { 	%>
           			<% for (Band b : listaBand) {%>
													
							<div class="item">
								<div class="cards_wrapper">
									<div class="card">
										<img src="<%=b.getImg() %>" class="card-img-top" alt="img/band1.png">
										<div class="card-body">
											<h5 class="card-title"><%=b.getBand()%></h5>
											<p class="card-text"><%=b.getBio() %></p>
													<form action="servlet" method="post">
													<input type="hidden" name="operazione" value="infoBand">
														<input type="hidden" name="dati_nascosti" value="<%=b.getIdBand()%>"> 
													<% 	if (u != null) {%>
	<input type="submit" class="btn btn-dark" value="Profilo"></form>
<% } else {%>
  
<% }
%>
														
													
											
											</div>
										</div>
									</div>
							</div><%}
			}%>
			
			
			
			</div>
			<% 	if (u != null) {%>
		<div class="container my-3 btn-lg" style="text-align: center;">
			<a href = "tutteBand.jsp"><button type="button" class="btn btn-dark">Scopri di più</button></a>
		</div>
		<% } else {
   
}
%>

		<!--Fine Sezione Band-->
		
		
		<!--Sezione Locali-->


		<div class="container mt-5 my-5" style="font-size: 60px; text-align: center;">Le migliori location per i
			tuoi eventi
		</div>

		<div id="slider-locali" class="owl-carousel owl-theme">

			<!--  Elenco nomi locali-->
			<% List<Locale> listaLocali = (List<Locale>) session.getAttribute("listaLocali");
			if (listaLocali != null) {
			
				for (Locale l : listaLocali) {
					%>
					<div class="item">
						<div class="cards_wrapper">
							<div class="card h-100">
								<img src="<%=l.getImg() %>" class="card-img-fluid" alt="...">
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
		<div class="container my-3 btn-lg" style="text-align: center;">
							<% 	if (u != null) {%>
		<a href = "tuttiLocali.jsp"><button type="button" class="btn btn-dark">Scopri di più</button></a>
<% } else {
   
}
%>
		
		</div>
	</div>
	
	<!--Fine Sezione Locali-->

	<!--Sezione About Us-->

	<div class="container mt-3" style="min-width: 90%;" id="aboutUs">


		<div class="row">
			<div class="col-md-5 col-sm-6" style="background-image:linear-gradient(#180e68,#131d3d); text-align: center; ">
				<img src="img/backgroundTrasparente.PNG" class="img-fluid" alt="img/band1.png">

			</div>
			<div class="col-md-7 col-sm-6 bg-dark text-white" style="text-align: center;">
				<div class="default-heading my-5" style="font-size: 50px;">
					<!-- heading -->
					Cos'è Generation Music?
				</div>
				<!-- about what we are like content -->
				<div class="about-what-we">
					<div class="row">
						<div class="col-md-4 col-sm-4">
							<div class="what-we-item ">
								<!-- heading with icon -->
								<h3><i class="fa fa-music"></i> Cosa facciamo?</h3>
								<!-- paragraph -->
								<p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit occaecat cupidatat non id est laborum.</p>
							</div>
						</div>
						<div class="col-md-4 col-sm-4">
							<div class="what-we-item ">
								<!-- heading with icon -->
								<h3><i class="fa fa-hand-o-up"></i> Perchè sceglierci?</h3>
								<!-- paragraph -->
								<p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit occaecat cupidatat non id est laborum.</p>
							</div>
						</div>
						<div class="col-md-4 col-sm-4">
							<div class="what-we-item ">
								<!-- heading with icon -->
								<h3><i class="fa fa-map-marker"></i> Dove siamo?</h3>
								<!-- paragraph -->
								<p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit occaecat cupidatat non id est laborum.</p>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>

	</div>

	<!--Fine Sezione About Us-->

	<!-- contact -->
	<div id="contattaci" class="contact pad my-5" id="contact" style="text-align: center;">
		<div class="container">
			<!-- default heading -->
			<div class="default-heading" id="contattaci">
				<!-- heading -->
				<h1>Contattaci</h1>
			</div>
			<div class="row">
				<div class="col-md-4 col-sm-4">
					<!-- contact item -->
					<div class="contact-item ">
						<!-- big icon -->
						<i class="fa fa-street-view">Indirizzo</i><br>
						<!-- contact details  -->
						<span class="contact-details">#30/67, 5th Street, Mega Market Circle, New Delhi -
							625001</span>
					</div>
				</div>
				<div class="col-md-4 col-sm-4">
					<!-- contact item -->
					<div class="contact-item ">
						<!-- big icon -->
						<i class="fa fa-wifi">Email</i><br>
						<!-- contact details  -->
						<span class="contact-details">generation@music.com</span>
					</div>
				</div>
				<div class="col-md-4 col-sm-4">
					<!-- contact item -->
					<div class="contact-item ">
						<!-- big icon -->
						<i class="fa fa-phone">Telefono</i><br>
						<!-- contact details  -->
						<span class="contact-details">333 333 3333</span>
					</div>
				</div>
			</div>


			<!-- form content -->
			<div class="form-content my-3">
				<!-- paragraph -->
				<div class="default-heading" style="font-size: 30px;">
					<!-- heading -->
					<p>Hai consigli per la piattaforma? Lascia un commento</p>
				</div>
				
				<form action ="servlet" id="contactForm" method="post">
				<input type="hidden" name="operazione" value="commentiAdmin">
					<div class="row">
						<div class="col-md-6 col-sm-6">
							<div class="form-group">
								<label for="name">Nome</label>
								<% if(u != null){ %>
								<input type="text" class="form-control" id="name" name="name" value="<%=u.getNickname() %>">
								
								<% } else { %>
								<input type="text" class="form-control" id="name" name="name">
								<% } %>
							</div>
							<div class="form-group">
								<label for="email">Email</label>
								<% if(u != null){ %>
								<input type="email" class="form-control" id="email" name="email"
									value="<%=u.getEmail() %>">
									
									<% } else { %>
									
									<input type="email" class="form-control" id="email" name="email">
									
									<% } %>
							</div>
						</div>
						<div class="col-md-6 col-sm-6">
							<div class="form-group">
								<label for="message">Messaggio</label>
								<textarea class="form-control" id="message" name="message" rows="9"
									placeholder="Enter message"></textarea>
							</div>
						</div>
					</div>
					<div class="text-center">
					<% 	if (u != null) {%>
	<button type="submit" class="btn btn-lg btn-dark my-5">Invia messaggio</button>
<% } else {%>
   <h2> Registrati per commentare <h2>
<% }
%>
						
					</div>
				</form>

			</div>

		</div>
	</div>
	<!-- contact end -->
	
	 <% if (u != null && u.getIdUtente() == 29) { %>
      <div class="container mb-3" style="text-align: center">  
      <a href="vediCommentiApp.jsp" class="btn btn-primary">Vedi Commenti Sito</a>
     </div>
    <% } %>


	<!--Jquery -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
		integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
		crossorigin="anonymous"></script>
	<!-- Owl Carousel -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
	<!-- custom JS code after importing jquery and owl -->
	<script type="text/javascript" src="javascript/carousel.js"></script>

			
			
			
</body>
</html>
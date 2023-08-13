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




<body style="background-image: url(img/tuttiBand.jpg); background-size: cover; margin-top:120px; ">
  <main>
    <div class="container my-3 rounded border bg-dark" style="min-width: 75%; text-align: center;">
      <div class="container p-5 my-2 bg-dark text-white">
      <h1> Le nostre Band </h1>
      </div>
      <div class="row">
 
 
			<!-- Elenco Band -->
			<% List <Band> listaBand = (List<Band>) session.getAttribute("listaBand"); 
				if (listaBand != null) { 	%>
           			<% for (Band b : listaBand) {%>

       
        <div class="col-md-8 col-lg-4 col-xl-3 col-xxl-2 my-3">
            <div class="cards_wrapper">
									<div class="card">
									<% if(b.getImg() != null){ %>
										<img src="<%=b.getImg() %>" class="card-img-top" alt="img/band1.png">
										<% } else { %>
										<img src="img\avatar.png" class="card-img-top" alt="img/band1.png">
										<% } %>
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

        
      
    </div>
  
  </main>
</body>

</html>
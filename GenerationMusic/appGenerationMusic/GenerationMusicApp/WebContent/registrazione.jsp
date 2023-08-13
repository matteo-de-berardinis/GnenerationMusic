<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrazione</title>
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
		
		<link rel="stylesheet" href="css/header.css" />
        <!--Custom radio btn css-->
		
		<link rel="stylesheet" href="css/registrazione.css" />

        <!-- Google Fonts Link -->
    <link
    href="https://fonts.googleapis.com/css2?family=Raleway:wght@300;400;500;700;800&display=swap"
    rel="stylesheet"
  />
  <!-- Line Awesome CDN Link -->
  <link
    rel="stylesheet"
    href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css"
  />
</head>
<body style="background-image: url(img/studio.jpg); background-size: cover;background-repeat: no-repeat;background-position: center;">

    
    <!--Div di scelta utente con button-->
    <form action="servlet" method="get">
    <input type="hidden" name="operazione" value="registrazione">
        
             <div class="main-container">
      <h2>Che tipo di utente sei?</h2>
      <div class="radio-buttons">
        <label for="cliente" class="custom-radio">
          <input type="radio" id="cliente" name="selezione"  value="sceltaCliente" checked />
          <span class="radio-btn"
            ><i class="las la-check"></i>
            <div class="hobbies-icon">
                <i class="fa-solid fa-circle-user"></i>
              <h3>Cliente</h3>
            </div>
          </span>
        </label>
        <label for="artista" class="custom-radio">
          <input type="radio" id="artista" name="selezione" value="sceltaArtista"/>
          <span class="radio-btn"
            ><i class="las la-check"></i>
            <div class="hobbies-icon">
                <i class="fa-solid fa-music"></i>
              <h3>Artista</h3>
            </div>
          </span>
        </label>
        <label for="band" class="custom-radio">
          <input type="radio" id="band" name="selezione" value="sceltaBand"/>
          <span class="radio-btn"
            ><i class="las la-check"></i>
            <div class="hobbies-icon">
                <i class="fa-solid fa-guitar"></i>
              <h3>Band</h3>
            </div>
          </span>
        </label>
        <label for="proprietario" class="custom-radio">
          <input type="radio" id="proprietario" name="selezione" value="sceltaProprietario"/>
          <span class="radio-btn"
            ><i class="las la-check"></i>
            <div class="hobbies-icon">
                <i class="fa-solid fa-location-dot"></i>
              <h3>Possiedi un locale?</h3>
            </div>
          </span>
        </label>
      </div>
      <br>
      <br>
      <input type="submit" value = "Continua la registrazione" role="button" class="btn btn-dark">
    </div>
            

        
      </form>
</body>
</html>
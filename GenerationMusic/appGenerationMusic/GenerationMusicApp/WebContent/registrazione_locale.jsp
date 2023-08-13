<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Registrazione Locale</title>
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

        <!--Custom radio btn css-->
		<link href="css/registrazione.css" rel="stylesheet">
</head>
<body>
    <section class="h-100 h-custom" style="background-color: #ffffff00;">
        <div class="container regArtista py-5 h-150">
          <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-lg-8 col-xl-6">
              <div class="card rounded-3">
                <img src="img/backgroundImmagine2.PNG"
                  class="w-100" style="border-top-left-radius: .3rem; border-top-right-radius: .3rem;"
                  alt="Sample photo">
                <div class="card-body p-4 p-md-5">
                  <h3 class="mb-4 pb-2 pb-md-0 mb-md-5 px-md-2">Info Registrazione</h3>
      
                  <form action = "servlet" method = "post" autocomplete="on" >
        <input type="hidden" name="operazione" value="RegistrazioneLocale">
      
                          <!--Nome Locale-->
                <div class="form-floating mb-3 mt-3">
                    <input type="text" class="form-control" id="username" placeholder="Nome Locale" name="nomeLocale">
                    <label for="nomelocale">Nome Locale</label>
                </div><br>
                <!--Città-->
                <div class="form-floating mb-3 mt-3">
                    <input type="text" class="form-control" id="nome" placeholder="Citta" name="citta">
                    <label for="citta">Città</label>
                </div><br>

                <!--Regione-->
                <div class="form-floating mb-3 mt-3">
                    <input type="text" class="form-control" id="cognome" placeholder="Regione" name="regione">
                    <label for="nomearte">Regione</label>
                </div><br>
                
                <!--Capienza-->
                
                <div class="col-lg-3 col-sm-6">
                    <label for="capienza">Capienza</label>
                    <input id="capienza" class="form-control" type="number" name="capienza" />
                    
                </div><br>
                <!--Prezzo-->
                <div class="col-lg-3 col-sm-6">
                    <label for="prezzo">Prezzo a serata</label>
                    <input id="prezzo" class="form-control" type="number" name="prezzo"/>
                    
                </div><br>
                
                <div class="form-floating mb-3 mt-3">
                <label for="bio">Descrizione:</label><br><br><br>
        <textarea id="bio" name="bio" rows="4" cols="50"></textarea><br><br>
                <br>
                </div>
                
                <br>
                
                
                <br>
                <input type="submit" role="button" class="btn btn-dark my-5" value = "Completa registrazione">            
            
         </form> 
      
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
</body>
</html>
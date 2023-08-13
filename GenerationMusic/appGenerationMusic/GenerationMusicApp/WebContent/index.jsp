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
      <!--Custom css-->
    <link href="css/header.css" rel="stylesheet">
    <link href="css/registrazione.css" rel="stylesheet">
</head>
<body>
    <section class="h-100 h-custom" style="background-color: #ffffff00;">
        <div class="container py-5 h-100" style=" background-image: url(img/regBackground.jpg); background-size: cover; background-repeat: no-repeat; background-position: center;">
          <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-lg-8 col-xl-6">
              <div class="card rounded-3">
                <img src="img/backgroundImmagine2.PNG"
                  class="w-100" style="border-top-left-radius: .3rem; border-top-right-radius: .3rem;"
                  alt="Sample photo">
                <div class="card-body p-4 p-md-5">
                  <h3 class="mb-4 pb-2 pb-md-0 mb-md-5 px-md-2">Inserisci le tue credenziali</h3>
      
                  <form class="px-md-2" action = "servlet" method ="post" autocomplete="on">
				  <input type="hidden" name="operazione" value="login">
      
                   
                <!--Email-->
                <div class="form-floating mb-3 mt-3">
                    <input type="email" class="form-control" id="email" placeholder="Enter email" name="email" required>
                    <label for="email" style="color: black;">Email</label>
                </div>
                <!--Password-->
                <div class="form-floating mt-3 mb-3">
                    <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pass"
                        required>
                    <label for="pwd" style="color: black;">Password</label>
                </div>
               
                    
      
                   
                <div class="container" style="text-align: center;">
                    <input type="submit" value="Accedi" class="btn btn-primary btn-outline-light btn-lg"><br><br>
                    <a href="" class="text-decoration-none text-black" style="font-size: larger;">Hai dimenticato la
                        password?</a>
                </div>
            </form>
            <br><br>
            <div class="container" style="text-align: center;">
                <h3>Non sei ancora iscritto? Registrati subito ed entra nel mondo di Generation Music</h3>
                <a href="registrazione.jsp"><input type="button" class="btn btn-danger btn-outline-dark btn-lg"
                        value="Registrati"></a>

                <br><br>

                <form action = "servlet" method = "post">
            <input type="hidden" name="operazione" value="loginSenzaAcesso">
            <input type="submit" class="btn btn-dark" value="Login senza accesso">
            </form>
            </div>
      

      
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
</body>
</html>
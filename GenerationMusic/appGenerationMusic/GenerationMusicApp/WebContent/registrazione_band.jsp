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
        <div class="container registrazione py-5 h-100">
          <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-lg-8 col-xl-6">
              <div class="card rounded-3">
                <img src="img/backgroundImmagine2.PNG"
                  class="w-100" style="border-top-left-radius: .3rem; border-top-right-radius: .3rem;"
                  alt="Sample photo">
                <div class="card-body p-4 p-md-5">
                  <h3 class="mb-4 pb-2 pb-md-0 mb-md-5 px-md-2">Info Registrazione</h3>
      
                  <form class="px-md-2" action = "" method = "post" autocomplete="on">
      
                    <!--Username-->
                    <div class="form-floating form-outline mb-4">
                        <input type="text" class="form-control" id="username" placeholder="Nome Utente" name="username">
                        <label for="username">Nome Utente</label>
                    </div>
      
                    <!--Nome d'arte-->
                    <div class="form-floating form-outline mb-4">
                        <input type="text" class="form-control" id="username" placeholder="Nome d'Arte" name="username">
                        <label for="username">Nome d'Arte</label>
                    </div>
      
                        <!--Anno di fondazione-->
                
                <div class="col-lg-3 col-sm-6">
                    <label for="startDate">Anno di fondazione</label>
                    <input id="startDate" class="form-control" type="date" name="annonascita"/>
                    <span id="startDateSelected"></span>
                </div><br>
                <!--Nazionalità-->
                <label for = "nazionalita">Nazionalità:</label><br>
                <select class="form-select" id="nazionalita" name="nazionalita">
                    <option>--Seleziona Nazionalità--</option>
                    <option>Italia</option>
                    <option>Germania</option>
                    <option>Francia</option>
                    <option>Spagna</option>
                </select><br>
                <!--Genere musicale-->
                
                <label for = "genere">Genere musicale:</label><br>
                <select class="form-select"  id="genere" name="genere">
                    <option>--Seleziona Genere--</option>
                    <option>Pop</option>
                    <option>Rock</option>
                    <option>Classico</option>
                    <option>Cover</option>
                </select><br>
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
                <!--Conferma Password-->
                <div class="form-floating mt-3 mb-3">
                    <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pass"
                        required>
                    <label for="pwd" style="color: black;">Conferma Password</label>
                </div><br>
                
                <br>
      
                    
      
                    
      
                    <button type="submit" class="btn btn-dark btn-lg mb-1" value = "Completa registrazione">Registrati</button>
      
                  </form>
      
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
</body>
</html>
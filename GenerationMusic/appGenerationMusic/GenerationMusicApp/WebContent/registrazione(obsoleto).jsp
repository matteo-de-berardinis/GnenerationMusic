<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <!--Div contenente titolo e background titolo-->
    <div class = Title><h1>Benvenuti su Generation Music</h1></div>
    <!--Div di scelta utente con button-->
    <input type="button" id = "btnCliente" value = "Cliente"  onclick="mostraRegistrazioneCliente()">
    <input type="button"  value = "Solista" onclick="mostraRegistrazioneSolista()">
    <input type="button" value = "Band" onclick="mostraRegistrazioneBand()">
    <input type="button" value = "Proprietario" onclick="mostraRegistrazioneProprietario()">

    <!--Div Cliente-->
    <div class = Scelta id = "RegCliente" hidden>
        <form action = "" method = "post" autocomplete="on">
            <fieldset>
                <h3>Registrati Cliente</h3><br>
                <label for="email">Email:</label><br>
                <input type="email" id="email" name="email" placeholder="generation@music.com" required><br>
                <label for="pass">Password:</label><br>
                <input type="password" id="pass" name="pass" placeholder="*******" required><br><br>
                <input type="submit" value = "Accedi"> <a href="">Hai dimenticato la password?</a>
            </fieldset>
         </form>   
    </div> 

    <!--Div Artista-->
    <div class = Scelta id = "RegSolista" hidden>
        <form action = "" method = "post" autocomplete="on">
            <fieldset>
                <h3>Registrati Solista</h3><br>
                <label for="email">Email:</label><br>
                <input type="email" id="email" name="email" placeholder="generation@music.com" required><br>
                <label for="pass">Password:</label><br>
                <input type="password" id="pass" name="pass" placeholder="*******" required><br><br>
                <input type="submit" value = "Accedi"> <a href="">Hai dimenticato la password?</a>
            </fieldset>
         </form>   
    </div> 

    <!--Div Band-->
    <div class = Scelta id = "RegBand" hidden>
        <form action = "" method = "post" autocomplete="on">
            <fieldset>
                <h3>Registrati Band</h3><br>
                <label for="email">Email:</label><br>
                <input type="email" id="email" name="email" placeholder="generation@music.com" required><br>
                <label for="pass">Password:</label><br>
                <input type="password" id="pass" name="pass" placeholder="*******" required><br><br>
                <input type="submit" value = "Accedi"> <a href="">Hai dimenticato la password?</a>
            </fieldset>
         </form>   
    </div> 

    <!--Div Proprietario-->
    <div class = Scelta id = "RegProprietario" hidden>
        <form action = "" method = "post" autocomplete="on">
            <fieldset>
                <h3>Registrati Proprietario</h3><br>
                <label for="email">Email:</label><br>
                <input type="email" id="email" name="email" placeholder="generation@music.com" required><br>
                <label for="pass">Password:</label><br>
                <input type="password" id="pass" name="pass" placeholder="*******" required><br><br>
                <input type="submit" value = "Accedi"> <a href="">Hai dimenticato la password?</a>
            </fieldset>
         </form>   
    </div> 
    <!--Fine div di scelta utente-->
    <script type="text/javascript" src="javascript/registrazione.js"></script>
</body>
</html>


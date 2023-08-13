<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import = "model.Proprietario" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%Proprietario p = (Proprietario)session.getAttribute("proprietario"); %>
<h1>benvenuto <%= p.getNome()  %></h1>
<h2> email =<%=p.getEmail() %> </h2>

<h1>aggiungi i tuoi locali</h1>
<a href="registrazione_locale.jsp">aggiungi locali</a>


<form action = "servlet" method = "post" autocomplete="on" >
<input type="hidden" name="operazione" value="modificaProfiloProprietario">
            <fieldset>
                <h3 class="mt-5">modifica profilo</h3><br>
                <!--Username-->
                <div class="form-floating mb-3 mt-3">
                    <input type="text" class="form-control" id="username" value=<%= p.getNickname() %> name="username">
                    <label for="username">Nome Utente</label>
                </div><br>
                <!--Nome-->
                <div class="form-floating mb-3 mt-3">
                    <input type="text" class="form-control" id="nome" value=<%= p.getNome() %>  name="nome">
                    <label for="nomearte">Nome</label>
                </div><br>

                <!--Cognome-->
                <div class="form-floating mb-3 mt-3">
                    <input type="text" class="form-control" id="cognome" value=<%= p.getCognome() %> name="cognome">
                    <label for="nomearte">Cognome</label>
                </div><br>
                
              
                <!--Email-->
                <div class="form-floating mb-3 mt-3">
                    <input type="email" class="form-control" id="email" value=<%= p.getEmail() %> name="email" required>
                    <label for="email" style="color: black;">Email</label>
                </div>
                <!--Password-->
                <div class="form-floating mt-3 mb-3">
                    <input type="password" class="form-control" id="pwd" value=<%= p.getPassword() %> name="pswd"
                        required>
                    <label for="pwd" style="color: black;">Password</label>
                </div>
                <!--Conferma Password-->
                <div class="form-floating mt-3 mb-3">
                    <input type="password" class="form-control" id="pwd" value=<%= p.getPassword() %> name="pswd"
                        required>
                    <label for="pwd" style="color: black;">Conferma Password</label>
                </div><br>
                
                <br>
                <input type="submit" role="button" class="btn btn-dark my-5" value = "Completa le modifiche ">            
            </fieldset>
         </form>   

</body>
</html>
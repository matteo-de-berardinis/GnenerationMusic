<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
    <%@ page
	import="model.Utente, model.Artista, model.Band, model.Locale, model.Cliente, model.Proprietario"%>
<%@ page import="DAO.artistiDAO"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!--Custom header css-->
    <link href="css/header.css" rel="stylesheet">
    <link href="css/index.css" rel="stylesheet">

    <!--Bootstrap Icons-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>

<!-- Header -->

<%@include file="header.jsp" %>



<body>
    
	<%Cliente c = (Cliente)session.getAttribute("cliente"); %>
	<main>
        
        <form action = "servlet" method = "post" autocomplete="on" >
              <input type="hidden" name="operazione" value="modificaProfiloCliente">
            <div class="container rounded">
                <div class="row d-flex justify-content-center"  >
                
                <div class="table-responsive" >
                    
                <table class="table" >
              
            <thead class="table-dark">
                    <tr>  
                        <td>
                            <h3>  Modifica i dati</h3> </th></td>
                       <th></th>
                    
                        </tr> 
                   
                    </thead>
                 
            <thead class="table-light">
            
            <tr>
            <th><label for="username">Nome Utente:</label> </th>
            <td><input type="text" class="form-control-sm" name="username" id="username" placeholder="<%=c.getNickname() %>"> 
            </td><br>
            </tr>

            <tr>  
            <th> <label for="nome">Nome:</label></th>
            <td><input  type="text" class="form-control-sm" name="nome" id="nome" placeholder="<%=c.getNome() %>"> 
           </td>
            </tr> 

            <tr>  
                <th> <label for="cognome">Cognome:</label></th>
                <td><input  type="text" class="form-control-sm" name="cognome" id="cognome" placeholder="<%=c.getCognome() %>"> 
               </td>
                </tr> 
            
            <tr>

                


            <tr>
            <br><th><label for="email">Email:</label> </th>
			<td><input type="email" class="form-control-sm" name="email" id="email" placeholder="<%=c.getEmail() %>"> 
            </td><br>
            </tr>

            

            <tr>
			<th><label for="pswd">Password:</label></th>
			<td><input type="password" class="form-control-sm" name="pass" id="pwd" placeholder="<%=c.getPassword() %>"> 
            </td><br>
            </tr>

            <tr>
                <th><label for="pwd">Conferma Password:</label></th>
                <td><input type="password" class="form-control-sm" name="pass" id="pwd" placeholder="<%=c.getPassword() %>"> 
                </td><br>
            </tr>


            

          

        </thead>
    </table>
                </div>
                </div> 
</div>   
        <div class="btn-group-sm" align="center">
            <input type="submit" role="button" class="btn-close-white" value="Aggiorna i Dati">
      
		</div>
    </form>
	</main>



	<footer>
	</footer>
 

</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import = "model.Band" %>
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
    
    
    
    
    
    <body>
        <%Band b = (Band)session.getAttribute("band"); %>
        
        <main>
            
            <form action="servlet" method="post" autocomplete="on">
            <input type="hidden" name="operazione" value="modificaProfiloBand">
                
                <div class="container">
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
                <td><input type="text" class="form-control-sm" name="username" id="username" placeholder="<%=b.getNickname() %>"> 
                </td><br>
                </tr>
    
                <tr>  
                <th> <label for="nomearte">Nome Band:</label></th>
                <td><input  type="text" class="form-control-sm" name="nomearte" id="nomearte" placeholder="<%=b.getBand() %>"> 
               </td>
                </tr> 
                
                <tr>
    
                    <th><label for="genere">Genere Musicale:</label> </th>
                    <td>
                        <div id="genere">
                        <select name="genere" id="genere" class="form-select-sm">
                            <option value="<%=b.getGenere() %>" selected disabled> <%=b.getGenere() %> </option>
                          <option value="pop">Pop</option>
                          <option value="rock">Rock</option>
                          <option value="punk">Punk</option>
                          <option value="commerciale">Commerciale</option>
                          <option value="classico">Classico</option>
                          <option value="cover">Cover</option>
                      </select>
                    </div>
                    </td>
                </tr>
    
    
                <tr>
                <br><th><label for="email">Email:</label> </th>
                <td><input type="email" class="form-control-sm" name="email" id="email" placeholder="<%=b.getEmail() %>" required> 
                </td><br>
                </tr>
    
                
    
                <tr>
                <th><label for="pswd">Password:</label></th>
                <td><input type="password" class="form-control-sm" name="pass" id="pwd" placeholder="<%=b.getPassword() %>" required> 
                </td><br>
                </tr>
    
                <tr>
                    <th><label for="pwd">Conferma Password:</label></th>
                    <td><input type="password" class="form-control-sm" name="pass" id="pwd" placeholder="<%=b.getPassword() %>" required> 
                    </td><br>
                </tr>
    
              
    
            </thead>
        </table>
                    </div>
                    </div> 
    </div>   
            <div class="btn-group-sm" align="center">
                <input type="submit" role="button" class="btn-close-white" value="Aggiorna i Dati"></a>
          
            </div>
        </form>
        </main>
    
    
    
        <footer>
        </footer>
     
    
    </body>
    </html>
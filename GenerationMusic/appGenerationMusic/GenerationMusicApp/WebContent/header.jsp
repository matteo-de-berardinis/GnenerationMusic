
<!--Header-->
<header>
	<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark ">
		<div class="container" style="min-width: 90%;">
			<a href="home.jsp"><button type="button"
					class="btn btn-lg logo"
					style="background-image: url(img/logo.png);"></button></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#mynavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse mx-4" id="mynavbar">
				<ul class="navbar-nav me-auto">
				
					<li class="nav-item mx-2"><a class="nav-link active"
						href="tuttiArtisti.jsp"> Artisti </a></li>
					<li class="nav-item mx-2"><a class="nav-link active"
						href="tutteBand.jsp"> Band </a></li>
					<li class="nav-item mx-2"><a class="nav-link active"
						href="tuttiLocali.jsp"> Locali </a></li>
					
					<li class="nav-item mx-2"><a class="nav-link active"
						href="home.jsp#aboutUs"> Chi Siamo </a></li>
					<li class="nav-item mx-2"><a class="nav-link active"
						href="home.jsp#contattaci"> Contattaci </a></li>

				</ul>
				
	<!--  Verifica se l'utente è loggato-->
	<%Utente u = (Utente) session.getAttribute("utente");
	if (u != null) {%>
	<ul class="navbar-nav ml-auto">
					<li class="nav-link navbar-brand">
					<% if (u.getTipo().equals("artista")) {
			Artista a = (Artista) session.getAttribute("artista");
	%>
	<% if(a.getImg() != null){ %>
	<a class="nav-link active" href="#">
	<img src="<%=a.getImg() %>" class="rounded-circle profile-img"> </a>
	<%} else { %>
	<img src="img\avatar.png" class="rounded-circle profile-img"> </a>
	
	<% } %>
	
	</li>
					<li class="nav-item dropdown mt-4"><a
						class="nav-link active dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown"> <%=a.getNomeArtista()%> </a>
						<ul class="dropdown-menu dropdown-menu-dark">
							<li><a class="dropdown-item" href="ilMioProfiloArtista.jsp">Profilo</a></li>
							<li><a class="dropdown-item" href="#">Modifica</a></li>
							<li><a class="dropdown-item" href="leMiePrenotazioniArtista.jsp">Le mie Prenotazioni</a></li>
							<li><a class="dropdown-item" href="index.jsp">Esci</a></li>
						</ul></li>

				</ul>
							</div>
		</div>
	</nav>
</header>
		
	<%
	} else if (u.getTipo().equals("band")) {
	Band b = (Band) session.getAttribute("band");
	%><a class="nav-link active" href="#">
	<% if(b.getImg() != null){ %>
	<img src="<%=b.getImg() %>" class="rounded-circle profile-img"> 
	<%} else { %>
	<img src="img\avatar.png" class="rounded-circle profile-img"> 
	<% } %>
	
	</a>
	</li>
					<li class="nav-item dropdown mt-4"><a
						class="nav-link active dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown"> <%=b.getBand()%> </a>
						<ul class="dropdown-menu dropdown-menu-dark">
							<li><a class="dropdown-item" href="ilMioProfiloBand.jsp">Profilo</a></li>
							<li><a class="dropdown-item" href="#">Modifica</a></li>
							<li><a class="dropdown-item" href="leMiePrenotazioniBand.jsp">Le mie Prenotazioni</a></li>
							<li><a class="dropdown-item" href="index.jsp">Esci</a></li>
						</ul></li>

				</ul>
							</div>
		</div>
	</nav>
</header>
	
	<%
	} else if (u.getTipo().equals("proprietario")) {
	Proprietario p = (Proprietario) session.getAttribute("proprietario");
	%>
	<a class="nav-link active" href="#">
	<% if(p.getImg() != null){ %>
	<img src="<%=p.getImg() %>" class="rounded-circle profile-img">
	<%} else { %>
	<img src="img\avatar.png" class="rounded-circle profile-img"> 
	<% } %>
	 </a>
	</li>
					<li class="nav-item dropdown mt-4"><a
						class="nav-link active dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown"> <%=p.getNome()%></a>
						<ul class="dropdown-menu dropdown-menu-dark">
							<li><a class="dropdown-item" href="ilMioProfiloProprietario.jsp">Profilo</a></li>
							<li><a class="dropdown-item" href="#">Modifica</a></li>
							<li><a class="dropdown-item" href="MieiLocali.jsp">I miei Locali</a></li>
							<li><a class="dropdown-item" href="index.jsp">Esci</a></li>
						</ul></li>

				</ul>
							</div>
		</div>
	</nav>
</header>
	
	
	<%
	} else if (u.getTipo().equals("cliente")) {
	Cliente c = (Cliente) session.getAttribute("cliente");
	%>
	<a class="nav-link active" href="#">
	<% if(c.getImg() != null){ %>
	<img src="<%=c.getImg() %>" class="rounded-circle profile-img">
	<%} else { %>
	<img src="img\avatar.png" class="rounded-circle profile-img"> 
	<% } %>
	 </a>
	</li>
					<li class="nav-item dropdown mt-4"><a
						class="nav-link active dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown"><%=c.getNome()%></a>
						<ul class="dropdown-menu dropdown-menu-dark">
							<li><a class="dropdown-item" href="ilMioProfiloCliente.jsp">Profilo</a></li>
							<li><a class="dropdown-item" href="modificaCliente.jsp">Modifica</a></li>
							<li><a class="dropdown-item" href="leMiePrenotazioniCliente.jsp">Le mie Prenotazioni</a></li>
							<li><a class="dropdown-item" href="index.jsp">Esci</a></li>
						</ul></li>

				</ul>
				</div>
		</div>
	</nav>
</header>
	
	<%
	}
	} else {
	%>
	<button type="button" class="btn btnAccesso btn-primary bg-gradient mx-3" data-bs-toggle="modal"
          data-bs-target="#accesso">Accedi
          
        </button>

       <a href="registrazione.jsp"><input type="button" class="btn btn-danger btn-lg"
                        value="Registrati"></a>




      </div>
    </div>
  </nav>

  <!-- The Modal -->
  <div class="modal fade" id="accesso">
    <div class="modal-dialog modal-fullscreen-sm-down">
      <div class="modal-content">

        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Accedi</h4>
          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
        </div>

        <!-- Modal body -->
        <div class="modal-body text-center">
          <form action="servlet" method="post" autocomplete="on">
          <input type="hidden" name="operazione" value="login">
          
            <div class="form-floating mb-3 mt-3">
              <input type="text" class="form-control" id="email" placeholder="Enter email" name="email" required>
              <label for="email" style="color: black;">Email</label>
            </div>

            <div class="form-floating mt-3 mb-3">
              <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pass" required>
              <label for="pwd" style="color: black;">Password</label>
            </div>
            <br><br>
            <div class="container" style="text-align: center;">
              <input type="submit" value="Accedi " class="btn btn-primary btn-outline-light" style="width: 100px; 
                height:50px; 
                font-size: large"><br><br>
              <a href="" class="text-decoration-none text-black" style="font-size: larger;">Hai dimenticato la
                password?</a>
            </div>
          </form>
        </div>

        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
        </div>

      </div>
    </div>
  </div>

  <script>
    // Initialize tooltips
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
      return new bootstrap.Tooltip(tooltipTriggerEl)
    })
  </script>
</header>
	<%
	}
	%>
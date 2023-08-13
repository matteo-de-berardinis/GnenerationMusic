package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.ClienteDAO;
import DAO.CommentiArtistiDAO;
import DAO.CommentiBandDAO;
import DAO.CommentiLocaleDAO;
import DAO.LocaleDAO;
import DAO.ProprietarioDAO;
import DAO.UtenteDAO;
import DAO.artistiDAO;
import DAO.bandDAO;
import DAO.commentiAdminDAO;
import DAO.giorniDispDAO;
import DAO.prenotazioneDAO;
import model.Artista;
import model.Band;
import model.Cliente;
import model.CommentiArtista;
import model.CommentiBand;
import model.CommentoLocale;
import model.GiorniDisp;
import model.JavaMailUtil;
import model.Locale;
import model.Prenotazione;
import model.Proprietario;
import model.Utente;
import model.commentiAdmin;

@WebServlet("/servlet")
public class servletApp extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public servletApp() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("operazione");
        System.out.println(action);

        switch (action) {
            case "loginSenzaAcesso":
                acessoNormale(request, response);
                break;
            case "registrazione":
                registrazione(request, response);
                break;
            case "registrazioneartisti":
                try {
                    registrazioneArtisti(request, response);
                } catch (ServletException | IOException | MessagingException e) {
                    e.printStackTrace();
                }
                break;
            case "registrazioneband":
                try {
                    registrazioneBand(request, response);
                } catch (ServletException | IOException | MessagingException e) {
                    e.printStackTrace();
                }
                break;
            case "registrazionecliente":
                try {
                    registrazioneCliente(request, response);
                } catch (ServletException | IOException | MessagingException e) {
                    e.printStackTrace();
                }
                break;
            case "registrazioneproprietario":
                try {
                    registrazioneProprietario(request, response);
                } catch (ServletException | IOException | MessagingException e) {
                    e.printStackTrace();
                }
                break;
            case "login":
                loginUtente(request, response);
                break;
            case "inserisciNuovaData":
                inserisciDataDisp(request, response);
                break;
            case "vediLocale":
                vediLocale(request,response);
                break;
            case "inserisciNuovaDataLocale":
                inserisciDataDispLocale(request,response);
                break;
            case "infoArtista":
                infoArtista(request,response);
                break;
            case "inserisciCommento":
                inserisciCommento(request,response);
                break;
            case "infoBand":
                infoBand(request,response);
                break;
            case "inserisciCommentoBand":
                try {
                    inserisciCommentoBand(request,response);
                } catch (ServletException | IOException | SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "infoLocale":
                infoLocale(request,response);
                break;
            case "inserisciCommentoLocale":
                inserisciCommentoLocale(request,response);
                break;
            case "modificaProfiloArtista":
                modificaProfiloArtista(request,response);
                break;
            case "modificaProfiloProprietario":
                modificaProfiloProprietario(request,response);
                break;
            case "modificaProfiloBand":
                modificaProfiloBand(request, response);
                break;
            case "modificaProfiloCliente":
                modificaProfiloCliente(request, response);
                break;
            case "RegistrazioneLocale":
                RegistrazioneLocale(request,response);
                break;
            case "prenotazioneArtista":
                try {
                    prenotazioneArtista(request,response);
                } catch (ServletException | IOException | MessagingException e) {
                    e.printStackTrace();
                }
                break;
            case "prenotazioneBand":
                try {
                    prenotazioneBand(request,response);
                } catch (ServletException | IOException | MessagingException e) {
                    e.printStackTrace();
                }
                break;
            case "prenotazioneLocale":
                try {
                    prenotazioneLocale(request,response);
                } catch (ServletException | IOException | MessagingException e) {
                    e.printStackTrace();
                }
                break;
            case "cancellaPrenotazione":
                try {
                	cancellaPrenotazione(request,response);
                } catch (ServletException | IOException | MessagingException e) {
                    e.printStackTrace();
                }
                break;
            case "cancellaPrenotazioneArtista":
                try {
                	cancellaPrenotazioneArtista(request,response);
                } catch (ServletException | IOException | MessagingException e) {
                    e.printStackTrace();
                }
                break;
            case "cancellaPrenotazioneBand":
                try {
                	cancellaPrenotazioneBand(request,response);
                } catch (ServletException | IOException | MessagingException e) {
                    e.printStackTrace();
                }
                break;
                
            case "cancellaPrenotazioneLocale":
                try {
                	cancellaPrenotazioneLocale(request,response);
                } catch (ServletException | IOException | MessagingException e) {
                    e.printStackTrace();
                }
                break;
            case"commentiAdmin":
            	commentiAdmin(request,response);
            	break;
            default:
                index(request, response);
                break;
        }
    }


    private void index(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("ciao.jsp");
        dispatcher.forward(request, response);
    }

    private void acessoNormale(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sessione = request.getSession(true);
        Utente u = null;
        List<Artista> listaArtisti = artistiDAO.recuperLista();
        List<Band> listaBand = bandDAO.recuperLista();
        List<Locale> listaLocali = LocaleDAO.recuperLista();
        sessione.setAttribute("listaArtisti", listaArtisti);
        sessione.setAttribute("listaBand", listaBand);
        sessione.setAttribute("listaLocali", listaLocali);
        sessione.setAttribute("utente", u);
        RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
        dispatcher.forward(request, response);
    }

    private void registrazione(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String tipo = request.getParameter("selezione");
        if (tipo.equals("sceltaCliente")) {
            request.setAttribute(tipo, "sceltaTipo");
            RequestDispatcher dispatcher = request.getRequestDispatcher("registrazione_cliente.jsp");
            dispatcher.forward(request, response);
        } else if (tipo.equals("sceltaArtista")) {
            request.setAttribute(tipo, "sceltaTipo");
            RequestDispatcher dispatcher = request.getRequestDispatcher("registrazione_artista.jsp");
            dispatcher.forward(request, response);
        } else if (tipo.equals("sceltaBand")) {
            request.setAttribute(tipo, "sceltaTipo");
            RequestDispatcher dispatcher = request.getRequestDispatcher("registrazione_band.jsp");
            dispatcher.forward(request, response);
        } else if (tipo.equals("sceltaProprietario")) {
            request.setAttribute(tipo, "sceltaTipo");
            RequestDispatcher dispatcher = request.getRequestDispatcher("registrazione_proprietario.jsp");
            dispatcher.forward(request, response);
        }
    }

    private void registrazioneArtisti(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, MessagingException {
        String tipo = "artista";
        String username = request.getParameter("username");
        String nomeArte = request.getParameter("nomearte");
        String annoNascita = request.getParameter("annonascita");
        String nazionalita = request.getParameter("nazionalita");
        String genereMusicale = request.getParameter("genere");
        String email = request.getParameter("email");
        String password = request.getParameter("pass");

        Utente u = new Utente(username, email, nazionalita, password, tipo);
        UtenteDAO.inserisciUtente(u);

        Artista a = new Artista(username, email, nazionalita, password, nomeArte, genereMusicale, annoNascita,
                u.getIdUtente());
        artistiDAO.inserisciArtista(u, a);
        JavaMailUtil.sendMail(u.getEmail(), "generationmusicinfoservizi@gmail.com", "Registrazione", "Benvenuto su Generation Music \n" +"caro " + a.getNomeArtista()+ " siamo felice di accoglierti sulla nostra piattaforma :)" );
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
    }

    private void registrazioneBand(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, MessagingException {
        String tipo = "band";
        String username = request.getParameter("username");
        String nomeBand = request.getParameter("nomeband");
        String annoFondazione = request.getParameter("annonascita");
        String nazionalita = request.getParameter("nazionalita");
        String genereMusicale = request.getParameter("genere");
        String email = request.getParameter("email");
        String password = request.getParameter("pass");

        Utente u = new Utente(username, email, nazionalita, password, tipo);
        UtenteDAO.inserisciUtente(u);

        Band b = new Band(username, email, nazionalita, password, nomeBand, genereMusicale, annoFondazione,
                u.getIdUtente());
        bandDAO.inserisciBand(u, b);
        JavaMailUtil.sendMail(u.getEmail(), "generationmusicinfoservizi@gmail.com", "Registrazione", "Benvenuto su Generation Music \n" +"caro " +b.getBand()+ " siamo felice di accoglierti sulla nostra piattaforma :)");
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
    }

    private void registrazioneCliente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, MessagingException {
        String tipo = "cliente";
        String annoNascita = request.getParameter("annonascita");
        String username = request.getParameter("username");
        String nome = request.getParameter("nome");
        String cognome = request.getParameter("cognome");
        String nazionalita = request.getParameter("nazionalita");
        String genereMusicale = request.getParameter("genere");
        String email = request.getParameter("email");
        String password = request.getParameter("pass");

        Utente u = new Utente(username, email, nazionalita, password, tipo);
        UtenteDAO.inserisciUtente(u);

        Cliente c = new Cliente(username, email, nazionalita, password, nome, annoNascita, cognome, u.getIdUtente());
        ClienteDAO.inserisciArtista(u, c);
        JavaMailUtil.sendMail(u.getEmail(), "generationmusicinfoservizi@gmail.com", "Registrazione", "Benvenuto su Generation Music \n" +"caro " + c.getNome() + " siamo felice di accoglierti sulla nostra piattaforma :)" );
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
    }

    private void registrazioneProprietario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, MessagingException {
        String tipo = "proprietario";
        String username = request.getParameter("username");
        String nome = request.getParameter("nome");
        String cognome = request.getParameter("cognome");
        String annoNascita = request.getParameter("annonascita");
        String nazionalita = request.getParameter("nazionalita");
        String email = request.getParameter("email");
        String password = request.getParameter("pass");

        Utente u = new Utente(username, email, nazionalita, password, tipo);
        UtenteDAO.inserisciUtente(u);

        Proprietario p = new Proprietario(username, email, nazionalita, password, nome, cognome, annoNascita, u.getIdUtente());
        ProprietarioDAO.inserisciProprietario(u, p);
        JavaMailUtil.sendMail(u.getEmail(), "generationmusicinfoservizi@gmail.com", "Registrazione", "Benvenuto su Generation Music \n" +"caro "  +p.getNome()+ " siamo felice di accoglierti sulla nostra piattaforma :)" );
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
    }

    private void loginUtente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sessione = request.getSession(true);
        String email = request.getParameter("email");
        String password = request.getParameter("pass");
        List<Utente> listaUtenti = UtenteDAO.recuperLista();
        boolean utenteTrovato = false;

        for (Utente u : listaUtenti) {
            if (u.getEmail().equals(email) && u.getPassword().equals(password)) {
                utenteTrovato = true;
                if (u.getTipo().equals("artista")) {
                    Artista a = artistiDAO.recuperaArtistaTramiteID(u);
                    List<Artista> listaArtisti = artistiDAO.recuperLista();
                    List<Band> listaBand = bandDAO.recuperLista();
                    List<Locale> listaLocale = LocaleDAO.recuperLista();
                    sessione.setAttribute("listaArtisti", listaArtisti);
                    sessione.setAttribute("listaBand", listaBand);
                    sessione.setAttribute("listaLocali", listaLocale);
                    sessione.setAttribute("utente", u);
                    sessione.setAttribute("artista", a);
        
                } else if (u.getTipo().equals("band")) {
                    Band b = bandDAO.recuperaBandTramiteID(u);
                    List<Artista> listaArtisti = artistiDAO.recuperLista();
                    List<Band> listaBand = bandDAO.recuperLista();
                    List<Locale> listaLocale = LocaleDAO.recuperLista();
                    sessione.setAttribute("listaArtisti", listaArtisti);
                    sessione.setAttribute("listaBand", listaBand);
                    sessione.setAttribute("listaLocali", listaLocale);
                    sessione.setAttribute("utente", u);
                    sessione.setAttribute("band", b);
                } else if (u.getTipo().equals("proprietario")) {
                    Proprietario p = ProprietarioDAO.recuperaProprietarioTramiteID(u);
                    List<Artista> listaArtisti = artistiDAO.recuperLista();
                    List<Band> listaBand = bandDAO.recuperLista();
                    List<Locale> listaLocale = LocaleDAO.recuperLista();
                    sessione.setAttribute("listaArtisti", listaArtisti);
                    sessione.setAttribute("listaBand", listaBand);
                    sessione.setAttribute("listaLocali", listaLocale);
                    sessione.setAttribute("utente", u);
                    sessione.setAttribute("proprietario", p);
                }
                else if (u.getTipo().equals("cliente")) {
                    Cliente c = ClienteDAO.recuperaClienteTramiteID(u);
                    List<Artista> listaArtisti = artistiDAO.recuperLista();
                    List<Band> listaBand = bandDAO.recuperLista();
                    List<Locale> listaLocale = LocaleDAO.recuperLista();
                    sessione.setAttribute("listaArtisti", listaArtisti);
                    sessione.setAttribute("listaBand", listaBand);
                    sessione.setAttribute("listaLocali", listaLocale);
                    sessione.setAttribute("utente", u);
                    sessione.setAttribute("cliente", c);
                }

                break;
            }
        }

        if (utenteTrovato) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
            dispatcher.forward(request, response);
        } else {
            RequestDispatcher dispatcher2 = request.getRequestDispatcher("errore.jsp");
            dispatcher2.forward(request, response);
        }
    }
    
    
    /////////////////////7inserire data e mostrare le proprie date ///////////////////////////////////////////////

    private void inserisciDataDisp(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sessione = request.getSession(true);
        String data = request.getParameter("inserisciGiornoDisp");
        GiorniDisp g = new GiorniDisp(data);
        Utente u = (Utente) sessione.getAttribute("utente");

        if (u.getTipo().equals("artista")) {
            Artista a = (Artista) sessione.getAttribute("artista");
           giorniDispDAO.inserisciGiorniDispArtista(a, g);
           
            RequestDispatcher dispatcher2 = request.getRequestDispatcher("inserisciGiorni.jsp");
            dispatcher2.forward(request, response);
        } else if (u.getTipo().equals("band")) {
            Band b = (Band) sessione.getAttribute("band");
            giorniDispDAO.inserisciGiorniDispBand(b, g);
            RequestDispatcher dispatcher2 = request.getRequestDispatcher("inserisciGiorni.jsp");
            dispatcher2.forward(request, response);
        }
    }
    
    
    
    
    //////////////metodo per risalire a un singolo locale ///////////////////////////////////////////
    protected void vediLocale(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sessione = request.getSession(true);
        String idLocaleParam = request.getParameter("dati_nascosti");
        int idLocale = Integer.parseInt(idLocaleParam);
        sessione.setAttribute("idLocale", idLocale);
        RequestDispatcher dispatcher2 = request.getRequestDispatcher("locale.jsp");
        dispatcher2.forward(request, response);
    }

    
    //////////////metodo che mi fa inserire data disponibile per singoo locale 
    protected void inserisciDataDispLocale(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sessione = request.getSession(true);
        String data = request.getParameter("inserisciGiornoDisp");
        GiorniDisp g = new GiorniDisp(data);
        Proprietario p = (Proprietario) sessione.getAttribute("proprietario");
        int id = (int) sessione.getAttribute("idLocale");
        Locale l = LocaleDAO.recuperaLocaleTramiteId(id);
        giorniDispDAO.inserisciGiorniDispLocale(l, g);
        RequestDispatcher dispatcher2 = request.getRequestDispatcher("gestisciDispLocale.jsp");
        dispatcher2.forward(request, response);
    }

    
    
    ////////////////////////////7metodo che mi manda alle pagine info degli artisti////////////////////7
    protected void infoArtista(HttpServletRequest request, HttpServletResponse response)
    	    throws ServletException, IOException {
    	    HttpSession sessione = request.getSession(true);
    	    String idNascosto = request.getParameter("dati_nascosti");
    	    int idArtista = Integer.parseInt(idNascosto);
    	    sessione.setAttribute("idArtista", idArtista);
    	    RequestDispatcher dispatcher2 = request.getRequestDispatcher("infoArtista.jsp");
    	    dispatcher2.forward(request, response);
    	}
    
    
    
    ///////////////7metodo per inserire commenti artisti  /////////////////////////////
    protected void inserisciCommento(HttpServletRequest request, HttpServletResponse response)
    	    throws ServletException, IOException {
    	    HttpSession sessione = request.getSession(true);
    	    String commento = request.getParameter("commento");
            int valutazione = Integer.parseInt(request.getParameter("valutazione"));
            CommentiArtista c= new CommentiArtista(commento,valutazione);
            String email=request.getParameter("emailUtente");
            Utente u=UtenteDAO.recuperaUtentePerEmail(email);
            String idArtista=request.getParameter("idArtista");
            int VeroID=Integer.parseInt(idArtista);
            Artista a=artistiDAO.recuperaArtistaTramiteIDint(VeroID);
            CommentiArtistiDAO.inserisciCommentiArtista(a, c, u);
            
    	    RequestDispatcher dispatcher2 = request.getRequestDispatcher("infoArtista.jsp");
    	    dispatcher2.forward(request, response);
    	}
    
    
    
    protected void infoBand(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sessione = request.getSession(true);
        
            String idNascosto = request.getParameter("dati_nascosti");
            int idBand = Integer.parseInt(idNascosto);
            sessione.setAttribute("idBand", idBand);
            RequestDispatcher dispatcher2 = request.getRequestDispatcher("infoBand.jsp");
            dispatcher2.forward(request, response);
      
    }

    protected void inserisciCommentoBand(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
    	     String commento = request.getParameter("commento2");
    	     System.out.println("Commento = " + commento);
        int valutazione = Integer.parseInt(request.getParameter("valutazione2"));
        System.out.println(valutazione);
        CommentiBand c = new CommentiBand(commento, valutazione);
        String email = request.getParameter("emailUtente2");
        Utente u = UtenteDAO.recuperaUtentePerEmail(email);
        String idBand = request.getParameter("idBand2");
        int VeroID=Integer.parseInt(idBand);
       
        Band b = bandDAO.recuperaBandTramiteIDint(VeroID);
        CommentiBandDAO.inserisciCommentiBand(b, c, u);

        RequestDispatcher dispatcher = request.getRequestDispatcher("infoBand.jsp");
        dispatcher.forward(request, response);
    }

    
    ////////////////////////////7metodo che mi manda alle pagine info dei locali////////////////////7
    protected void infoLocale(HttpServletRequest request, HttpServletResponse response)
    	    throws ServletException, IOException {
    	    HttpSession sessione = request.getSession(true);
    	    String idNascosto = request.getParameter("dati_nascosti");
    	    int idLocale = Integer.parseInt(idNascosto);
    	    sessione.setAttribute("idLocale", idLocale);
    	    RequestDispatcher dispatcher2 = request.getRequestDispatcher("infoLocale.jsp");
    	    dispatcher2.forward(request, response);
    	}
    

    
    /////////////////modifica inseriswci commento locale  /////////////////////////////////
    
    
    
    protected void inserisciCommentoLocale(HttpServletRequest request, HttpServletResponse response)
    	    throws ServletException, IOException {
    	    HttpSession sessione = request.getSession(true);
    	    String commento = request.getParameter("commento");
            int valutazione = Integer.parseInt(request.getParameter("valutazione"));
            CommentoLocale c= new CommentoLocale(commento,valutazione);
            String email=request.getParameter("emailUtente");
            Utente u=UtenteDAO.recuperaUtentePerEmail(email);
            String idLocale=request.getParameter("idArtista");
            int VeroID=Integer.parseInt(idLocale);
            Locale l=LocaleDAO.recuperaLocaleTramiteIDint(VeroID);
            CommentiLocaleDAO.inserisciCommentiLocale(l, c, u);
            
    	    RequestDispatcher dispatcher2 = request.getRequestDispatcher("infoLocale.jsp");
    	    dispatcher2.forward(request, response);
    	}
    
    
    
    
    ///////////////7metodo per modificare profilo artista   /////////////////////////////
    protected void modificaProfiloArtista(HttpServletRequest request, HttpServletResponse response)
    	    throws ServletException, IOException {
    	    HttpSession sessione = request.getSession(true);
    	Artista a =(Artista)sessione.getAttribute("artista");
    	String username=request.getParameter("username");
    	String NomeArte=request.getParameter("nomearte");
    	String genere=request.getParameter("genere");
    	String email=request.getParameter("email");
    	String password=request.getParameter("pass");
    	a.setNickname(username);
    	a.setNomeArtista(NomeArte);
    	a.setGenere(genere);
    	a.setPassword(password);
    	a.setEmail(email);
    	artistiDAO.modificaArtista(username, NomeArte, genere, email, password, a);
            
    	    RequestDispatcher dispatcher2 = request.getRequestDispatcher("ilMioProfiloArtista.jsp");
    	    dispatcher2.forward(request, response);
    	}
    
    ///////////////7metodo per modificare profilo proprietario   /////////////////////////////
    protected void modificaProfiloProprietario(HttpServletRequest request, HttpServletResponse response)
    	    throws ServletException, IOException {
    	    HttpSession sessione = request.getSession(true);
    	Proprietario p =(Proprietario)sessione.getAttribute("proprietario");
        Utente u=(Utente)sessione.getAttribute("utente");
    	String username=request.getParameter("username");
    	String Nome=request.getParameter("nome");
    	String cognome=request.getParameter("cognome");
    	String email=request.getParameter("email");
    	String password=request.getParameter("pass");
    	p.setNickname(username);
    	p.setNome(Nome);
    	p.setCognome(cognome);
    	p.setPassword(password);
    	p.setEmail(email);
    	ProprietarioDAO.modificaProprietario(username, Nome, cognome, email, password, p,u);
            
    	    RequestDispatcher dispatcher2 = request.getRequestDispatcher("ilMioProfiloProprietario.jsp");
    	    dispatcher2.forward(request, response);
    	}
    
    
    //////////////77metodo modifica band ////////////////////////////////////////////////77
    protected void modificaProfiloBand(HttpServletRequest request, HttpServletResponse response)
    	    throws ServletException, IOException {
    	    HttpSession sessione = request.getSession(true);
    	Band b =(Band)sessione.getAttribute("band");
        Utente u=(Utente)sessione.getAttribute("utente");
    	String username=request.getParameter("username");
    	String NomeBand=request.getParameter("nomeband");
    	String genere=request.getParameter("genere");
    	String email=request.getParameter("email");
    	String password=request.getParameter("pass");
    	b.setNickname(username);
    	b.setBand(NomeBand);
    	b.setGenere(genere);
    	b.setPassword(password);
    	b.setEmail(email);
    	bandDAO.modificaBand(username, NomeBand, genere, email, password, b,u);
            
    	    RequestDispatcher dispatcher2 = request.getRequestDispatcher("ilMioProfiloBand.jsp");
    	    dispatcher2.forward(request, response);
    
    }
    
    
    ///////////////metodo modifica cliente ////////////////////////////////////////////////
    protected void modificaProfiloCliente(HttpServletRequest request, HttpServletResponse response)
    	    throws ServletException, IOException {
    	    HttpSession sessione = request.getSession(true);
    	    Utente u=(Utente)sessione.getAttribute("utente");
    	Cliente c =(Cliente)sessione.getAttribute("cliente");
    	String username=request.getParameter("username");
    	String Nome=request.getParameter("nome");
    	String Cognome=request.getParameter("cognome");
    	String email=request.getParameter("email");
    	String password=request.getParameter("pass");
    	c.setNickname(username);
    	c.setNome(Nome);
    	c.setCognome(Cognome);
    	c.setPassword(password);
    	c.setEmail(email);
   ClienteDAO.modificaCliente(username, Nome, Cognome, email, password, c,u);
            
    	    RequestDispatcher dispatcher2 = request.getRequestDispatcher("ilMioProfiloCliente.jsp");
    	    dispatcher2.forward(request, response);
    
    
    
    }
    
    
    protected void RegistrazioneLocale(HttpServletRequest request, HttpServletResponse response)
    	    throws ServletException, IOException {
    	    HttpSession sessione = request.getSession(true);
    	   Proprietario p=(Proprietario)sessione.getAttribute("proprietario");
    	   Utente u=(Utente)sessione.getAttribute("utente");
   String nomeLocale=request.getParameter("nomeLocale");
   String citta=request.getParameter("citta");
   String regione=request.getParameter("regione");
   int capienza = Integer.parseInt(request.getParameter("capienza"));
   double prezzo= Double.parseDouble(request.getParameter("prezzo"));
   String bio=request.getParameter("bio");
   LocaleDAO.inseriscinuovoLocale(nomeLocale, citta, regione, capienza, prezzo, bio, p);
   
            
    	    RequestDispatcher dispatcher2 = request.getRequestDispatcher("ilMioProfiloProprietario.jsp");
    	    dispatcher2.forward(request, response);
    
    
    
    }
    
    ///////////////prenotazioneArtista ///////////////////////
    protected void prenotazioneArtista(HttpServletRequest request, HttpServletResponse response)
    	    throws ServletException, IOException, MessagingException {
    	    HttpSession sessione = request.getSession(true);
    	int IdUtente= Integer.parseInt(request.getParameter("idUtente"));
    	int IdArtista= Integer.parseInt(request.getParameter("idArtista"));
    	String data=request.getParameter("data");
    	String commento =request.getParameter("commento");
    	Prenotazione p=new Prenotazione(IdUtente,IdArtista,data,commento);
    	prenotazioneDAO.inserisciPrenotazioneArtista(p);
    	Utente u=(Utente)sessione.getAttribute("utente");
    	Artista a=artistiDAO.recuperaArtistaDefinitivo(IdArtista);
    	/////invio email cliente 
    	 JavaMailUtil.sendMail(u.getEmail(), "generationmusicinfoservizi@gmail.com", "Conferma Prenotazione", "Ti confermiamo che la sua prenotazione per "
    	+" "+a.getNomeArtista()+" per il giorno"+data+"\n" +" e stata iviata all artista ."+"\n" +
    			 "grazie per avere scleto Generation Music" );	
    	////invio email artista 
    	 JavaMailUtil.sendMail(a.getEmail(), "generationmusicinfoservizi@gmail.com", "Conferma Prenotazione", "Ti comunichiamo che è appena stata fatta una prenotazione da parte di  "
    		    	+" "+u.getNickname()+" per il giorno"+data+"\n" +" la preghiamo di contattatare l utente presso l eamil fornita qui sotto "+"\n" +
    		    	u.getEmail()+		 "grazie per avere scleto Generation Music" );	
   
            
    	    RequestDispatcher dispatcher = request.getRequestDispatcher("confermaPrenotazione.jsp");
    	    dispatcher.forward(request, response);
    
    
    
    }
    
    ///////////////prenotazioneBand///////////////////////
    protected void prenotazioneBand(HttpServletRequest request, HttpServletResponse response)
    	    throws ServletException, IOException, MessagingException {
    	    HttpSession sessione = request.getSession(true);
    	int IdUtente= Integer.parseInt(request.getParameter("idUtente"));
    	int IdBand= Integer.parseInt(request.getParameter("idBand"));
    	String data=request.getParameter("data");
    	String commento =request.getParameter("commento");
    	Prenotazione p=new Prenotazione(IdUtente,IdBand,data,commento);
    	prenotazioneDAO.inserisciPrenotazioneBand(p);
    	Utente u=(Utente)sessione.getAttribute("utente");
    	Band b = bandDAO.recuperaBandDefinitiva(IdBand);
    	/////invio email cliente 
    	 JavaMailUtil.sendMail(u.getEmail(), "generationmusicinfoservizi@gmail.com", "Conferma Prenotazione", "Ti confermiamo che la sua prenotazione per "
    	+" "+b.getBand()+" per il giorno"+data+"\n" +" e stata iviata alla band ."+"\n" +
    			 "grazie per avere scleto Generation Music" );	
    	////invio email artista 
    	 JavaMailUtil.sendMail(b.getEmail(), "generationmusicinfoservizi@gmail.com", "Conferma Prenotazione", "Ti comunichiamo che è appena stata fatta una prenotazione da parte di  "
    		    	+" "+u.getNickname()+" per il giorno"+data+"\n" +" la preghiamo di contattatare l utente presso l eamil fornita qui sotto "+"\n" +
    		    	u.getEmail()+" l utente ha lasciato un messagio per lei"+p.getCommento()+		 "grazie per avere scleto Generation Music" );	
   
            
    	    RequestDispatcher dispatcher = request.getRequestDispatcher("confermaPrenotazione.jsp");
    	    dispatcher.forward(request, response);
    
    
    
    }
    
    
    ///////////////prenotazionelocale///////////////////////
    protected void prenotazioneLocale(HttpServletRequest request, HttpServletResponse response)
    	    throws ServletException, IOException, MessagingException {
    	    HttpSession sessione = request.getSession(true);
    	int IdUtente= Integer.parseInt(request.getParameter("idUtente"));
    	int IdLocale= Integer.parseInt(request.getParameter("idLocale"));
    	String nomeLocale=request.getParameter("nomeLocale");
    	String data=request.getParameter("data");
    	String commento =request.getParameter("commento");
    	Prenotazione p=new Prenotazione(IdUtente,IdLocale,data,commento);
    	prenotazioneDAO.inserisciPrenotazioneLocale(p);
    	Utente u=(Utente)sessione.getAttribute("utente");
    	Locale l= LocaleDAO.recuperaLocaleTramiteIDint(IdLocale);
    	Proprietario pr= LocaleDAO.recuperaProprietarioCompleto(IdLocale);
    	/////invio email cliente 
    	 JavaMailUtil.sendMail(u.getEmail(), "generationmusicinfoservizi@gmail.com", "Conferma Prenotazione", "Ti confermiamo che la sua prenotazione presso il locale "
    	+" "+nomeLocale+" per il giorno"+data+"\n" +" e stata iviata al signor  ."+pr.getNome()+"\n" +
    			 "Grazie per avere scelto Generation Music, a breve avrà notizie " );	
    	////invio email artista 
    	 JavaMailUtil.sendMail(pr.getEmail(), "generationmusicinfoservizi@gmail.com", "Conferma Prenotazione", "Ti comunichiamo che è appena stata fatta una prenotazione da parte di  "
    		    	+" "+u.getNickname()+" per il giorno "+data+" per il suo locale"+l.getNome()+"\n" +" la preghiamo di contattatare l'utente presso l'email fornita qui sotto "+"\n" +
    		    	u.getEmail()+" l'utente ha lasciato un messagio per lei"+p.getCommento()+		 "Grazie per avere scleto Generation Music" );	
   
            
    	    RequestDispatcher dispatcher = request.getRequestDispatcher("confermaPrenotazione.jsp");
    	    dispatcher.forward(request, response);
    
    
    
    }
    /////////7cancella prenotazione  cliente //////////////
    
    protected void cancellaPrenotazione(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, MessagingException {
        HttpSession sessione = request.getSession(true);
        int idPrenotazione = Integer.parseInt(request.getParameter("idPrenotazione"));
        System.out.println(idPrenotazione);
        prenotazioneDAO.cancellaPrenotazione(idPrenotazione);

        RequestDispatcher dispatcher = request.getRequestDispatcher("leMiePrenotazioniCliente.jsp");
        dispatcher.forward(request, response);
    }
    
  /////////7cancella prenotazione  artista //////////////
    
    protected void cancellaPrenotazioneArtista(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, MessagingException {
        HttpSession sessione = request.getSession(true);
        int idPrenotazione = Integer.parseInt(request.getParameter("idPrenotazione"));
        System.out.println(idPrenotazione);
        prenotazioneDAO.cancellaPrenotazione(idPrenotazione);

        RequestDispatcher dispatcher = request.getRequestDispatcher("leMiePrenotazioniArtista.jsp");
        dispatcher.forward(request, response);
    }
    
 /////////7cancella prenotazione  band //////////////
    
    protected void cancellaPrenotazioneBand(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, MessagingException {
        HttpSession sessione = request.getSession(true);
        int idPrenotazione = Integer.parseInt(request.getParameter("idPrenotazione"));
        System.out.println(idPrenotazione);
        prenotazioneDAO.cancellaPrenotazione(idPrenotazione);

        RequestDispatcher dispatcher = request.getRequestDispatcher("leMiePrenotazioniBand.jsp");
        dispatcher.forward(request, response);
    }
    
/////////7cancella prenotazione  locale//////////////
    
protected void cancellaPrenotazioneLocale(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException, MessagingException {
    HttpSession sessione = request.getSession(true);
    int idPrenotazione = Integer.parseInt(request.getParameter("idPrenotazione"));
    System.out.println(idPrenotazione);
    prenotazioneDAO.cancellaPrenotazione(idPrenotazione);

    RequestDispatcher dispatcher = request.getRequestDispatcher("gestisciDispLocale.jsp");
    dispatcher.forward(request, response);
}

//////commentiAdmin/////////////////////////////////

protected void commentiAdmin(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	    HttpSession sessione = request.getSession(true);
	    String nome = request.getParameter("name");
       String email=request.getParameter("email");
       String message=request.getParameter("message");
      commentiAdminDAO.inserisciCommentiAdmin(nome, email, message);
        
	    RequestDispatcher dispatcher2 = request.getRequestDispatcher("home.jsp");
	    dispatcher2.forward(request, response);
	}
    
    
}


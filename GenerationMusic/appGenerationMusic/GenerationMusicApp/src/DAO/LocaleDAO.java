package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.ConnessioneDB;
import model.Artista;
import model.Locale;
import model.Proprietario;
import model.Utente;

public class LocaleDAO {

	///////////////////// metodo per avere una lista di
	///////////////////// locali///////////////////////////////////////////////////

	public static List<Locale> recuperLista() {
		List<Locale> listaLocali = new ArrayList<Locale>();
		try {
			ConnessioneDB.connect();
			String query = "SELECT * FROM appmusica.locale;";
			PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				int idLocale = rs.getInt("idLocale");
				String nomeLocale = rs.getString("nome_locale");
				String citta = rs.getString("citta");
				String regione = rs.getString("regione");
				int capienza = rs.getInt("capienza");
				double prezzo = rs.getDouble("prezzo");
				int idProprietario = rs.getInt("idProprietario");
				String img = rs.getString("img");
				String bio = rs.getString("bio");

				Locale b = new Locale(idLocale, nomeLocale, citta, regione, capienza, prezzo, img, bio, idProprietario);
				listaLocali.add(b);
			}

			ConnessioneDB.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return listaLocali;

	}

	//////////////// metodo per avre lista di locali di un
	//////////////// prorpietario/////////////////////////////////////////////7777

	public static List<Locale> recuperListaLocaliProprietatio(Proprietario p) {
		List<Locale> listaLocali = new ArrayList<Locale>();
		try {
			ConnessioneDB.connect();
			String query = "SELECT * FROM appmusica.locale where idProprietario=?";
			PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
			ps.setInt(1, p.getId());
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				int idLocale = rs.getInt("idLocale");
				String nomeLocale = rs.getString("nome_locale");
				String citta = rs.getString("citta");
				String regione = rs.getString("regione");
				int capienza = rs.getInt("capienza");
				double prezzo = rs.getDouble("prezzo");
				int idProprietario = rs.getInt("idProprietario");
				String img = rs.getString("img");
				String bio = rs.getString("bio");

				Locale b = new Locale(idLocale, nomeLocale, citta, regione, capienza, prezzo, img, bio, p.getId());
				listaLocali.add(b);
			}

			ConnessioneDB.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return listaLocali;

	}

///////////////////////////metodo per avere il locale specifico tramire il suo id ///////////////////////////////////////////7
	public static Locale recuperaLocaleTramiteId(int id) {
		Locale locale = null;
		try {
			ConnessioneDB.connect();
			String query = "SELECT * FROM appmusica.locale WHERE idLocale=?";
			PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				int idLocale = rs.getInt("idLocale");
				String nomeLocale = rs.getString("nome_locale");
				String citta = rs.getString("citta");
				String regione = rs.getString("regione");
				int capienza = rs.getInt("capienza");
				double prezzo = rs.getDouble("prezzo");
				int idProprietario = rs.getInt("idProprietario");
				String img = rs.getString("img");
				String bio = rs.getString("bio");

				locale = new Locale(idLocale, nomeLocale, citta, regione, capienza, prezzo, img, bio, idProprietario);
			}

			rs.close();
			ps.close();
			ConnessioneDB.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return locale;
	}

///////////////////////////////metodo che mi recupera un locale  tramite l id int ///////////////////////////////////////////////

	public static Locale recuperaLocaleTramiteIDint(int id) {
		Locale l = null;
		try {
			ConnessioneDB.connect();
			String query = "SELECT * FROM appmusica.locale WHERE idLocale = ?";
			PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				int idLocale = rs.getInt("idLocale");

				l = new Locale(idLocale);
			}

			rs.close();
			ps.close();
			ConnessioneDB.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return l;
	}

	//////////////////metodo che mi fa inserire un nuovo locale nel db /////////////////////////////////////77
	public static void inseriscinuovoLocale(String nomeLocale, String citta, String regione, int capienza, double prezzo,
			String bio,Proprietario p) {

			try {
			ConnessioneDB.connect();

			String query1 = "INSERT INTO `appmusica`.`locale` ( `nome_locale`, `citta`, `regione`, `capienza`, `prezzo`, `idProprietario`,  `bio`) VALUES ( ?, ?, ?, ?, ?, ?, ?);";
			PreparedStatement ps1 = ConnessioneDB.getCon().prepareStatement(query1);
			ps1.setString(1, nomeLocale);
			ps1.setString(2, citta);
			ps1.setString(3, regione);
			ps1.setInt(4, capienza);
			ps1.setDouble(5, prezzo);
			ps1.setInt(6, p.getId());
			ps1.setString(7, bio);
			
			ps1.executeUpdate();
			ps1.close();

		

			ConnessioneDB.close();
			} catch (SQLException e) {
			e.printStackTrace();
			}
	
	
	}
	
	////////////////////metodo che mi recupera un prorpietario dal locale ///////////////
	public static Proprietario recuperaProprietarioCompleto(int idLocale) {
	    Proprietario p = null;

	    try {
	        ConnessioneDB.connect();
	        String query = "SELECT * FROM appmusica.locale WHERE idLocale=?";
	        PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
	        ps.setInt(1, idLocale);
	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            int idProprietario = rs.getInt("idProprietario");

	            String queryProprietario = "SELECT * FROM appmusica.proprietario WHERE idProprietario=?";
	            PreparedStatement psProprietario = ConnessioneDB.getCon().prepareStatement(queryProprietario);
	            psProprietario.setInt(1, idProprietario);
	            ResultSet rsProprietario = psProprietario.executeQuery();

	            if (rsProprietario.next()) {
	                int idUtente = rsProprietario.getInt("idUtente");

	                String queryUtente = "SELECT * FROM appmusica.utente WHERE idUtente=?";
	                PreparedStatement psUtente = ConnessioneDB.getCon().prepareStatement(queryUtente);
	                psUtente.setInt(1, idUtente);
	                ResultSet rsUtente = psUtente.executeQuery();

	                if (rsUtente.next()) {
	                    int idUtenteProprietario = rsUtente.getInt("idUtente");
	                    String email = rsUtente.getString("email");
	                    String username = rsUtente.getString("username");
	                    String password = rsUtente.getString("password");
	                    String nazionalita = rsUtente.getString("nazionalita");
	                    String img = rsUtente.getString("img");
	                    String tipo = rsUtente.getString("tipo");

	                    String nome = rsProprietario.getString("nome");
	                    String cognome = rsProprietario.getString("cognome");
	                    String annoNascita = rsProprietario.getString("anno_nascita");
	                    String bio = rsProprietario.getString("bio");

	                    Utente u = new Utente(idUtenteProprietario, email, username, password, nazionalita, img, tipo);
	                    p = new Proprietario(idUtenteProprietario, email, username, password, nazionalita, img, tipo, idProprietario, nome, cognome, annoNascita, idUtenteProprietario, bio);
	                }
	            }
	        }

	        ConnessioneDB.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return p;
	}

	

	
	
	
	
	
	
}

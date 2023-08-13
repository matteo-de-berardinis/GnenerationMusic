package DAO;

import data.ConnessioneDB;
import model.Locale;
import model.Utente;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UtenteDAO {

	public static boolean inserisciUtente(Utente u) {
		boolean righeAggiornate = false;
		try {

			ConnessioneDB.connect();
			String query = "INSERT INTO `appmusica`.`utente` (`username`, `password`, `nazionalita`, `email`,`tipo`) VALUES (?,?,?,?,?);";
			PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
			ps.setString(1, u.getNickname());
			ps.setString(2, u.getPassword());
			ps.setString(3, u.getNazionalita());
			ps.setString(4, u.getEmail());
			ps.setString(5, u.getTipo());

			int righeInserite = ps.executeUpdate();
			if (righeInserite > 0) {
				righeAggiornate = true;
			}

			ps.close();
			ConnessioneDB.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return righeAggiornate;
	}

	/////////////////////////////// metodo per avere una lista di
	/////////////////////////////// utenti//////////////////////////////////////////////////////////////////

	public static List<Utente> recuperLista() {
		List<Utente> listaUtenti = new ArrayList<Utente>();
		try {
			ConnessioneDB.connect();
			String query = "SELECT *FROM appmusica.utente";
			PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				int idUtente = rs.getInt("idUtente");
				String username = rs.getString("username");
				String password = rs.getString("password");
				String nazionalita = rs.getString("nazionalita");
				String img = rs.getString("img");
				String email = rs.getString("email");
				String tipo = rs.getString("tipo");

				Utente u = new Utente(idUtente, email, username, password, nazionalita, img, tipo);
				listaUtenti.add(u);
			}

			ConnessioneDB.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return listaUtenti;

	}
	
	//////////////7metdo che mi recupera un utente tramite l email/////////////////
	public static Utente recuperaUtentePerEmail(String email) {
	    Utente u = null;
	    try {
	        ConnessioneDB.connect();
	        String query = "SELECT * FROM appmusica.utente WHERE email=?";
	        PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
	        ps.setString(1, email);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            int idUtente = rs.getInt("idUtente");
	            String username = rs.getString("username");
	            String password = rs.getString("password");
	            String nazionalita = rs.getString("nazionalita");
	            String img = rs.getString("img");
	            String tipo = rs.getString("tipo");

	            u = new Utente(idUtente, email, username, password, nazionalita, img, tipo);
	        }

	        ConnessioneDB.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return u;
	}

	
//////////////7metdo che mi recupera un utente tramite ld/////////////////
public static Utente recuperaUtentePerId(int id) {
Utente u = null;
try {
  ConnessioneDB.connect();
  String query = "SELECT * FROM appmusica.utente WHERE idUtente=?";
  PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
  ps.setInt(1, id);
  ResultSet rs = ps.executeQuery();

  while (rs.next()) {
      int idUtente = rs.getInt("idUtente");
      String username = rs.getString("username");
      String password = rs.getString("password");
      String nazionalita = rs.getString("nazionalita");
      String img = rs.getString("img");
      String tipo = rs.getString("tipo");
      String email=rs.getString("email");

      u = new Utente(idUtente, email, username, password, nazionalita, img, tipo);
  }

  ConnessioneDB.close();
} catch (SQLException e) {
  e.printStackTrace();
}

return u;
}
	
	
	
	
	
	
	
	
	

}

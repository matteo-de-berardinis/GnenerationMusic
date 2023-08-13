package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.ConnessioneDB;
import model.Artista;

import model.Utente;

public class artistiDAO {

	public static boolean inserisciArtista(Utente u, Artista a) {
		boolean righeAggiornate = false;
		try {
			ConnessioneDB.connect();
			String query = "SELECT idUtente FROM utente WHERE email=?";
			PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
			ps.setString(1, u.getEmail());
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("idUtente");

				String query2 = "INSERT INTO `appmusica`.`artista` (`nome_artista`, `genere`, `anno_nascita`, `idUtente`) VALUES (?,?,?,?)";
				PreparedStatement ps2 = ConnessioneDB.getCon().prepareStatement(query2);
				ps2.setString(1, a.getNomeArtista());
				ps2.setString(2, a.getGenere());
				ps2.setString(3, a.getAnnoNascita());
				ps2.setInt(4, id);

				int righeInserite = ps2.executeUpdate();
				if (righeInserite > 0) {
					righeAggiornate = true;
				}

				ps2.close();
			}

			rs.close();
			ps.close();
			ConnessioneDB.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return righeAggiornate;
	}

	//////////// metodo per recuperare lista
	//////////// artisti//////////////////////////////////////////////////////////////////////////////////////////
	public static List<Artista> recuperLista() {
		List<Artista> listaArtisti = new ArrayList<Artista>();
		try {
			ConnessioneDB.connect();
			String query = "SELECT * FROM appmusica.artista;";
			PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				int idArtista = rs.getInt("idArtista");
				String nomeArtista = rs.getString("nome_artista");
				int eta = rs.getInt("eta");
				String genere = rs.getString("genere");
				String AnnoNascita = rs.getString("anno_nascita");
				double prezzo = rs.getDouble("prezzo");
				int idUtente = rs.getInt("idUtente");

				String bio = rs.getString("bio");

				String query2 = "SELECT username,nazionalita,img FROM appmusica.utente where idUtente= ?";
				ps = ConnessioneDB.getCon().prepareStatement(query2);
				PreparedStatement ps2 = ConnessioneDB.getCon().prepareStatement(query2);
				ps2.setInt(1, idUtente);
				ResultSet rs2 = ps2.executeQuery();
				while (rs2.next()) {
					String username = rs2.getString("username");
					String nazionalita = rs2.getString("nazionalita");
					String img = rs2.getString("img");
					Artista a = new Artista(username, nazionalita, img, idArtista, nomeArtista, eta, genere,
							AnnoNascita, prezzo, idUtente, bio);
					listaArtisti.add(a);
				}

			}

			ConnessioneDB.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return listaArtisti;

	}

	/////////////////////////////// metodo che mi recupera un artista tramite l id
	/////////////////////////////// dell utente
	/////////////////////////////// ///////////////////////////////////////////////

	public static Artista recuperaArtistaTramiteID(Utente u) {
		Artista a = null;
		try {
			ConnessioneDB.connect();
			String query = "SELECT * FROM appmusica.artista where idUtente =?";
			PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
			ps.setInt(1, u.getIdUtente());
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				int idArtista = rs.getInt("idArtista");
				String nomeArtista = rs.getString("nome_artista");
				String genere = rs.getString("genere");
				String annoNascita = rs.getString("anno_nascita");
				int idUtente = rs.getInt("idUtente");
				String bio = rs.getString("bio");

				a = new Artista(u.getIdUtente(), u.getEmail(), u.getNickname(), u.getPassword(), u.getNazionalita(),
						u.getImg(), u.getTipo(), idArtista, nomeArtista, genere, annoNascita, idUtente, bio);

			}

			ConnessioneDB.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return a;

	}

///////////////////////////////metodo che mi recupera un artista tramite l id int ///////////////////////////////////////////////

	public static Artista recuperaArtistaTramiteIDint(int id) {
		Artista a = null;
		try {
			ConnessioneDB.connect();
			String query = "SELECT * FROM appmusica.artista WHERE idArtista = ?";
			PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				int idArtista = rs.getInt("idArtista");
				String nomeArtista = rs.getString("nome_artista");
				String genere = rs.getString("genere");
				String annoNascita = rs.getString("anno_nascita");
				int idUtente = rs.getInt("idUtente");
				String bio = rs.getString("bio");

				a = new Artista(idArtista, nomeArtista, genere, annoNascita, idUtente, bio);
			}

			rs.close();
			ps.close();
			ConnessioneDB.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return a;
	}

//////////////////////////////////metodo che mi fa modificare dati artista //////////////////////////////////////

	public static void modificaArtista(String username, String nomeArte, String genere, String email, String password,
			Artista a) {

		try {
			ConnessioneDB.connect();

			String query1 = "UPDATE appmusica.utente SET username = ?, password = ?, email = ? WHERE idUtente = ?;";
			PreparedStatement ps1 = ConnessioneDB.getCon().prepareStatement(query1);
			ps1.setString(1, username);
			ps1.setString(2, password);
			ps1.setString(3, email);
			ps1.setInt(4, a.getIdUtente());
			ps1.executeUpdate();
			ps1.close();

			String query2 = "UPDATE appmusica.artista SET nome_artista = ?, genere = ? WHERE idArtista = ?;";
			PreparedStatement ps2 = ConnessioneDB.getCon().prepareStatement(query2);
			ps2.setString(1, nomeArte);
			ps2.setString(2, genere);
			ps2.setInt(3, a.getId());
			ps2.executeUpdate();
			ps2.close();

			ConnessioneDB.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
////////////////metodo per trovare l artista con tutti i dati tramite id dell artista  ////////////
	
	
	public static Artista recuperaArtistaDefinitivo(int id) {
	    Artista a = null;
	    Utente u = null;

	    try {
	        ConnessioneDB.connect();
	        String queryArtista = "SELECT * FROM appmusica.artista WHERE idArtista=?";
	        PreparedStatement psArtista = ConnessioneDB.getCon().prepareStatement(queryArtista);
	        psArtista.setInt(1, id);
	        ResultSet rsArtista = psArtista.executeQuery();

	        if (rsArtista.next()) {
	            int idArtista = rsArtista.getInt("idArtista");
	            String nomeArtista = rsArtista.getString("nome_artista");
	            String genere = rsArtista.getString("genere");
	            String annoNascita = rsArtista.getString("anno_nascita");
	            int idUtenteArtista = rsArtista.getInt("idUtente");
	            String bio = rsArtista.getString("bio");

	            String queryUtente = "SELECT * FROM appmusica.utente WHERE idUtente=?";
	            PreparedStatement psUtente = ConnessioneDB.getCon().prepareStatement(queryUtente);
	            psUtente.setInt(1, idUtenteArtista);
	            ResultSet rsUtente = psUtente.executeQuery();

	            if (rsUtente.next()) {
	                int idUtente = rsUtente.getInt("idUtente");
	                String username = rsUtente.getString("username");
	                String password = rsUtente.getString("password");
	                String nazionalita = rsUtente.getString("nazionalita");
	                String img = rsUtente.getString("img");
	                String email = rsUtente.getString("email");
	                String tipo = rsUtente.getString("tipo");

	                u = new Utente(idUtente, email, username, password, nazionalita, img, tipo);

	                a = new Artista(idUtenteArtista, u.getEmail(), u.getNickname(), u.getPassword(), u.getNazionalita(),
	                        u.getImg(), u.getTipo(), idArtista, nomeArtista, genere, annoNascita, idUtenteArtista, bio);
	            }
	        }

	        ConnessioneDB.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return a;
	}
}

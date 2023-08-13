package DAO;

import model.Artista;
import model.Band;
import model.Utente;
import data.ConnessioneDB;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class bandDAO {

	public static boolean inserisciBand(Utente u, Band b) {
		boolean righeAggiornate = false;
		try {
			ConnessioneDB.connect();
			String query = "SELECT idUtente FROM utente WHERE email=?";
			PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
			ps.setString(1, u.getEmail());
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("idUtente");

				String query2 = "INSERT INTO `appmusica`.`band` (`nome_band`, `genere`, `anno_fondazione`,`idUtente`) VALUES (?, ?,?,?)";
				PreparedStatement ps2 = ConnessioneDB.getCon().prepareStatement(query2);
				ps2.setString(1, b.getBand());
				ps2.setString(2, b.getGenere());
				ps2.setString(3, b.getAnnoFondazione());
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

	/////////////// 7metodo per ottenere lista di band nel db
	/////////////// ///////////////////////////////////////////////////////////////////////

	public static List<Band> recuperLista() {
		List<Band> listaBand = new ArrayList<Band>();
		try {
			ConnessioneDB.connect();
			String query = "SELECT * FROM appmusica.band;";
			PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				int idBand = rs.getInt("idBand");
				String nomeBand = rs.getString("nome_band");
				String genere = rs.getString("genere");
				String AnnoFondazione = rs.getString("anno_fondazione");
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
					Band b = new Band(username, nazionalita, img, idBand, nomeBand, genere, AnnoFondazione, prezzo,
							idUtente, bio);
					listaBand.add(b);
				}

			}

			ConnessioneDB.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return listaBand;

	}

	//////////////////////////// metodo per ecuperare band tramite l id
	//////////////////////////// //////////////////////////////////////

	public static Band recuperaBandTramiteID(Utente u) {
		Band b = null;
		try {
			ConnessioneDB.connect();
			String query = "SELECT * FROM appmusica.band where idUtente =?";
			PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
			ps.setInt(1, u.getIdUtente());
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				int idBand = rs.getInt("idBand");
				String nomeBand = rs.getString("nome_band");
				String genere = rs.getString("genere");
				String annoFondazione = rs.getString("anno_fondazione");
				int idUtente = rs.getInt("idUtente");
				String bio = rs.getString("bio");

				b = new Band(u.getIdUtente(), u.getEmail(), u.getNickname(), u.getPassword(), u.getNazionalita(),
						u.getImg(), u.getTipo(), idBand, nomeBand, genere, annoFondazione, idUtente, bio);

			}

			ConnessioneDB.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return b;
	}

/////////////7metodo che recupera band tramite l id int ////////////////

	public static Band recuperaBandTramiteIDint(int id) throws SQLException {
		Band b = null;
		try {
			ConnessioneDB.connect();
			String query = "SELECT * FROM appmusica.band WHERE idBand = ?";
			PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				int bandId = rs.getInt("idBand");
				String nomeBand = rs.getString("nome_band");
				String genere = rs.getString("genere");
				String annoFondazione = rs.getString("anno_fondazione");
				int idUtente = rs.getInt("idUtente");
				String bio = rs.getString("bio");

				b = new Band(nomeBand, bandId, genere, annoFondazione, idUtente, bio);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			// Gestisci l'eccezione in modo appropriato
			// throw new RuntimeException("Errore durante l'esecuzione della query.", e);
		} finally {
			// Chiudi le risorse nel blocco finally
			ConnessioneDB.close();
		}
		return b;
	}

	///////////////////////// 7metodo che modifica band
	///////////////////////// //////////////////////////////////
	public static void modificaBand(String username, String nomeBand, String genere, String email, String password,
			Band b, Utente u) {

		try {
			ConnessioneDB.connect();

			String query1 = "UPDATE appmusica.utente SET username = ?, password = ?, email = ? WHERE idUtente = ?;";
			PreparedStatement ps1 = ConnessioneDB.getCon().prepareStatement(query1);
			ps1.setString(1, username);
			ps1.setString(2, password);
			ps1.setString(3, email);
			ps1.setInt(4, u.getIdUtente());
			ps1.executeUpdate();
			ps1.close();

			String query2 = "UPDATE appmusica.band SET nome_band = ?, genere = ? WHERE idBand = ?;";
			PreparedStatement ps2 = ConnessioneDB.getCon().prepareStatement(query2);
			ps2.setString(1, nomeBand);
			ps2.setString(2, genere);
			ps2.setInt(3, b.getIdBand());
			ps2.executeUpdate();
			ps2.close();

			ConnessioneDB.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

////////////////metodo per trovare la band  con tutti i dati tramite id dell artista  ////////////

	public static Band recuperaBandDefinitiva(int id) {
	    Band b = null;
	    Utente u = null;

	    try {
	        ConnessioneDB.connect();
	        String queryBand = "SELECT * FROM appmusica.band WHERE idBand=?";
	        PreparedStatement psBand = ConnessioneDB.getCon().prepareStatement(queryBand);
	        psBand.setInt(1, id);
	        ResultSet rsBand = psBand.executeQuery();

	        if (rsBand.next()) {
	            int bandId = rsBand.getInt("idBand");
	            String nomeBand = rsBand.getString("nome_band");
	            String genere = rsBand.getString("genere");
	            String annoFondazione = rsBand.getString("anno_fondazione");
	            int idUtenteBand = rsBand.getInt("idUtente");
	            String bio = rsBand.getString("bio");

	            String queryUtente = "SELECT * FROM appmusica.utente WHERE idUtente=?";
	            PreparedStatement psUtente = ConnessioneDB.getCon().prepareStatement(queryUtente);
	            psUtente.setInt(1, idUtenteBand);
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

	                b = new Band(u.getIdUtente(), u.getEmail(), u.getNickname(), u.getPassword(), u.getNazionalita(),
	                        u.getImg(), u.getTipo(), bandId, nomeBand, genere, annoFondazione, idUtenteBand, bio);
	            }
	        }

	        ConnessioneDB.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return b;
	}


}

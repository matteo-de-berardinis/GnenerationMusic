package DAO;

import model.Artista;
import model.Cliente;
import model.Utente;
import data.ConnessioneDB;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ClienteDAO {
	public static boolean inserisciArtista(Utente u, Cliente c) {
		boolean righeAggiornate = false;
		try {
			ConnessioneDB.connect();
			String query = "SELECT idUtente FROM utente WHERE email=?";
			PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
			ps.setString(1, u.getEmail());
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("idUtente");

				String quary2 = "INSERT INTO `appmusica`.`cliente` (`nome`, `cognome`, `anno_nascita`,`idUtente`) VALUES (?,?,?,?);";
				PreparedStatement ps2 = ConnessioneDB.getCon().prepareStatement(quary2);
				ps2.setString(1, c.getNome());
				ps2.setString(2, c.getCognome());
				ps2.setString(3, c.getAnnoNascita());
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

///////////////////////////////metodo che mi recupera un cliente  tramite l id ///////////////////////////////////////////////

	public static Cliente recuperaClienteTramiteID(Utente u) {
		Cliente  c = null;
		try {
			ConnessioneDB.connect();
			String query = "SELECT * FROM appmusica.cliente where idUtente =?";
			PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
			ps.setInt(1, u.getIdUtente());
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				int idCliente = rs.getInt("idCliente");
				String nome= rs.getString("nome");
				String cognome = rs.getString("cognome");
				String annoNascita = rs.getString("anno_nascita");
				int idUtente = rs.getInt("idUtente");
				String bio = rs.getString("bio");

				c = new Cliente(u.getIdUtente(), u.getEmail(), u.getNickname(), u.getPassword(), u.getNazionalita(),
						u.getImg(), u.getTipo(), idCliente, nome, cognome, annoNascita, idUtente, bio);

			}

			ConnessioneDB.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return c;

	}
	
	
	////////////////metodo che mi m odifica dati cliente/////////////////////////////////
	
	public static void modificaCliente(String username, String nome, String cognome, String email, String password,
			Cliente c,Utente u) {

		try {
			ConnessioneDB.connect();

			String query1 = "UPDATE appmusica.utente SET username = ?, password = ?, email = ? WHERE idUtente = ?;";
			PreparedStatement ps1 = ConnessioneDB.getCon().prepareStatement(query1);
			ps1.setString(1, username);
			ps1.setString(2, password);
			ps1.setString(3, email);
			ps1.setInt(4, u.getIdUtente());
			System.out.println("Cliente id = " + c.getIdCliente());
			
			int righeAggiornate = ps1.executeUpdate();
			System.out.println("Righe aggiornate = " + righeAggiornate);
			ps1.close();

			String query2 = "UPDATE appmusica.cliente SET nome = ?, cognome = ? WHERE idCliente = ?;";
			PreparedStatement ps2 = ConnessioneDB.getCon().prepareStatement(query2);
			ps2.setString(1, nome);
			ps2.setString(2, cognome);
			ps2.setInt(3, c.getIdCliente());
			ps2.executeUpdate();
			int righeAggiornate2 = ps2.executeUpdate();
			System.out.println("Righe aggiornate = " + righeAggiornate2);
			ps2.close();

			ConnessioneDB.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}

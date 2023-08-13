package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.ConnessioneDB;
import model.Artista;
import model.CommentiArtista;
import model.GiorniDisp;
import model.Utente;

public class CommentiArtistiDAO {
	
	public static List<CommentiArtista> listaGiorniDiUnArtista(Artista a) {
	    List<CommentiArtista> lista = new ArrayList<CommentiArtista>();
	    try {
	        ConnessioneDB.connect();
	        String query = "SELECT testo, valutazione, idUtente FROM appmusica.commenti_artista WHERE idArtista = ?";
	        PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
	        ps.setInt(1, a.getId());
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            String testo = rs.getString("testo");
	            int valutazione = rs.getInt("valutazione");
	            int idUtente = rs.getInt("idUtente");

	            String query2 = "SELECT username FROM appmusica.utente WHERE idUtente = ?";
	            PreparedStatement ps2 = ConnessioneDB.getCon().prepareStatement(query2);
	            ps2.setInt(1, idUtente);
	            ResultSet rs2 = ps2.executeQuery();
	            while (rs2.next()) {
	                String username = rs2.getString("username");
	                CommentiArtista c = new CommentiArtista(testo, valutazione, username);
	                lista.add(c);
	            }
	            rs2.close();
	            ps2.close();
	        }

	        rs.close();
	        ps.close();
	        ConnessioneDB.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return lista;
	}
 
	//////////////////////////7metodo che mi fa inserire i commenti //////////////////////////////////////////
	public static void inserisciCommentiArtista(Artista a, CommentiArtista c,Utente u) {
		try {
			ConnessioneDB.connect();
			String query = "INSERT INTO `appmusica`.`commenti_artista` (`idUtente`, `testo`, `idArtista`, `valutazione`) VALUES (?,?,?,?);";
			PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
			ps.setInt(1, u.getIdUtente());
			ps.setString(2, c.getTesto());
			ps.setInt(3, a.getId());
			ps.setInt(4, c.getValutazione());
			ps.executeUpdate();

			ps.close();
			ConnessioneDB.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	
	
	///media 
		public static int mediaValutazioneArtista(int idArtista) {
		    int media = 0;
		    
		    try {
		        ConnessioneDB.connect();
		        String query = "SELECT AVG(valutazione) AS media_valutazione FROM appmusica.commenti_artista WHERE idArtista = ?";
		        PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
		        ps.setInt(1, idArtista);
		        ResultSet rs = ps.executeQuery();

		        if (rs.next()) {
		            media = rs.getInt("media_valutazione");
		        }

		        rs.close();
		        ps.close();
		        ConnessioneDB.close();
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }

		    return media;
		}
	
	
	
	
}

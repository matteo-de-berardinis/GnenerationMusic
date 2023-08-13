package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.ConnessioneDB;
import model.Artista;
import model.Band;
import model.CommentiArtista;
import model.CommentiBand;
import model.Utente;

public class CommentiBandDAO {
    public static List<CommentiBand> listaGiorniDiUnABand(Band b) throws SQLException {
        List<CommentiBand> lista = new ArrayList<>();
        try {
            ConnessioneDB.connect();
            String query = "SELECT testo, valutazione, idUtente FROM appmusica.commenti_band WHERE idBand = ?";
            PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
            ps.setInt(1, b.getIdBand());
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String testo = rs.getString("testo");
                int valutazione = rs.getInt("valutazione");
                int idUtente = rs.getInt("idUtente");

                String query2 = "SELECT username FROM appmusica.utente WHERE idUtente = ?";
                PreparedStatement ps2 = ConnessioneDB.getCon().prepareStatement(query2);
                ps2.setInt(1, idUtente);
                ResultSet rs2 = ps2.executeQuery();
                if (rs2.next()) {
                    String username = rs2.getString("username");
                    CommentiBand c = new CommentiBand(testo, valutazione, username);
                    lista.add(c);
                }
                rs2.close();
                ps2.close();
            }

        } catch (SQLException e) {
            e.printStackTrace();
            // Gestisci l'eccezione in modo appropriato
            // throw new RuntimeException("Errore durante l'esecuzione della query.", e);
        } finally {
            // Chiudi le risorse nel blocco finally
            ConnessioneDB.close();
        }

        return lista;
    }

    public static void inserisciCommentiBand(Band b, CommentiBand c, Utente u) throws SQLException {
        try {
            ConnessioneDB.connect();
            String query = "INSERT INTO `appmusica`.`commenti_band` (`idUtente`, `testo`, `idBand`, `valutazione`) VALUES (?,?,?,?);";
            PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
            ps.setInt(1, u.getIdUtente());
            ps.setString(2, c.getTesto());
            ps.setInt(3, b.getIdBand());
            ps.setInt(4, c.getValutazione());
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            // Gestisci l'eccezione in modo appropriato
            // throw new RuntimeException("Errore durante l'esecuzione della query.", e);
        } finally {
            // Chiudi le risorse nel blocco finally
            ConnessioneDB.close();
        }
    }
    
  ///media 
  	public static int mediaValutazioneBand(int idBand) {
  	    int media = 0;
  	    
  	    try {
  	        ConnessioneDB.connect();
  	        String query = "SELECT AVG(valutazione) AS media_valutazione FROM appmusica.commenti_band WHERE idBand = ?";
  	        PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
  	        ps.setInt(1, idBand);
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


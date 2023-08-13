package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.ConnessioneDB;
import model.CommentoLocale;
import model.Locale;
import model.Utente;

public class CommentiLocaleDAO {
	public static List<CommentoLocale> listaCommentiLocale(Locale l) {
	    List<CommentoLocale> lista = new ArrayList<CommentoLocale>();
	    try {
	        ConnessioneDB.connect();
	        String query = "SELECT testo, valutazione, idUtente FROM appmusica.commenti_locale WHERE idLocale = ?";
	        PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
	        ps.setInt(1, l.getId());
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
	                CommentoLocale c = new CommentoLocale(testo, valutazione, username);
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
public static void inserisciCommentiLocale(Locale l, CommentoLocale c,Utente u) {
try {
ConnessioneDB.connect();
String query = "INSERT INTO `appmusica`.`commenti_locale` (`idUtente`, `testo`, `idLocale`, `valutazione`) VALUES (?,?,?,?);";
PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
ps.setInt(1, u.getIdUtente());
ps.setString(2, c.getTesto());
ps.setInt(3, l.getId());
ps.setInt(4, c.getValutazione());
ps.executeUpdate();

ps.close();
ConnessioneDB.close();
} catch (SQLException e) {
e.printStackTrace();
}
}


///media 
	public static int mediaValutazioneLocale(int idLocale) {
	    int media = 0;
	    
	    try {
	        ConnessioneDB.connect();
	        String query = "SELECT AVG(valutazione) AS media_valutazione FROM appmusica.commenti_locale WHERE idLocale = ?";
	        PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
	        ps.setInt(1, idLocale);
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

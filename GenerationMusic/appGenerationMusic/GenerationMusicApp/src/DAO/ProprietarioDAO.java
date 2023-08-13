package DAO;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import data.ConnessioneDB;
import model.Artista;
import model.Proprietario;
import model.Utente;

public class ProprietarioDAO {
    public static boolean inserisciProprietario(Utente u, Proprietario p) {
        boolean righeAggiornate = false;
        try {
            ConnessioneDB.connect();
            String query = "SELECT idUtente FROM utente WHERE email=?";
            PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
            ps.setString(1, u.getEmail());
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("idUtente");
                String query2 = "INSERT INTO `appmusica`.`proprietario` (`nome`, `cognome`, `anno_nascita`, `idUtente`) VALUES (?, ?, ?, ?)";
                PreparedStatement ps2 = ConnessioneDB.getCon().prepareStatement(query2);
                ps2.setString(1, p.getNome());
                ps2.setString(2, p.getCognome());
                ps2.setString(3, p.getAnnoNascita());
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
    
    
    ////////////////////////metodo per  recuperare prorpietario tramire id /////////////////////////
    
    
    public static Proprietario recuperaProprietarioTramiteID(Utente u) {
    	Proprietario p =null;
    		try {
    			ConnessioneDB.connect();
    			String query = "SELECT * FROM appmusica.proprietario where idUtente =?";
    			PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
    			ps.setInt(1, u.getIdUtente());
    			ResultSet rs = ps.executeQuery();

    			while (rs.next()) {
    				int idProprietario = rs.getInt("idProprietario");
    				String nome = rs.getString("nome");
    				String cognome= rs.getString("cognome");
    				String annoNascita = rs.getString("anno_nascita");
    				int idUtente = rs.getInt("idUtente");
    				String bio = rs.getString("bio");
    				
    			
    				 p = new Proprietario(u.getIdUtente(), u.getEmail(), u.getNickname(), u.getPassword(), u.getNazionalita(), u.getImg(), u.getTipo()
    						,idProprietario,nome,cognome,annoNascita,idUtente,bio);
    				
    			}

    			ConnessioneDB.close();
    		} catch (SQLException e) {
    			e.printStackTrace();
    		}
    		return p;

    		

    	}
    
    
    
//////////////////////////////////metodo che mi fa modificare dati proprietario //////////////////////////////////////

public static void modificaProprietario(String username, String nome, String cognome, String email, String password,
Proprietario p,Utente u) {

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

String query2 = "UPDATE appmusica.proprietario SET nome = ?, cognome = ? WHERE idProprietario = ?;";
PreparedStatement ps2 = ConnessioneDB.getCon().prepareStatement(query2);
ps2.setString(1, nome);
ps2.setString(2, cognome);
ps2.setInt(3, p.getId());
ps2.executeUpdate();
ps2.close();

ConnessioneDB.close();
} catch (SQLException e) {
e.printStackTrace();
}
}

    
    
    
    
    
    
    
    
    
    
    
    
}

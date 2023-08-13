package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.ConnessioneDB;
import model.Prenotazione;
import model.Utente;

public class prenotazioneDAO {
    public static boolean inserisciPrenotazioneArtista(Prenotazione p) {
        boolean righeAggiornate = false;
        try {
            ConnessioneDB.connect();
            String query = "INSERT INTO `appmusica`.`prenotazione` (`data_prenotazione`, `idUtente`, `idArtista`, `richiesta`) VALUES (?,?,?,?);";
            PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
            ps.setString(1, p.getData());
            ps.setInt(2, p.getIdUtente());
            ps.setInt(3, p.getIdPrenotato());
            ps.setString(4, p.getCommento());
            
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
    
    
    ///////////////////prenotazione band //////////////////////////////
   
        public static boolean inserisciPrenotazioneBand(Prenotazione p) {
            boolean righeAggiornate = false;
            try {
                ConnessioneDB.connect();
                String query = "INSERT INTO `appmusica`.`prenotazione` (`data_prenotazione`, `idUtente`, `idBand`, `richiesta`) VALUES (?,?,?,?);";
                PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
                ps.setString(1, p.getData());
                ps.setInt(2, p.getIdUtente());
                ps.setInt(3, p.getIdPrenotato());
                ps.setString(4, p.getCommento());
                
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
    
        ///////////////////prenotazione locale //////////////////////////////
        
        public static boolean inserisciPrenotazioneLocale(Prenotazione p) {
            boolean righeAggiornate = false;
            try {
                ConnessioneDB.connect();
                String query = "INSERT INTO `appmusica`.`prenotazione` (`data_prenotazione`, `idUtente`, `idLocale`, `richiesta`) VALUES (?,?,?,?);";
                PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
                ps.setString(1, p.getData());
                ps.setInt(2, p.getIdUtente());
                ps.setInt(3, p.getIdPrenotato());
                ps.setString(4, p.getCommento());
                
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
    
    
     // Selezione delle prenotazioni cliente
        public static List<Prenotazione> ottieniListaPrenotazione(int id) {
            List<Prenotazione> prenotazioni = new ArrayList<>();
            try {
                ConnessioneDB.connect();
                String query = "SELECT * FROM appmusica.prenotazione WHERE idUtente=?";
                PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
                ps.setInt(1, id);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    int idPrenotazione = rs.getInt("idPrenotazione");
                    int idUtente = rs.getInt("idUtente");
                    String data = rs.getString("data_prenotazione");
                    int idArtista = rs.getInt("idArtista");
                    int idLocale = rs.getInt("idLocale");
                    int idBand = rs.getInt("idBand");
                    String commento = rs.getString("richiesta");

                    Prenotazione prenotazione = new Prenotazione(idPrenotazione, idUtente, idArtista, idBand, idLocale, data, commento);
                    prenotazioni.add(prenotazione);
                }

                ConnessioneDB.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }

            return prenotazioni;
        }

        // Selezione delle prenotazioni artista
        public static List<Prenotazione> ottieniListaPrenotazioneArtista(int id) {
            List<Prenotazione> prenotazioni = new ArrayList<>();
            try {
                ConnessioneDB.connect();
                String query = "SELECT * FROM appmusica.prenotazione WHERE idArtista=?";
                PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
                ps.setInt(1, id);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    int idPrenotazione = rs.getInt("idPrenotazione");
                    int idUtente = rs.getInt("idUtente");
                    String data = rs.getString("data_prenotazione");
                    int idArtista = rs.getInt("idArtista");
                    int idLocale = rs.getInt("idLocale");
                    int idBand = rs.getInt("idBand");
                    String commento = rs.getString("richiesta");

                    Prenotazione prenotazione = new Prenotazione(idPrenotazione, idUtente, idArtista, idBand, idLocale, data, commento);
                    prenotazioni.add(prenotazione);
                }

                ConnessioneDB.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }

            return prenotazioni;
        }

        // Selezione delle prenotazioni band
        public static List<Prenotazione> ottieniListaPrenotazioneBand(int id) {
            List<Prenotazione> prenotazioni = new ArrayList<>();
            try {
                ConnessioneDB.connect();
                String query = "SELECT * FROM appmusica.prenotazione WHERE idBand=?";
                PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
                ps.setInt(1, id);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    int idPrenotazione = rs.getInt("idPrenotazione");
                    int idUtente = rs.getInt("idUtente");
                    String data = rs.getString("data_prenotazione");
                    int idArtista = rs.getInt("idArtista");
                    int idLocale = rs.getInt("idLocale");
                    int idBand = rs.getInt("idBand");
                    String commento = rs.getString("richiesta");

                    Prenotazione prenotazione = new Prenotazione(idPrenotazione, idUtente, idArtista, idBand, idLocale, data, commento);
                    prenotazioni.add(prenotazione);
                }

                ConnessioneDB.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }

            return prenotazioni;
        }

        // Selezione delle prenotazioni locale
        public static List<Prenotazione> ottieniListaPrenotazioneLocale(int id) {
            List<Prenotazione> prenotazioni = new ArrayList<>();
            try {
                ConnessioneDB.connect();
                String query = "SELECT * FROM appmusica.prenotazione WHERE idLocale=?";
                PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
                ps.setInt(1, id);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    int idPrenotazione = rs.getInt("idPrenotazione");
                    int idUtente = rs.getInt("idUtente");
                    String data = rs.getString("data_prenotazione");
                    int idArtista = rs.getInt("idArtista");
                    int idLocale = rs.getInt("idLocale");
                    int idBand = rs.getInt("idBand");
                    String commento = rs.getString("richiesta");

                    Prenotazione prenotazione = new Prenotazione(idPrenotazione, idUtente, idArtista, idBand, idLocale, data, commento);
                    prenotazioni.add(prenotazione);
                }

                ConnessioneDB.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }

            return prenotazioni;
        }

        
        public static void cancellaPrenotazione(int idPrenotazione) {
            try {
                ConnessioneDB.connect();
                String query = "DELETE FROM `appmusica`.`prenotazione` WHERE (`idPrenotazione` = ?)";
                PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
                ps.setInt(1, idPrenotazione);
                int rowsAffected = ps.executeUpdate();

                if (rowsAffected > 0) {
                    System.out.println("Prenotazione eliminata correttamente.");
                } else {
                    System.out.println("Nessuna prenotazione trovata con l'ID specificato.");
                }

                ConnessioneDB.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

}


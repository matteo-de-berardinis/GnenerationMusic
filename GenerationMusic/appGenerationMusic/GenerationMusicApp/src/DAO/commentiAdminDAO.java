package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.ConnessioneDB;
import model.commentiAdmin;

public class commentiAdminDAO {
//////////////////////////7metodo che mi fa inserire i commenti //////////////////////////////////////////
public static void inserisciCommentiAdmin(String nome,String email,String message) {
try {
ConnessioneDB.connect();
String query = "INSERT INTO `appmusica`.`commenti_admin` ( `nomeUtente`, `email`, `commento`) VALUES (?,?,?);";
PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
ps.setString(1, nome);
ps.setString(2, email);
ps.setString(3, message);

ps.executeUpdate();

ps.close();
ConnessioneDB.close();
} catch (SQLException e) {
e.printStackTrace();
}
}
/////////////////////metodo che mi fa tornare la lista 
public static List<commentiAdmin> getCommenti() {
    List<commentiAdmin> commenti = new ArrayList<commentiAdmin>();
    
    try {
        ConnessioneDB.connect();
        String query = "SELECT `nomeUtente`, `email`, `commento` FROM `appmusica`.`commenti_admin`;";
        PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            String nome = rs.getString("nomeUtente");
            String email = rs.getString("email");
            String commento = rs.getString("commento");

            commentiAdmin nuovoCommento = new commentiAdmin(nome, email, commento);
            commenti.add(nuovoCommento);
        }

        rs.close();
        ps.close();
        ConnessioneDB.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
    
    return commenti;
}


}

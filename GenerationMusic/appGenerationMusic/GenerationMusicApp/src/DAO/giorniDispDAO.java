package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.ConnessioneDB;
import model.Artista;
import model.Band;
import model.GiorniDisp;
import model.Locale;

//////////////////////metodo per ecuperare lista di giorni di un artista ////////////////////////////////////////////
public class giorniDispDAO {
	public static List<GiorniDisp> listaGiorniDiUnArtista(Artista a) {
		List<GiorniDisp> lista = new ArrayList<GiorniDisp>();
		try {
			ConnessioneDB.connect();
			String query = "SELECT giorno FROM disponibilita_artista WHERE idArtista = ?";
			PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
			ps.setInt(1, a.getId());
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				String giorno = rs.getString("giorno");
				GiorniDisp g = new GiorniDisp(giorno);
				lista.add(g);
			}

			rs.close();
			ps.close();
			ConnessioneDB.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return lista;
	}

//////////////////////////////////////////////////metodom che mi fa inserire giorni artista  nel db ////////////////////////////////////////////

	public static void inserisciGiorniDispArtista(Artista a, GiorniDisp g) {
		try {
			ConnessioneDB.connect();
			String query = "INSERT INTO disponibilita_artista (giorno, idArtista) VALUES (?, ?)";
			PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
			ps.setString(1, g.getData());
			ps.setInt(2, a.getId());
			ps.executeUpdate();

			ps.close();
			ConnessioneDB.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

//////////////////////metodo per ecuperare lista di giorni di una band////////////////////////////////////////////

	public static List<GiorniDisp> listaGiorniDiUnaBand(Band b) {
		List<GiorniDisp> lista = new ArrayList<GiorniDisp>();
		try {
			ConnessioneDB.connect();
			String query = "SELECT giorno FROM disponibilita_band WHERE idBand = ?";
			PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
			ps.setInt(1, b.getIdBand());
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				String giorno = rs.getString("giorno");
				GiorniDisp g = new GiorniDisp(giorno);
				lista.add(g);
			}

			rs.close();
			ps.close();
			ConnessioneDB.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return lista;
	}

//////////////////////////////////////////////////metodom che mi fa inserire giorni band  nel db ////////////////////////////////////////////

	public static void inserisciGiorniDispBand(Band b, GiorniDisp g) {
		try {
			ConnessioneDB.connect();
			String query = "INSERT INTO disponibilita_band (giorno, idBand) VALUES (?, ?)";
			PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
			ps.setString(1, g.getData());
			ps.setInt(2, b.getIdBand());
			ps.executeUpdate();

			ps.close();
			ConnessioneDB.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	////////////////// metodo che mi fa vedere i giorni disponibili di un locale
	////////////////// ////////////////////////////////
	public static List<GiorniDisp> listaGiorniDiUnLocale(Locale l) {
		List<GiorniDisp> lista = new ArrayList<GiorniDisp>();
		try {
			ConnessioneDB.connect();
			String query = "SELECT giorno FROM disponibilita_locale WHERE idLocale = ?";
			PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
			ps.setInt(1, l.getId());
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				String giorno = rs.getString("giorno");
				GiorniDisp g = new GiorniDisp(giorno);
				lista.add(g);
			}

			rs.close();
			ps.close();
			ConnessioneDB.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return lista;
	}

	public static void inserisciGiorniDispLocale(Locale l, GiorniDisp g) {
		try {
			ConnessioneDB.connect();
			String query = "INSERT INTO disponibilita_locale (giorno, idLocale) VALUES (?, ?)";
			PreparedStatement ps = ConnessioneDB.getCon().prepareStatement(query);
			ps.setString(1, g.getData());
			ps.setInt(2, l.getId());
			ps.executeUpdate();

			ps.close();
			ConnessioneDB.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}

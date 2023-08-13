package model;

import java.util.Objects;

public class Prenotazione {
	private int idPrenotazione;
	private int idUtente;
	private int idArtista;
	private int idBand;
	private int idLocale;
	private int idPrenotato;
	private String data;
	private String commento;
	private Utente utente;

	
	
	
	////costruttore per recuperare una lista di commenti 
	
	public Prenotazione(int idPrenotazione,int idUtente, int idArtista, int idBand, int idLocale, String data, String commento) {
		super();
		this.idPrenotazione=idPrenotazione;
		this.idUtente = idUtente;
		this.idArtista = idArtista;
		this.idBand = idBand;
		this.idLocale = idLocale;
		this.data = data;
		this.commento = commento;
	}
	//////costrutto per creare il commento //////////////
	public Prenotazione(int idUtente, int idPrenotato, String data, String commento) {
		super();
		this.idUtente = idUtente;
		this.idPrenotato = idPrenotato;
		this.data = data;
		this.commento = commento;
	}
	@Override
	public String toString() {
		return "Prenotazione [idUtente=" + idUtente + ", idPrenotato=" + idPrenotato + ", data=" + data + ", commento="
				+ commento + ", utente=" + utente + "]";
	}
	public int getIdUtente() {
		return idUtente;
	}
	public void setIdUtente(int idUtente) {
		this.idUtente = idUtente;
	}
	public int getIdPrenotato() {
		return idPrenotato;
	}
	public void setIdPrenotato(int idPrenotato) {
		this.idPrenotato = idPrenotato;
	}
	public String getCommento() {
		return commento;
	}
	public void setCommento(String commento) {
		this.commento = commento;
	}
	public int getId() {
		return idUtente;
	}
	public void setId(int id) {
		this.idUtente = id;
	}
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	public Utente getUtente() {
		return utente;
	}
	public void setUtente(Utente utente) {
		this.utente = utente;
	}
	public int getIdArtista() {
		return idArtista;
	}
	public void setIdArtista(int idArtista) {
		this.idArtista = idArtista;
	}
	public int getIdBand() {
		return idBand;
	}
	public void setIdBand(int idBand) {
		this.idBand = idBand;
	}
	public int getIdLocale() {
		return idLocale;
	}
	public void setIdLocale(int idLocale) {
		this.idLocale = idLocale;
	}
	public int getIdPrenotazione() {
		return idPrenotazione;
	}
	public void setIdPrenotazione(int idPrenotazione) {
		this.idPrenotazione = idPrenotazione;
	}

	

}

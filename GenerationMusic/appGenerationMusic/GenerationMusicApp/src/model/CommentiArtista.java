package model;

import java.util.Objects;

public class CommentiArtista {
 private int idCommento;
	private String testo;
private Utente utente;
	private int valutazione ;
	String nickname;

/////////////costruttore per ottenere una lista di commenti///////////////////7
	public CommentiArtista(String testo, int valutazione, String nockname) {
		super();
		this.testo = testo;
		this.valutazione = valutazione;
		this.nickname=nockname;
	}
	///////////////////////7costruttore per inserire un commento 
	
	
	public CommentiArtista(String testo, int valutazione) {
		super();
		this.testo = testo;
		this.valutazione = valutazione;
	}
	public String getTesto() {
		return testo;
	}
	public void setTesto(String testo) {
		this.testo = testo;
	}
	

	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public Utente getUtente() {
		return utente;
	}

	public void setUtente(Utente utente) {
		this.utente = utente;
	}

	public int getIdCommento() {
		return idCommento;
	}
	public void setIdCommento(int idCommento) {
		this.idCommento = idCommento;
	}
	public int getValutazione() {
		return valutazione;
	}
	public void setValutazione(int valutazione) {
		this.valutazione = valutazione;
	}
	
	
}

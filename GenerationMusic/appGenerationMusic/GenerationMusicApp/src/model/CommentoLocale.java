package model;

import java.util.Objects;

public class CommentoLocale {
	private int idCommento;
	private String testo;
	private Cliente cliente;
	private Artista artista;
	private int valutazione;
	String username;

	////// costruttore per avere una lista di commenti

	public CommentoLocale(String testo, int valutazione, String username) {
		super();
		this.testo = testo;
		this.valutazione = valutazione;
		this.username = username;
	}

	////// costruttore per inserire commento
	public CommentoLocale(String testo, int valutazione) {
		super();
		this.testo = testo;
		this.valutazione = valutazione;
	}

	public CommentoLocale(String testo, Artista artista) {
		super();
		this.testo = testo;
		this.artista = artista;
	}

	public CommentoLocale(String testo, Cliente cliente) {
		super();
		this.testo = testo;
		this.cliente = cliente;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
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

	public String getTesto() {
		return testo;
	}

	public void setTesto(String testo) {
		this.testo = testo;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public Artista getArtista() {
		return artista;
	}

	public void setArtista(Artista artista) {
		this.artista = artista;
	}

	@Override
	public int hashCode() {
		return Objects.hash(artista, cliente, testo);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CommentoLocale other = (CommentoLocale) obj;
		return Objects.equals(artista, other.artista) && Objects.equals(cliente, other.cliente)
				&& Objects.equals(testo, other.testo);
	}

	@Override
	public String toString() {
		return "CommentoLocale [testo=" + testo + ", cliente=" + cliente + ", artista=" + artista + "]";
	}

}

package model;

import java.util.Objects;

public class CommentiBand {
	private int idCommento;
	private String testo;
	private Cliente cliente;
	private Proprietario proprietario ;
	private int valutazione;
	String username;
	
	
	/////////costruttore per inserire commenti
	
	public CommentiBand(String testo, int valutazione) {
		super();
		this.testo = testo;
		this.valutazione = valutazione;
	}

	
	
	
	
	
	//////////7costruttore per lista di commenti 
	public CommentiBand(String testo, int valutazione, String username) {
		super();
		this.testo = testo;
		this.valutazione = valutazione;
		this.username = username;
	}
	
	
	
	


	public CommentiBand(String testo, Proprietario proprietario) {
		super();
		this.testo = testo;
		this.proprietario = proprietario;
	}
	
	public CommentiBand(String testo, Cliente cliente) {
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
	public Proprietario getProprietario() {
		return proprietario;
	}
	public void setProprietario(Proprietario proprietario) {
		this.proprietario = proprietario;
	}
	@Override
	public int hashCode() {
		return Objects.hash(cliente, proprietario, testo);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CommentiBand other = (CommentiBand) obj;
		return Objects.equals(cliente, other.cliente) && Objects.equals(proprietario, other.proprietario)
				&& Objects.equals(testo, other.testo);
	}
	@Override
	public String toString() {
		return "CommentiBand [testo=" + testo + ", cliente=" + cliente + ", proprietario=" + proprietario + "]";
	}
	
	

}

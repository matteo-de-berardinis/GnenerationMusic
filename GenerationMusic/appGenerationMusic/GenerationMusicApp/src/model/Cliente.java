package model;

import java.util.List;
import java.util.Objects;

public class Cliente extends Utente {
	
	
	private int idCliente;
	private String nome;
	private int eta;
	private String annoNascita;
	private String cognome;
	private List <Prenotazione> listaPrenotazioni;
	private int idUtente;
	 private String bio;
	
	
	
	
	
		


	public Cliente(int idUtente, String email, String nickname, String password, String nazionalita, String img,
			String tipo, int idCliente, String nome, String cognome, String annoNascita, int idUtente2, String bio) {
		super(idUtente, email, nickname, password, nazionalita, img, tipo);
		this.idCliente = idCliente;
		this.nome = nome;
		this.cognome = cognome;
		this.annoNascita = annoNascita;
		idUtente = idUtente2;
		this.bio = bio;
	}



	public Cliente(String nickname, String email, String nazionalita, String password, String nome, String annoNascita,
			String cognome, int idUtente) {
		super(nickname, email, nazionalita, password);
		this.nome = nome;
		this.annoNascita = annoNascita;
		this.cognome = cognome;
		this.idUtente = idUtente;
	}



	public Cliente(int idUtente, String email, String nickname, String password, String nazionalita, String citta,
			String img, String genere, boolean dj, int idCliente, String nome, int eta, String annoNascita,
			String cognome, List<Prenotazione> listaPrenotazioni) {
		super(idUtente, email, nickname, password, nazionalita, citta, img, genere, dj);
		this.idCliente = idCliente;
		this.nome = nome;
		this.eta = eta;
		this.annoNascita = annoNascita;
		this.cognome = cognome;
		this.listaPrenotazioni = listaPrenotazioni;
	}



	@Override
	public String toString() {
		return "Cliente [idCliente=" + idCliente + ", nome=" + nome + ", eta=" + eta + ", annoNascita=" + annoNascita
				+ ", cognome=" + cognome + ", listaPrenotazioni=" + listaPrenotazioni + "]";
	}
	
	

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + Objects.hash(annoNascita, cognome, eta, idCliente, listaPrenotazioni, nome);
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!super.equals(obj))
			return false;
		if (getClass() != obj.getClass())
			return false;
		Cliente other = (Cliente) obj;
		return Objects.equals(annoNascita, other.annoNascita) && Objects.equals(cognome, other.cognome)
				&& eta == other.eta && idCliente == other.idCliente
				&& Objects.equals(listaPrenotazioni, other.listaPrenotazioni) && Objects.equals(nome, other.nome);
	}
	
	

	public int getIdUtente() {
		return idUtente;
	}



	public void setIdUtente(int idUtente) {
		this.idUtente = idUtente;
	}



	public int getIdCliente() {
		return idCliente;
	}
	public void setIdCliente(int idCliente) {
		this.idCliente = idCliente;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public int getEta() {
		return eta;
	}
	public void setEta(int eta) {
		this.eta = eta;
	}
	public String getAnnoNascita() {
		return annoNascita;
	}
	public void setAnnoNascita(String annoNascita) {
		this.annoNascita = annoNascita;
	}
	public String getCognome() {
		return cognome;
	}
	public void setCognome(String cognome) {
		this.cognome = cognome;
	}
	public List<Prenotazione> getListaPrenotazioni() {
		return listaPrenotazioni;
	}
	public void setListaPrenotazioni(List<Prenotazione> listaPrenotazioni) {
		this.listaPrenotazioni = listaPrenotazioni;
	}



	public String getBio() {
		return bio;
	}



	public void setBio(String bio) {
		this.bio = bio;
	}
	
	
	
	

}

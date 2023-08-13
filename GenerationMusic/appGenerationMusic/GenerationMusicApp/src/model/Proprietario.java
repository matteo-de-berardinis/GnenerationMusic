package model;

import java.util.List;
import java.util.Objects;

public class Proprietario extends Utente {

	private int id;
	private String nome;
	private String cognome;
	private int eta;
	private String annoNascita;
	private List<Locale> locali;
	private int idUtente;
	private String bio;

	/////////////////////// costuttore per il
	/////////////////////// login//////////////////////////////////

	public Proprietario(int idUtente, String email, String nickname, String password, String nazionalita, String img,
			String tipo, int id, String nome, String cognome, String annoNascita, int idUtente2, String bio) {
		super(idUtente, email, nickname, password, nazionalita, img, tipo);
		this.id = id;
		this.nome = nome;
		this.cognome = cognome;
		this.annoNascita = annoNascita;
		idUtente = idUtente2;
		this.bio = bio;
	}

	public Proprietario(String nickname, String email, String nazionalita, String password, String nome, String cognome,
			String annoNascita, int idUtente) {
		super(nickname, email, nazionalita, password);
		this.nome = nome;
		this.cognome = cognome;
		this.annoNascita = annoNascita;
		this.idUtente = idUtente;
	}

	public Proprietario(int idUtente, String email, String nickname, String password, String nazionalita, String citta,
			String img, String genere, boolean dj, int id, String nome, int eta, String annoNascita,
			List<Locale> locali) {
		super(idUtente, email, nickname, password, nazionalita, citta, img, genere, dj);
		this.id = id;
		this.nome = nome;
		this.eta = eta;
		this.annoNascita = annoNascita;
		this.locali = locali;
	}

	public String getBio() {
		return bio;
	}

	public void setBio(String bio) {
		this.bio = bio;
	}

	public int getIdUtente() {
		return idUtente;
	}

	public void setIdUtente(int idUtente) {
		this.idUtente = idUtente;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public List<Locale> getLocali() {
		return locali;
	}

	public void setLocali(List<Locale> locali) {
		this.locali = locali;
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + Objects.hash(annoNascita, eta, id, locali, nome);
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
		Proprietario other = (Proprietario) obj;
		return Objects.equals(annoNascita, other.annoNascita) && eta == other.eta && id == other.id
				&& Objects.equals(locali, other.locali) && Objects.equals(nome, other.nome);
	}

	@Override
	public String toString() {
		return "Proprietario [id=" + id + ", nome=" + nome + ", eta=" + eta + ", annoNascita=" + annoNascita
				+ ", locali=" + locali + "]";
	}

}

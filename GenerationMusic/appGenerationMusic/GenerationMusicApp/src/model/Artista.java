package model;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class Artista extends Utente {

	private int id;
	private String nomeArtista;
	private int eta;
	private String genere;
	private String annoNascita;
	private double prezzo;
	private List<CommentiArtista> commenti;
	private List<GiorniDisp> giorniDisp;
	private List<Prenotazione> listaPrenotazioni;
	private int utenteId;
	private String bio;

	//// costruttore che mi per,mette di inviare i commenti

	public Artista(int id, String nomeArtista, String genere, String annoNascita, int utenteId, String bio) {
		super();
		this.id = id;
		this.nomeArtista = nomeArtista;
		this.genere = genere;
		this.annoNascita = annoNascita;
		this.utenteId = utenteId;
		this.bio = bio;
	}

	///////////////////// costruttore che mi salva in sessione l artista

	public Artista(int idUtente, String email, String nickname, String password, String nazionalita, String img,
			String tipo, int id, String nomeArtista, String genere, String annoNascita, int utenteId, String bio) {
		super(idUtente, email, nickname, password, nazionalita, img, tipo);
		this.id = id;
		this.nomeArtista = nomeArtista;
		this.genere = genere;
		this.annoNascita = annoNascita;
		this.utenteId = utenteId;
		this.bio = bio;
		this.giorniDisp = new ArrayList<GiorniDisp>();
	}

	public Artista(String nickname, String email, String nazionalita, String password, String nomeArtista,
			String genere, String annoNascita, int utenteId) {
		super(nickname, email, nazionalita, password);
		this.nomeArtista = nomeArtista;
		this.genere = genere;
		this.annoNascita = annoNascita;

	}

	public Artista(String nickname, String nazionalita, String img, int id, String nomeArtista, int eta, String genere,
			String annoNascita, double prezzo, int utenteId, String bio) {
		super(nickname, nazionalita, img);
		this.id = id;
		this.nomeArtista = nomeArtista;
		this.eta = eta;
		this.genere = genere;
		this.annoNascita = annoNascita;
		this.prezzo = prezzo;
		this.utenteId = utenteId;
		this.bio = bio;

	}

	public Artista(int idUtente, String email, String nickname, String password, String nazionalita, String citta,
			String img, String genere, boolean dj, int id, String nomeArtista, int eta, String genere2,
			String annoNascita, double prezzo, List<CommentiArtista> commenti, List<GiorniDisp> giorniDisp,
			List<Prenotazione> listaPrenotazioni) {
		super(idUtente, email, nickname, password, nazionalita, citta, img, genere, dj);
		this.id = id;
		this.nomeArtista = nomeArtista;
		this.eta = eta;
		genere = genere2;
		this.annoNascita = annoNascita;
		this.prezzo = prezzo;
		this.commenti = commenti;
		this.giorniDisp = giorniDisp;
		this.listaPrenotazioni = listaPrenotazioni;
	}

	public Artista(String nickname, String email, String nazionalita, String password, String tipo, String nomeArtista,
			String genere, String annoNascita, int utenteId, int dj) {
		super(nickname, email, nazionalita, password, tipo);
		this.nomeArtista = nomeArtista;
		this.genere = genere;
		this.annoNascita = annoNascita;
		this.utenteId = utenteId;

	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + Objects.hash(annoNascita, commenti, eta, genere, giorniDisp, id, listaPrenotazioni,
				nomeArtista, prezzo);
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
		Artista other = (Artista) obj;
		return Objects.equals(annoNascita, other.annoNascita) && Objects.equals(commenti, other.commenti)
				&& eta == other.eta && Objects.equals(genere, other.genere)
				&& Objects.equals(giorniDisp, other.giorniDisp) && id == other.id
				&& Objects.equals(listaPrenotazioni, other.listaPrenotazioni)
				&& Objects.equals(nomeArtista, other.nomeArtista)
				&& Double.doubleToLongBits(prezzo) == Double.doubleToLongBits(other.prezzo);
	}

	@Override
	public String toString() {
		return "Artista [id=" + id + ", nomeArtista=" + nomeArtista + ", eta=" + eta + ", genere=" + genere
				+ ", annoNascita=" + annoNascita + ", prezzo=" + prezzo + ", commenti=" + commenti + ", giorniDisp="
				+ giorniDisp + ", listaPrenotazioni=" + listaPrenotazioni + "]";
	}

	public int getUtenteId() {
		return utenteId;
	}

	public void setUtenteId(int utenteId) {
		this.utenteId = utenteId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNomeArtista() {
		return nomeArtista;
	}

	public void setNomeArtista(String nomeArtista) {
		this.nomeArtista = nomeArtista;
	}

	public int getEta() {
		return eta;
	}

	public void setEta(int eta) {
		this.eta = eta;
	}

	public String getGenere() {
		return genere;
	}

	public void setGenere(String genere) {
		this.genere = genere;
	}

	public String getAnnoNascita() {
		return annoNascita;
	}

	public void setAnnoNascita(String annoNascita) {
		this.annoNascita = annoNascita;
	}

	public double getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}

	public List<CommentiArtista> getCommenti() {
		return commenti;
	}

	public void setCommenti(List<CommentiArtista> commenti) {
		this.commenti = commenti;
	}

	public List<GiorniDisp> getGiorniDisp() {
		return giorniDisp;
	}

	public void setGiorniDisp(List<GiorniDisp> giorniDisp) {
		this.giorniDisp = giorniDisp;
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

package model;

import java.util.List;
import java.util.Objects;

public class Band extends Utente {

	private String band;
	private int idBand;
	private String genere;
	private String annoFondazione;
	private double prezzo;
	private List<GiorniDisp> giorniDisp;
	private List<CommentiBand> commentiBand;
	private List<Prenotazione> listaPrenotazioni;
	private int idUtente;
	String bio;

	
	//////////costruttore per inserire commenti //////////////////////
	
	
	
	
	public Band(String nickname, String nazionalita, String img, int idBand, String band, String genere,
			String annoFondazione, double prezzo, int idUtente, String bio) {
		super(nickname, nazionalita, img);
		this.idBand = idBand;
		this.band = band;
		this.genere = genere;
		this.annoFondazione = annoFondazione;
		this.prezzo = prezzo;
		this.idUtente = idUtente;
		this.bio = bio;
		this.giorniDisp=null;
	}
	
	public Band(String band, int idBand, String genere, String annoFondazione, int idUtente,
			String bio) {
		super();
		this.band = band;
		this.idBand = idBand;
		this.genere = genere;
		this.annoFondazione = annoFondazione;
		
		this.idUtente = idUtente;
		this.bio = bio;
	}

	public Band(String nickname, String email, String nazionalita, String password, String band, String genere,
			String annoFondazione, int idUtente) {
		super(nickname, email, nazionalita, password);
		this.band = band;
		this.genere = genere;
		this.annoFondazione = annoFondazione;
		this.idUtente = idUtente;
	}

	public Band(int idUtente, String email, String nickname, String password, String nazionalita, String citta,
			String img, boolean dj, String band, int idBand, String genere, String annoFondazione, double prezzo,
			List<GiorniDisp> giorniDisp, List<CommentiBand> commentiBand, List<Prenotazione> listaPrenotazioni) {
		super(idUtente, email, nickname, password, nazionalita, citta, img, annoFondazione, dj);
		this.band = band;
		this.idBand = idBand;
		this.genere = genere;
		this.annoFondazione = annoFondazione;
		this.prezzo = prezzo;
		this.giorniDisp = giorniDisp;
		this.commentiBand = commentiBand;
		this.listaPrenotazioni = listaPrenotazioni;
	}

///////////costuttore per salvare in sessione la band 

	public Band(int idUtente, String email, String nickname, String password, String nazionalita, String img,
			String tipo, int idBand, String band, String genere, String annoFondazione, int idUtente2, String bio) {
		super(idUtente, email, nickname, password, nazionalita, img, tipo);
		this.idBand = idBand;
		this.band = band;
		this.genere = genere;
		this.annoFondazione = annoFondazione;
		idUtente = idUtente2;
		this.bio = bio;
	}

	@Override
	public String toString() {
		return "Band [band=" + band + ", idBand=" + idBand + ", genere=" + genere + ", annoFondazione=" + annoFondazione
				+ ", prezzo=" + prezzo + ", giorniDisp=" + giorniDisp + ", commentiBand=" + commentiBand
				+ ", listaPrenotazioni=" + listaPrenotazioni + ", toString()=" + super.toString() + ", hashCode()="
				+ hashCode() + "]";
	}

	public int getIdUtente() {
		return idUtente;
	}

	public void setIdUtente(int idUtente) {
		this.idUtente = idUtente;
	}

	public String getBand() {
		return band;
	}

	public void setBand(String band) {
		this.band = band;
	}

	public int getIdBand() {
		return idBand;
	}

	public void setIdBand(int idBand) {
		this.idBand = idBand;
	}

	public String getGenere() {
		return genere;
	}

	public void setGenere(String genere) {
		this.genere = genere;
	}

	public String getAnnoFondazione() {
		return annoFondazione;
	}

	public void setAnnoFondazione(String annoFondazione) {
		this.annoFondazione = annoFondazione;
	}

	public double getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}

	public List<GiorniDisp> getGiorniDisp() {
		return giorniDisp;
	}

	public void setGiorniDisp(List<GiorniDisp> giorniDisp) {
		this.giorniDisp = giorniDisp;
	}

	public List<CommentiBand> getCommentiBand() {
		return commentiBand;
	}

	public void setCommentiBand(List<CommentiBand> commentiBand) {
		this.commentiBand = commentiBand;
	}

	public List<Prenotazione> getListaPrenotazioni() {
		return listaPrenotazioni;
	}

	public void setListaPrenotazioni(List<Prenotazione> listaPrenotazioni) {
		this.listaPrenotazioni = listaPrenotazioni;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + Objects.hash(annoFondazione, band, commentiBand, genere, giorniDisp, idBand,
				listaPrenotazioni, prezzo);
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
		Band other = (Band) obj;
		return Objects.equals(annoFondazione, other.annoFondazione) && Objects.equals(band, other.band)
				&& Objects.equals(commentiBand, other.commentiBand) && Objects.equals(genere, other.genere)
				&& Objects.equals(giorniDisp, other.giorniDisp) && idBand == other.idBand
				&& Objects.equals(listaPrenotazioni, other.listaPrenotazioni)
				&& Double.doubleToLongBits(prezzo) == Double.doubleToLongBits(other.prezzo);
	}

	public String getBio() {
		return bio;
	}

	public void setBio(String bio) {
		this.bio = bio;
	}

}

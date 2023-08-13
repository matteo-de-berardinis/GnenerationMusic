package model;

import java.util.List;
import java.util.Objects;

public class Locale {
	
	private int id;
	private String nome;
	private String citta;
	private String regione;
	private int capienza;
	private double prezzo;
	private Proprietario propietario;
	private List <GiorniDisp> giorniDisp;
	private List <CommentoLocale> commentiLocale;
	private List <Prenotazione> listaPrenotazioni;
	private String img;
	 private String bio;
	 private int idProprietario;
	
	
///costruttore per inserire commenti 
	 public Locale(int id) {
			super();
			this.id = id;
		}
	
	public Locale(int id, String nome, String citta, String regione, int capienza, double prezzo, String img,
			String bio, int idProprietario) {
		super();
		this.id = id;
		this.nome = nome;
		this.citta = citta;
		this.regione = regione;
		this.capienza = capienza;
		this.prezzo = prezzo;
		this.img = img;
		this.bio = bio;
		this.idProprietario = idProprietario;
		
	}


	


	public Locale(int id, String nome, String citta, String regione, int capienza, double prezzo,
			Proprietario propietario, List<GiorniDisp> giorniDisp, List<CommentoLocale> commentiLocale,
			List<Prenotazione> listaPrenotazioni, String img) {
		super();
		this.id = id;
		this.nome = nome;
		this.citta = citta;
		this.regione = regione;
		this.capienza = capienza;
		this.prezzo = prezzo;
		this.propietario = propietario;
		this.giorniDisp = giorniDisp;
		this.commentiLocale = commentiLocale;
		this.listaPrenotazioni = listaPrenotazioni;
		this.img = img;
	}
	
	
	public int getIdProprietario() {
		return idProprietario;
	}


	public void setIdProprietario(int idProprietario) {
		this.idProprietario = idProprietario;
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
	public String getCitta() {
		return citta;
	}
	public void setCitta(String citta) {
		this.citta = citta;
	}
	public String getRegione() {
		return regione;
	}
	public void setRegione(String regione) {
		this.regione = regione;
	}
	public int getCapienza() {
		return capienza;
	}
	public void setCapienza(int capienza) {
		this.capienza = capienza;
	}
	public double getPrezzo() {
		return prezzo;
	}
	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}
	public Proprietario getPropietario() {
		return propietario;
	}
	public void setPropietario(Proprietario propietario) {
		this.propietario = propietario;
	}
	public List<GiorniDisp> getGiorniDisp() {
		return giorniDisp;
	}
	public void setGiorniDisp(List<GiorniDisp> giorniDisp) {
		this.giorniDisp = giorniDisp;
	}
	public List<CommentoLocale> getCommentiLocale() {
		return commentiLocale;
	}
	public void setCommentiLocale(List<CommentoLocale> commentiLocale) {
		this.commentiLocale = commentiLocale;
	}
	public List<Prenotazione> getListaPrenotazioni() {
		return listaPrenotazioni;
	}
	public void setListaPrenotazioni(List<Prenotazione> listaPrenotazioni) {
		this.listaPrenotazioni = listaPrenotazioni;
	}
	
	
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	@Override
	public int hashCode() {
		return Objects.hash(capienza, citta, commentiLocale, giorniDisp, id, img, listaPrenotazioni, nome, prezzo,
				propietario, regione);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Locale other = (Locale) obj;
		return capienza == other.capienza && Objects.equals(citta, other.citta)
				&& Objects.equals(commentiLocale, other.commentiLocale) && Objects.equals(giorniDisp, other.giorniDisp)
				&& id == other.id && Objects.equals(img, other.img)
				&& Objects.equals(listaPrenotazioni, other.listaPrenotazioni) && Objects.equals(nome, other.nome)
				&& Double.doubleToLongBits(prezzo) == Double.doubleToLongBits(other.prezzo)
				&& Objects.equals(propietario, other.propietario) && Objects.equals(regione, other.regione);
	}
	@Override
	public String toString() {
		return "Locale [id=" + id + ", nome=" + nome + ", citta=" + citta + ", regione=" + regione + ", capienza="
				+ capienza + ", prezzo=" + prezzo + ", propietario=" + propietario + ", giorniDisp=" + giorniDisp
				+ ", commentiLocale=" + commentiLocale + ", listaPrenotazioni=" + listaPrenotazioni + ", img=" + img
				+ "]";
	}
	
	
	public String getBio() {
		return bio;
	}


	public void setBio(String bio) {
		this.bio = bio;
	}
}

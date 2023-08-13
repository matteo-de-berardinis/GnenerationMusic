package model;

import java.util.Objects;

public  class Utente {
	
	private int idUtente;
	private String email;
	private String nickname;
	private String password;
	private String nazionalita;
	private String citta;
	private String img;
	private String tipo;
	
	private boolean admin;
//costruttore vuoto
	public Utente() {
		
	}
	///costruttore che recupera lista di utenti 
	public Utente(int idUtente, String email, String nickname, String password, String nazionalita, String img,
			String tipo) {
		super();
		this.idUtente = idUtente;
		this.email = email;
		this.nickname = nickname;
		this.password = password;
		this.nazionalita = nazionalita;
		this.img = img;
		this.tipo = tipo;
	}
	
	public Utente(String nickname,String email,String nazionalita,String password,String tipo) {
		this.email=email;
		this.nickname=nickname;
		this.nazionalita=nazionalita;
		this.password=password;
		this.tipo=tipo;
	}
	
	

	public Utente(String nickname,String email,String nazionalita,String password) {
		this.email=email;
		this.nickname=nickname;
		this.nazionalita=nazionalita;
		this.password=password;
	
	}
	
	
	
	public Utente(String nickname, String nazionalita, String img) {
		super();
		this.nickname = nickname;
		this.nazionalita = nazionalita;
		this.img = img;
	}


	public Utente(int idUtente, String email, String nickname, String password, String nazionalita, String citta,
			String img, String genere, boolean dj) {
		super();
		this.idUtente = idUtente;
		this.email = email;
		this.nickname = nickname;
		this.password = password;
		this.nazionalita = nazionalita;
		this.citta = citta;
		this.img = img;
		
		
	}




	
	
	
	public int getIdUtente() {
		return idUtente;
	}
	public void setIdUtente(int idUtente) {
		this.idUtente = idUtente;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNazionalita() {
		return nazionalita;
	}
	public void setNazionalita(String nazionalita) {
		this.nazionalita = nazionalita;
	}
	
	
	public String getCitta() {
		return citta;
	}
	public void setCitta(String citta) {
		this.citta = citta;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}



	public boolean isAdmin() {
		return admin;
	}


	public void setAdmin(boolean admin) {
		this.admin = admin;
	}
	
	



	public String getTipo() {
		return tipo;
	}


	public void setTipo(String tipo) {
		this.tipo = tipo;
	}


	@Override
	public String toString() {
		return "Utente [idUtente=" + idUtente + ", email=" + email + ", nickname=" + nickname + ", password=" + password
				+ ", nazionalita=" + nazionalita + ", citta=" + citta + ", img=" + img + ", genere=" +  ", dj="
				+ "]";
	}


	@Override
	public int hashCode() {
		return Objects.hash(citta, email, idUtente, img, nazionalita, nickname, password);
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Utente other = (Utente) obj;
		return Objects.equals(citta, other.citta) &&   Objects.equals(email, other.email)
				&& idUtente == other.idUtente && Objects.equals(img, other.img)
				&& Objects.equals(nazionalita, other.nazionalita) && Objects.equals(nickname, other.nickname)
				&& Objects.equals(password, other.password);
	}
	
	
	

}

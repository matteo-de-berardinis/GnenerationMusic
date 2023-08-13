package model;

public class commentiAdmin {
private String nomeUtente;
private String Email;
private String testo;
public commentiAdmin(String nomeUtente, String email, String testo) {
	super();
	this.nomeUtente = nomeUtente;
	Email = email;
	this.testo = testo;
}
public String getNomeUtente() {
	return nomeUtente;
}
public void setNomeUtente(String nomeUtente) {
	this.nomeUtente = nomeUtente;
}
public String getEmail() {
	return Email;
}
public void setEmail(String email) {
	Email = email;
}
public String getTesto() {
	return testo;
}
public void setTesto(String testo) {
	this.testo = testo;
}












}

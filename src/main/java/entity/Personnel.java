
package entity;

import java.sql.Date;


public class Personnel {
    private int iD;
	private String cin;
	private String nom;
	private String prenom;
	private Date dateNaissance;
	private String adresse;
	private String telephone;
	private String email;
	private char sexe;
	private String etatCivil;
	private String matricule;
	private String dateEmbauche;
	private String specialitePrincipale;
	private Compte compte;

    public Personnel() {
    }

    public Personnel(int iD, String cin, String nom, String prenom, Date dateNaissance, String adresse, String telephone, String email, char sexe, String etatCivil, String matricule, String dateEmbauche, String specialitePrincipale, Compte compte) {
        this.iD = iD;
        this.cin = cin;
        this.nom = nom;
        this.prenom = prenom;
        this.dateNaissance = dateNaissance;
        this.adresse = adresse;
        this.telephone = telephone;
        this.email = email;
        this.sexe = sexe;
        this.etatCivil = etatCivil;
        this.matricule = matricule;
        this.dateEmbauche = dateEmbauche;
        this.specialitePrincipale = specialitePrincipale;
        this.compte = compte;
    }

    public int getiD() {
        return iD;
    }

    public void setiD(int iD) {
        this.iD = iD;
    }

    public String getCin() {
        return cin;
    }

    public void setCin(String cin) {
        this.cin = cin;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public Date getDateNaissance() {
        return dateNaissance;
    }

    public void setDateNaissance(Date dateNaissance) {
        this.dateNaissance = dateNaissance;
    }

    public String getAdresse() {
        return adresse;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public char getSexe() {
        return sexe;
    }

    public void setSexe(char sexe) {
        this.sexe = sexe;
    }

    public String getEtatCivil() {
        return etatCivil;
    }

    public void setEtatCivil(String etatCivil) {
        this.etatCivil = etatCivil;
    }

    public String getMatricule() {
        return matricule;
    }

    public void setMatricule(String matricule) {
        this.matricule = matricule;
    }

    public String getDateEmbauche() {
        return dateEmbauche;
    }

    public void setDateEmbauche(String dateEmbauche) {
        this.dateEmbauche = dateEmbauche;
    }

    public String getSpecialitePrincipale() {
        return specialitePrincipale;
    }

    public void setSpecialitePrincipale(String specialitePrincipale) {
        this.specialitePrincipale = specialitePrincipale;
    }

    public Compte getCompte() {
        return compte;
    }

    public void setCompte(Compte compte) {
        this.compte = compte;
    }
        
	
    
}

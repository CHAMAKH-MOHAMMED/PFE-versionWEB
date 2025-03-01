/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;


public class Compte {
   private int iD;
	private String nomUtilsateur;
	private String email;
	private String pswd;
	private Role role;
	private Personnel compte;

    public Compte(int iD, String nomUtilsateur, String email, String pswd, Role role, Personnel compte) {
        this.iD = iD;
        this.nomUtilsateur = nomUtilsateur;
        this.email = email;
        this.pswd = pswd;
        this.role = role;
        this.compte = compte;
    }

    public Compte() {
    }

    public int getiD() {
        return iD;
    }

    public void setiD(int iD) {
        this.iD = iD;
    }

    public String getNomUtilsateur() {
        return nomUtilsateur;
    }

    public void setNomUtilsateur(String nomUtilsateur) {
        this.nomUtilsateur = nomUtilsateur;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPswd() {
        return pswd;
    }

    public void setPswd(String pswd) {
        this.pswd = pswd;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public Personnel getCompte() {
        return compte;
    }

    public void setCompte(Personnel compte) {
        this.compte = compte;
    }

 

    
}
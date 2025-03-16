/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;


public class Compte {
   private int id;
	private String nomUtilsateur;
	private String email;
	private String pswd;
	private Role role;
	private Personnel Personnel;

    public Compte() {
    }

    public Compte(int id, String nomUtilsateur, String email, String pswd, Role role, Personnel Personnel) {
        this.id = id;
        this.nomUtilsateur = nomUtilsateur;
        this.email = email;
        this.pswd = pswd;
        this.role = role;
        this.Personnel = Personnel;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public Personnel getPersonnel() {
        return Personnel;
    }

    public void setPersonnel(Personnel Personnel) {
        this.Personnel = Personnel;
    }

 

    
}
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import entity.Patient;

/**
 *
 * @author vPro
 */
public class PatientDAO {
     private Connection con;
	
	public PatientDAO() {
		this.con = DB.getInstance().con;
	}
	public void insert(Patient patient) throws SQLException{
                //TODO	
	}
	public ArrayList<Patient> getAll() throws SQLException{
		String query = "SELECT * FROM `patient`";
		PreparedStatement statement = (PreparedStatement) con.prepareStatement(query);
		ResultSet rs = statement.executeQuery();
		ArrayList<Patient> patients = new ArrayList<Patient>();
		
		while (rs.next()) {
                        int id=rs.getInt("ID");
                        String nom =rs.getString("Nom");
                        String prenom =rs.getString("Prenom");
                        Date dateNaissance = rs.getDate("DateNaissance");
                        Patient patient = new Patient();
                        patient.setId(id);
                        patient.setNom(nom);
                        patient.setPrenom(prenom);
                        patient.setDateNaissance(dateNaissance);
                        patients.add(patient);     
		}
		rs.close();
		statement.close();
		return patients;			
	}
	
}

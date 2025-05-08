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
import entity.Maladie;
import entity.Patient;

/**
 *
 * @author vPro
 */
public class MaladieDAO {
    private Connection con;
	
	public MaladieDAO() {
		this.con = DB.getInstance().con;
	}
	public void insert(Maladie maladie) throws SQLException{
              //TODO  
	}
	public ArrayList<Maladie> getByPatientId(int patientId) throws SQLException{
		String query = "SELECT `maladie`.`ID` as `maladieID`, `maladie`.`Titre` as `maladieTitre`, `maladie`.`Description` as `maladieDescription` "
                             + "FROM `maladie` , `dossiermedical_maladie` , `dossiermedical` , `patient`  WHERE `dossiermedical_maladie`.`dossiermedicalID`=`dossiermedical`.`ID` and `maladie`.`ID`=`dossiermedical_maladie`.`MaladieID` and `dossiermedical`.`PatientID` = `patient`.`ID`  and `patient`.`ID`=? ";
		PreparedStatement statement = (PreparedStatement) con.prepareStatement(query);
                statement.setInt(1, patientId);
		ResultSet rs = statement.executeQuery();
		ArrayList<Maladie> maladies = new ArrayList<Maladie>();
		while (rs.next()) {
                    Maladie maladie = new Maladie();
                    maladie.setId(rs.getInt("maladieID"));
                    maladie.setTitre(rs.getString("maladieTitre"));
                    maladie.setDescription(rs.getString("maladieDescription"));
                    maladies.add(maladie);
                }
		rs.close();
		statement.close();
		return maladies;			
	}
        public ArrayList<Maladie> getByPatient(Patient patientObj) throws SQLException{
		String query = "SELECT `maladie`.`ID` as `maladieID`, `maladie`.`Titre` as `maladieTitre`, `maladie`.`Description` as `maladieDescription` "
                             + "FROM `maladie` , `dossiermedical_maladie` , `dossiermedical`  WHERE `maladie`.`ID`=`dossiermedical_maladie`.`MaladieID` and `dossiermedical`.`PatientID` = ?";
		PreparedStatement statement = (PreparedStatement) con.prepareStatement(query);
                statement.setInt(1, patientObj.getId());
		ResultSet rs = statement.executeQuery();
		ArrayList<Maladie> maladies = new ArrayList<Maladie>();
		while (rs.next()) {
                    Maladie maladie = new Maladie();
                    maladie.setId(rs.getInt("maladieID"));
                    maladie.setTitre(rs.getString("maladieTitre"));
                    maladie.setDescription(rs.getString("maladieDescription"));
                    maladies.add(maladie);
                }
		rs.close();
		statement.close();
		return maladies;			
	}
	
}

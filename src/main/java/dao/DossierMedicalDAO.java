/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import entity.DossierMedical;
import entity.Patient;
import entity.ProtocoleSevrage;

/**
 *
 * @author vPro
 */
public class DossierMedicalDAO {
    private Connection con;
	
	public DossierMedicalDAO() {
		this.con = DB.getInstance().con;
	}
	public void insert(DossierMedical dossierMedical) throws SQLException{
              //TODO  
	}
	public DossierMedical getByPatientId(int patientId) throws SQLException{
		String query = "SELECT `patient`.`ID` as `patientID`, `patient`.`Nom`, `patient`.`Prenom`, `patient`.`DateNaissance`, "
                             + "`dossiermedical`.`ID` as `dossiermedicalID`, `protocolesevrage`.`ID` as `protocolesevrageID`, "
                             + "`protocolesevrage`.`Titre` as `protocolesevrageTitre`, `protocolesevrage`.`Description` as `protocolesevrageDescription`, "
                             + "`protocolesevrage`.`Page` as `protocolesevragePage` FROM `patient`,`dossiermedical`, `protocolesevrage` WHERE "
                             + "`patient`.`ID`=`dossiermedical`.`PatientID` and `dossiermedical`.`ProtocoleSevrageID`=`protocolesevrage`.`ID` and `patient`.`ID`= ? ";
		PreparedStatement statement = (PreparedStatement) con.prepareStatement(query);
                statement.setInt(1, patientId);
		ResultSet rs = statement.executeQuery();
		DossierMedical dossierMedical = new DossierMedical();
		while (rs.next()) {
                    Patient patient = new Patient();
                    patient.setId(rs.getInt("patientID"));
                    patient.setNom(rs.getString("Nom"));
                    patient.setPrenom(rs.getString("Prenom"));
                    patient.setDateNaissance(rs.getDate("DateNaissance"));
                    
                    ProtocoleSevrage protocoleSevrage= new ProtocoleSevrage();
                    protocoleSevrage.setId(rs.getInt("protocolesevrageID"));
                    protocoleSevrage.setTitre(rs.getString("protocolesevrageTitre"));
                    protocoleSevrage.setDescription(rs.getString("protocolesevrageDescription"));
                    protocoleSevrage.setPage(rs.getString("protocolesevragePage"));
                    
                    dossierMedical.setId(rs.getInt("dossiermedicalID"));
                    dossierMedical.setPatient(patient);
                    dossierMedical.setProtocoleSevrage(protocoleSevrage);
                }
		rs.close();
		statement.close();
		return dossierMedical;			
	}
        public DossierMedical getByPatient(Patient patientObj) throws SQLException{
		String query = "SELECT `patient`.`ID` as `patientID`, `patient`.`Nom`, `patient`.`Prenom`, `patient`.`DateNaissance`, "
                             + "`dossiermedical`.`ID` as `dossiermedicalID`, `protocolesevrage`.`ID` as `protocolesevrageID`, "
                             + "`protocolesevrage`.`Titre` as `protocolesevrageTitre`, `protocolesevrage`.`Description` as `protocolesevrageDescription`, "
                             + "`protocolesevrage`.`Page` as `protocolesevragePage` FROM `patient`,`dossiermedical`, `protocolesevrage` WHERE "
                             + "`patient`.`ID`=`dossiermedical`.`PatientID` and `dossiermedical`.`ProtocoleSevrageID`=`protocolesevrage`.`ID` and `patient`.`ID`= ? ";
		PreparedStatement statement = (PreparedStatement) con.prepareStatement(query);
                statement.setInt(1, patientObj.getId());
		ResultSet rs = statement.executeQuery();
		DossierMedical dossierMedical = new DossierMedical();
		while (rs.next()) {
                    Patient patient = new Patient();
                    patient.setId(rs.getInt("patientID"));
                    patient.setNom(rs.getString("Nom"));
                    patient.setPrenom(rs.getString("Prenom"));
                    patient.setDateNaissance(rs.getDate("DateNaissance"));
                    
                    ProtocoleSevrage protocoleSevrage= new ProtocoleSevrage();
                    protocoleSevrage.setId(rs.getInt("protocolesevrageID"));
                    protocoleSevrage.setTitre(rs.getString("protocolesevrageTitre"));
                    protocoleSevrage.setDescription(rs.getString("protocolesevrageDescription"));
                    protocoleSevrage.setPage(rs.getString("protocolesevragePage"));
                    
                    dossierMedical.setId(rs.getInt("dossiermedicalID"));
                    dossierMedical.setPatient(patient);
                    dossierMedical.setProtocoleSevrage(protocoleSevrage);
                }
		rs.close();
		statement.close();
		return dossierMedical;			
	}
	
}

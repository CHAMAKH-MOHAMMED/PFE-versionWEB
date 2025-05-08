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
import entity.Phase;
import entity.ProtocoleSevrage;

/**
 *
 * @author vPro
 */
public class PhaseDAO {
    private Connection con;
	
    public PhaseDAO() {
            this.con = DB.getInstance().con;
    }
    public void insert(Phase phase) throws SQLException{
        //TODO
    }
    public ArrayList<Phase> getAllByProtocole(ProtocoleSevrage protocoleSevrage) throws SQLException{
            String query = "SELECT `phase`.`ID`, `phase`.`Titre`, `phase`.`Description`, `phase`.`Page` "
                         + "FROM `phase` WHERE `phase`.`ProtocoleSevrageID`= ? ";
            PreparedStatement statement = (PreparedStatement) con.prepareStatement(query);
            statement.setInt(1, protocoleSevrage.getId());
            ResultSet rs = statement.executeQuery();
            ArrayList<Phase> phases = new ArrayList<>();
            while (rs.next()) {
                Phase phase = new Phase();
                int id=rs.getInt("id");
                String titre = rs.getString("titre");
                String description = rs.getString("description");
                String page = rs.getString("page");
                phase.setId(id);
                phase.setTitre(titre);
                phase.setDescription(description);
                phase.setPage(page);
                phases.add(phase);
            }
            rs.close();
            statement.close();
            return phases;			
    }
    public ArrayList<Phase> getAllByProtocoleId(int protocoleId) throws SQLException{
            String query = "SELECT `phase`.`ID`, `phase`.`Titre`, `phase`.`Description`, `phase`.`Page` "
                         + "FROM `phase` WHERE `phase`.`ProtocoleSevrageID`= ? ";
            PreparedStatement statement = (PreparedStatement) con.prepareStatement(query);
            statement.setInt(1, protocoleId);
            ResultSet rs = statement.executeQuery();
            ArrayList<Phase> phases = new ArrayList<>();
            while (rs.next()) {
                Phase phase = new Phase();
                int id=rs.getInt("ID");
                String titre = rs.getString("Titre");
                String description = rs.getString("Description");
                String page = rs.getString("Page");
                phase.setId(id);
                phase.setTitre(titre);
                phase.setDescription(description);
                phase.setPage(page);
                phases.add(phase);
            }
            rs.close();
            statement.close();
            return phases;			
    }


    
   /* 
    SELECT `patient`.`ID` as `patientID`, `patient`.`Nom`, `patient`.`Prenom`, `patient`.`DateNaissance`, `dossiermedical`.`ID` as `dossiermedicalID`, `protocolesevrage`.`ID` as `protocolesevrageID`, `protocolesevrage`.`Titre` as `protocolesevrageTitre`, `protocolesevrage`.`Description` as `protocolesevrageDescription`, `protocolesevrage`.`Page` as `protocolesevragePage`, `phase`.`ID` as `phaseID`, `phase`.`Titre` as `phaseTitre`, `phase`.`Description` as `phaseDescription`, `phase`.`Page` as `phasePage`, `action`.`ID` as `actionID`, `action`.`Titre` as `actionTitre`, `action`.`Description` as `actionDescription`, `preuve`.`ID` as `preuveID`, `preuve`.`Code` as `preuveCode`, `preuve`.`Titre` as `preuveTitre`, `preuve`.`Description` as `preuveDescription` FROM `patient`,`dossiermedical`, `protocolesevrage`, `phase`, `action`, `phase_action`, `preuve`  WHERE   
`patient`.`ID`=`dossiermedical`.`PatientID` and `dossiermedical`.`ProtocoleSevrageID`=`protocolesevrage`.`ID` and `phase`.`ProtocoleSevrageID`=	`protocolesevrage`.`ID`	and	`phase_action`.`PhaseID`= `phase`.`ID` and `phase_action`.`ActionID`=`action`.`ID` and `action`.`PreuveID`=`preuve`.`ID` and  `patient`.`ID`= 1   
    */
}

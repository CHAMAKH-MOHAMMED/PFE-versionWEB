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
import entity.Action;
import entity.Phase;
import entity.Preuve;

/**
 *
 * @author vPro
 */
public class ActionDAO {
    private Connection con;
	
    public ActionDAO() {
            this.con = DB.getInstance().con;
    }
    public void insert(Action action) throws SQLException{
        //TODO
    }
    public ArrayList<Action> getAllByPhase(Phase phase) throws SQLException{
            String query = "SELECT `action`.`ID` as `actionID`, `action`.`Titre` as `actionTitre`, "
                         + "`action`.`Description` as `actionDescription`, `preuve`.`ID` as `preuveID`, "
                         + "`preuve`.`Code` as `preuveCode`, `preuve`.`Titre` as `preuveTitre`, `preuve`.`Description` as `preuveDescription` "
                         + "FROM `phase`,`action`,`phase_action`,`preuve` WHERE `phase_action`.`ActionID`=`action`.`ID` AND `action`.`PreuveID`=`preuve`.`ID` AND "
                         + "`phase_action`.`PhaseID`= `phase`.`ID` AND `phase`.`ID`=?";
            PreparedStatement statement = (PreparedStatement) con.prepareStatement(query);
            statement.setInt(1, phase.getId());
            ResultSet rs = statement.executeQuery();
            ArrayList<Action> actions = new ArrayList<>();
            while (rs.next()) {
                Action action = new Action();
                int id=rs.getInt("actionID");
                String titre = rs.getString("actionTitre");
                String description = rs.getString("actionDescription");
                action.setId(id);
                action.setTitre(titre);
                action.setDescription(description);
                
                int idPreuve = rs.getInt("preuveID");
                String titrePreuve = rs.getString("preuveTitre");
                String codePreuve = rs.getString("preuveCode");
                String descriptionPreuve = rs.getString("preuveDescription");
                        
                Preuve preuve = new Preuve();
                preuve.setId(idPreuve);
                preuve.setCode(codePreuve);
                preuve.setTitre(titrePreuve);
                preuve.setDescription(descriptionPreuve);
                
                action.setPreuve(preuve);
                
                actions.add(action);
            }
            rs.close();
            statement.close();
            return actions;		
    }
    public ArrayList<Action> getAllByPhaseId(int phaseId) throws SQLException{
            String query = "SELECT `action`.`ID` as `actionID`, `action`.`Titre` as `actionTitre`, "
                         + "`action`.`Description` as `actionDescription`, `preuve`.`ID` as `preuveID`, "
                         + "`preuve`.`Code` as `preuveCode`, `preuve`.`Titre` as `preuveTitre`, `preuve`.`Description` as `preuveDescription` "
                         + "FROM `action`, `phase_action`,`preuve` WHERE `phase_action`.`ActionID`=`action`.`ID` AND `action`.`PreuveID`=`preuve`.`ID` AND"
                         + "`phase`.`ID`= ?";
            PreparedStatement statement = (PreparedStatement) con.prepareStatement(query);
            statement.setInt(1, phaseId);
            ResultSet rs = statement.executeQuery();
            ArrayList<Action> actions = new ArrayList<>();
            while (rs.next()) {
                Action action = new Action();
                int id=rs.getInt("actionID");
                String titre = rs.getString("actionTitre");
                String description = rs.getString("actionDescription");
                String page = rs.getString("Page");
                action.setId(id);
                action.setTitre(titre);
                action.setDescription(description);
                
                int idPreuve = rs.getInt("preuveID");
                String titrePreuve = rs.getString("preuveTitre");
                String codePreuve = rs.getString("preuveCode");
                String descriptionPreuve = rs.getString("preuveDescription");
                        
                Preuve preuve = new Preuve();
                preuve.setId(idPreuve);
                preuve.setCode(codePreuve);
                preuve.setTitre(titrePreuve);
                preuve.setDescription(descriptionPreuve);
                
                action.setPreuve(preuve);
                
                actions.add(action);
            }
            rs.close();
            statement.close();
            return actions;			
    }


    
   /* 
    SELECT `patient`.`ID` as `patientID`, `patient`.`Nom`, `patient`.`Prenom`, `patient`.`DateNaissance`, `dossiermedical`.`ID` as `dossiermedicalID`, `protocolesevrage`.`ID` as `protocolesevrageID`, `protocolesevrage`.`Titre` as `protocolesevrageTitre`, `protocolesevrage`.`Description` as `protocolesevrageDescription`, `protocolesevrage`.`Page` as `protocolesevragePage`, `phase`.`ID` as `phaseID`, `phase`.`Titre` as `phaseTitre`, `phase`.`Description` as `phaseDescription`, `phase`.`Page` as `phasePage`, `action`.`ID` as `actionID`, `action`.`Titre` as `actionTitre`, `action`.`Description` as `actionDescription`, `preuve`.`ID` as `preuveID`, `preuve`.`Code` as `preuveCode`, `preuve`.`Titre` as `preuveTitre`, `preuve`.`Description` as `preuveDescription` FROM `patient`,`dossiermedical`, `protocolesevrage`, `phase`, `action`, `phase_action`, `preuve`  WHERE   
`patient`.`ID`=`dossiermedical`.`PatientID` and `dossiermedical`.`ProtocoleSevrageID`=`protocolesevrage`.`ID` and `phase`.`ProtocoleSevrageID`=	`protocolesevrage`.`ID`	and	`phase_action`.`PhaseID`= `phase`.`ID` and `phase_action`.`ActionID`=`action`.`ID` and `action`.`PreuveID`=`preuve`.`ID` and  `patient`.`ID`= 1   
    */
}

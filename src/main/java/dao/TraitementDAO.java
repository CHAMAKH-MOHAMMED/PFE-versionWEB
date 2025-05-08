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
import entity.Traitement;
import entity.Phase;
import entity.Forme;
import entity.Traitement;

/**
 *
 * @author vPro
 */
public class TraitementDAO {
    private Connection con;
	
    public TraitementDAO() {
            this.con = DB.getInstance().con;
    }
    public void insert(Traitement traitement) throws SQLException{
        //TODO
    }
    public ArrayList<Traitement> getAllByPhase(Phase phase) throws SQLException{
            String query = "SELECT `traitement`.`ID` as `traitementID`, `traitement`.`Titre` as `traitementTitre`, "
                         + "`traitement`.`Description` as `traitementDescription`, `forme`.`ID` as `formeID`, "
                         + "`forme`.`Titre` as `formeTitre`, `forme`.`Description` as `formeDescription` "
                         + "FROM `phase`,`traitement`,`phase_traitement`,`forme` WHERE `phase_traitement`.`TraitementID`=`traitement`.`ID` AND `traitement`.`FormeID`=`forme`.`ID` AND "
                         + "`phase_traitement`.`PhaseID`= `phase`.`ID` AND `phase`.`ID`=?";
            PreparedStatement statement = (PreparedStatement) con.prepareStatement(query);
            statement.setInt(1, phase.getId());
            ResultSet rs = statement.executeQuery();
            ArrayList<Traitement> traitements = new ArrayList<>();
            while (rs.next()) {
                Traitement traitement = new Traitement();
                int id=rs.getInt("traitementID");
                String titre = rs.getString("traitementTitre");
                String description = rs.getString("traitementDescription");
                traitement.setId(id);
                traitement.setTitre(titre);
                traitement.setDescription(description);
                
                int idForme = rs.getInt("formeID");
                String titreForme = rs.getString("formeTitre");
                String descriptionForme = rs.getString("formeDescription");
                        
                Forme forme = new Forme();
                forme.setId(idForme);
                forme.setTitre(titreForme);
                forme.setDescription(descriptionForme);
                
                traitement.setForme(forme);
                
                traitements.add(traitement);
            }
            rs.close();
            statement.close();
            return traitements;		
    }
    public ArrayList<Traitement> getAllByPhaseId(int phaseId) throws SQLException{
            String query = "SELECT `traitement`.`ID` as `traitementID`, `traitement`.`Titre` as `traitementTitre`, "
                         + "`traitement`.`Description` as `traitementDescription`, `forme`.`ID` as `formeID`, "
                         + "`forme`.`Titre` as `formeTitre`, `forme`.`Description` as `formeDescription` "
                         + "FROM `traitement`, `phase_traitement`,`forme` WHERE `phase_traitement`.`TraitementID`=`traitement`.`ID` AND `traitement`.`FormeID`=`forme`.`ID` AND"
                         + "`phase`.`ID`= ?";
            PreparedStatement statement = (PreparedStatement) con.prepareStatement(query);
            statement.setInt(1, phaseId);
            ResultSet rs = statement.executeQuery();
            ArrayList<Traitement> traitements = new ArrayList<>();
            while (rs.next()) {
                Traitement traitement = new Traitement();
                int id=rs.getInt("traitementID");
                String titre = rs.getString("traitementTitre");
                String description = rs.getString("traitementDescription");
                traitement.setId(id);
                traitement.setTitre(titre);
                traitement.setDescription(description);
                
                int idForme = rs.getInt("formeID");
                String titreForme = rs.getString("formeTitre");
                String descriptionForme = rs.getString("formeDescription");
                        
                Forme forme = new Forme();
                forme.setId(idForme);
                forme.setTitre(titreForme);
                forme.setDescription(descriptionForme);
                
                traitement.setForme(forme);
                
                traitements.add(traitement);
            }
            rs.close();
            statement.close();
            return traitements;			
    }

}

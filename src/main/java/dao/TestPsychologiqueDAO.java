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

import entity.TestPsychologique;

/**
 *
 * @author vPro
 */
public class TestPsychologiqueDAO {
    private Connection con;
	
    public TestPsychologiqueDAO() {
            this.con = DB.getInstance().con;
    }
    public void insert(TestPsychologique testPsychologique) throws SQLException{
        //TODO
    }
    public ArrayList<TestPsychologique> getAllByPhase(Phase phase) throws SQLException{
            String query = "SELECT `testPsychologique`.`ID` as `testPsychologiqueID`, `testPsychologique`.`Titre` as `testPsychologiqueTitre`, "
                         + "`testPsychologique`.`Description` as `testPsychologiqueDescription`, `testPsychologique`.`Page` as `testPsychologiquePage` "
                         + "FROM `phase`,`testPsychologique`,`phase_testPsychologique` WHERE `phase_testPsychologique`.`TestPsychologiqueID`=`testPsychologique`.`ID` AND "
                         + "`phase_testPsychologique`.`PhaseID`= `phase`.`ID` AND `phase`.`ID`=?";
            PreparedStatement statement = (PreparedStatement) con.prepareStatement(query);
            statement.setInt(1, phase.getId());
            ResultSet rs = statement.executeQuery();
            ArrayList<TestPsychologique> testPsychologiques = new ArrayList<>();
            while (rs.next()) {
                TestPsychologique testPsychologique = new TestPsychologique();
                int id=rs.getInt("testPsychologiqueID");
                String titre = rs.getString("testPsychologiqueTitre");
                String description = rs.getString("testPsychologiqueDescription");
                String page = rs.getString("testPsychologiquePage");
                testPsychologique.setId(id);
                testPsychologique.setTitre(titre);
                testPsychologique.setDescription(description);
                testPsychologique.setPage(page);
                
                testPsychologiques.add(testPsychologique);
            }
            rs.close();
            statement.close();
            return testPsychologiques;		
    }
    public ArrayList<TestPsychologique> getAllByPhaseId(int phaseId) throws SQLException{
            String query = "SELECT `testPsychologique`.`ID` as `testPsychologiqueID`, `testPsychologique`.`Titre` as `testPsychologiqueTitre`, "
                         + "`testPsychologique`.`Description` as `testPsychologiqueDescription`, `testPsychologique`.`Page` as `testPsychologiquePage` "
                         + "FROM `phase`,`testPsychologique`,`phase_testPsychologique` WHERE `phase_testPsychologique`.`TestPsychologiqueID`=`testPsychologique`.`ID` AND "
                         + "`phase_testPsychologique`.`PhaseID`= `phase`.`ID` AND `phase`.`ID`=?";
            PreparedStatement statement = (PreparedStatement) con.prepareStatement(query);
            statement.setInt(1, phaseId);
            ResultSet rs = statement.executeQuery();
            ArrayList<TestPsychologique> testPsychologiques = new ArrayList<>();
            while (rs.next()) {
                TestPsychologique testPsychologique = new TestPsychologique();
                int id=rs.getInt("testPsychologiqueID");
                String titre = rs.getString("testPsychologiqueTitre");
                String description = rs.getString("testPsychologiqueDescription");
                String page = rs.getString("testPsychologiquePage");
                testPsychologique.setId(id);
                testPsychologique.setTitre(titre);
                testPsychologique.setDescription(description);
                testPsychologique.setPage(page);
                
                testPsychologiques.add(testPsychologique);
            }
            rs.close();
            statement.close();
            return testPsychologiques;			
    }

}

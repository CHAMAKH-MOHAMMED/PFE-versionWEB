package dao;

import entity.Personnel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author MohammedCHamakh
 */
public class PersonnelDAO {
    private DbSingleton db;

    public PersonnelDAO() throws SQLException, ClassNotFoundException {
        db = DbSingleton.getInstance();
    }

    public ArrayList<Personnel> listerPersonnels() {
        ArrayList<Personnel> personnels = new ArrayList<>();
        String query = "SELECT * FROM Personnel";

        try (Connection conn = db.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Personnel personnel = new Personnel();
                personnel.setiD(rs.getInt("ID"));
                personnel.setCin(rs.getString("Cin"));
                personnel.setNom(rs.getString("Nom"));
                personnel.setPrenom(rs.getString("Prenom"));
                personnel.setDateNaissance(rs.getDate("DateNaissance"));
                personnel.setAdresse(rs.getString("Adresse"));
                personnel.setTelephone(rs.getString("Telephone"));
                personnel.setEmail(rs.getString("Email"));
                personnel.setSexe(rs.getString("Sexe").charAt(0));
                personnel.setEtatCivil(rs.getString("EtatCivil"));
                personnel.setMatricule(rs.getString("Matricule"));
                personnel.setDateEmbauche(rs.getString("DateEmbauche"));
                personnel.setSpecialitePrincipale(rs.getString("SpecialitePrincipale"));

                personnels.add(personnel);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return personnels;
    }

    public Boolean ajouterPersonnel(Personnel personnel) {
        String query = "INSERT INTO Personnel (Cin, Nom, Prenom, DateNaissance, Adresse, Telephone, Email, Sexe, EtatCivil, Matricule, DateEmbauche, SpecialitePrincipale) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = db.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setString(1, personnel.getCin());
            pstmt.setString(2, personnel.getNom());
            pstmt.setString(3, personnel.getPrenom());
            pstmt.setDate(4, personnel.getDateNaissance());
            pstmt.setString(5, personnel.getAdresse());
            pstmt.setString(6, personnel.getTelephone());
            pstmt.setString(7, personnel.getEmail());
            pstmt.setString(8, String.valueOf(personnel.getSexe()));
            pstmt.setString(9, personnel.getEtatCivil());
            pstmt.setString(10, personnel.getMatricule());
            pstmt.setString(11, personnel.getDateEmbauche());
            pstmt.setString(12, personnel.getSpecialitePrincipale());

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public Boolean modifierPersonnel(Personnel personnel) {
        String query = "UPDATE Personnel SET Cin = ?, Nom = ?, Prenom = ?, DateNaissance = ?, Adresse = ?, Telephone = ?, Email = ?, Sexe = ?, EtatCivil = ?, Matricule = ?, DateEmbauche = ?, SpecialitePrincipale = ? WHERE ID = ?";

        try (Connection conn = db.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setString(1, personnel.getCin());
            pstmt.setString(2, personnel.getNom());
            pstmt.setString(3, personnel.getPrenom());
            pstmt.setDate(4, personnel.getDateNaissance());
            pstmt.setString(5, personnel.getAdresse());
            pstmt.setString(6, personnel.getTelephone());
            pstmt.setString(7, personnel.getEmail());
            pstmt.setString(8, String.valueOf(personnel.getSexe()));
            pstmt.setString(9, personnel.getEtatCivil());
            pstmt.setString(10, personnel.getMatricule());
            pstmt.setString(11, personnel.getDateEmbauche());
            pstmt.setString(12, personnel.getSpecialitePrincipale());
            pstmt.setInt(13, personnel.getiD());

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public Boolean supprimerPersonnel(Personnel personnel) {
        String query = "DELETE FROM Personnel WHERE ID = ?";

        try (Connection conn = db.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setInt(1, personnel.getiD());
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
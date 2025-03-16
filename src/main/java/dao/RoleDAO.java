package dao;

import entity.Role;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author MohammedCHamakh
 */
public class RoleDAO {
    private DbSingleton db;

    // Constructeur
    public RoleDAO() throws SQLException, ClassNotFoundException {
        db = DbSingleton.getInstance();
    }

    // Lister tous les rôles
    public ArrayList<Role> listerRoles() {
        ArrayList<Role> roles = new ArrayList<>();
        String query = "SELECT * FROM role";

        try (Connection conn = db.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Role role = new Role();
                role.setId(rs.getInt("ID"));
                role.setNom(rs.getString("Nom"));
                roles.add(role);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return roles;
    }

    // Ajouter un rôle
    public Boolean ajouterRole(Role role) {
        String query = "INSERT INTO role (Nom) VALUES (?)";

        try (Connection conn = db.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setString(1, role.getNom());

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Modifier un rôle
    public Boolean modifierRole(Role role) {
        String query = "UPDATE role SET Nom = ? WHERE ID = ?";

        try (Connection conn = db.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setString(1, role.getNom());
            pstmt.setInt(2, role.getId());

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Supprimer un rôle
    public Boolean supprimerRole(Role role) {
        String query = "DELETE FROM role WHERE ID = ?";

        try (Connection conn = db.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setInt(1, role.getId());

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Récupérer un rôle par ID
    public Role getRole(int id) {
        String query = "SELECT * FROM role WHERE ID = ?";
        Role role = null;

        try (Connection conn = db.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    role = new Role();
                    role.setId(rs.getInt("ID"));
                    role.setNom(rs.getString("Nom"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return role;
    }

    // Récupérer un rôle par son nom
    public Role getRoleByNom(String nom) {
        String query = "SELECT * FROM role WHERE Nom = ?";
        Role role = null;

        try (Connection conn = db.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setString(1, nom);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    role = new Role();
                    role.setId(rs.getInt("ID"));
                    role.setNom(rs.getString("Nom"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return role;
    }
}
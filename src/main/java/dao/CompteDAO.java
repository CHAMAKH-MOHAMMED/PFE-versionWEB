package dao;

import entity.Role;
import entity.Compte;
import entity.Personnel;
import java.sql.*;
import java.util.*;

public class CompteDAO {

    private Connection conn;
    private DbSingleton dbSingleton;

    public CompteDAO() throws SQLException, ClassNotFoundException {
        dbSingleton = DbSingleton.getInstance();
        conn = dbSingleton.getConnection();
    }

    public Compte getUserByUsername(String email) throws SQLException {
        String sql = "SELECT * FROM compte WHERE Email = ?";
        Compte user = new Compte();
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    int userId = rs.getInt("id");
                    String emaill = rs.getString("Email");
                    String password = rs.getString("password");
                    int roleId = rs.getInt("RoleID");

                    user.setId(userId);
                    user.setEmail(email);
                    user.setPswd(password);
                    user.setRole(getRoleById(roleId));
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
        return user;
    }

    public Compte getCompte(int id) throws SQLException {
        String sql = "SELECT * FROM compte WHERE id = ?";
        Compte user = new Compte();
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    int userId = rs.getInt("id");
                    System.out.println(id);
                    String emaill = rs.getString("Email");
                    System.out.println(emaill);
                    String password = rs.getString("password");
                    System.out.println(password);
                    int roleId = rs.getInt("RoleID");
                    user.setRole(getRoleById(roleId));
                    int compteID = rs.getInt("PersonnelID");
                    System.out.println("le personnelID: " + compteID);
                    Personnel p = getPersonnel(compteID);
                    System.out.println("le personnel: " + p);
                    user.setPersonnel(p);
                    user.setId(userId);
                    user.setEmail(emaill);
                    user.setPswd(password);
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
        return user;
    }

    public boolean registerUser(Compte user) throws SQLException {
        String checkUserSql = "SELECT id FROM compte WHERE email = ?";
        try (PreparedStatement checkStmt = conn.prepareStatement(checkUserSql)) {
            checkStmt.setString(1, user.getEmail());
            try (ResultSet rs = checkStmt.executeQuery()) {
                if (rs.next()) {
                    return false;
                }
            }
        }

        String insertUserSql = "INSERT INTO compte (NomUtilsateur, Email, password, RoleID) VALUES (?, ?, ?, ?)";
        try (PreparedStatement insertStmt = conn.prepareStatement(insertUserSql)) {
            insertStmt.setString(1, user.getNomUtilsateur());
            insertStmt.setString(2, user.getEmail());
            insertStmt.setString(3, user.getPswd());
            insertStmt.setInt(4, 2); // ID du rôle utilisateur par défaut
            int rowsInserted = insertStmt.executeUpdate();
            return rowsInserted > 0;
        }
    }

    public List<Compte> getAll() throws SQLException {
        List<Compte> comptes = new ArrayList<>();
        String sql = "SELECT * FROM compte";

        try (PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Compte compte = new Compte();
                compte.setId(rs.getInt("id"));
                compte.setNomUtilsateur(rs.getString("NomUtilsateur"));
                compte.setEmail(rs.getString("Email"));
                compte.setPswd(rs.getString("password"));
                int roleId = rs.getInt("RoleID");
                Role role = getRoleById(roleId);
                compte.setRole(role);
                comptes.add(compte);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
        return comptes;
    }

    private Role getRoleById(int roleId) throws SQLException {
        String sqlRole = "SELECT id, Nom FROM role WHERE id = ?";
        try (PreparedStatement stmtRole = conn.prepareStatement(sqlRole)) {
            stmtRole.setInt(1, roleId);
            try (ResultSet rsRole = stmtRole.executeQuery()) {
                if (rsRole.next()) {
                    return new Role(rsRole.getInt("id"), rsRole.getString("Nom"));
                }
            }
        }
        return null;
    }

    public Personnel getPersonnel(int id) throws SQLException {
        String sql = "SELECT `ID`, `Cin`, `Nom`, `Prenom`, `DateNaissance`, `Adresse`, `Telephone`, `Email`, `Sexe`, `EtatCivil`, `Matricule`, `DateEmbauche`, `SpecialitePrincipale` FROM `personnel` WHERE id = ?";
        Personnel personnel = null;

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    personnel = new Personnel();
                    personnel.setiD(rs.getInt("ID"));
                    personnel.setCin(rs.getString("Cin"));
                    personnel.setNom(rs.getString("Nom"));
                    personnel.setPrenom(rs.getString("Prenom"));
                    personnel.setDateNaissance(rs.getDate("DateNaissance"));
                    personnel.setAdresse(rs.getString("Adresse"));
                    personnel.setTelephone(rs.getString("Telephone"));
                    personnel.setEmail(rs.getString("Email"));
                    personnel.setSexe(rs.getString("Sexe")); // Convertir String en char
                    personnel.setEtatCivil(rs.getString("EtatCivil"));
                    personnel.setMatricule(rs.getString("Matricule"));
                    personnel.setDateEmbauche(rs.getDate("DateEmbauche")); // Utiliser getDate pour cohérence
                    personnel.setSpecialitePrincipale(rs.getString("SpecialitePrincipale"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
        return personnel;
    }

    public boolean updateCompte(Compte compte) throws SQLException {
        String sql = "UPDATE compte SET Email = ?, NomUtilsateur = ?, RoleID = ? WHERE id = ?";

        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, compte.getEmail());
            pstmt.setString(2, compte.getNomUtilsateur() != null ? compte.getNomUtilsateur() : "");
            pstmt.setInt(3, compte.getRole().getId());
            pstmt.setInt(4, compte.getId());

            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }
    }
}

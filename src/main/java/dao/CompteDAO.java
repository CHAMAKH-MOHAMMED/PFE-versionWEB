package dao;

import entity.Role;
import entity.Compte;
import java.sql.*;

public class CompteDAO {

    private final String jdbcURL = "jdbc:mysql://localhost:3306/security";
    private final String jdbcUsername = "root";
    private final String jdbcPassword = "";
    private final String jdbcDriver = "com.mysql.cj.jdbc.Driver";
    private Connection conn;

    public CompteDAO() throws SQLException, ClassNotFoundException {
        Class.forName(jdbcDriver);
        this.conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    public Compte getUserByUsername(String email) throws SQLException {
        String sql = "SELECT * FROM compte WHERE email = ?";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    int userId = rs.getInt("id");
                    String emaill = rs.getString("email");
                    String password = rs.getString("password");
                    int roleId = rs.getInt("role_id");

                    Compte user = new Compte(userId, emaill, password);

                    // Récupérer le rôle de l'utilisateur
                    String sqlRole = "SELECT * FROM userrole WHERE id = ?";
                    try (PreparedStatement stmtRole = conn.prepareStatement(sqlRole)) {
                        stmtRole.setInt(1, roleId);
                        try (ResultSet rsRole = stmtRole.executeQuery()) {
                            if (rsRole.next()) {
                                Role role = new Role(rsRole.getInt("id"), rsRole.getString("roleName"));
                                user.setRole(role);
                            }
                        }
                    }
                    return user;
                }
            }
        }
        return null;
    }

    public boolean registerUser(Compte user) throws SQLException {
        // Vérifier si l'utilisateur existe déjà
        String checkUserSql = "SELECT id FROM compte WHERE email = ?";
        try (PreparedStatement checkStmt = conn.prepareStatement(checkUserSql)) {
            checkStmt.setString(1, user.getEmail());
            try (ResultSet rs = checkStmt.executeQuery()) {
                if (rs.next()) {
                    // L'utilisateur existe déjà
                    return false;
                }
            }
        }

        // Insérer le nouvel utilisateur
        String insertUserSql = "INSERT INTO compte (username,email, password, idRole) VALUES (?, ?, ?)";
        try (PreparedStatement insertStmt = conn.prepareStatement(insertUserSql)) {
            insertStmt.setString(1, user.getEmail());
            insertStmt.setString(2, user.getPassword()); // ⚠️ À HASHER en production
            insertStmt.setInt(3, 2); // ID du rôle utilisateur par défaut (à adapter)

            int rowsInserted = insertStmt.executeUpdate();
            return rowsInserted > 0;
        }
    }
    // Méthode pour ajouter un compte

    public boolean ajouterCompte(String username, String password, int role, String email) throws SQLException {
       String sql = "INSERT INTO compte (username, password, role_id,email) VALUES (?, ?, ?,?)";

        PreparedStatement stmt = conn.prepareStatement(sql);

        stmt.setString(1, username);
        stmt.setString(2, password);
        stmt.setInt(3, role);
        stmt.setString(4, email);
        int rowsInserted = stmt.executeUpdate();
        return rowsInserted > 0; // Retourne vrai si l'insertion a réussi

    }

    // Méthode pour fermer la connexion proprement
    public void close() throws SQLException {
        if (conn != null && !conn.isClosed()) {
            conn.close();
        }
    }
}

package controller;

import com.google.gson.Gson;
import dao.CompteDAO;
import entity.Compte;
import java.io.IOException;
import java.io.PrintWriter;

import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/chercherUtilisateur")
public class ChercherUtilisateur extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Récupérer le paramètre userId
        String userIdParam = request.getParameter("userId");
        String json;

        if (userIdParam == null || userIdParam.isEmpty()) {
            json = new Gson().toJson("Erreur : Le paramètre 'userId' est manquant.");
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // Code 400
        } else {
            try {
                int userId = Integer.parseInt(userIdParam);

              
                // Récupérer le personnel par son ID
                CompteDAO personnelDAO = new CompteDAO();
                Compte personnel = personnelDAO.getCompte(userId);

                if (personnel != null) {
                    json = new Gson().toJson(personnel); // Convertir l'objet Personnel en JSON
                } else {
                    json = new Gson().toJson("Aucun utilisateur trouvé avec l'ID : " + userId);
                    response.setStatus(HttpServletResponse.SC_NOT_FOUND); // Code 404
                }
            } catch (NumberFormatException e) {
                json = new Gson().toJson("Erreur : Le paramètre 'userId' doit être un nombre.");
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // Code 400
                e.printStackTrace();
            } catch (SQLException e) {
                json = new Gson().toJson("Erreur : Problème de base de données.");
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // Code 500
                e.printStackTrace();
            } catch (Exception e) {
                json = new Gson().toJson("Erreur inattendue : " + e.getMessage());
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // Code 500
                e.printStackTrace();
            }
        }

        // Envoyer la réponse JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.print(json);
            out.flush();
        }
    }
}
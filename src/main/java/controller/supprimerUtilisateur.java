package controller;

import com.google.gson.Gson;
import dao.CompteDAO;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/supprimerUtilisateur")
public class SupprimerUtilisateur extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userIdParam = request.getParameter("id");
        String json;

        if (userIdParam == null || userIdParam.isEmpty()) {
            json = new Gson().toJson("Erreur : Le paramètre 'Id' est manquant.");
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // Code 400
        } else {
            try {
                int userId = Integer.parseInt(userIdParam);

                CompteDAO compteDAO = new CompteDAO();
                boolean isDeleted = compteDAO.deleteCompte(userId);

                if (isDeleted) {
                    json = new Gson().toJson("Utilisateur supprimé avec succès.");
                    response.setStatus(HttpServletResponse.SC_OK); // Code 200
                } else {
                    json = new Gson().toJson("Aucun utilisateur trouvé avec l'ID : " + userId);
                    response.setStatus(HttpServletResponse.SC_NOT_FOUND); // Code 404
                }
            } catch (NumberFormatException e) {
                json = new Gson().toJson("Erreur : L'ID doit être un nombre valide.");
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

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }
}

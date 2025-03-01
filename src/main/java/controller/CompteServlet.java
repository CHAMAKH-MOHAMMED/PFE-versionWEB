package controller;

import dao.CompteDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;

@WebServlet("/public/creerCompte")
public class CompteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        JSONObject jsonResponse = new JSONObject();
        
        try {
            // Récupération des données du formulaire
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            int role = 10;

            CompteDAO compteDAO = new CompteDAO();
            boolean success = compteDAO.ajouterCompte(username, password, role, email);

            if (success) {
                jsonResponse.put("status", "success");
                jsonResponse.put("message", "Compte créé avec succès !");
            } else {
                jsonResponse.put("status", "error");
                jsonResponse.put("message", "Échec de la création du compte.");
            }
        } catch (Exception e) {
            jsonResponse.put("status", "error");
            jsonResponse.put("message", "Une erreur s'est produite : " + e.getMessage());
        }

        response.getWriter().write(jsonResponse.toString());
    }
}

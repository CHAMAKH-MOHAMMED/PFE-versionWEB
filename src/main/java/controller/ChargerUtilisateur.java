package controller;

import dao.CompteDAO;
import entity.Compte;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author MohammedCHamakh
 */
@WebServlet("/admin/chargerUtilisateur")
public class ChargerUtilisateur extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String json;
        try {
            // Récupérer le paramètre "listeF" (si nécessaire)
            
            
            // Récupérer la liste des comptes
            CompteDAO compteDAO = new CompteDAO();
            ArrayList<Compte> liste = (ArrayList<Compte>) compteDAO.getAll(); 
            
            // Convertir la liste en JSON
            json = new Gson().toJson(liste);
            
        
        } catch (Exception e) {
            json = new Gson().toJson("Erreur inattendue : " + e.getMessage());
            e.printStackTrace();
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
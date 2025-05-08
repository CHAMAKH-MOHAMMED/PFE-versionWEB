package controller;
import com.google.gson.Gson;
import dao.CompteDAO;
import dao.PersonnelDAO;
import dao.RoleDAO;
import entity.Compte;
import entity.Personnel;
import entity.Role;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/ajouterUtilisateur")
public class AjouterUtilisateur extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String json;
        try {
            // Récupérer les paramètres envoyés par le frontend
            String userName = request.getParameter("username");
            String pswd = request.getParameter("password");
            String email = request.getParameter("email");
            String roleNom = request.getParameter("role");
            String nom = request.getParameter("nomString");
            String prenom = request.getParameter("prenomString");
            String dateNaissanceStr = request.getParameter("dateNaissance");
            String sexe = request.getParameter("sexechar");
            String adresse = request.getParameter("adresseString");
            String telephone = request.getParameter("telephoneString");
            String matricule = request.getParameter("matriculeString");
            String dateEmbaucheStr = request.getParameter("dateEmbaucheString");
            String specialite = request.getParameter("specialitePrincipaleString");
            String cin = request.getParameter("cinString");
            String etatCivil = request.getParameter("etatCivilString");

            // Initialiser les DAO
            CompteDAO compteDAO = new CompteDAO();
            PersonnelDAO personnelDAO = new PersonnelDAO();
            RoleDAO roleDAO = new RoleDAO();

            // Vérifier si le rôle existe
            Role role = roleDAO.getRoleByNom(roleNom);
            if (role == null) {
                json = new Gson().toJson("Erreur : Rôle '" + roleNom + "' non trouvé.");
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                sendResponse(response, json);
                return;
            }

            // Création de l'objet Personnel
            Personnel personnel = new Personnel();
            personnel.setNom(nom);
            personnel.setPrenom(prenom);
            personnel.setSexe(sexe);
            personnel.setAdresse(adresse);
            personnel.setTelephone(telephone);
            personnel.setMatricule(matricule);
            personnel.setSpecialitePrincipale(specialite);
            personnel.setCin(cin);
            personnel.setEtatCivil(etatCivil);

            // Conversion des dates
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            if (dateNaissanceStr != null && !dateNaissanceStr.isEmpty()) {
                personnel.setDateNaissance(new Date(sdf.parse(dateNaissanceStr).getTime()));
            }
            if (dateEmbaucheStr != null && !dateEmbaucheStr.isEmpty()) {
                personnel.setDateEmbauche(new Date(sdf.parse(dateEmbaucheStr).getTime()));
            }

           

            // Création de l'objet Compte
            Compte compte = new Compte();
            compte.setEmail(email);
            compte.setNomUtilsateur(userName);
            compte.setPswd(pswd);
            compte.setRole(role);
            compte.setPersonnel(personnel);

            // Insérer le compte dans la base de données
            boolean compteInserted = compteDAO.ajouterCompte(compte);
            if (compteInserted) {
                json = new Gson().toJson("Utilisateur ajouté avec succès.");
                response.setStatus(HttpServletResponse.SC_OK);
            } else {
                json = new Gson().toJson("Erreur lors de l'ajout du compte.");
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        } catch (SQLException | ClassNotFoundException e) {
            json = new Gson().toJson("Erreur : Problème de base de données.");
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            e.printStackTrace();
        } catch (ParseException e) {
            json = new Gson().toJson("Erreur : Format de date invalide.");
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            e.printStackTrace();
        } catch (Exception e) {
            json = new Gson().toJson("Erreur inattendue : " + e.getMessage());
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            e.printStackTrace();
        }

        // Envoyer la réponse JSON
        sendResponse(response, json);
    }

    // Méthode utilitaire pour envoyer la réponse JSON
    private void sendResponse(HttpServletResponse response, String json) throws IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        try (java.io.PrintWriter out = response.getWriter()) {
            out.print(json);
            out.flush();
        }
    }
}

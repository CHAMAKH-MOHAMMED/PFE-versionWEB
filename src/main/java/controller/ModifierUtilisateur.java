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

@WebServlet("/admin/modifierUtilisateur")
public class ModifierUtilisateur extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String json;
        try {
            // Récupérer les paramètres envoyés par le frontend
            //info compte
            String userIdParam = request.getParameter("userId");
            String userName = request.getParameter("username");
            String pswd = request.getParameter("password");
            String email = request.getParameter("email");   
           
            
            //infopersonnele
            String emailP = request.getParameter("emailString");  
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

            // Vérifier si l'ID est présent
            if (userIdParam == null || userIdParam.isEmpty()) {
                json = new Gson().toJson("Erreur : Le paramètre 'id' est manquant.");
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // 400
            } else {
                int userId = Integer.parseInt(userIdParam);

                // Initialiser les DAO
                CompteDAO compteDAO = new CompteDAO();
                PersonnelDAO personnelDAO = new PersonnelDAO();
                RoleDAO roleDAO = new RoleDAO();

                // Récupérer l'utilisateur existant
                Compte compte = compteDAO.getCompte(userId);

                if (compte != null) {
                   

                    // Mettre à jour le rôle
                    Role role = roleDAO.getRoleByNom(roleNom);
                    if (role == null) {
                        json = new Gson().toJson("Erreur : Rôle '" + roleNom + "' non trouvé.");
                        response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // 400
                        sendResponse(response, json);
                        return;
                    }
                     // Mettre à jour les champs de Compte
                    compte.setEmail(email);
                    compte.setNomUtilsateur(userName);
                    compte.setPswd(pswd);
                    compte.setRole(role);

                    // Mettre à jour les informations du personnel
                    Personnel personnel = compte.getPersonnel();
                    if (personnel != null) {
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

                        // Mettre à jour le personnel dans la base de données
                        boolean personnelUpdated = personnelDAO.modifierPersonnel(personnel);
                        
                        if (!personnelUpdated) {
                            json = new Gson().toJson("Erreur lors de la mise à jour des informations personnelles.");
                            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // 500
                            sendResponse(response, json);
                            return;
                        }
                        boolean compteUpdate=compteDAO.updateCompte(compte);
                         if (!compteUpdate) {
                            json = new Gson().toJson("Erreur lors de la mise à jour des informations de compte.");
                            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // 500
                            sendResponse(response, json);
                            return;
                        }
                    } else {
                        json = new Gson().toJson("Erreur : Informations personnelles non trouvées pour cet utilisateur.");
                        response.setStatus(HttpServletResponse.SC_NOT_FOUND); // 404
                        sendResponse(response, json);
                        return;
                    }

                    // Mettre à jour le compte dans la base de données
                    boolean compteUpdated = compteDAO.updateCompte(compte);
                    if (compteUpdated) {
                        json = new Gson().toJson("Utilisateur mis à jour avec succès.");
                        response.setStatus(HttpServletResponse.SC_OK); // 200
                    } else {
                        json = new Gson().toJson("Erreur lors de la mise à jour du compte.");
                        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // 500
                    }
                } else {
                    json = new Gson().toJson("Aucun utilisateur trouvé avec l'ID : " + userId);
                    response.setStatus(HttpServletResponse.SC_NOT_FOUND); // 404
                }
            }
        } catch (NumberFormatException e) {
            json = new Gson().toJson("Erreur : Le paramètre 'id' doit être un nombre.");
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // 400
            e.printStackTrace();
        } catch (SQLException | ClassNotFoundException e) {
            json = new Gson().toJson("Erreur : Problème de base de données.");
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // 500
            e.printStackTrace();
        } catch (ParseException e) {
            json = new Gson().toJson("Erreur : Format de date invalide.");
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // 400
            e.printStackTrace();
        } catch (Exception e) {
            json = new Gson().toJson("Erreur inattendue : " + e.getMessage());
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // 500
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
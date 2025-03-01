package controller;

import entity.Compte;
import dao.CompteDAO;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/public/LoginServlet")
public class LoginServlet extends HttpServlet {

 

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String email = request.getParameter("email");
        String password = request.getParameter("passwordLog");
       
        Compte user = null;
        
        try {
            CompteDAO userDAO = new CompteDAO();
            user = userDAO.getUserByUsername(email);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace(); // Pour le débogage
            response.sendRedirect("login.jsp?error=db");
            return;
        }

        // Vérifier si l'utilisateur existe et si le mot de passe est correct
        if (user != null && user.getPswd()!= null && user.getPswd().equals(password)) {
            // Créer une session et stocker l'utilisateur
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            session.setAttribute("role", user.getRole().getRole());

            // Rediriger en fonction du rôle de l'utilisateur
            String direction = "/" + user.getRole().getRole() + "/home.jsp";
            response.sendRedirect(request.getContextPath() + direction);
        } else {
            // Rediriger vers la page de connexion avec un message d'erreur
            response.sendRedirect("login.jsp?error=1");
        }
    }
}

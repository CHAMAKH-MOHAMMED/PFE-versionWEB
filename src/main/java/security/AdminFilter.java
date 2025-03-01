package security;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/admin/*") // Appliquer ce filtre à toutes les pages sous /admin/
public class AdminFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false); // Ne pas créer de session si elle n'existe pas
        
        // Vérifier si l'utilisateur est authentifié et s'il a le rôle "admin"
        if (session == null || session.getAttribute("role") == null || 
            !session.getAttribute("role").equals("admin")) {
            
            // Rediriger vers la page de connexion
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/public/Authentifications.jsp");
            return; // Arrêter l'exécution du filtre ici
        }

        // Si l'utilisateur est admin, continuer la requête
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
       
    }
}

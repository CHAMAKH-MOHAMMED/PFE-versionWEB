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

@WebFilter("/patient/*") // Appliquer ce filtre aux   /patient/
public class PatientFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false); // Ne pas créer de session si elle n'existe pas
        
        // Vérifier si l'utilisateur est authentifié et a le rôle "patient"
        if (session == null || session.getAttribute("role") == null || 
            !session.getAttribute("role").equals("patient")) {
            
            // Rediriger vers la page de connexion
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/public/Authentifications.jsp");
            return; // Stopper l'exécution du filtre après la redirection
        }

        // Si l'utilisateur est un patient, continuer la requête
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // Nettoyage du filtre (optionnel)
    }
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import dao.ActionDAO;
import dao.TraitementDAO;
import dao.DossierMedicalDAO;
import dao.MaladieDAO;
import dao.PhaseDAO;
import dao.TestPsychologiqueDAO;
import java.io.IOException;
import java.io.PrintWriter;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import entity.Action;
import entity.Maladie;
import entity.Phase;
import entity.TestPsychologique;
import entity.Traitement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author vProme
 */
@WebServlet(name = "DossierMedical", urlPatterns = {"/medecin/DossierMedical"})
public class DossierMedical extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String json=null;
        //Recuperer l'Id du patient envoyee par le GET
        int id =Integer.parseInt(request.getParameter("id"));
        entity.DossierMedical dossierMedical= new entity.DossierMedical();
        DossierMedicalDAO dossierMedicalDAO =new  DossierMedicalDAO();
        PhaseDAO phaseDAO = new PhaseDAO();
        ActionDAO actionDAO = new ActionDAO();
        MaladieDAO maladieDAO = new MaladieDAO();
        TraitementDAO traitementDAO = new TraitementDAO();
        
        TestPsychologiqueDAO testPsychologiqueDAO = new TestPsychologiqueDAO();
        
        try {
            ArrayList<Phase>phases=new ArrayList<>();
            ArrayList<Maladie> maladies = new ArrayList<Maladie>();
            dossierMedical=dossierMedicalDAO.getByPatientId(id);
            maladies = maladieDAO.getByPatientId(id);
            for(Maladie mld:maladies){
                dossierMedical.addMaladie(mld);
            }
            phases = phaseDAO.getAllByProtocole(dossierMedical.getProtocoleSevrage());
            for(Phase phs:phases){
                ArrayList<Action>actions=new ArrayList<Action>();
                ArrayList<Traitement>traitements=new ArrayList<Traitement>();
                ArrayList<TestPsychologique>testPsychologiques=new ArrayList<TestPsychologique>();
                actions = actionDAO.getAllByPhase(phs);
                traitements= traitementDAO.getAllByPhase(phs);
                testPsychologiques=testPsychologiqueDAO.getAllByPhase(phs);
                for(Action act:actions){
                    phs.addActions(act);
                }
                for(Traitement trait:traitements){
                    phs.addTraitement(trait);
                }
                for(TestPsychologique testPsy:testPsychologiques){
                    phs.addTestPsychologique(testPsy);
                }
                dossierMedical.getProtocoleSevrage().addPhases(phs);
            }
            Gson gson = new GsonBuilder().setDateFormat("dd-MM-yyyy").create();
            json = gson.toJson(dossierMedical); 
        } catch (SQLException ex) {
            Logger.getLogger(DossierMedical.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(json);
        out.flush();
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

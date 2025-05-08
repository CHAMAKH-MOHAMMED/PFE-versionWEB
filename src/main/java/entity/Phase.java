package entity;

import java.util.ArrayList;

public class Phase {
	private int id;
	private String titre;
	private String description;
	private String page;
	private ArrayList<TestPsychologique> testPsychologiques = new ArrayList<TestPsychologique>();
	private ArrayList<AnalyseBioMedical> analyseBioMedicales = new ArrayList<AnalyseBioMedical>();
	private ArrayList<Traitement> traitements = new ArrayList<Traitement>();
	private ArrayList<Action> actions = new ArrayList<Action>();

    public Phase(int id, String titre, String description, String page) {
        this.id = id;
        this.titre = titre;
        this.description = description;
        this.page = page;
    }

    public Phase() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitre() {
        return titre;
    }

    public void setTitre(String titre) {
        this.titre = titre;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPage() {
        return page;
    }

    public void setPage(String page) {
        this.page = page;
    }

    public ArrayList<TestPsychologique> getTestPsychologique() {
        return testPsychologiques;
    }

    public void addTestPsychologique(TestPsychologique testPsychologique) {
        this.testPsychologiques.add(testPsychologique);
    }

    public ArrayList<AnalyseBioMedical> getAnalyseBioMedical() {
        return analyseBioMedicales;
    }

    public void addAnalyseBioMedical(AnalyseBioMedical analyseBioMedical) {
        this.analyseBioMedicales.add(analyseBioMedical);
    }

    public ArrayList<Traitement> getTraitement() {
        return traitements;
    }

    public void addTraitement(Traitement traitement) {
        this.traitements.add(traitement);
    }

    public ArrayList<Action> getActions() {
        return actions;
    }

    public void addActions(Action action) {
        this.actions.add(action);
    }

    @Override
    public String toString() {
        return "Phase{" + "id=" + id + ", titre=" + titre + ", description=" + description + ", page=" + page + ", testPsychologique=" + testPsychologiques + ", analyseBioMedical=" + analyseBioMedicales + ", traitement=" + traitements + ", actions=" + actions + '}';
    }
        
}
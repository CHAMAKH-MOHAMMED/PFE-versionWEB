package entity;

import java.util.ArrayList;

public class ProtocoleSevrage {
	private int id;
	private String titre;
	private String description;
	private String page;
	private ArrayList<Phase> phases = new ArrayList<Phase>();

    public ProtocoleSevrage(int id, String titre, String description, String page) {
        this.id = id;
        this.titre = titre;
        this.description = description;
        this.page = page;
    }

    public ProtocoleSevrage() {
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

    public ArrayList<Phase> getPhases() {
        return phases;
    }

    public void addPhases(Phase phase) {
        this.phases.add(phase);
    }

    @Override
    public String toString() {
        return "ProtocoleSevrage{" + "id=" + id + ", titre=" + titre + ", description=" + description + ", page=" + page + ", phases=" + phases + '}';
    }    
}
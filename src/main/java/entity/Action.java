package entity;
public class Action {
	private int id;
	private String titre;
	private String description;
	private Preuve preuve;

    public Action(int id, String titre, String description, Preuve preuve) {
        this.id = id;
        this.titre = titre;
        this.description = description;
        this.preuve = preuve;
    }

    public Action() {
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

    public Preuve getPreuve() {
        return preuve;
    }

    public void setPreuve(Preuve preuve) {
        this.preuve = preuve;
    }

    @Override
    public String toString() {
        return "Action{" + "id=" + id + ", titre=" + titre + ", description=" + description + ", preuve=" + preuve + '}';
    }
        
}
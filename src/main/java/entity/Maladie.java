package entity;

public class Maladie {
	private int id;
	private String titre;
	private String description;

    public Maladie(int id, String titre, String description) {
        this.id = id;
        this.titre = titre;
        this.description = description;
    }

    public Maladie() {
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

    @Override
    public String toString() {
        return "Maladie{" + "id=" + id + ", titre=" + titre + ", description=" + description + '}';
    }
	
}
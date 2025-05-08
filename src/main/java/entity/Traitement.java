package entity;

public class Traitement {
	private int id;
	private String titre;
	private String description;
        private Forme forme;

    public Traitement(int id, String titre, String description, Forme frome) {
        this.id = id;
        this.titre = titre;
        this.description = description;
        this.forme = forme;
    }

    public Traitement() {
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

    public Forme getForme() {
        return forme;
    }

    public void setForme(Forme forme) {
        this.forme = forme;
    }

    @Override
    public String toString() {
        return "Traitement{" + "id=" + id + ", titre=" + titre + ", description=" + description + ", forme=" + forme + '}';
    }
  	
}
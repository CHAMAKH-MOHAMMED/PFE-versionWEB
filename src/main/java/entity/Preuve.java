package entity;

public class Preuve {
	private int id;
	private String code;
	private String titre;
	private String description;

    public Preuve(int id, String code, String titre, String description) {
        this.id = id;
        this.code = code;
        this.titre = titre;
        this.description = description;
    }

    public Preuve() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
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
        return "Preuve{" + "id=" + id + ", code=" + code + ", titre=" + titre + ", description=" + description + '}';
    }
        
}
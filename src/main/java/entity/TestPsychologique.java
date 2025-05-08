package entity;

public class TestPsychologique {
	private int id;
	private String titre;
	private String description;
	private String page;

    public TestPsychologique(int id, String titre, String description, String page) {
        this.id = id;
        this.titre = titre;
        this.description = description;
        this.page = page;
    }

    public TestPsychologique() {
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

    @Override
    public String toString() {
        return "TestPsychologique{" + "id=" + id + ", titre=" + titre + ", description=" + description + ", page=" + page + '}';
    }
       
}
package entity;
import java.util.Date;
public class Consultation {
	private int id;
	private Date date;
	private String observation;
	private String compteRendu;
	private DossierMedical dossierMedical;
	private Phase phase;

    public Consultation(int id, Date date, String observation, String compteRendu, DossierMedical dossierMedical, Phase phase) {
        this.id = id;
        this.date = date;
        this.observation = observation;
        this.compteRendu = compteRendu;
        this.dossierMedical = dossierMedical;
        this.phase = phase;
    }

    public Consultation() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getObservation() {
        return observation;
    }

    public void setObservation(String observation) {
        this.observation = observation;
    }

    public String getCompteRendu() {
        return compteRendu;
    }

    public void setCompteRendu(String compteRendu) {
        this.compteRendu = compteRendu;
    }

    public DossierMedical getDossierMedical() {
        return dossierMedical;
    }

    public void setDossierMedical(DossierMedical dossierMedical) {
        this.dossierMedical = dossierMedical;
    }

    public Phase getPhase() {
        return phase;
    }

    public void setPhase(Phase phase) {
        this.phase = phase;
    }

    @Override
    public String toString() {
        return "Consultation{" + "id=" + id + ", date=" + date + ", observation=" + observation + ", compteRendu=" + compteRendu + ", dossierMedical=" + dossierMedical + ", phase=" + phase + '}';
    }
        
}
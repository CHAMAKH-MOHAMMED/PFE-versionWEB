package entity;
import java.util.ArrayList;

public class DossierMedical {
	private int id;
	private Patient patient;
	private ProtocoleSevrage protocoleSevrage;
	private ArrayList<Maladie> maladies = new ArrayList<Maladie>();
	public ArrayList<Consultation> consultations = new ArrayList<Consultation>();

    public DossierMedical(int id, Patient patient, ProtocoleSevrage protocoleSevrage) {
        this.id = id;
        this.patient = patient;
        this.protocoleSevrage = protocoleSevrage;
    }

    public DossierMedical() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    public ProtocoleSevrage getProtocoleSevrage() {
        return protocoleSevrage;
    }

    public void setProtocoleSevrage(ProtocoleSevrage protocoleSevrage) {
        this.protocoleSevrage = protocoleSevrage;
    }

    public ArrayList<Maladie> getMaladie() {
        return maladies;
    }

    public void addMaladie(Maladie maladie) {
        this.maladies.add(maladie);
    }

    public ArrayList<Consultation> getConsultations() {
        return consultations;
    }

    public void addConsultations(Consultation consultation) {
        this.consultations.add(consultation);
    }

    @Override
    public String toString() {
        return "DossierMedical{" + "id=" + id + ", patient=" + patient + ", protocoleSevrage=" + protocoleSevrage + ", maladie=" + maladies + ", consultations=" + consultations + '}';
    }
        
}
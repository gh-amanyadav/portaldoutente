package org.jboss.tools.example.springmvc.model;

import java.util.Calendar;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@NamedQueries({
	@NamedQuery(name=Medicacao.FIND_ALL_BY_UTENTE, query="SELECT m FROM Medicacao m WHERE m.numUtente = :" + Medicacao.UTENTE +" ORDER BY m.cal DESC"),
	@NamedQuery(name=Medicacao.DELETE, query="DELETE FROM Medicacao m WHERE m.id = :" + Medicacao.ID),
	@NamedQuery(name=Medicacao.FIND_BY_ID_AND_MED, query="SELECT m FROM Medicacao m WHERE m.numUtente = :" + Medicacao.UTENTE + " AND m.idMedicamento = :"+Medicacao.MEDICAMENTO),
	@NamedQuery(name=Medicacao.FIND_BY_ID, query="SELECT m FROM Medicacao m WHERE m.id = :" + Medicacao.ID)
})
public class Medicacao {

	
	@Id
	@JsonIgnore
	@GeneratedValue
	private int id;

	public static final String FIND_BY_ID_AND_MED = "Medicacao.findByIdAndMed";
	
	public static final String FIND_BY_ID = "Medicacao.findById";
	
	public static final String MEDICAMENTO = "medicamento";
	
	public static final String FIND_ALL_BY_UTENTE = "Medicacao.findAllByUtente";
	
	public static final String DELETE = "Medicacao.delete";
	
	public static final String UTENTE = "numUtente";
	
	public static final String ID = "id";
	
	@JsonIgnore
	private String numUtente;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Calendar cal;
	
	@JsonIgnore
	private int idMedicamento;
	
	private String nomeMedicamento;
	

	private boolean estado = false; //esta a true se o medico ja confirmou que esta medicao existe, caso nao tenha confirmado manter-se-a a falso


	private EstadoRenovacao renovacao;
	
	private Calendar validade;
	
	
	private double dose;
	
	private String indicacoes;
	
	private int comprimidosPorCaixa;
	
	public Medicacao(){}
	
	public Medicacao(String numUtente, int idMedicamento,String nomeMedicamento, double dose, String indicacoes, String renovacao, int comprimidosPorCaixa) {
		this.numUtente = numUtente;
		this.idMedicamento = idMedicamento;
		this.nomeMedicamento = nomeMedicamento;
		this.dose = dose;
		this.indicacoes = indicacoes;
		setRenovacao(renovacao);
		this.comprimidosPorCaixa = comprimidosPorCaixa;
		
		validade= Calendar.getInstance();
		validade.add(Calendar.MONTH, 6);
		
		
		cal = Calendar.getInstance();
		cal.add(Calendar.DATE, getDiasParaRenovacao() - 5);
	}
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNumUtente() {
		return numUtente;
	}

	public void setNumUtente(String numUtente) {
		this.numUtente = numUtente;
	}
	
	public String getNomeMedicamento() {
		return nomeMedicamento;
	}
	
	public void setNomeMedicamento(String nomeMedicamento) {
		this.nomeMedicamento = nomeMedicamento;
	}

	public Date getDataFinal() {
		return cal.getTime();
	}

	public void setCal(Calendar cal) {
		this.cal = cal;
	}
	
	public Date getValidade() {
		return validade.getTime();
	}
	
	public void setValidade(int meses) {
		validade.add(Calendar.MONTH, meses);
	}
	
	public String getRenovacao() {
		switch (renovacao) {
		case ACEITE:
			return "Aceite";
		case PENDENTE:
			return "Pendente";
		case CADUCADO:
			return "Caducado";
		default:
			return "Rejeitado";
		}
	}
	
	public void setRenovacao(String renovacao) {
		switch (renovacao) {
		case "Aceite":
			this.renovacao = EstadoRenovacao.ACEITE;
		case "Pendente":
			this.renovacao = EstadoRenovacao.PENDENTE;
		case "Caducado":
			this.renovacao = EstadoRenovacao.CADUCADO;
		default:
			this.renovacao = EstadoRenovacao.REJEITADO;
	}
	}

	public int getIdMedicamento() {
		return idMedicamento;
	}

	public void setIdMedicamento(int idMedicamento) {
		this.idMedicamento = idMedicamento;
	}

	public double getDose() {
		return dose;
	}

	public void setDose(double dose) {
		this.dose = dose;
	}
	
	public boolean getEstado() {
		return estado;
	}
	
	public void setEstado(boolean estado) {
		this.estado = estado;
	}

	public String getIndicacoes() {
		return indicacoes;
	}

	public void setIndicacoes(String indicacoes) {
		this.indicacoes = indicacoes;
	}

	public int getDiasParaRenovacao() {
		return (int) (comprimidosPorCaixa/dose);
	}
	
	public boolean renovarMedicacao() {
		Calendar cenas = Calendar.getInstance();
		if (cenas.before(validade) && cenas.after(cal) && estado && renovacao==EstadoRenovacao.CADUCADO) {
			renovacao=EstadoRenovacao.ACEITE;
			return true;
		}
		else if (renovacao == EstadoRenovacao.PENDENTE) {
			return true;
		}
		return false;
	}
	
	
	
	public boolean checkMedicacao() {
		Calendar cenas = Calendar.getInstance();
		if (cenas.after(validade)) {
			renovacao = EstadoRenovacao.REJEITADO;
			return false;
		}
		else if (renovacao == EstadoRenovacao.CADUCADO) {
			return false;
		}
		else if (cenas.after(cal)) {
			setRenovacao("Caducado");
			return false;
		}
		else {
			return true;
		}
	}
}

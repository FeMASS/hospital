/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entidade;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;

/**
 *
 * @author Alzemand
 */
@Entity
@NamedQuery(name="Remedio.listarTodos", query = "select p from Remedio p")
public class Remedio implements Serializable {

   

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String nome;
    private String indicacao;
    private String contraindicacao;
    private String bula;
    
//    @OneToMany(mappedBy = "remedio")
//    private List<Funcionario> funcionarios;
//
//    public List<Funcionario> getFuncionarios() {
//        return funcionarios;
//    }
//
//    public void setFuncionarios(List<Funcionario> funcionarios) {
//        this.funcionarios = funcionarios;
//    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getIndicacao() {
        return indicacao;
    }

    public void setIndicacao(String indicacao) {
        this.indicacao = indicacao;
    }

    public String getContraindicacao() {
        return contraindicacao;
    }

    public void setContraindicacao(String contraindicacao) {
        this.contraindicacao = contraindicacao;
    }

    public String getBula() {
        return bula;
    }

    public void setBula(String bula) {
        this.bula = bula;
    }
    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Remedio)) {
            return false;
        }
        Remedio other = (Remedio) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return nome;
    }
    
}

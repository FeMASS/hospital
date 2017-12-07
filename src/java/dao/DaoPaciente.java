/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entidade.Paciente;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.TypedQuery;

/**
 *
 * @author Alzemand
 */
public class DaoPaciente {

    
    public void cadastrar(Paciente c) {
        EntityManagerFactory emf;
        emf = FabricaConexao.getConexao();
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        
        em.persist(c);
        em.getTransaction().commit();
        em.close();
        
    }

    
    public void alterar(Paciente c) {
        EntityManagerFactory emf = FabricaConexao.getConexao();
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        
        em.merge(c);
        em.getTransaction().commit();
        em.close();
        
    }

    
    public void excluir(Long id) {
        EntityManagerFactory emf = FabricaConexao.getConexao();
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        Paciente c = em.find(Paciente.class, id);
        em.remove(c);
        em.getTransaction().commit();
        em.close();
        
    }

   
    public List listarTodos() {
        EntityManagerFactory emf = FabricaConexao.getConexao();
        EntityManager em = emf.createEntityManager();
        TypedQuery<Paciente> query = em.createNamedQuery("Paciente.listarTodos", Paciente.class);
        List<Paciente> lista = query.getResultList();
        em.close();
        return lista;
    }

    
    public Paciente listarPorId(Long id) {
        EntityManagerFactory emf = FabricaConexao.getConexao();
        EntityManager em = emf.createEntityManager();
        Paciente c;
        c = em.find(Paciente.class, id);
        em.close();
        return c;
    }
    
}

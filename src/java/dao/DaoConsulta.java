/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entidade.Paciente;
import entidade.Consulta;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.TypedQuery;

/**
 *
 * @author Alzemand
 */
public class DaoConsulta{

    
    public void cadastrar(Consulta p) {
        EntityManagerFactory emf = FabricaConexao.getConexao();
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        em.persist(p);
        em.getTransaction().commit();
        em.close();
        
    }

    
    public void alterar(Consulta p) {
        EntityManagerFactory emf = FabricaConexao.getConexao();
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        em.merge(p);
        em.getTransaction().commit();
        em.close();
    }

    
    public void excluir(Long id) {
        EntityManagerFactory emf = FabricaConexao.getConexao();
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        Consulta p = em.find(Consulta.class, id);
        em.remove(p);
        em.getTransaction().commit();
        em.close();
    }

    
    public List listarTodos() {
        EntityManagerFactory emf = FabricaConexao.getConexao();
        EntityManager em = emf.createEntityManager();
        TypedQuery<Consulta> query = em.createNamedQuery("Consulta.listarTodos", Consulta.class);
        List<Consulta> lista = query.getResultList();
        em.close();
        return lista;
    }

    
    public Consulta listarPorId(Long id) {
        EntityManagerFactory emf = FabricaConexao.getConexao();
        EntityManager em = emf.createEntityManager();
        Consulta p;
        p = em.find(Consulta.class, id);
        em.close();
        return p;
    }
    
    
    public List listarConsultasPorPaciente(Paciente paciente){
    
        EntityManagerFactory emf = FabricaConexao.getConexao();
        EntityManager em = emf.createEntityManager();
        
            String sql = "select p from Consulta p "+
                         "where p.paciente = :paciente";
        
        
        TypedQuery<Consulta> query = (TypedQuery<Consulta>) em.createQuery(sql, Consulta.class);
        query.setParameter("paciente", paciente);
        List<Consulta> lista = query.getResultList();
        em.close();
        return lista;
}
    
    
}

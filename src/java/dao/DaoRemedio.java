/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entidade.Remedio;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.TypedQuery;

/**
 *
 * @author Alzemand
 */
public class DaoRemedio {

    
    public void cadastrar(Remedio c) {
        EntityManagerFactory emf;
        emf = FabricaConexao.getConexao();
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        em.persist(c);
        em.getTransaction().commit();
        em.close();
        
    }

    
    public void alterar(Remedio c) {
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
        Remedio c = em.find(Remedio.class, id);
        em.remove(c);
        em.getTransaction().commit();
        em.close();
        
    }

   
    public List listarTodos() {
        EntityManagerFactory emf = FabricaConexao.getConexao();
        EntityManager em = emf.createEntityManager();
        TypedQuery<Remedio> query = em.createNamedQuery("Remedio.listarTodos", Remedio.class);
        List<Remedio> lista = query.getResultList();
        em.close();
        return lista;
    }

    
    public Remedio listarPorId(Long id) {
        EntityManagerFactory emf = FabricaConexao.getConexao();
        EntityManager em = emf.createEntityManager();
        Remedio c;
        c = em.find(Remedio.class, id);
        em.close();
        return c;
    }
    
}

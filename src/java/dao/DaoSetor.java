/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entidade.Setor;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.TypedQuery;

/**
 *
 * @author Alzemand
 */
public class DaoSetor {

    
    public void cadastrar(Setor c) {
        EntityManagerFactory emf;
        emf = FabricaConexao.getConexao();
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        
        em.persist(c);
        em.getTransaction().commit();
        em.close();
        
    }

    
    public void alterar(Setor c) {
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
        Setor c = em.find(Setor.class, id);
        em.remove(c);
        em.getTransaction().commit();
        em.close();
        
    }

   
    public List listarTodos() {
        EntityManagerFactory emf = FabricaConexao.getConexao();
        EntityManager em = emf.createEntityManager();
        TypedQuery<Setor> query = em.createNamedQuery("Setor.listarTodos", Setor.class);
        List<Setor> lista = query.getResultList();
        em.close();
        return lista;
    }

    
    public Setor listarPorId(Long id) {
        EntityManagerFactory emf = FabricaConexao.getConexao();
        EntityManager em = emf.createEntityManager();
        Setor c;
        c = em.find(Setor.class, id);
        em.close();
        return c;
    }
    
}

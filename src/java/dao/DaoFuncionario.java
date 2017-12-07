/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entidade.Setor;
import entidade.Funcionario;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.TypedQuery;

/**
 *
 * @author Alzemand
 */
public class DaoFuncionario{

    
    public void cadastrar(Funcionario p) {
        EntityManagerFactory emf = FabricaConexao.getConexao();
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        em.persist(p);
        em.getTransaction().commit();
        em.close();
        
    }

    
    public void alterar(Funcionario p) {
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
        Funcionario p = em.find(Funcionario.class, id);
        em.remove(p);
        em.getTransaction().commit();
        em.close();
    }

    
    public List listarTodos() {
        EntityManagerFactory emf = FabricaConexao.getConexao();
        EntityManager em = emf.createEntityManager();
        TypedQuery<Funcionario> query = em.createNamedQuery("Funcionario.listarTodos", Funcionario.class);
        List<Funcionario> lista = query.getResultList();
        em.close();
        return lista;
    }

    
    public Funcionario listarPorId(Long id) {
        EntityManagerFactory emf = FabricaConexao.getConexao();
        EntityManager em = emf.createEntityManager();
        Funcionario p;
        p = em.find(Funcionario.class, id);
        em.close();
        return p;
    }
    
    
    public List listarFuncionariosPorSetor(Setor setor){
    
        EntityManagerFactory emf = FabricaConexao.getConexao();
        EntityManager em = emf.createEntityManager();
        
            String sql = "select p from Funcionario p "+
                         "where p.setor = :setor";
        
        
        TypedQuery<Funcionario> query = (TypedQuery<Funcionario>) em.createQuery(sql, Funcionario.class);
        query.setParameter("setor", setor);
        List<Funcionario> lista = query.getResultList();
        em.close();
        return lista;
}
    
    
}

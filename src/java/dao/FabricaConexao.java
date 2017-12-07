/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author Alzemand
 */
public class FabricaConexao {
    private static EntityManagerFactory emf;
    public static EntityManagerFactory getConexao(){
        if (emf != null) {
            return emf;
        } else {
            emf = Persistence.createEntityManagerFactory("hospitalPU");
            return emf;
        }
        
    }

    /*
    public static EntityManagerFactory getConexao(){
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("DespensaVirtualJPAPU");
        return emf;
    }
*/
}

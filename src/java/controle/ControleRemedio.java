/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import dao.DaoRemedio;
import entidade.Remedio;
import java.sql.SQLException;
import java.util.List;
import javax.swing.JComboBox;
import javax.swing.JList;

/**
 *
 * @author Alzemand
 */
public class ControleRemedio {
    public void gravar(Remedio c) throws SQLException{
        if(c.getId()==null){
            cadastrar(c);
        }else{
            alterar(c);
        }
    }
    
    
    
    private void cadastrar(Remedio c) throws SQLException{
        DaoRemedio dao = new DaoRemedio();
        dao.cadastrar(c);
    }
    
    private void alterar(Remedio c) throws SQLException{
        DaoRemedio dao = new DaoRemedio();
        dao.alterar(c);
    }
    public void atualizarListaRemedios(JList listaRemedios) throws SQLException{
        DaoRemedio dao = new DaoRemedio();        
        List pacientes = dao.listarTodos();
        listaRemedios.setListData(pacientes.toArray());
    }
    
    public void atualizarCboRemedios(JComboBox cboRemedios) throws SQLException{
        DaoRemedio dao = new DaoRemedio();        
        List pacientes = dao.listarTodos();
        cboRemedios.removeAllItems();
        cboRemedios.addItem("");
        for(Object o : pacientes){
            cboRemedios.addItem(o);
        }
    }
    
    public void excluir(Long id) throws SQLException{
        DaoRemedio dao = new DaoRemedio();
        dao.excluir(id);
    }
    
    public List listarRemedios() throws SQLException{
        DaoRemedio dao = new DaoRemedio();        
        return dao.listarTodos();
        
    }
    
    public Remedio listarRemedioPorId(Long id) throws SQLException{
        DaoRemedio dao = new DaoRemedio();        
        return dao.listarPorId(id);
    }
}

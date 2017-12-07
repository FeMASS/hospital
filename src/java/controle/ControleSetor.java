/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import dao.DaoSetor;
import entidade.Setor;
import java.sql.SQLException;
import java.util.List;
import javax.swing.JComboBox;
import javax.swing.JList;

/**
 *
 * @author Alzemand
 */
public class ControleSetor {
    public void gravar(Setor c) throws SQLException{
        if(c.getId()==null){
            cadastrar(c);
        }else{
            alterar(c);
        }
    }
    
    
    
    private void cadastrar(Setor c) throws SQLException{
        DaoSetor dao = new DaoSetor();
        dao.cadastrar(c);
    }
    
    private void alterar(Setor c) throws SQLException{
        DaoSetor dao = new DaoSetor();
        dao.alterar(c);
    }
    public void atualizarListaSetors(JList listaSetors) throws SQLException{
        DaoSetor dao = new DaoSetor();        
        List pacientes = dao.listarTodos();
        listaSetors.setListData(pacientes.toArray());
    }
    
    public void atualizarCboSetors(JComboBox cboSetors) throws SQLException{
        DaoSetor dao = new DaoSetor();        
        List pacientes = dao.listarTodos();
        cboSetors.removeAllItems();
        cboSetors.addItem("");
        for(Object o : pacientes){
            cboSetors.addItem(o);
        }
    }
    
    public void excluir(Long id) throws SQLException{
        DaoSetor dao = new DaoSetor();
        dao.excluir(id);
    }
    
    public List listarSetors() throws SQLException{
        DaoSetor dao = new DaoSetor();        
        return dao.listarTodos();
        
    }
    
    public Setor listarSetorPorId(Long id) throws SQLException{
        DaoSetor dao = new DaoSetor();        
        return dao.listarPorId(id);
    }
}

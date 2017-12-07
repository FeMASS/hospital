/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import dao.DaoPaciente;
import entidade.Paciente;
import java.sql.SQLException;
import java.util.List;
import javax.swing.JComboBox;
import javax.swing.JList;

/**
 *
 * @author Alzemand
 */
public class ControlePaciente {
    public void gravar(Paciente c) throws SQLException{
        if(c.getId()==null){
            cadastrar(c);
        }else{
            alterar(c);
        }
    }
    
    
    
    private void cadastrar(Paciente c) throws SQLException{
        DaoPaciente dao = new DaoPaciente();
        dao.cadastrar(c);
    }
    
    private void alterar(Paciente c) throws SQLException{
        DaoPaciente dao = new DaoPaciente();
        dao.alterar(c);
    }
    public void atualizarListaPacientes(JList listaPacientes) throws SQLException{
        DaoPaciente dao = new DaoPaciente();        
        List pacientes = dao.listarTodos();
        listaPacientes.setListData(pacientes.toArray());
    }
    
    public void atualizarCboPacientes(JComboBox cboPacientes) throws SQLException{
        DaoPaciente dao = new DaoPaciente();        
        List pacientes = dao.listarTodos();
        cboPacientes.removeAllItems();
        cboPacientes.addItem("");
        for(Object o : pacientes){
            cboPacientes.addItem(o);
        }
    }
    
    public void excluir(Long id) throws SQLException{
        DaoPaciente dao = new DaoPaciente();
        dao.excluir(id);
    }
    
    public List listarPacientes() throws SQLException{
        DaoPaciente dao = new DaoPaciente();        
        return dao.listarTodos();
        
    }
    
    public Paciente listarPacientePorId(Long id) throws SQLException{
        DaoPaciente dao = new DaoPaciente();        
        return dao.listarPorId(id);
    }
}


package controle;

import dao.DaoFuncionario;
import entidade.Setor;
import entidade.Funcionario;
import java.sql.SQLException;
import java.util.List;
import javax.swing.JComboBox;
import javax.swing.JList;

/**
 *
 * @author Alzemand
 */
public class ControleFuncionario {
    public void gravar(Funcionario p) throws SQLException{
        if(p.getId()==null){
            cadastrar(p);
        }else{
            alterar(p);
        }
    }
    private void cadastrar(Funcionario p) throws SQLException{
        DaoFuncionario dao = new DaoFuncionario();
        dao.cadastrar(p);
    }
    
    private void alterar(Funcionario p) throws SQLException{
        DaoFuncionario dao = new DaoFuncionario();
        dao.alterar(p);
    }
    public void atualizarListaFuncionarios(JList listaFuncionarios) throws SQLException{
        DaoFuncionario dao = new DaoFuncionario();        
        List consultas = dao.listarTodos();
        listaFuncionarios.setListData(consultas.toArray());
    }
    
    public void atualizarCboFuncionarios(JComboBox cboFuncionarios) throws SQLException{
        DaoFuncionario dao = new DaoFuncionario();        
        List consultas = dao.listarTodos();
        cboFuncionarios.removeAllItems();
        cboFuncionarios.addItem("");
        for(Object o : consultas){
            cboFuncionarios.addItem(o);
        }
    }
    
    public void excluir(Long id) throws SQLException{
        DaoFuncionario dao = new DaoFuncionario();
        dao.excluir(id);
    }
    
    public void atualizarListaFuncionariosPorSetor(Setor paciente, JList listaFuncionarios) throws SQLException{
        DaoFuncionario dao = new DaoFuncionario();        
        List consultas = dao.listarFuncionariosPorSetor(paciente);
        listaFuncionarios.setListData(consultas.toArray());
    }
    
    public List listarFuncionarios() throws SQLException{
        DaoFuncionario dao = new DaoFuncionario();        
        return dao.listarTodos();
        
    }
    
    public Funcionario listarFuncionarioPorId(Long id) throws SQLException{
        DaoFuncionario dao = new DaoFuncionario();        
        return dao.listarPorId(id);
    }
    
}

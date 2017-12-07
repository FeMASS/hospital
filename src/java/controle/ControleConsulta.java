
package controle;

import dao.DaoConsulta;
import entidade.Paciente;
import entidade.Consulta;
import java.sql.SQLException;
import java.util.List;
import javax.swing.JComboBox;
import javax.swing.JList;

/**
 *
 * @author Alzemand
 */
public class ControleConsulta {
    public void gravar(Consulta p) throws SQLException{
        if(p.getId()==null){
            cadastrar(p);
        }else{
            alterar(p);
        }
    }
    private void cadastrar(Consulta p) throws SQLException{
        DaoConsulta dao = new DaoConsulta();
        dao.cadastrar(p);
    }
    
    private void alterar(Consulta p) throws SQLException{
        DaoConsulta dao = new DaoConsulta();
        dao.alterar(p);
    }
    public void atualizarListaConsultas(JList listaConsultas) throws SQLException{
        DaoConsulta dao = new DaoConsulta();        
        List consultas = dao.listarTodos();
        listaConsultas.setListData(consultas.toArray());
    }
    
    public void atualizarCboConsultas(JComboBox cboConsultas) throws SQLException{
        DaoConsulta dao = new DaoConsulta();        
        List consultas = dao.listarTodos();
        cboConsultas.removeAllItems();
        cboConsultas.addItem("");
        for(Object o : consultas){
            cboConsultas.addItem(o);
        }
    }
    
    public void excluir(Long id) throws SQLException{
        DaoConsulta dao = new DaoConsulta();
        dao.excluir(id);
    }
    
    public void atualizarListaConsultasPorPaciente(Paciente paciente, JList listaConsultas) throws SQLException{
        DaoConsulta dao = new DaoConsulta();        
        List consultas = dao.listarConsultasPorPaciente(paciente);
        listaConsultas.setListData(consultas.toArray());
    }
    
    public List listarConsultas() throws SQLException{
        DaoConsulta dao = new DaoConsulta();        
        return dao.listarTodos();
        
    }
    
    public Consulta listarConsultaPorId(Long id) throws SQLException{
        DaoConsulta dao = new DaoConsulta();        
        return dao.listarPorId(id);
    }
    
}

<%@page import="controle.ControleConsulta"%>
<%@page import="entidade.Consulta"%>
<%@page import="controle.ControlePaciente"%>
<%@page import="entidade.Paciente"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="shared/head.html" %>

        <title>Hospital Online</title>
    </head>
    <body>
        <%@include file="shared/navbar.html" %>
        <%@include file="shared/banner.html" %>
        <div class="container">

            <div class="row">
                <div class="col s12 m12">
                    <div class="">

                        <h5 class="center">Cadastrar consulta</h5>

                        <form method="GET" action="gravarConsulta.jsp" class="col s15">
                            <% ControleConsulta controle = new ControleConsulta();
                                ControlePaciente controlePaciente = new ControlePaciente();
                                String id = request.getParameter("id");
                                Consulta p = null;
                                if (id != null) {
                                    p = controle.listarConsultaPorId(new Long(id));
                            %>
                            <div class="input-field col s12">
                                <input readonly value="<%=request.getParameter("id")%>" name="id" id="id" type="text" class="validate">
                                <label for="id">Número</label>
                            </div>
                            <%}%>
                            <div class="input-field col s12">
                                <select required="true" id="paciente" name="paciente" class="validate">
                                    <option value="" disabled selected>Paciente Atendido</option>
                                    <%  List<Paciente> pacientes = controlePaciente.listarPacientes();
                                        for (Paciente c : pacientes) {%>
                                    <option value="<%=c.getId()%>" <%=p != null ? p.getPaciente().getId() == c.getId() ? "selected" : "" : ""%>><%=c.getNome()%></option>

                                    <%}%>
                                </select>
                                <label for="paciente">Paciente</label>
                            </div>
                                <div class="input-field col s12">
                                    <input id="dataConsulta " name="dataConsulta" type="text" class="validate" value="<%=p != null ? p.getDataConsulta() : ""%>">
                                    <label for="dataConsulta">Data</label>
                                </div>

                            <div class="input-field col s12">
                                <textarea id="relatosPaciente" name="relatosPaciente" class="materialize-textarea"><%=p != null ? p.getRelatosPaciente() : ""%></textarea>
                                <label for="relatosPaciente">Relatos do Paciente</label>
                            </div>
                                
                                <div class="input-field col s12">
                                <textarea id="medicacoes" name="medicacoes" class="materialize-textarea"><%=p != null ? p.getMedicacoes() : ""%></textarea>
                                <label for="medicacoes">Medicações Prescritas</label>
                            </div>
                                
                                <div class="input-field col s12">
                                <textarea id="exames" name="exames" class="materialize-textarea"><%=p != null ? p.getExames() : ""%></textarea>
                                <label for="exames">Exames Solicitados</label>
                            </div>
                            <div class="input col s12">
                                <button class="btn waves-effect waves-light" type="submit" name="gravar">Cadastrar
                                    <i class="material-icons right">add</i>
                                </button>
                                <button class="btn waves-effect waves-light" type="reset" name="limpar">Limpar
                                    <i class="material-icons right">clear</i>
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col s12 m12">
                    <div class="icon-block">
                        <br><br><br>
                        <h5 class="center">Minhas consultas</h5>
                        <table>
                            <thead>
                                <tr>
                                    <th>Paciente</th>
                                    <th>Data</th>
                                    <th>Relatos do paciente</th>
                                    <th>Medicações</th>
                                    <th>Exames</th>
                                    <th class="right">Ações</th>
                                </tr>
                            </thead>
                            <tbody> 
                                <%
                                    List consultas = controle.listarConsultas();
                                    for (Object o : consultas) {
                                        Consulta consulta = (Consulta) o;
                                %>
                                <tr>
    
                                    <td><%=consulta.getPaciente().getNome()%></td>
                                    <td><%=consulta.getDataConsulta()%></td>
                                    <td><%=consulta.getRelatosPaciente()%></td>
                                    <td><%=consulta.getMedicacoes()%></td>
                                    <td><%=consulta.getExames()%></td>

                                    <td><a href="excluirConsulta.jsp?id=<%=consulta.getId()%>"><i class="material-icons right">delete</i></a>
                                        <a href="consulta.jsp?id=<%=consulta.getId()%>"><i class="material-icons waves-light right">create</i></a></td>
                                </tr>          
                                <%}%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <br><br>
        </div>
        <%@include file="shared/footer.html" %>  
    </body>
</html>
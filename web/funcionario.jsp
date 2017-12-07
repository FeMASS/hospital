<%@page import="controle.ControleFuncionario"%>
<%@page import="entidade.Funcionario"%>
<%@page import="controle.ControleSetor"%>
<%@page import="entidade.Setor"%>
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

                        <h5 class="center">Cadastrar funcionario</h5>

                        <form method="GET" action="gravarFuncionario.jsp" class="col s15">
                            <% ControleFuncionario controle = new ControleFuncionario();
                                ControleSetor controleSetor = new ControleSetor();
                                String id = request.getParameter("id");
                                Funcionario p = null;
                                if (id != null) {
                                    p = controle.listarFuncionarioPorId(new Long(id));
                            %>
                            <div class="input-field col s12">
                                <input readonly value="<%=request.getParameter("id")%>" name="id" id="id" type="text" class="validate">
                                <label for="id">Número</label>
                            </div>
                            <%}%>
                            <div class="input-field col s12">
                                <select required="true" id="setor" name="setor" class="validate">
                                    <option value="" disabled selected>Setor Atendido</option>
                                    <%  List<Setor> setors = controleSetor.listarSetors();
                                        for (Setor c : setors) {%>
                                    <option value="<%=c.getId()%>" <%=p != null ? p.getSetor().getId() == c.getId() ? "selected" : "" : ""%>><%=c.getNome()%></option>

                                    <%}%>
                                </select>
                                <label for="setor">Setor</label>
                            </div>
                                <div class="input-field col s12">
                                    <input id="nomeFuncionario " name="nomeFuncionario" type="text" class="validate" value="<%=p != null ? p.getNome(): ""%>">
                                    <label for="nomeFuncionario">Nome</label>
                                </div>

                            <div class="input-field col s12">
                                <input id="matricula " name="matricula" type="text" class="validate" value="<%=p != null ? p.getMatricula(): ""%>">
                                <label for="matricula">Matricula do Funcionário</label>
                            </div>
                                
                            <div class="input-field col s12">
                                <input id="turno " name="turno" type="text" class="validate" value="<%=p != null ? p.getTurno(): ""%>">
                                <label for="exames">Turno</label>
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
                        <h5 class="center">Meus funcionarios</h5>
                        <table>
                            <thead>
                                <tr>
                                    <th>Setor</th>
                                    <th>Nome</th>
                                    <th>Matricula</th>
                                    <th>Turno</th>
                                    <th class="right">Ações</th>
                                </tr>
                            </thead>
                            <tbody> 
                                <%
                                    List funcionarios = controle.listarFuncionarios();
                                    for (Object o : funcionarios) {
                                        Funcionario funcionario = (Funcionario) o;
                                %>
                                <tr>
    
                                    <td><%=funcionario.getSetor().getNome()%></td>
                                    <td><%=funcionario.getNome()%></td>
                                    <td><%=funcionario.getMatricula()%></td>
                                    <td><%=funcionario.getTurno()%></td>

                                    <td><a href="excluirFuncionario.jsp?id=<%=funcionario.getId()%>"><i class="material-icons right">delete</i></a>
                                        <a href="funcionario.jsp?id=<%=funcionario.getId()%>"><i class="material-icons waves-light right">create</i></a></td>
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
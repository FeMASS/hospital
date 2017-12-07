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
            <div class="section">     
                <div class="row">
                    <div class="col s12 m12">
                        <div class="icon-block">

                            <h5 class="center">Cadastrar paciente</h5>

                            <form method="GET" action="gravarPaciente.jsp">
                                <% ControlePaciente controle = new ControlePaciente();
                                    String id = request.getParameter("id");
                                    Paciente p = null;
                                    if (id != null) {
                                        p = controle.listarPacientePorId(new Long(id));

                                %>
                                <div class="input-field col s12">
                                    <input readonly value="<%=request.getParameter("id")%>" name="id" id="id" type="text" type="text" class="validate">
                                    <label for="id">Número</label>
                                </div>
                                <%}%>
                                <div class="input-field col s12">
                                    <input id="nome" name="nome" type="text" class="validate" value="<%=p != null ? p.getNome() : ""%>">
                                    <label for="nome">Nome</label>
                                </div>

                                <div class="input-field col s12">
                                    <input id="endereco " name="endereco" type="text" class="validate" value="<%=p != null ? p.getEndereco() : ""%>">
                                    <label for="endereco">Endereço</label>
                                </div>

                                <div class="input-field col s12">
                                    <input id="celular" name="celular" type="text" class="validate" value="<%=p != null ? p.getCelular() : ""%>">
                                    <label for="celular">Celular</label>
                                </div>

                                <div class="input-field col s12">
                                    <input id="email" name="email" type="text" class="validate" value="<%=p != null ? p.getEmail() : ""%>">
                                    <label for="email">E-mail</label>
                                </div>

                                <div class="input-field col s12">
                                    <input id="tipoSanguineo" name="tipoSanguineo" type="text" class="validate" value="<%=p != null ? p.getTipoSanguineo() : ""%>">
                                    <label for="tipoSanguineo">Tipo Sanguíneo</label>
                                </div>

                                <div class="input-field col s12">
                                    <input id="fatorRh" name="fatorRh" type="text" class="validate" value="<%=p != null ? p.getFatorRh() : ""%>">
                                    <label for="fatorRh">Fator RH</label>
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
                            <h5 class="center">Pacientes cadastrados</h5>
                            <table>
                                <thead>
                                    <tr>
                                        <th>Nome</th>
                                        <th>Endereço</th>
                                        <th>Celular</th>
                                        <th>E-mail</th>
                                        <th>Tipo Sanguíneo</th>
                                        <th>Fator RH</th>
                                        
                                        <th class="right">Ações</th>
                                    </tr>
                                </thead>

                                <tbody> 
                                    <%
                                        List pacientes = controle.listarPacientes();
                                        for (Object o : pacientes) {
                                            Paciente paciente = (Paciente) o;

                                    %>
                                    <tr>
                                        <td><%=paciente.getNome()%></td>
                                        <td><%=paciente.getEndereco()%></td>  
                                        <td><%=paciente.getCelular()%></td> 
                                        <td><%=paciente.getEmail()%></td> 
                                        <td><%=paciente.getTipoSanguineo()%></td> 
                                        <td><%=paciente.getFatorRh()%></td> 
                                        <td><a href="excluirPaciente.jsp?id=<%=paciente.getId()%>"><i class="material-icons right">delete</i></a>
                                            <a href="paciente.jsp?id=<%=paciente.getId()%>"><i class="material-icons right">create</i></a></td>
                                    </tr>          
                                    <%}%>
                                </tbody>
                            </table>


                        </div>
                    </div>


                </div>

            </div>
            <br><br>
        </div>
        <%@include file="shared/footer.html" %>  
    </body>
</html>
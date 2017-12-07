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
        <div class="container">
            <div class="section">     
                <div class="row">
                    <div style="display:none" class="col s12 m12">
                        <div class="icon-block">

                            <h5 class="center">Cadastrar setor</h5>

                            <form method="GET" action="gravarSetor.jsp">
                                <% ControleSetor controle = new ControleSetor();
                                    String id = request.getParameter("id");
                                    Setor p = null;
                                    if (id != null) {
                                        p = controle.listarSetorPorId(new Long(id));

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
                                    <input id="predio" name="predio" type="text" class="validate" value="<%=p != null ? p.getPredio(): ""%>">
                                    <label for="endereco">Prédio</label>
                                </div>

                                <div class="input-field col s12">
                                    <input id="sala" name="sala" type="text" class="validate" value="<%=p != null ? p.getSala(): ""%>">
                                    <label for="celular">Sala</label>
                                </div>

                                <div class="input-field col s12">
                                    <input id="numero" name="numero" type="text" class="validate" value="<%=p != null ? p.getNumero(): ""%>">
                                    <label for="numero">Número</label>
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
                                <h5 class="center">Relatório geral dos setores cadastrados</h5><br><br>
                            <table>
                                <thead>
                                    <tr>
                                        <th>Nome</th>
                                        <th>Prédio</th>
                                        <th>Sala</th>
                                        <th>Número</th>
                                        
                                    </tr>
                                </thead>

                                <tbody> 
                                    <%
                                        List setors = controle.listarSetors();
                                        for (Object o : setors) {
                                            Setor setor = (Setor) o;

                                    %>
                                    <tr>
                                        <td><%=setor.getNome()%></td>
                                        <td><%=setor.getPredio()%></td>  
                                        <td><%=setor.getSala()%></td> 
                                        <td><%=setor.getPredio()%></td> 

                                       
                                    </tr>          
                                    <%}%>
                                </tbody>
                            </table>


                        </div>
                    </div>


                </div>

            </div>
            <br><br>
        </div><br><br><br><br><br>
        <%@include file="shared/footer.html" %>  
    </body>
</html>
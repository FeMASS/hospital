<%@page import="controle.ControleRemedio"%>
<%@page import="entidade.Remedio"%>
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

                            <h5 class="center">Cadastrar remédio</h5>

                            <form method="GET" action="gravarRemedio.jsp">
                                <% ControleRemedio controle = new ControleRemedio();
                                    String id = request.getParameter("id");
                                    Remedio p = null;
                                    if (id != null) {
                                        p = controle.listarRemedioPorId(new Long(id));

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
                                    <input id="indicacao" name="indicacao" type="text" class="validate" value="<%=p != null ? p.getIndicacao(): ""%>">
                                    <label for="indicacao">Indicação</label>
                                </div>

                                <div class="input-field col s12">
                                    <input id="contraindicacao" name="contraindicacao" type="text" class="validate" value="<%=p != null ? p.getContraindicacao(): ""%>">
                                    <label for="contraindicacao">Contra Indicação</label>
                                </div>

                                <div class="input-field col s12">
                                    <input id="bula" name="bula" type="text" class="validate" value="<%=p != null ? p.getBula(): ""%>">
                                    <label for="Bula">Bula</label>
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
                            <h5 class="center">Remedioes cadastrados</h5>
                            <table>
                                <thead>
                                    <tr>
                                        <th>Nome</th>
                                        <th>Indicação</th>
                                        <th>Contra Indicação</th>
                                        <th>Bula</th>
                                        
                                        <th class="right">Ações</th>
                                    </tr>
                                </thead>

                                <tbody> 
                                    <%
                                        List setors = controle.listarRemedios();
                                        for (Object o : setors) {
                                            Remedio setor = (Remedio) o;

                                    %>
                                    <tr>
                                        <td><%=setor.getNome()%></td>
                                        <td><%=setor.getIndicacao()%></td>  
                                        <td><%=setor.getContraindicacao()%></td> 
                                        <td><%=setor.getBula()%></td> 

                                        <td><a href="excluirRemedio.jsp?id=<%=setor.getId()%>"><i class="material-icons right">delete</i></a>
                                            <a href="setor.jsp?id=<%=setor.getId()%>"><i class="material-icons right">create</i></a></td>
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
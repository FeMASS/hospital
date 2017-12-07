<%@page import="controle.ControleFuncionario"%>
<%@page import="entidade.Funcionario"%>
<%@page import="controle.ControleSetor"%>
<%@page import="entidade.Setor"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            ControleFuncionario controle = new ControleFuncionario();
            ControleSetor controleSetor = new ControleSetor();
            Funcionario funcionario = new Funcionario();
            String id = request.getParameter("id");
            System.out.println("id:" + id);
            if (id != null) {
                funcionario.setId(new Long(id));
            }
            String idSetor = request.getParameter("setor");
            funcionario.setNome(request.getParameter("nomeFuncionario"));
            funcionario.setMatricula(request.getParameter("matricula"));
            funcionario.setTurno(request.getParameter("turno"));
            Setor setor = controleSetor.listarSetorPorId(new Long(idSetor));
            funcionario.setSetor(setor);
            controle.gravar(funcionario);
            response.sendRedirect("funcionario.jsp");
        %>
    </body>
</html>

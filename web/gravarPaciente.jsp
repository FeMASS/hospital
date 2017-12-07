<%@page import="controle.ControlePaciente"%>
<%@page import="entidade.Paciente"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            ControlePaciente controle = new ControlePaciente();
            Paciente paciente = new Paciente();
            String id = request.getParameter("id");
            System.out.println("id:" + id);
            if (id != null) {
                paciente.setId(new Long(id));
            }
            paciente.setNome(request.getParameter("nome"));
            paciente.setEndereco(request.getParameter("endereco"));
            paciente.setCelular(request.getParameter("celular"));
            paciente.setEmail(request.getParameter("email"));
            paciente.setTipoSanguineo(request.getParameter("tipoSanguineo"));
            paciente.setFatorRh(request.getParameter("fatorRh"));

            controle.gravar(paciente);
            response.sendRedirect("paciente.jsp");
        %>
    </body>
</html>

<%@page import="controle.ControleConsulta"%>
<%@page import="entidade.Consulta"%>
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
            ControleConsulta controle = new ControleConsulta();
            ControlePaciente controlePaciente = new ControlePaciente();
            Consulta consulta = new Consulta();
            String id = request.getParameter("id");
            System.out.println("id:" + id);
            if (id != null) {
                consulta.setId(new Long(id));
            }
            String idPaciente = request.getParameter("paciente");
            consulta.setDataConsulta(request.getParameter("dataConsulta"));
            consulta.setRelatosPaciente(request.getParameter("relatosPaciente"));
            consulta.setMedicacoes(request.getParameter("medicacoes"));
            consulta.setExames(request.getParameter("exames"));
            Paciente paciente = controlePaciente.listarPacientePorId(new Long(idPaciente));
            consulta.setPaciente(paciente);
            controle.gravar(consulta);
            response.sendRedirect("consulta.jsp");
        %>
    </body>
</html>

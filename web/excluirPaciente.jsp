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
            ControlePaciente controle= new ControlePaciente();
            
            String id = request.getParameter("id");
            if(id!=null){
                controle.excluir(new Long(id));
            }
            response.sendRedirect("paciente.jsp");
        %>
    </body>
</html>

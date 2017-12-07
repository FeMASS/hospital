<%@page import="controle.ControleConsulta"%>
<%@page import="entidade.Consulta"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            ControleConsulta controle= new ControleConsulta();
            
            String id = request.getParameter("id");
            if(id!=null){
                controle.excluir(new Long(id));
            }
            response.sendRedirect("consulta.jsp");
        %>
    </body>
</html>

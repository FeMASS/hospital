<%@page import="controle.ControleRemedio"%>
<%@page import="entidade.Remedio"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            ControleRemedio controle = new ControleRemedio();
            Remedio remedio = new Remedio();
            String id = request.getParameter("id");
            System.out.println("id:" + id);
            if (id != null) {
                remedio.setId(new Long(id));
            }
            remedio.setNome(request.getParameter("nome"));
            remedio.setIndicacao(request.getParameter("indicacao"));
            remedio.setContraindicacao(request.getParameter("contraindicacao"));
            remedio.setBula(request.getParameter("bula"));

            controle.gravar(remedio);
            response.sendRedirect("remedio.jsp");
        %>
    </body>
</html>

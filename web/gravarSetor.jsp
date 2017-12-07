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
            ControleSetor controle = new ControleSetor();
            Setor setor = new Setor();
            String id = request.getParameter("id");
            System.out.println("id:" + id);
            if (id != null) {
                setor.setId(new Long(id));
            }
            setor.setNome(request.getParameter("nome"));
            setor.setPredio(request.getParameter("predio"));
            setor.setSala(request.getParameter("sala"));
            setor.setNumero(request.getParameter("numero"));

            controle.gravar(setor);
            response.sendRedirect("setor.jsp");
        %>
    </body>
</html>

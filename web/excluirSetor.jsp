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
            ControleSetor controle= new ControleSetor();
            
            String id = request.getParameter("id");
            if(id!=null){
                controle.excluir(new Long(id));
            }
            response.sendRedirect("setor.jsp");
        %>
    </body>
</html>

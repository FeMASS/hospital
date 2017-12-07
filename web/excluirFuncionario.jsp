<%@page import="controle.ControleFuncionario"%>
<%@page import="entidade.Funcionario"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            ControleFuncionario controle= new ControleFuncionario();
            
            String id = request.getParameter("id");
            if(id!=null){
                controle.excluir(new Long(id));
            }
            response.sendRedirect("funcionario.jsp");
        %>
    </body>
</html>

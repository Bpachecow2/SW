<%@ page import="edu.usmp.progra1.bean.Usuario"%>
<% Usuario usuario=
(Usuario)session.getAttribute("usuario");%>
Bienvenido <%=usuario.getAlias()%>
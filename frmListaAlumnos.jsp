<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBc8HaKYOAkgjPRP3AMsozbdimfP7KbYWY&sensor=false"
  type="text/javascript"></script>
<link rel="stylesheet"  href="http://code.jquery.com/ui/1.9.1/themes/base/jquery.ui.all.css">
<script src="http://code.jquery.com/jquery.js"></script>
<script src="http://code.jquery.com/ui/1.9.1/jquery-ui.js"></script>
<link rel="stylesheet"  href="css/demos.css">
<script>
function mapa(direccion,nombres) {
	var strsplit =direccion.split("|");
	var vLat=strsplit[0];
	var vLng=strsplit[1];
	var myLatlng = new google.maps.LatLng(vLat,vLng);
    var mapOptions = {
            center: myLatlng,
            zoom: 8,
            mapTypeId: google.maps.MapTypeId.ROADMAP
          };
    var map = new google.maps.Map(
    		document.getElementById("map_canvas"),
              mapOptions);
    var marker = new google.maps.Marker({
        position: myLatlng, 
        map: map,
    	title: nombres
   	});
	$("#dialog" ).dialog({height:300,width:300});
}
</script>
</head>
<body>
<%@ page import="java.util.List" %>
<%@ page import="edu.usmp.progra1.bean.Alumno" %>
<% List<Alumno> alumnos = (List<Alumno>)
	request.getAttribute("alumnos");%>
<a href="regalumno">Registrar Alumno</a><br/>	
<table width="616" border="0" cellpadding="2" cellspacing="2" id="table" class="sortable">
   <thead>
  
  <tr bgcolor="#CCCCCC">
    <th width="65" class="nosort">&nbsp;</th>
    <th width="14"><strong>Id</strong></th>
    <th width="59"><strong>Apellido</strong></th>
    <th width="59"><strong>Nombre</strong></th>
    <th width="53"><strong>Genero</strong></th>
    <th width="88"><strong>Fecha Nacimiento </strong></th>
    <th width="52"><strong>Pais</strong></th>
    <th width="144"><strong>Direccion</strong></th>
  </tr>
  
  </thead>
  
  <%for(Alumno alumno:alumnos){%>
  <tr>
    <td><a href="editalumno?id=<%=alumno.getId()%>">
    	Editar</a>&nbsp;
       <a href="elimalumno?id=<%=alumno.getId()%>">
       	Eliminar
       </a>
    </td>
    <td><%=alumno.getId()%></td>
    <td><%=alumno.getApellido()%></td>
    <td><%=alumno.getNombre()%></td>
    <td><%=alumno.getGenero()%></td>
    <td><%=alumno.getFechaNacimiento()%></td>
    <td><%=alumno.getPais()%></td>
    <td><a href="javascript:mapa('<%=alumno.getDireccion()%>','<%=alumno.getApellido()%> <%=alumno.getNombre()%>')">
    	Mapa</a>
    </td>
  </tr>
  <%}%>
</table>
<%@ include file="piepaginacion.jsp"%>
<div id="dialog" title="Mapa">
	<div id="map_canvas" style="width:100%; height:100%"></div>
</div>

</body>
</html>
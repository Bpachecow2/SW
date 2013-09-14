<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Alumno</title>
<style type="text/css">
      html { height: 100% }
      body { height: 100%; margin: 0; padding: 0 }
      #map_canvas { height: 100% }
</style>
<link rel="stylesheet"  href="http://code.jquery.com/ui/1.9.1/themes/base/jquery.ui.all.css">
<link rel="stylesheet"  href="css/demos.css">
<script src="http://code.jquery.com/jquery.js"></script>
<script src="http://code.jquery.com/ui/1.9.1/jquery-ui.js"></script>
<script type="text/javascript">
$(function(){
	$("#txt_fechaNacimiento").datepicker({
		showOn: "button",
		buttonImage: "images/calendar.gif",
		buttonImageOnly: true
	});
});
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBc8HaKYOAkgjPRP3AMsozbdimfP7KbYWY&sensor=false"
  type="text/javascript"></script>
<script type="text/javascript">
      function initialize(direccion,nombres) {
    	var strsplit =direccion.split("|");
    	var vLat=strsplit[0];
    	var vLng=strsplit[1];
    	document.forms[0].txt_latitude.value=vLat;
    	document.forms[0].txt_longitude.value=vLng;
    	var myLatlng = new google.maps.LatLng(vLat,vLng);
    	var mapOptions = {
          center: myLatlng,
          zoom: 8,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var map = new google.maps.Map(document.getElementById("map_canvas"),
            mapOptions);
        var marker = new google.maps.Marker({
            position: myLatlng, 
            map: map,
        	title: nombres
       	});
        google.maps.event.addListener(map, "dblclick", function(event) {
            var lat = event.latLng.lat();
            var lng = event.latLng.lng();
            document.forms[0].txt_latitude.value=lat;
            document.forms[0].txt_longitude.value=lng;
        });
      }
</script>
</head>
<%@ page import="edu.usmp.progra1.bean.Alumno" %>
<%@ page import="java.text.SimpleDateFormat" %>
<% SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
	Alumno alumno=
 (Alumno)request.getAttribute("alumno");%>
<body onload="initialize('<%=alumno.getDireccion()%>','<%=alumno.getApellido()%> <%=alumno.getNombre()%>')">
<%@ include file="cabecera.jsp" %>
<form action="editalumno" method="post">
<table width="360" border="0">
  <tr bgcolor="#0099FF">
    <td colspan="2">Alumno
    <input type="hidden" name="txt_id" value="<%=alumno.getId()%>"/>
    </td>
    </tr>
  <tr>
    <td width="119" bgcolor="#CCCCCC">Apellidos : </td>
    <td width="225"><input type="text" name="txt_apellidos" value="<%=alumno.getApellido()%>"/></td>
  </tr>
  <tr>
    <td bgcolor="#CCCCCC">Nombres :</td>
    <td><input type="text" name="txt_nombres" value="<%=alumno.getNombre()%>"/></td>
  </tr>
  <tr>
    <td bgcolor="#CCCCCC">Genero : </td>
    <td><input name="rbn_genero" type="radio" 
    value="Masculino" <%="Masculino".equals(alumno.getGenero())?"checked":""%>     >
      Masculino
        <input name="rbn_genero" type="radio" 
        value="Femenino" <%="Femenino".equals(alumno.getGenero())?"checked":""%>>
      Femenino</td>
  </tr>
  <tr>
    <td bgcolor="#CCCCCC">Fecha Nacimiento : </td>
    <td><input type="text" name="txt_fechaNacimiento" id="txt_fechaNacimiento" 
    value="<%=format.format(alumno.getFechaNacimiento())%>"></td>
  </tr>
  <tr>
    <td bgcolor="#CCCCCC">Pais Nacimiento : </td>
    <td><select name="sel_pais">
      <option value="PE" <%="PE".equals(alumno.getPais())?"selected":""%>>PERU</option>
      <option value="MX" <%="MX".equals(alumno.getPais())?"selected":""%>>MEXICO</option>
    </select>
    </td>
  </tr>
  <tr>
    <td bgcolor="#CCCCCC">Direccion : </td>
    <td>
    	<input type="text" name="txt_latitude" id="txt_latitude">
    	<input type="text" name="txt_longitude" id="txt_longitude">
    </td>
  </tr>  
  <tr>
    <td>&nbsp;</td>
    <td><input type="submit" value="Actualizar"></td>
  </tr>
</table>
</form>
<div id="map_canvas" style="width:40%; height:40%"></div>
</body>
</html>
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
      function initialize() {
        var mapOptions = {
          center: new google.maps.LatLng(-12.072161174882616, -76.94201946258545),
          zoom: 8,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var map = new google.maps.Map(document.getElementById("map_canvas"),
            mapOptions);
        google.maps.event.addListener(map, "dblclick", function(event) {
            var lat = event.latLng.lat();
            var lng = event.latLng.lng();
            document.forms[0].txt_latitude.value=lat;
            document.forms[0].txt_longitude.value=lng;
        });
      }
</script>
</head>
<body onload="initialize()">
<%@ include file="cabecera.jsp" %>
<form action="regalumno" method="post">
<table width="360" border="0">
  <tr bgcolor="#0099FF">
    <td colspan="2">Alumno</td>
    </tr>
  <tr>
    <td width="119" bgcolor="#CCCCCC">Apellidos : </td>
    <td width="225"><input type="text" name="txt_apellidos"></td>
  </tr>
  <tr>
    <td bgcolor="#CCCCCC">Nombres :</td>
    <td><input type="text" name="txt_nombres"></td>
  </tr>
  <tr>
    <td bgcolor="#CCCCCC">Genero : </td>
    <td><input name="rbn_genero" type="radio" value="Masculino">
      Masculino
        <input name="rbn_genero" type="radio" value="Femenino">
      Femenino</td>
  </tr>
  <tr>
    <td bgcolor="#CCCCCC">Fecha Nacimiento : </td>
    <td><input type="text" name="txt_fechaNacimiento" id="txt_fechaNacimiento"></td>
  </tr>
  <tr>
    <td bgcolor="#CCCCCC">Pais Nacimiento : </td>
    <td><select name="sel_pais">
      <option value="PE">PERU</option>
      <option value="MX">MEXICO</option>
    </select>
    </td>
  </tr>
  <tr>
    <td bgcolor="#CCCCCC">Direccion : </td>
    <td>
    	<input type="text" name="txt_latitude">
    	<input type="text" name="txt_longitude">
    </td>
  </tr>  
  <tr>
    <td>&nbsp;</td>
    <td><input type="submit" value="Registrar"></td>
  </tr>
</table>
</form>
<div id="map_canvas" style="width:40%; height:40%"></div>
</body>
</html>
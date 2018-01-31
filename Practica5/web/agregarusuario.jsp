<%-- 
    Document   : agregarusuario
    Created on : 12/07/2015, 09:26:10 PM
    Author     : molot
--%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">	
	<link rel="stylesheet" href="css/main.css">
	<link rel="shortcut icon" href="img/das-icon.ico"/>
	<title>Nuevo Usuario</title>
        <script language="javascript" type="text/javascript" >
            function submitForm()
            {
                var uno = document.getElementById('password1').value;
                var dos = document.getElementById('password2').value;
                if(uno == dos) {
                    document.forms["form1"].submit();
                    return true;
                }
                alert("No coinciden las contraseñas ingresadas");
                document.getElementById('password1').value = "";
                document.getElementById('password2').value = "";
                return false;

            }
        </script>
</head>
<body>	
	<ul class="no-lista borde">
			<li class="col-sm-2 text-left">
				<img height="70" width="70" src="img/das-icon.png">
			</li>
			<li class="col-sm-2 no-lista text-left marron" >
				<h1 class="negrita text-left espacio-abajo">DAS</h1>	
			</li>
			<li class="col-sm-4 fondo-ama inline-block" >
				<h1 align="center" class="text-center">
					NUEVO USUARIO	
				</h1>
			</li>
			<li class="col-sm-3 inline-block">
			</li>
	</ul>
	<br>
        <form method='POST' name="form1" id="form1" class="form-inline">
	<p class="text-center azul">
		&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;Nuevo Usuario:
		<input type="text" class="form-control" name="user" value="" size="14" maxlength="8" placeholder="Usuario">
	<br><br>
                &nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;Contraseña:
		<input type="password" class="form-control" name="password1" id="password1" value="" size="14" maxlength="10" placeholder="Contraseña">
	<br><br>
                Escriba de nuevo la Contraseña:
		<input type="password" class="form-control" name="password2" id="password2" value="" size="14" maxlength="10" placeholder="Contraseña">
	<br><br>
                    <button type="button" name="aceptar" id="aceptar" onclick="submitForm()" class="btn btn-success">Aceptar <span class="glyphicon glyphicon-thumbs-up"></span></button>
                    <button type="button" onClick="parent.location='menu.html'" class="btn btn-danger">Cancelar <span class="glyphicon glyphicon-thumbs-down"></span></button>
	</form>
        
        <c:if test="${pageContext.request.method=='POST'}">
            <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                url="jdbc:mysql://localhost:3306/basepc5"
                user="root"  password=""/>
            
            <sql:update var="result" dataSource="${snapshot}">
                INSERT INTO usuarios(nombre_usuario, contrasenya) VALUES (?,?);
                <sql:param value="${param.user}" />
                <sql:param value="${param.password1}" />  
            </sql:update>
            
            <script language="javascript" type="text/javascript"> 
                window.location.href = "menu.html";
            </script>
        </c:if>
        
	<div align="center">
            <table>
                <ul class="no-lista">
			<li class="col-md-1 inline-block">	
				<img src="img/durazno.jpg">
			</li>
			<li class="col-md-1 inline-block">
				<img  src="img/kiwi.jpg">
			</li>
			<li class="col-md-1 inline-block">	
				<img  src="img/naranja.jpg">
			</li>
			<li class="col-md-1 inline-block">	
				<img  src="img/platano.jpg">
			</li>
			<li class="col-md-1 inline-block">	
				<img src="img/granadilla.jpg">
			</li>
			<li class="col-md-1 inline-block">	
				<img  src="img/maracuya.jpg">
			</li>
			<li class="col-md-1 inline-block">	
				<img  src="img/bete.jpg">
			</li>
			<li class="col-md-1 inline-block">	
				<img  src="img/palta.jpg">
			</li>
			<li class="col-md-1 inline-block">	
				<img src="img/pera.jpg">
			</li>
			<li class="col-md-1 inline-block">	
				<img  src="img/chirimoya.jpg">
			</li>
                </ul>
            </table>
        </div>
</body>
</html>
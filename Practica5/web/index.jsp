<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">	
	<link rel="stylesheet" href="css/main.css">
	<link rel="shortcut icon" href="img/das-icon.ico"/>
	<title>Login</title>
        
</head>
<body>	
	<ul class="no-lista borde">
			<li class="col-md-2 text-left">
				<img height="70" width="70" src="img/das-icon.png">
			</li>
			<li class="col-md-2 no-lista text-left marron" >
				<h1 class="negrita text-left espacio-abajo">DAS</h1>	
			</li>
			<li class="col-md-4 fondo-ama inline-block" >
				<h1 align="center" class="text-center ">
					BIENVENIDO	
				</h1>
			</li>
			<li class="col-md-4 inline-block">
			</li>
	</ul>
	<br>
        <form method="POST" name="formu1" id="formu1" class="form-inline">
	<p class="text-center azul">
            
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Usuario:
		<input type="text" class="form-control" name="user" value="" size="14" maxlength="8" placeholder="Usuario"/>
	<br><br>
		Contraseña:
		<input type="password" class="form-control" name="password" value="" size="14" maxlength="10" placeholder="Contraseña"/>
	<br><br>
                <button type="submit" class="btn btn-success">Aceptar <span class="glyphicon glyphicon-ok"></span></button>
                <button type=button class="btn btn-danger" onclick="window.close();">Cerrar <span class="glyphicon glyphicon-remove"></span></button>
	</form>
        
        <c:if test="${pageContext.request.method=='POST'}">
            <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
            url="jdbc:mysql://localhost:3306/basepc5"
                user="root"  password=""/>
            
            <sql:query var="result" dataSource="${snapshot}">
                SELECT COUNT(1)
                FROM usuarios WHERE nombre_usuario LIKE ? AND contrasenya LIKE ?
                <sql:param value="${param.user}" />
                <sql:param value="${param.password}" />
            </sql:query>
            <c:forEach var="row" items="${result.rowsByIndex}">
                <c:forEach var="incidencias" items="${row}">
                    <c:choose>
                        <c:when test="${incidencias==1}">
                            <script language="javascript" type="text/javascript"> 
                                alert("Contraseña correcta");
                                window.location.href = "menu.html";
                            </script>
                        </c:when>
                        <c:when test="${incidencias==0}">
                            <script language="javascript" type="text/javascript"> 
                                alert("Contraseña incorrecta");
                            </script>
                        </c:when>
                        <c:otherwise>
                            <script language="javascript" type="text/javascript"> 
                                alert("Error");
                            </script>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </c:forEach>
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
    <script src="http://www.google-analytics.com/urchin.js" type="text/javascript"></script>
    <script type="text/javascript">
        _uacct = "UA-3040937-2";
        urchinTracker();
    </script>
</body>
</html>
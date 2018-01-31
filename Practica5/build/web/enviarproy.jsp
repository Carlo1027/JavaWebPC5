<%-- 
    Document   : enviarProy
    Created on : 12/07/2015, 02:58:01 PM
    Author     : molot
--%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="controller.ServletExcel"%>
<%@page import="controller.ServletGuardarTabla"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
            url="jdbc:mysql://localhost:3306/basepc5"
            user="root"  password=""/>

        <sql:update var="result" dataSource="${snapshot}">
            INSERT INTO proyectos(titulo, numeroProyecto, ubicacion,
            razonSocial, direccionSoltte, formaLegal, coSolicitantes, 
            entidAfiliada, nacionalidad, nIdentEuro, nContrato, telefono,
            fax, contrato, correo, aporteSolicitante, duracionTotal,
            fechaPresentacion, aporteUE, fechaInicio, fechaFin,
            otrosAportes, fechaContrato, puntajeTotal, montoTotal,
            componentes, beneficiario, estadoDelProyecto, tipoProyecto, 
            actividadDAS) 
            VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);
            <sql:param value="${param.title}" />
            <fmt:parseNumber var="i" integerOnly="true" type="number" value="${param.numP}" />
            <sql:param value="${i}" />
            <sql:param value="${param.ubic}" />
            <sql:param value="${param.razonSoc}" />
            <sql:param value="${param.dirSoli}" />
            <sql:param value="${param.formLeg}" />
            <sql:param value="${param.coSoli}" />
            <sql:param value="${param.entAfil}" />
            <sql:param value="${param.nacionalidad}" />
            <sql:param value="${param.numEntEu}" />
            <sql:param value="${param.numContrato}" />
            <sql:param value="${param.telef}" />
            <sql:param value="${param.fax}" />
            <sql:param value="${param.contact}" />
            <sql:param value="${param.mail}" />
            <fmt:parseNumber var="i" type="number" value="${param.aporteSoli}" />
            <sql:param value="${i}" />
            <sql:param value="${param.duracion}" />
            <sql:param value="${param.dueDate}" />
            <fmt:parseNumber var="i" type="number" value="${param.aporteUE}" />
            <sql:param value="${i}" />
            <sql:param value="${param.dateStart}" />
            <sql:param value="${param.dateFin}" />
            <fmt:parseNumber var="i" type="number" value="${param.aporteOtros}" />
            <sql:param value="${i}" />
            <sql:param value="${param.dateContract}" />
            <sql:param value="${param.puntajeT}" />
            <fmt:parseNumber var="i" type="number" value="${param.montoT}" />
            <sql:param value="${i}" />
            <sql:param value="${param.componentes}" />
            <sql:param value="${param.beneficiarios}" />
            <sql:param value="${param.proyectState}" />
            <sql:param value="${param.proyectType}" />
            <sql:param value="${param.activiDAS}" />
        </sql:update>
    </body>
</html>

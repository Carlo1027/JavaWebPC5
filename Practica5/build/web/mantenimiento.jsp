<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="controller.ServletExcel"%>
<%@page import="controller.ServletGuardarTabla"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="css/main.css"/>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet"/>    
    <link rel="stylesheet" href="css/main.css"/>
    <link rel="shortcut icon" href="img/das-icon.ico"/>
    <title>Mantenimiento</title>
    <script language="javascript" type="text/javascript" >
        function checkFilled() {
            /*Checkea que haya sido llenado en el formulario:
            title numP ubic razonSoc dirSoli formLeg coSoli*/
            var filled = 0;
            var selected=0;
            var x = document.form1.title.value;
            x = x.replace(/^\s+/,"");  // strip leading spaces
            if (x.length > 0) {filled ++;}
            var y = document.form1.numP.value;
            y = y.replace(/^s+/,"");  // strip leading spaces
            if (y.length > 0) {filled ++;}
            var z = document.form1.ubic.value;
            z = z.replace(/^s+/,"");  // strip leading spaces
            if (z.length > 0) {filled ++;}
            var u = document.form1.razonSoc.value;
            u = u.replace(/^\s+/,"");  // strip leading spaces
            if (u.length > 0) {filled ++;}
            var v = document.form1.dirSoli.value;
            v = v.replace(/^\s+/,"");  // strip leading spaces
            if (v.length > 0) {filled ++;}
            var w = document.form1.coSoli.value;
            w = w.replace(/^\s+/,"");  // strip leading spaces
            if (w.length > 0) {filled ++;}
            var t= document.form1.formLeg.value;
            if(t!="SELECCIONE"){selected=1;}
            else selected=0;
            //revisa q esten llenos
            if (filled ==6 && selected==1) {
            document.getElementById("guardar").disabled = false;
            }
            else {document.getElementById("guardar").disabled = true;}  // in case a field is filled then erased
        }
        //

        function submitForm()
        {
            document.forms["form2"].action="excel";
            document.forms["form2"].target="_blank";
            document.forms["form2"].submit();
        }
        
        function activarPest(){
            document.forms["form1"].target="formresponse";
            document.forms["form1"].action="enviarproy.jsp";
            document.forms["form1"].submit();
            //activa las pestañas al presionar guardar(guardar)
            document.getElementById("tab-2").disabled = false;
            document.getElementById("tab-3").disabled = false;
            document.getElementById("tab-4").disabled = false;
            var stpro = document.getElementById("numP").value;
            document.getElementById("tituloproy").innerHTML = "&nbsp;&nbsp;&nbsp;PROYECTO "+stpro;
            document.getElementById("nproy").setAttribute("value", stpro);
            document.getElementById("nfilas").setAttribute("value", cuentaLineas);
        }
        
        function alertaEnv(){
            document.forms["form2"].action="servletgt";
            document.forms["form2"].target="formresponse";
            document.forms["form2"].submit();
            alert("Tabla enviada");
        }
        ///
        var cuentaLineas=0;
        function addRow() {
            //recoge los valores
                var actividad=document.getElementById("actividad");
                var unidad=document.getElementById("unidad");
                var peso=document.getElementById("peso");
                if(actividad.value=="" || unidad.value=="SELECCIONE" || peso.value==""){
                    alert("No ha ingresado datos");
                    return 0;
                }
                <c:forEach var="i" begin="1" end="36">var m<c:out value="${i}"/> = document.getElementById("mes<c:out value="${i}"/>");
                </c:forEach>
                var table = document.getElementById("myTableData");//SELECCIONA LA TABLA DONDE SE AGREGAN DATOS

                var rowCount = table.rows.length;
                var row = table.insertRow(rowCount);
                cuentaLineas=rowCount;
                var i;
                <c:forEach var="i" begin="1" end="36">if(m<c:out value="${i}"/>.value=="") m<c:out value="${i}"/>.value=0;
                </c:forEach>
                //revisa que peso sea igual a los meses
                if(parseInt(peso.value)!=parseInt(m1.value)+parseInt(m2.value)+parseInt(m3.value)+parseInt(m4.value)+parseInt(m5.value)+parseInt(m6.value)+parseInt(m7.value)+parseInt(m8.value)+parseInt(m9.value)+parseInt(m10.value)+parseInt(m11.value)+parseInt(m12.value)+parseInt(m13.value)+parseInt(m14.value)+parseInt(m15.value)+parseInt(m16.value)+parseInt(m17.value)+parseInt(m18.value)+parseInt(m19.value)+parseInt(m20.value)+parseInt(m21.value)+parseInt(m22.value)+parseInt(m23.value)+parseInt(m24.value)+parseInt(m25.value)+parseInt(m26.value)+parseInt(m27.value)+parseInt(m28.value)+parseInt(m29.value)+parseInt(m30.value)+parseInt(m31.value)+parseInt(m32.value)+parseInt(m33.value)+parseInt(m34.value)+parseInt(m35.value)+parseInt(m36.value)){
                    alert("Los pesos no coinciden");
                    return 0;
                }
                //row.insertCell(0).innerHTML= '<input type="button" value = "Delete" onClick="Javacsript:deleteRow(this)">';
                //insersion
                var input;
                var cadena_aux="A.1."+(cuentaLineas)+"."+actividad.value;
                var nCol=0;
                
                row.insertCell(nCol).innerHTML= cadena_aux;
                input = document.createElement("input");
                input.setAttribute("type", "hidden");
                input.setAttribute("name", "celda"+cuentaLineas+(nCol+1));
                input.setAttribute("value", cadena_aux);
                nCol++;
                row.appendChild(input);
                
                cadena_aux = unidad.value;
                row.insertCell(nCol).innerHTML= cadena_aux;
                input = document.createElement("input");
                input.setAttribute("type", "hidden");
                input.setAttribute("name", "celda"+cuentaLineas+(nCol+1));
                input.setAttribute("value", cadena_aux);
                nCol++;
                row.appendChild(input);
                
                cadena_aux = peso.value;
                row.insertCell(nCol).innerHTML= cadena_aux;
                input = document.createElement("input");
                input.setAttribute("type", "hidden");
                input.setAttribute("name", "celda"+cuentaLineas+(nCol+1));
                input.setAttribute("value", cadena_aux);
                nCol++;
                row.appendChild(input);
                
                <c:forEach var="i" begin="1" end="36">
                    cadena_aux = m<c:out value="${i}"/>.value;
                    row.insertCell(<c:out value="${i+2}"/>).innerHTML= cadena_aux;
                    input = document.createElement("input");
                    input.setAttribute("type", "hidden");
                    input.setAttribute("name", "celda"+cuentaLineas+(nCol+1));
                    input.setAttribute("value", cadena_aux);
                    nCol++;
                    row.appendChild(input);
                </c:forEach>
                document.getElementById("nfilas").value = cuentaLineas;
                //wipe data
                actividad.value="";
                unidad.value="SELECCIONE";
                peso.value="";
                
                <c:forEach var="i" begin="1" end="36"> m<c:out value="${i}"/>.value = "";
                </c:forEach>
        }        //
        
        function deleteRow() {
            //var index = obj.parentNode.parentNode.rowIndex;
            if(cuentaLineas>0){
                document.getElementById("myTableData").deleteRow(cuentaLineas);
                cuentaLineas--;
                document.getElementById("nfilas").value = cuentaLineas;
            }
        }
        
        function editRow() {
            //var index = obj.parentNode.parentNode.rowIndex;
            //var lineaEdit=window.prompt("Ingrese el numero de linea",cuentaLineas);
            //alert(lineaEdit);
            var actividad=document.getElementById("actividad");
            var unidad=document.getElementById("unidad");
            var peso=document.getElementById("peso");
            if(actividad.value=="" || unidad.value=="SELECCIONE" || peso.value==""){
                alert("No ha ingresado datos");
                return 0;
                }
            else    if(cuentaLineas>0){
                        deleteRow();
                        addRow();
                    }
        }
        
    </script>
</head>
<body>
    <div class="fondo-ama" align="center"  style="margin-bottom:-10px">
        <nav class="fondo-ama padding-largo text-center">
        <ul class="no-lista">
            <li class="col-md-3 inline-block"></li>
            <li class="col-md-6 inline-block">
                <h3 class=" azul" style="margin-top:0px">
                    <font size="4">
                        PROGRAMA DE DESARROLLO ALTERNATIVO EN SATIPO
                    </font>
                </h3>
                <p>
                    <i>"Contribuyendo al desarrollo con oportunidades"</i>
                </p>
            </li>
            <li class="col-md-1 inline-block">
                <img height="60" width="60" class="vete-abajo" src="img/das-icon.png" >
            </li>
            <li class="col-md-2 vete-arriba inline-block">
                <a href="index.jsp" align="right" style="float:right">
                    <font size="2" color="white">
                        [Cerrar Sesión]
                    </font>
                </a>
                <a href="agregarusuario.jsp" align="left" style="float:left">
                    <font size="2" color="white">
                        [Agregar Nuevo Usuario]
                    </font>
                </a>
            </li>
        </ul>
        </nav>
        <div id="menu" align="left" class="fondo-gris">
            <ul class="nav">
                <li><a href="menu.html">Archivo</a></li>
                <li><a href="menu.html">Proyecto</a>
                    <ul>
                        <li><a href="mantenimiento.jsp">Mantenimiento</a></li>
                        <li><a href="menu.html">Registro</a></li>
                    </ul>
                </li>
                <li><a href="menu.html">Monitoreo</a></li>
                <li><a href="menu.html">Reportes</a>
                    <ul>
                        <li><a href="menu.html">Informe Mensual</a></li>
                        <li><a href="menu.html">Avance de proyecto</a></li>
                        <li><a href="menu.html">Avance detalle físico</a></li>
                        <li><a href="menu.html">Avance detalle financiero</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <!--FIN MENU><-->
    <br>
    <br>
    <br>
    <p class="azul text-center">
        Mantenimiento de proyectos
    </p>
    <br>
    <br>
    <div class="tabs">
        <div class="tab">
            <input type="radio" id="tab-1" name="tab-group-1" checked>
            <label for="tab-1">Proyecto</label>
            <div class="content">
                <p class="negrita blanco fondo-gris">
                &nbsp;&nbsp;&nbsp;Detalle del proyecto
                </p>
                <form method='POST' name="form1" id="form1" class="container">
                <div class="col-md-2 inline-block" >
                    Título
                </div>
                <div class="inline-block col-md-10">
                    <input  type="text" name="title" size="84" maxlength="84" onkeyup="checkFilled()">     
                </div>
                <div class="col-md-2 inline-block">
                    N° de Propuesta
                </div>
                <div class="col-md-2 inline-block" >
                    <input type="text" name="numP" id="numP" size="10" maxlength="10" onkeyup="checkFilled()">
                </div >
                <div class="col-md-2 inline-block">
                    Ubicación
                </div>
                <div class="col-md-6 inline-block">
                    <input  type="text" name="ubic" size="30" maxlength="30" onkeyup="checkFilled()">
                </div>
                <div class="col-md-2 inline-block" >
                    Nombre/Razón Social
                </div>
                <div class="col-md-10 inline-block" >
                    <input type="text" name="razonSoc" size="84" maxlength="84" onkeyup="checkFilled()">       
                </div>
                <div class="col-md-2 inline-block">
                    Dirección solicitante
                </div>
                <div class="col-md-10 inline-block" >
                    <input type="text" name="dirSoli" size="84" maxlength="84" onkeyup="checkFilled()">       
                </div>
                
                <div class="col-md-2 inline-block">
                    Forma legal
                </div>
                <div class="col-md-2 inline-block" >
                    <select name="formLeg" onchange="checkFilled()">
                        <option>SELECCIONE</option>
                        <option>Firma Personal</option>
                        <option>Sociedad Anónima</option> 
                        <option>Sociedad Limitada</option>
                    </select>   
                </div >
                <div class="col-md-2 inline-block">
                    Co-Solicitantes
                </div>
                <div class="col-md-6 inline-block " >
                    <input type="text" name="coSoli" size="30" maxlength="30" onkeyup="checkFilled()"> 
                </div>
                <div class="col-md-2 inline-block">
                    Entidad Afil.
                </div>
                <div class="col-md-2 inline-block">
                    <input type="text" name="entAfil" size="10" maxlength="10"> 
                </div>
                <div class="col-md-2 inline-block">
                    Nacionalidad
                </div>
                <div class="col-md-2 inline-block">
                    <select name="nacionalidad" >
                        <option>SELECCIONE</option>
                        <option>Peruana</option>
                        <option>Extranjero</option> 
                    </select> 
                </div>
                <div class="col-md-2 inline-block ">
                    N° Ident. Euro 
                </div>
                <div class="col-md-1 inline-block ">
                    <input type="text" name="numEntEu" size="10" maxlength="10">
                </div>
                
                <div class="col-md-2 inline-block" >
                    N° Contrato
                </div>
                <div class="col-md-2 inline-block">
                    <input type="text" name="numContrato" size="10" maxlength="10"> 
                </div>
                <div class="col-md-2 inline-block">
                    Teléfono
                </div>
                <div class="col-md-2 inline-block">
                    <input type="text" name="telef" size="10" maxlength="10">
                </div>
                <div class="col-md-2 inline-block">
                    Fax
                </div>
                <div class="col-md-1 inline-block">
                     <input type="text" name="fax" size="10" maxlength="10">
                </div>
                <div class="col-md-2 inline-block">
                    Contacto
                </div>
                <div class="col-md-2 inline-block">
                    <input type="text" name="contact" size="10" maxlength="10"> 
                </div>
                <div class="col-md-2 inline-block">
                    Correo
                </div>
                <div class="col-md-2 inline-block">
                    <input type="text" name="mail" size="10" maxlength="10">
                </div>
                <div class="col-md-2 inline-block">
                    Aporte Solicitante(€)
                </div>
                <div class="col-md-1 inline-block">
                    <input type="text" name="aporteSoli" size="10" maxlength="10">
                </div>
                <div class="col-md-2 inline-block">
                    Duración Total
                </div>
                <div class="col-md-2 inline-block">
                    <input type="text" name="duracion" size="10" maxlength="10">
                </div>
                <div class="col-md-2 inline-block">
                    Fecha de Presentación
                </div>
                <div class="col-md-2 inline-block">
                    <input type="text" name="dueDate" size="10" maxlength="10">
                </div>
                <div class="col-md-2 inline-block">
                    Aporte. UE(€)
                </div>
                <div class="col-md-1 inline-block">
                    <input type="text" name="aporteUE" size="10" maxlength="10">
                </div>
                <div class="col-md-2 inline-block">
                    Fecha Inicio Ejec.
                </div>
                <div class="col-md-2 inline-block">
                    <input type="text" name="dateStart" size="10" maxlength="10"> 
                </div>
                <div class="col-md-2 inline-block">
                    Fecha Fin
                </div>
                <div class="col-md-2 inline-block">
                    <input type="text" name="dateFin" size="10" maxlength="10" >
                </div>
                <div class="col-md-2 inline-block">
                    Otros Aportes(€)
                </div>
                <div class="col-md-1 inline-block">
                    <input type="text" name="aporteOtros" size="10" maxlength="10">
                </div>
                <div class="col-md-2 inline-block">
                    Fecha de Contrato
                </div>
                <div class="col-md-2 inline-block">
                    <input type="text" name="dateContract" size="10" maxlength="10"> 
                </div>
                <div class="col-md-2 inline-block">
                    Puntaje Total
                </div>
                <div class="col-md-2 inline-block">
                    <input type="text" name="puntajeT" size="10" maxlength="10">
                </div>
                <div class="col-md-2 inline-block">
                    Monto Total(€)
                </div>
                <div class="col-md-1 inline-block">
                    <input type="text" name="montoT" size="10" maxlength="10">
                </div>
                <div class="col-md-2 inline-block">
                    Componentes
                </div>
                <div class="col-md-2 inline-block">
                    <select name="componentes" >
                        <option>SELECCIONE</option>
                        <option>opcion1</option>
                        <option>opcion2</option>
                        <option>opcion3</option>
                    </select>     
                </div>
                <div class="col-md-2 inline-block">
                    Beneficiarios
                </div>
                <div class="col-md-2 inline-block">
                    <input type="text" name="beneficiarios" size="10" maxlength="10">
                </div>
                <div class="col-md-4 inline-block">
                </div>
                <div class="col-md-2 inline-block">
                    Estado del Proyecto
                </div>
                <div class="col-md-2 inline-block">
                    <select name="proyectState" >
                        <option>SELECCIONE</option>
                        <option>En espera</option>
                        <option>Iniciado</option>
                        <option>Intermedio</option>
                        <option>Avanzado</option>
                        <option>Finalizado</option> 
                    </select>   
                </div>
                <div class="col-md-2 inline-block">
                    Tipo de Proyecto
                </div>
                <div class="col-md-2 inline-block">
                    <select name="proyectType" >
                        <option>SELECCIONE</option>
                        <option>Agricultura</option>
                        <option>Ganaderia</option> 
                        <option>Puente o carretera</option>
                    </select> 
                </div>
                <div class="col-md-2 inline-block">
                    Actividad DAS
                </div>
                <div class="col-md-1 inline-block">
                    <select name="activiDAS" >
                        <option>SELECCIONE</option>
                        <option>opcion1</option>
                        <option>opcion2</option>
                        <option>opcion3</option>
                    </select> 
                </div>
                <div class="col-md-12 inline-block" align="center" >
                    <button type="button" class="btn btn-success" name="guardar" id="guardar" disabled='disabled' onClick="activarPest()">Guardar <span class="glyphicon glyphicon-floppy-saved"></span></button>
                    <button type="button" class="btn btn-danger" name="cerrar" id="cerrar" onClick="parent.location='index.jsp'">Cancelar <span class="glyphicon glyphicon-floppy-remove"></span></button>
                </div>
                
                </form>
                
            </div>
        </div>
        <div class="tab">
            <input type="radio" id='tab-2' name="tab-group-1" disabled="disabled">
            <label  for="tab-2">Marco Lógico</label>
            <div class="content">No tiene acceso a esta página</div>
        </div>
        <div class="tab">
            <input type="radio" id="tab-3" name="tab-group-1" disabled="disabled">
            <label for="tab-3">Metas físicas</label>
            <div class="content">
                <p name="tituloproy" id="tituloproy" class="negrita blanco fondo-gris"></p>
                <div class="col-md-1 inline-block">
                    Actividad
                </div>
                <div class="col-md-9 inline-block">
                    <input type="text" id="actividad" size="69" maxlength="69">
                </div>
                <div class="col-md-2 inline-block vete-derecha">
                    <button type="button" onclick="Javascript:addRow()">Agregar <span class="glyphicon glyphicon-plus-sign"></span></button>
                    <button type="button" onclick="deleteRow()"><span class="glyphicon glyphicon-remove-sign"></span> Eliminar</button>
                    <button  type="button" onClick="editRegister()">Editar <span class="glyphicon glyphicon-edit"></span></button>
                </div>
                 <!--segunda linea -->
                <div class="col-md-1 inline-block">
                    Unidad
                </div>
                <div class="col-md-2 inline-block"> 
                    <select id="unidad">
                        <option>SELECCIONE</option>
                        <option>Informe tecnico</option>
                        <option>Global</option> 
                    </select> 
                </div>
                <div class="col-md-2 inline-block">
                </div>
                <div class="col-md-1 inline-block">
                    Peso
                </div>
                <div class="col-md-1 inline-block">
                    <input type="text" id="peso" size="8" maxlength="8">
                </div>
                <div class="col-md-3 inline-block">
                </div>
                <div class="col-md-1 inline-block vete-derecha">
                    
                </div>
                <div class="col-md-1 inline-block">
                </div>
                <!-- tercera linea-->
                <div class="col-md-12 inline-block">
                    
                </div>
                <!--fin menu, inicio de formulario meses -->
                <br>
                
                <c:forEach var="i" begin="1" end="12">
                    <div class="col-md-1 inline-block2 fondo-gris blanco">
                        Mes <c:out value="${i}"/>
                    </div>
                </c:forEach>
                
                <c:forEach var="i" begin="1" end="12">
                    <div class="col-md-1 inline-block2">
                        <input type="text" id="mes<c:out value="${i}"/>" size="9" maxlength="9">   
                    </div>
                </c:forEach>
                
                <c:forEach var="i" begin="13" end="24">
                <div class="col-md-1 inline-block2 fondo-gris blanco">
                    Mes <c:out value="${i}"/>
                </div>
                </c:forEach>
                
                <c:forEach var="i" begin="13" end="24">
                <div class="col-md-1 inline-block2">
                    <input type="text" id="mes<c:out value="${i}"/>" size="9" maxlength="9">   
                </div>
                </c:forEach>
                
                <c:forEach var="i" begin="25" end="36">
                <div class="col-md-1 inline-block2 fondo-gris blanco">
                    Mes <c:out value="${i}"/>
                </div>
                </c:forEach>
                
                <c:forEach var="i" begin="25" end="36">
                <div class="col-md-1 inline-block2">
                    <input type="text" id="mes<c:out value="${i}"/>" size="9" maxlength="9">   
                </div>
                </c:forEach>
                
<!--FIN MESES overflow:auto crea scrollbar en ambas direcciones, unidireccional se usa overflow-x/y/INICIO TABLA-->
                <br>
                <br>
                <form method='POST' name="form2" id="form2" class="container"> <!-- target="formresponse">-->
                    <input type="hidden" id="nproy" name="nproy" >
                    <div id="mydata" style="width:100%; overflow:auto; max-height: 200px; border:#3A4F63 solid 1px;">
                        <table style="width:100%;" id="myTableData"  border="1" cellpadding="2">
                            <tr class="format blanco">
                                <td>Tarea_Actividad</td>
                                <td>   Unidades   </td>
                                <td>   Totales   </td>
                                <c:forEach var="i" begin="1" end="36">
                                    <td>Mes <c:out value="${i}"/></td>
                                </c:forEach>
                            </tr>
                        </table>
                        &nbsp;<br/>
                    </div>
                    <input type="hidden" name="nfilas" id="nfilas"/>
                    <button type="button" class="btn btn-success" name="envTabla" id="envTabla" onClick="alertaEnv()">Enviar <span class="glyphicon glyphicon-saved"></span></button>
                    <button type="button" class="btn btn-info" name="recibirExcel" id="recibirExcel" onclick="submitForm()">Excel <span class="glyphicon glyphicon-import"></span></button>
                </form>
                

<!-- FIN TABLAAA-->
            </div>
        </div>
        <div class="tab">
            <input type="radio" id="tab-4" name="tab-group-1" disabled="disabled">
            <label  for="tab-4">Metas financieras</label>
            <div class="content">No tiene acceso a esta página</div>
        </div>
    </div>
    <iframe name='formresponse' style="display:none;"></iframe>
</body>
</html>
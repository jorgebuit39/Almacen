
<%@page import="Persistencia.DaoFacturas"%>
<%@page import="Modelo.Facturas"%>
<%@page import="Persistencia.DaoUsuarios"%>
<%@page import="Modelo.Usuarios"%>
<%@page import="Persistencia.DaoProveedores"%>
<%@page import="Modelo.Proveedores"%>
<%@page import="java.util.List"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Facturas</title>    
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>    
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <!-- DataTables CSS -->
        <link href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap4.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <body>
        <!--Barra de Navegacion -->
        <nav class="navbar  navbar-expand-md navbar-dark bg-dark border-3 fixed-top border-bottom" id="menu" >
            <div class="container-fluid"> 

                <a class="navbar-brand" href="#"></a>
            <img src="./img/llogo.jpg" alt="" height="40" width="50" style="left: 30px">
                <button 
                    class="navbar-toggler" type="button" data-bs-toggle="collapse" 
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" 
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>


                <div class="collapse navbar-collapse  " id="navbarSupportedContent">
                    <ul class="navbar-nav ml-3 me-auto">  
                        <form class="navbar-nav ms-auto ml-auto" role="search">
                            <input class="form-control " type="search" name="txtbuscar" placeholder="Buscar Nombre, CC" aria-label="Buscar">
                            <button  type="submit" name="accion" value="buscar" class="btn btn-primary">Buscar</button>
                        </form>

                    </ul>

                    <ul class="navbar-nav mb-5 mb-lg-0 float-start ">   

                        <li class="nav-item ">
                            <a class="nav-link active my-menu-item" aria-current="page" href="./index.jsp"><b>
                                    <span  style="margin-left: 50px; border:none" class="btn btn-success">
                                        <i class="bi bi-arrow-left-square-fill text-dark"></i> <b> Inicio </b>
                                    </span>
                            </a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link active" aria-current="page" href="ControladorRecibo?accion=listar">
                                <span  style="margin-left: 50px; border:none" class="btn btn-warning">
                                    <i class="bi bi-plus-circle"></i> <b> Listar </b> </span>
                            </a>
                        </li>

                    </ul>
                </div>
            </div>

            <div class="ml-auto">
                <!-- Botón de cierre de sesión -->
               <!-- <button class="btn btn-primary" style="margin-top: 2px;" onclick="cerrarSesion()">Cerrar Sesión</button>-->
                    <button  name="accion" value="Salir" class="btn btn-primary" href="#">Salir</button>

                </ul>
            </div>
        
    </nav>
        <!--formulario -->
        <form action="ControladorFacturas" method="POST" autocomplete="off" class="custom-form">
            <div class="row ">   
                <div class="col-md-2 ">
                    <%--Formulario para registrar y sirve para editar --%>
                    <div class="col-sm- bg-darkt card-body">
                        <hr>
                        <hr>
                        <h3>Facturas de Compras</h3>
                        <label for="numeroOrden"></label>
                        <input type="text" class="form-control" value="${User.getNumeroOrden()}"  id="numeroOrden" 
                               name="numeroOrden" placeholder="Ingrese Numero Orden">

                        <label for="fechaEntrada"></label>
                        <input type="text" class="form-control" value="${User.getFechaEntrada()}"  id="fechaEntrada" 
                               name="FechaEntrada" placeholder="Ingrese Fecha Entrada">
                    </div>
                </div>
            </div>


            <div class="btn-group" role="group" aria-label="Basic mixed styles example">
                <button type="submit" name="accion" value="registrar" class="btn btn-success">
                    <i class="fas fa-save "></i> Agregar</button>
                <button type="submit" name="accion" value="editarFacturas" class="btn btn-info">
                    <i class="bi bi-arrow-repeat"></i> Actualizar</button>
                <button type="submit" name="accion" value="listar" class="btn btn-danger">
                    <i class="bi bi-x-lg"></i> Cancelar</button>
            </div>

            <div class="col-sm-8 mb-4 mt-4 ">
                <table class="table table-dark">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Numero Orden</th>                      
                            <th>Fecha Entrada</th>
                            <th>Usuario</th>
                  
                            <th>Proveedor</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>

                    <%
                        List<Facturas> Lista = (List<Facturas>) request.getAttribute("listaFacturas");
                        for (Facturas fact : Lista) {%>
                    <tr>
                        <td><%= fact.getIdFacturas()%></td>
                        <td><%= fact.getNumeroOrden()%></td>                    
                        <td><%= fact.getFechaEntrada()%></td>
                        <td><%=DaoUsuarios.obtenerUsuarioPorId(fact.getUsuarios_idUsuarios())%></td>                    
                        <td><%=DaoProveedores.obtenerNombreProveedores(fact.getProveedores_idProveedores())%></td>

                        <td>
                            <div class="btn-group" role="group" aria-label="Acciones">

                                <a href="ControladorFacturas?accion=eliminar&id=<%= fact.getIdFacturas()%>"
                                   class="btn btn-danger btn-sm" onclick="return confirm('¿Estás seguro de que deseas eliminar la factura?')">
                                    <i class="fas fa-trash"></i> <!-- Ícono de papelera -->
                                </a>

                                <a href="ControladorFacturas?accion=editar&id=<%= fact.getIdFacturas()%>" class="btn btn-primary btn-sm">
                                    <i class="fas fa-pencil-alt"></i> <!-- Ícono de lápiz -->
                                </a>
                            </div>
                        </td>
                    </tr>
                    <% }%>
                    </tbody>
                </table>
            </div>
   
    <style>
        body {
            background-image: url('img/fac.jpg');
            background-size: cover;
            font-family:var
        }
        .row{
          
            padding: 20px; /* Añadir espacio de relleno para separar el contenido del borde */
            color:white ;
        }
        label{
            display: inline-block; /* Hacer que las etiquetas ocupen un espacio en línea */
            width: 300px; /* Ancho deseado para las etiquetas */
            font-size: 25px; /* Tamaño de fuente */
            margin-bottom: 10px; /* Espacio entre las etiquetas */
        }
        h1{
            font-size: 30px; /* Tamaño de fuente */
            color:white; /* Color del texto */
            text-align: center; /* Alineación del texto */
            margin-top: 30px; /* Margen superior */
            margin-bottom: 20px; /* Margen inferior */
            font-weight: bold; /* Negrita */
            text-transform: uppercase; /* Convertir texto a mayúsculas */
            font-family: Arial, sans-serif; /* Familia de fuente */
        }
        .card-body {
            width: 400px; /* Ancho mínimo del formulario en pantallas pequeñas */
            margin: 0 auto /* Centrar el formulario horizontalmente */
        }

        .button {
           color: #007bff
        }

        .container {
            position: static; /* Posicionamiento relativo */
            width: 350px; /* Ancho del contenedor */
            height: 50px; /* Altura del contenedor */
            background-color:  #000; /* Color de fondo */
            border: 0px solid #ccc; /* Borde */
            transition: all 0.3s ease; /* Transición suave */
        }

        table{
            color:black
        }

    </style>
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- DataTables JS -->
    <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap4.min.js"></script>

    <script>

                                       <script>         $(document).ready(function () {
                                               $('#miTabla').DataTable({
                                       "paging": true,
                                               "pageLength": 5
        });
        });
        function cerrarSesion() {
                                               $.ajax({
                                               type: "POST",
                                                       url: "cerrar_sesion.php",
                                                       success: function(response) {
                                                       window.location.href = "inicio_sesion.html";
                                                       },
                                                       error: function(xhr, status, error) {
        console.error("Error al cerrar sesión:", error);
                                                      } }); }
                
                $(document).ready(function () 
                {
                                               $('#miTabla').DataTable({
                                       "paging": true, // Habilita la paginación
                                               "pageLength": 5 // Número de registros por página
                                       });
            </script>
    </body>
</html>











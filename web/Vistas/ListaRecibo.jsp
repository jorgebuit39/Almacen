<%@page import="Persistencia.DaoProductos"%>
<%@page import="Modelo.Productos"%>
<%@page import="Persistencia.DaoRecibo"%>
<%@page import="Modelo.Recibo"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Recibo</title>      
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>    
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <!-- DataTables CSS -->
        <link href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap4.min.css" rel="stylesheet">
        <!-- Link to Font Awesome CSS -->
        <link href="Estilos4/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../EstilosCss/EstilosCCS4.css" rel="stylesheet" type="text/css"/>
        <link href="./EstilosCss/EstilosTablas.css" rel="stylesheet" type="text/css"/>
        <link href="EstilosTablas.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>

        <!-- Barra de Navegacion -->
        <nav class="navbar  navbar-expand-md navbar-dark bg-dark border-3 fixed-top border-bottom" id="menu" >
            <div class="container-fluid"> 

                <a class="navbar-brand" href="#"></a>
                <img src="./img/llogo.jpg" alt="llogo" style="width: 60px;">

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
                            <button  type="submit" name="accion" value="buscar" class="btn btn-primary ml-1">Buscar</button>
                        </form>

                    </ul>

                    <ul class="navbar-nav mb-5 mb-lg-0 float-start ">   

                        <li class="nav-item ">
                            <a class="nav-link active my-menu-item" aria-current="page" href="./index.jsp"><b>
                                    <span  style="margin-left: 50px; border:none" class="btn btn-info">
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

            <div class="ml-xl-5">
                <!-- Botón de cierre de sesión -->
                <button class="btn btn-danger"ml onclick="cerrarSesion()">Cerrar Sesión</button>
            </div>
        </nav>

        <!-- Barra de Navegacion -->
        <hr>
        <hr>
        <hr>
        <hr>
        <!-- Formulario -->
        <div class="row">

            <div class="col-sm-4 bg-darkt card-body">
                <h4 class="text-primary elegant-font"><b>FORMULARIO DE RECIBO</b></h4>


                <!-- Inicio Formulario -->
                <form action="ControladorRecibo" method="POST" autocomplete="off" class="custom-form">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group text-left">
                                <label for="plu" class="text-left">Plu</label>
                                <input type="text" class="form-control" id="plu" name="plu" value="${User.getPlu()}" placeholder="Ingrese Plu">
                            </div>
                            <div class="form-group text-left">
                                <label for="descripcion" class="text-left">Descripcion</label>
                                <input type="text" class="form-control" id="descripcion"
                                       name="descripcion" value="${User.getDescripcion()}" placeholder="Ingrese Descripcion">
                            </div>
                            <div class="form-group text-left">
                                <label for="cantidad">Cantidad</label>
                                <input type="cantidad" class="form-control" id="cantidad"
                                       name="cantidad" value="${User.getCantidad()}" placeholder="Ingrese Cantidad">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group text-left">
                                <label for="costo">Costo</label>
                                <input type="costo" class="form-control" id="costo" name="costo" value="${User.getCosto()}" placeholder="Ingrese Costo">
                            </div>
                            <div class="form-group text-left">
                                <label for="nombreProductos">Productos</label>
                                <select class="form-control" id="nombreProductos" value="${User.getProductos_idProductos()}" name="productos_idProductos">
                                    <option value="0">Seleccione Producto</option>
                                    <% List<Productos> productos = DaoProductos.listar();
                                        if (productos != null) {
                                            for (Productos pr : productos) {
                                                if (pr != null) {%>
                                    <option value="<%=pr.getIdProductos()%>"><%=pr.getNombreProductos()%></option>
                                    <% }
                                            }
                                        }%>
                                </select>
                            </div>
                        </div>
                    </div>

                    <!--Botones -->
                    <div class="form-group mt-3 text-center">
                        <button type="submit" name="accion" value="registrar" class="btn btn-warning">
                            <i class="fas fa-save"></i> Grabar 
                        </button>
                        <button type="submit" name="accion" value="editarRecibo" class="btn btn-success">
                            <i class="bi bi-arrow-repeat"></i> Actualizar
                        </button>                                    
                        <button type="submit" name="accion" value="listar" class="btn btn-secondary">
                            <i class="bi bi-x-lg"></i> Cancelar
                        </button>
                    </div>

                </form> 

                <!-- Aquí se cierra el formulario -->

            </div>


            <!-- Contenedor lista usuarios donde aparecen los datos -->
            <div class="col-sm-8 mb-4 mt-5 sticky-top">
                <br>
                <h5 class="text-primary elegant-font"><b>LISTA RECIBO</b></h5> 
                <div class=" table-container ml-0 md-0 table-responsive" >

                    <div class="container mt-6 bg-dark btn-group" >
                        <!--<table id="miTabla" class="table table-striped table-bordered" style="width:100%">-->
                        <table class="table table-dark table-striped">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Plu</th>
                                    <th>Descripcion</th>
                                    <th>Cantidad</th>
                                    <th>Costo</th>
                                    <th>Producto</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    List<Recibo> Lista = (List<Recibo>) request.getAttribute("listaRecibo");
                                    for (Recibo recibo : Lista) {%>
                                <tr>
                                    <td><%= recibo.getIdRecibo()%></td>
                                    <td><%= recibo.getPlu()%></td>
                                    <td><%= recibo.getDescripcion()%></td>
                                    <td><%= recibo.getCantidad()%></td>
                                    <td><%= recibo.getCosto()%></td>
                                    <td><%= DaoProductos.obtenerNombreProductos(recibo.getProductos_idProductos())%></td>
                                   
                                    <td>
                                        <div class="btn-group" role="group" aria-label="Acciones">

                                            <a href="ControladorRecibo?accion=eliminar&id=<%= recibo.getIdRecibo()%>"
                                               class="btn btn-danger btn-sm" onclick="return confirm('¿Estás seguro de que deseas eliminar este recibo?')">
                                                <i class="fas fa-trash"></i> <!-- Ícono de papelera -->
                                            </a>

                                            <a href="ControladorRecibo?accion=editar&id=<%= recibo.getIdRecibo()%>" class="btn btn-primary btn-sm">
                                                <i class="fas fa-pencil-alt"></i> <!-- Ícono de lápiz -->
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                                <% }%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>



        <!-- jQuery -->
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <!-- Bootstrap JS -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <!-- DataTables JS -->
        <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap4.min.js"></script>

        <style>

            body {

                background-image: url('img/ikki.jpg');
                background-size: cover;

            }

            label{

                color: #ffffff
            }

            h5{

                color: #ffffff
            }


        </style>


    </body>

</html>

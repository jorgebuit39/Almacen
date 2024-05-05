
<%@page import="Persistencia.DaoProductos"%>
<%@page import="Modelo.Productos"%>
<%@page import="Persistencia.DaoCategorias"%>
<%@page import="Modelo.Categorias"%>
<%@page import="Persistencia.DaoProveedores"%>
<%@page import="Modelo.Proveedores"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Productos</title>
        <!--<link href="../EstilosCss/VistaProductos.css" rel="stylesheet" type="text/css"/>-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>    

        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <!-- DataTables CSS -->
        <link href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap4.min.css" rel="stylesheet">

        <!-- Link to Font Awesome CSS -->

        <link href="Estilos4/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="../EstilosCss/EstilosCCS4.css" rel="stylesheet" type="text/css"/>

    </head>

    <body>

        <!--Barra de Navegacion -->
        <nav class="navbar  navbar-expand-md navbar-dark bg-dark border-3 fixed-top border-bottom" id="menu" >
            <div class="container-fluid"> 

                <a class="navbar-brand" href="#"></a>
                <img src="./img/llogo.jpg" alt="llogo" style="width: 80px;">

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
                            <a class="nav-link active" aria-current="page" href="ControladorProductos?accion=listar">
                                <span  style="margin-left: 50px; border:none" class="btn btn-warning">
                                    <i class="bi bi-plus-circle"></i> <b> Listar </b> </span>
                            </a>
                        </li>

                    </ul>
                </div>
            </div>

            <div class="ml-xl-2">
                <!-- Botón de cierre de sesión -->
                <button class="btn btn-danger"ml onclick="cerrarSesion()">Cerrar Sesión</button>

            </div>

        </nav>

        <!--Barra de Navegacion -->


        <hr>
        <hr>
        <!--formulario -->

        <div class="row ">   
            <div class="col-md-4 ">
                <%--Formulario para registrar y sirve para editar --%>
                <div class="col-sm- bg-darkt card-body">
                    <hr>
                    <hr>
                    <h5 class="text-primary elegant-font"><b>FORMULARIO DE REGISTRO</b></h5> 

                    <form action="ControladorProductos" method="POST" autocomplete="off" class="custom-form">

                        <div class="row">
                            <div class="col-md-6 ">

                                <div class="form-group text-left">
                                    <label for="nombre" class="text-left">Nombres</label>
                                    <input type="text" class="form-control" value="${User.getNombreProductos()}"  id="nombre" 
                                           name="nombre" placeholder="Ingrese Nombre">
                                </div>                           

                                <div class="form-group text-left">
                                    <label for="plu">Plu</label>
                                    <input type="Plu" class="form-control" id="plu" value="${User.getPlu()}"
                                           name="plu" placeholder="Ingrese Plu">
                                </div>

                                <div class="form-group text-left">
                                    <label for="cantidad">Cantidad</label>
                                    <input type="text" class="form-control" id="cantidad" value="${User.getCantidad()}" 
                                           name="cantidad" placeholder="Ingrese Cantidad">
                                </div>

                                <div class="form-group text-left">
                                    <label for="categorias" class="form-label">categorias</label>
                                    <input type="text" class="form-control" id="categorias" value="${User.getCategorias()}" 
                                           name="categorias" placeholder="Ingrese Categorias">
                                    <select id="categorias" class="form-select accordion-header">
                                        <option selected>Categorias...</option>
                                        <option>...</option>
                                    </select>
                                    
                                         <div class="form-group text-left">
                                    <label for="proveedoress" class="form-label">proveedores</label>
                                    <input type="text" class="form-control" id="proveedores" value="${User.getProveedores()}" 
                                           name="proveedoress" placeholder="Ingrese Proveedores">
                                    <select id="proveedores" class="form-select accordion-header">
                                        <option selected>Proveedores...</option>
                                        <option>...</option>
                                    </select>
                                </div>
                                </div>
                            </div>
                        </div>
                </div>

                <div class="form-group mt-2 text-center" style="border: none;">

                    <button type="submit" name="accion" value="registrar" class="btn btn-warning">
                        <i class="fas fa-save "></i> Agregar</button>
                    <button type="submit" name="accion" value="editarUsuarios" class="btn btn-success">
                        <i class="bi bi-arrow-repeat"></i> Actualizar</button>

                    <button type="submit" name="accion" value="listar" class="btn btn-secondary">
                        <i class="bi bi-x-lg"></i> Cancelar</button>

                </div>    

            </div>



            <div class="col-sm-8 mb-3 mt-5 sticky-top">
                <br>
                <h5 class="text-primary elegant-font"><b>Lista productos</b></h5> 
                <div class=" table-container ml-0 md-0 table-responsive" >

                    <div class="container mt-6 bg-dark btn-group" >
                        <!--<table id="miTabla" class="table table-striped table-bordered" style="width:100%">-->
                        <table class="table table-dark table-striped">

                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Nombres</th>                      
                                    <th>Plu</th>
                                    <th>Cantidad</th>
                                    <th>Categoria</th>
                                    <th>Proveedor</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                List<Productos> Lista = (List<Productos>) request.getAttribute("listaProductos");
                                for (Productos producto : Lista) {%>
                                <tr>
                                    <td><%= producto.getIdProductos()%></td>
                                    <td><%= producto.getNombreProductos()%></td>                    
                                    <td><%= producto.getPlu()%></td>
                                    <td><%= producto.getCantidad()%></td>
                                    <td><%=DaoCategorias.obtenerNombreCategorias(producto.getCategorias_idCategorias())%></td>
                                    <td><%=DaoProveedores.obtenerNombreProveedores(producto.getProveedores_idProveedores())%></td>

                                    <td>
                                        <div class="btn-group" role="group" aria-label="Acciones">

                                            <a href="ControladorProductos?accion=eliminar&id=<%= producto.getIdProductos()%>"
                                               class="btn btn-danger btn-sm" onclick="return confirm('¿Estás seguro de que deseas eliminar este producto?')">
                                                <i class="fas fa-trash"></i> <!-- Ícono de papelera -->
                                            </a>

                                            <a href="ControladorProductos?accion=editar&id=<%= producto.getIdProductos()%>" class="btn btn-primary btn-sm">
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




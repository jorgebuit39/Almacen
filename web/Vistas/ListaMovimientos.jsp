<%@page import="Persistencia.DaoMovimientos"%>
<%@page import="Modelo.Movimientos"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Productos"%>
<%@page import="Persistencia.DaoProductos"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movimientos</title>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <!--link href="https://cdn.jsdelivr.net/npm/bootstrap@5.5.0/dist/css/bootstrap.min.css" rel="stylesheet"-->

        <!-- Link to Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

        <!-- Link to Font Awesome CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>    
        <link href="./EstilosCss/Estilos2.css" rel="stylesheet" type="text/css"/>
        <link href="./EstilosCss/EstilosTablas.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>

        <!--Barra de Navegacion -->
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
                                    <span  style="margin-left: 50px; border:none" class="btn btn-outline-light">
                                        <i class="bi bi-arrow-left-square-fill text-dark"></i> <b> Inicio </b>
                                    </span>
                            </a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link active" aria-current="page" href="ControladorRecibo?accion=listar">
                                <span  style="margin-left: 50px; border:none" class="btn btn-outline-light">
                                    <i class="bi bi-plus-circle"></i> <b> Listar </b> </span>
                            </a>
                        </li>

                    </ul>
                </div>
            </div>

            <div class="ml-xl-5">
                <!-- Botón de cierre de sesión -->
                <button class="btn btn-danger"ml onclick="cerrarSesion()">Cerrar Sesión</button>
        </nav>

        <!--Barra de Navegacion -->

        <hr>
        <hr>
        <!--formulario -->

        <div class="row  ">   
            <div class="col-md-4 ">
                <%--Formulario para registrar y sirve para editar --%>
                <div class="col-sm- bg-darkt card-body">
                    <hr>
                    <hr>
                    <h4 class="text-primary elegant-font"><b>Formulario movimientos</b></h4> 

                    <form action="ControladorMovimientos" method="POST" autocomplete="off" class="custom-form">

                        <div class="row">
                            <div class="col-md-6 ">

                                <div class="form-group text-left">
                                    <label for="nombre" class="text-left">Nombre</label>
                                    <input type="text" class="form-control" value="${User.getNombre()}"  id="nombre" 
                                           name="nombre" placeholder="Ingrese Nombre">
                                </div>                           

                                <div class="form-group text-left">
                                    <label for="fecha" class="text-left">Fecha</label>
                                    <input type="text" class="form-control" value="${User.getFecha()}"  id="fecha" 
                                           name="fecha" placeholder="Ingrese Fecha">
                                </div>           

                            </div>
                            <div class="col-md-6">        

                                <div class="form-group text-left">
                                    <label for="cantidad">Cantidad</label>
                                    <input type="cantidad" class="form-control" id="cantidad" value="${User.getCantidad()}" 
                                           name="cantidad" placeholder="Ingrese Cantidad">


                                </div>
                            </div>
                        </div>
                </div>



                <div class="form-group mt-3 text-center" style="border: none;">

                    <button type="submit" name="accion" value="registrar" class="btn btn-warning">
                        <i class="fas fa-save "></i> Agregar</button>
                    <button type="submit" name="accion" value="editarUsuarios" class="btn btn-success">
                        <i class="bi bi-arrow-repeat"></i> Actualizar</button>

                    <button type="submit" name="accion" value="listar" class="btn btn-secondary">
                        <i class="bi bi-x-lg"></i> Cancelar</button>

                </div>    
                </form>
            </div>


            <div class="col-sm-7 mb-4 mt-5 sticky-top">
                
                <h4 class="text-primary elegant-font"><b></b></h4> 
                <div class=" table-container ml-5 md-5 table-responsive" >

                    <div class="container mt-1 bg-dark bi-arrow-left-square-fill col-md-12" >
                        <!--<table id="miTabla" class="table table-striped table-bordered" style="width:100%">-->
                        <table class="table table-success table-striped">


                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Nombre</th>
                                    <th>Fecha</th>                      
                                    <th>Cantidad</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    List<Movimientos> Lista = (List<Movimientos>) request.getAttribute("listaMovimientos");
                                    for (Movimientos mov : Lista) {%>
                                <tr>
                                    <td><%= mov.getIdMovimientos()%></td>
                                    <td><%= mov.getNombre()%></td>
                                    <td><%= mov.getFecha()%></td>                    
                                    <td><%= mov.getCantidad()%></td>
                                    <td><%=DaoProductos.obtenerNombreProducto(mov.getProductos_idProductos())%></td>
                                    <td>
                                        <div class="btn-group" role="group" aria-label="Acciones">

                                            <a href="ControladorMovimientos?accion=eliminar&id=<%= mov.getIdMovimientos()%>"
                                               class="btn btn-danger btn-sm" onclick="return confirm('¿Estás seguro de que deseas eliminar este movimiento?')">
                                                <i class="fas fa-trash"></i> <!-- Ícono de papelera -->
                                            </a>
                                            <a href="ControladorMovimientos?accion=editar&id=<%= mov.getIdMovimientos()%>" class="btn btn-primary btn-sm">
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





            <!-- jQuery -->
            <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
            <!-- Bootstrap JS -->
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
            <!-- DataTables JS -->
            <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
            <script src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap4.min.js"></script>


            
    <style>
                body {
                    background-image: url('img/ppppp.png');
                    background-size: cover;
                }
                
                container {
                    background-color: #000
                    
                }
    </style>


</body>

</html>



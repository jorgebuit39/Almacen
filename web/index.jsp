
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>  
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>ZAP INVENTARIOS</title>

        <!-- Incluye los archivos CSS de Bootstrap -->
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
              crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

        <link href="Vistas/EstilosFondo.css" rel="stylesheet" type="text/css"/>


    </head>
    <body> 

        <div class="row">
            <div class="col-12"> 
                <nav class="navbar  navbar-expand-md navbar-dark bg-dark border-3 fixed-top border-bottom" id="menu" >
                    <div class="container-fluid">

                        <a  >
                            <img src="./img/llogo.jpg" alt="" height="40" width="50" style="left: 30px">
                        </a>


                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav me-auto mb-2 mb-lg-0">

                                <li class="nav-item">
                                    <a  style="margin-left: 10px; border:none" class="btn btn-secondary" 
                                        href="ControladorMovimientos?accion=listar">Movimientos</a>
                                </li>

                           

                                <li class="nav-item">
                                    <a style="margin-left: 10px;border:none" class="btn btn-secondary"
                                       href="ControladorFacturas?accion=listar">Facturas</a>

                                </li>


                                <%--Sirve para abrir otra pagina target="_blank"--%>

                                <li class="nav-item">
                                    <a style="margin-left: 10px;border:none" class="btn btn-secondary"
                                       href="ControladorProductos?accion=listar" >Productos</a>

                                </li>

                                <li class="nav-item">
                                    <a style="margin-left: 10px;border:none" class="btn btn-secondary"
                                       href="ControladorProveedores?accion=listar" >Proveedores</a>

                                </li>

                                <!--icono para varias ventanas multiples //-->
                                <li class="nav-item dropdown">
                                    <a style="margin-left: 10px; border:none" class="btn btn-warning"
                                       href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        Registros Varios    
                                    </a>
                                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">

                                        <li><a class="dropdown-item" href="ControladorUsuarios?accion=listar" ><b style="color: #0d6efd;">Usuarios</b></a></li>
                                        <li><hr class="dropdown-divider"></li>
                                        <li><a class="dropdown-item"   href="ControladorRecibo?accion=listar" ><b style="color: #0d6efd;">Recibo</b></a></li> 
                                        <li><hr class="dropdown-divider"></li>
                                        <li><a class="dropdown-item"    href="ControladorCategorias?accion=listar" ><b style="color: #0d6efd;">Categorias</b></a></li> 
                                        <li><hr class="dropdown-divider"></li>
                                        <li><a class="dropdown-item"     href="ControladorBodega?accion=listar"><b style="color: #0d6efd;">Bodega</b></a></li> 
                                        <li><hr class="dropdown-divider"></li>
                                    </ul>
                                </li>
                                <hr>
                                <form class="navbar-nav ms-auto ml-auto" role="search">
                                    <input class="form-control ml-5 " type="search" name="txtbuscar" placeholder="Buscar Nombre, CC" aria-label="Buscar">
                                    <button  type="submit" name="accion" value="buscar" class="btn btn-primary ml-4">Buscar</button>
                                </form>

                                <div class="ml-xl-5">
                                    <!-- Botón de cierre de sesión -->
                                    <button class="btn btn-danger"ml onclick="cerrarSesion()">Cerrar Sesión</button>


                            </ul>
                        </div>
                    </div>
                </nav>
            </div>   
        </div>


        <style>

            body {

                margin: 0;
                padding: 0;
                font-family: Arial, sans-serif;
            }

            .navbar {
                background-color: black; /* Color de fondo del navbar */
                color: white; /* Color de texto del navbar */
                padding: 20px; /* Espaciado interior del navbar */
            }

        </style>
    </head>
<body style="background-image: url('img/zap.jpg'); background-size: cover; background"            >

    <!-- Bootstrap CSS y JavaScript -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"
    ></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js"
            integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
            crossorigin="anonymous"
    ></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"
            integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
            crossorigin="anonymous"
    ></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"
    ></script>
</body>


</html>


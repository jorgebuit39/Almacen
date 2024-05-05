<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link href="css/estilo.css" rel="stylesheet" type="text/css"/>

        <title>zap2</title>

    </head>

    <body>

        <div id="cuadro" 
             >
            <form action = "ControladorValidar" method="post">
                <p id="titulo" > INICIAR SESION</p> 
                <hr>
                <br/>
                <br/>
                <label id="subtitulo1">NOMBRE DE USUARIO </label>
                <br/><br/>
                <input type="text" name="txtuser" class ="entrada" />
                <br/><br/>
                <label id="subtitulo2" > CONTRASEÑA </label>
                <br/><br/>
                <input type="password" name="txtclave" class ="entrada" />
                <br/><br/>
                <input type="submit" name="accion" value ="IniciarSesion" id="boton" />   
                <!-- Add the error message display -->
                <div class="form-group text-center">
                    <p style="color: red;">${errorMensaje}</p>
                </div>
            </form>
            <br/>
            <p id="marca"> ZAP2 INVENTARIO</p>
        </div>  


        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

    </body>



    <style>
        *{
            margin: 0px;
            padding: 0px;
        }

        body{
            background: url(./img/logo.png);
            margin: 0; /* Elimina el margen predeterminado del cuerpo */
            padding: 0; /* Elimina el relleno predeterminado del cuerpo */
            /*background-image: url('ruta/de/la/imagen.jpg'); /* Ruta de tu imagen */
            background-size: cover; /* Ajusta la imagen para cubrir todo el fondo */
            background-position: center; /* Centra la imagen en el fondo */
            background-repeat: no-repeat; /* Evita la repetición de la imagen */
            height: 100vh; /* Establece la altura al 100% de la ventana gráfica visible (viewport height) */
            display: flex; /* Utiliza el modelo de caja flexible para centrar el contenido */
            align-items: center; /* Centra verticalmente el contenido */
            justify-content: center; /* Centra horizontalmente el contenido */
            color: white; /* Color del texto, ajusta según tus necesidades */
            font-size: 24px; /* Tamaño del texto, ajusta según tus necesidades */
        }


        #cuadro{

            width:350px;
            background:black;
            color:yellow;
            margin:auto;
            margin-top:120px;
            padding:5px 5px 30px 5px;
            border-top: 35px solid #141414;
            border-right: 35px solid #141414;
            border-left: 35px solid #141414;
            border-radius:6px;
            opacity:0.8;
        }

        .entrada{

            width:280px;
            height:35px;
            border-radius: 6px;
            font-family:verdana;
            font-weight:900;
        }

        #boton {
            width :280px;
            heigth:45px;
            border-radius: 6px;
            background:green;
            color:#ffffff;
            font-size:15px;



        }

        #titulo{

            font-size:20px;
            font-family:black;
            text-align:center;
        }

        #subtitulo2 {
            font-size:15px;
            font-family:black;
            text-align:center;

        }

        #marca{
            font-size:10px;
            padding-left: 200px;
            font-weight: 900;
            color:yellow;
        }


    </style>

</html>
